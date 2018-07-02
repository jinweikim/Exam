package com.example.exam.Controller;

import com.example.exam.Entity.Questions;
import com.example.exam.Entity.User;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.PaperService;
import com.example.exam.Service.UserService;
import org.hibernate.validator.constraints.pl.REGON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.ArrayList;

@Controller
@RequestMapping("/quiz")
public class QuizController {


    private final static Logger logger = LoggerFactory.getLogger(QuizController.class);

    @Autowired
    public PaperService paperService;

    @Autowired
    public UserService userService;

    @RequestMapping("start")
    public ModelAndView startQuiz(){
        ModelAndView mav = new ModelAndView();
        ArrayList<Questions> queList = paperService.getQueInPaper(1,200);
        mav.addObject("queList",queList);
        mav.setViewName("quiz");
        return mav;
    }

    @RequestMapping(value = "end",method = RequestMethod.POST)
    public ModelAndView endQuiz(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        ArrayList<Questions> stuAns = new ArrayList<>();
        ArrayList<Questions> queList = paperService.getQueInPaper(1,200);
        User user = (User)request.getSession().getAttribute("_session_user");
        String ans;
        Integer grade;
//        for(Questions q:queList){
//            rightAns.add(q.que_ans);
//        }
        int size = queList.size();
        for(int i=0;i<size;i++){
            ans = request.getParameter("ans_"+i);
            logger.info("答案: "+ans);
            Questions questions = null;
            try{
                questions = (Questions)queList.get(i).clone();
            }catch (Exception e){
                e.printStackTrace();
            }
            questions.setQue_ans(ans);
            stuAns.add(questions);
        }
        grade = calcGrade(queList,stuAns);
        user.setGrade(grade);
        userService.update(user);
        logger.info("成绩:"+grade);
        mav.addObject("stuAns",stuAns);
        mav.addObject("queList",queList);
        mav.addObject("grade",grade);
        mav.setViewName("quiz_result");
        return mav;
    }

    @RequestMapping("RepeatSubmit")
    public ModelAndView repeatSubmit(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        User user = (User)request.getSession().getAttribute("_session_user");
        mav.addObject("grade",user.getGrade());
        mav.setViewName("RepeatSubmit");
        return mav;
    }

    public Integer calcGrade(ArrayList<Questions> queList,ArrayList<Questions> stuAns){
        int grade = 0;
        if(queList.size() != stuAns.size()){
            logger.info("两份答案大小不同");
            return grade;
        }
        int size =queList.size();
        int every = 100/size;
        String ans1;
        String ans2;
        for(int i=0;i<size;i++){
            ans1 = queList.get(i).getQue_ans().trim();
            ans2 = stuAns.get(i).getQue_ans().trim();
            logger.info("学生答案:"+ans1);
            logger.info("标准答案:"+ans2);
            if(ans1.equals(ans2)){
                grade += every;
            }
        }
        return grade;

    }
}

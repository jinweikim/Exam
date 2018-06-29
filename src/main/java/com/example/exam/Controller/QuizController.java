package com.example.exam.Controller;

import com.example.exam.Entity.Questions;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.PaperService;
import org.hibernate.validator.constraints.pl.REGON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
@RequestMapping("/quiz")
public class QuizController {

    ArrayList<Questions> queList;

    private final static Logger logger = LoggerFactory.getLogger(QuizController.class);

    @Autowired
    public PaperService paperService;

    @RequestMapping("start")
    public ModelAndView startQuiz(){
        ModelAndView mav = new ModelAndView();
        queList = paperService.getQueInPaper(1,200);
        mav.addObject("queList",queList);
        mav.setViewName("quiz");
        return mav;
    }

    @RequestMapping(value = "end",method = RequestMethod.POST)
    public ModelAndView endQuiz(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        ArrayList<Questions> stuAns = new ArrayList<>();
//        ArrayList<Questions> queList = paperService.getQueInPaper(1,200);
        String ans;
        Integer grade;
//        for(Questions q:queList){
//            rightAns.add(q.que_ans);
//        }
        int size = queList.size();
        for(int i=0;i<size;i++){
            ans = request.getParameter(""+i);
            Questions questions = queList.get(i);
            questions.setQue_ans(ans);
            stuAns.add(questions);
        }
        grade = calcGrade(queList,stuAns);
        mav.addObject("stuAns",stuAns);
        mav.addObject("queList",queList);
        mav.setViewName("");
        return mav;
    }

    public Integer calcGrade(ArrayList<Questions> queList,ArrayList<Questions> stuAns){
        int grade = 0;
        if(queList.size() != stuAns.size()){
            logger.info("两份答案大小不同");
            return grade;
        }
        int size =queList.size();
        String ans1;
        String ans2;
        for(int i=0;i<size;i++){
            ans1 = queList.get(i).getQue_ans().trim();
            ans2 = stuAns.get(i).getQue_ans().trim();
            if(ans1.equals(ans2)){
                grade++;
            }
        }
        return grade;

    }
}

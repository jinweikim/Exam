package com.example.exam.Controller;

import com.example.exam.Entity.*;
import com.example.exam.Service.PaperService;
import com.example.exam.Service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {

    private final static Logger logger = LoggerFactory.getLogger(AnalysisController.class);

    @Autowired
    public PaperService paperService;

    @Autowired
    public UserService userService;

    @RequestMapping("/echarts1")
    public ModelAndView eCharts1(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("echarts1");
        return mav;
    }

    @RequestMapping("/echarts1_data")
    public @ResponseBody GradeDistributition echarts1_data(){
        GradeDistributition gd = new GradeDistributition();
        ArrayList<User> userList = (ArrayList<User>)userService.getUserList();
        for(User u:userList){
            if(u.getGrade() != 0){
                if(u.getGrade() < 60){
                    gd.setLow60(gd.getLow60()+1);
                }else if(u.getGrade() < 70){
                    gd.setSix7(gd.getSix7()+1);
                }else if(u.getGrade() < 80){
                    gd.setSeven8(gd.getSeven8() + 1);
                }else if(u.getGrade() < 90){
                    gd.setEight9(gd.getEight9() + 1);
                }else if(u.getGrade() <= 100){
                    gd.setNine10(gd.getNine10() + 1);
                }
            }
        }
        logger.info("gd:"+gd.getLow60());
        logger.info("gd:"+gd.getSix7());
        logger.info("gd:"+gd.getSeven8());
        return gd;
    }

    @RequestMapping("/echarts2")
    public ModelAndView eCharts2(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("echarts2");
        return mav;
    }

    @RequestMapping("/echarts2_data")
    public @ResponseBody ArrayList<ClassGrade> echarts2_data(){

        ArrayList<ClassGrade> classes = new ArrayList<>();
        classes = userService.AnalysisUser();
        for(ClassGrade cg:classes){
            //ClassGrade classGrade = new ClassGrade(cg.getClassName(),cg.getMaxGrade(),cg.getMinGrade(),cg.getAverageGrade());
            logger.info("平均分"+cg.getAverageGrade());
            logger.info("最高分"+cg.getMaxGrade());
            logger.info("最低分"+cg.getMinGrade());
        }
        return classes;

    }
    @RequestMapping("/echarts3")
    public ModelAndView eCharts3(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("echarts3");
        return mav;
    }

    @RequestMapping("/echarts3_data")
    public @ResponseBody ArrayList<Difficulty> echarts3_data(){

        ArrayList<Difficulty> difficulties = new ArrayList<>();
        difficulties = userService.AnalysisDiff();
        return difficulties;
    }

}

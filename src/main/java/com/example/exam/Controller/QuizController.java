package com.example.exam.Controller;

import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/quiz")
public class QuizController {

    @RequestMapping("start")
    public ModelAndView startQuiz(){
        ModelAndView mav = new ModelAndView();
        return mav;
    }
}

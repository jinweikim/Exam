package com.example.exam.Controller;

import com.example.exam.Entity.OptionalQuestions;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.QueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/question")
public class QueController {
    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Autowired
    public QueService queService;

    @RequestMapping("/OptQueList")
    public ModelAndView getOptQueList(){
        ModelAndView mav = new ModelAndView();
        ArrayList<OptionalQuestions> optList = new ArrayList<>();
        optList = (ArrayList)queService.getOptList();
        mav.addObject("optList",optList);
        mav.setViewName("OptQueList");
        return mav;
    }


}

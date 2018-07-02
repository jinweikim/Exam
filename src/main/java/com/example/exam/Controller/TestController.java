package com.example.exam.Controller;

import com.example.exam.Interceptor.SessionInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/error")
public class TestController {

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @GetMapping("/error")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error");
        logger.info(("进入error"));
        return mav;

    }
}

package com.example.exam.Controller;

import com.example.exam.Entity.Papers;
import com.example.exam.Entity.Questions;
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
@RequestMapping("/paper")
public class PaperController {

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Autowired
    private QueService queService;

    @RequestMapping("/paperList")
    public ModelAndView PaperList(){
        ModelAndView mav = new ModelAndView();
        Papers papers1 = new Papers();
        Questions que1 = queService.getOptById(1);
        Questions que2 = queService.getOptById(2);
        Questions que3 = queService.getBlankById(3);
        logger.info(que1.que_head);
        ArrayList<Questions> paperList = new ArrayList<>();
        paperList.add(que1);
        paperList.add(que2);
        paperList.add(que3);
        papers1.setList(paperList);
        logger.info(papers1.getList().get(0).que_head);
        mav.addObject("paperList",papers1);

        mav.setViewName("paper_list");
        return mav;
    }
}

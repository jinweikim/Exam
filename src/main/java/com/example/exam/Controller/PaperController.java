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
        Papers papers2 = new Papers();
        Papers papers3 = new Papers();
        Questions que1 = queService.getOptById(1);
        Questions que2 = queService.getOptById(2);
        Questions que3 = queService.getBlankById(3);
        logger.info(que1.que_head);
        ArrayList<Questions> queList = new ArrayList<>();
        ArrayList<Papers> paperList = new ArrayList<>();
        queList.add(que1);
        queList.add(que2);
        queList.add(que3);
        paperList.add(papers1);
        paperList.add(papers2);
        paperList.add(papers3);
        papers1.setName("测试考卷1");
        papers2.setName("测试考卷2");
        papers3.setName("测试考卷3");

        papers1.setList(queList);
        mav.addObject("paperList",paperList);

        mav.setViewName("paper_list");
        return mav;
    }
}

package com.example.exam.Controller;

import com.example.exam.Entity.OptionalQuestions;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.QueService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
        optList = (ArrayList)queService.getOptList(1,10);
        logger.info("选择题列表大小:"+optList.size());
        PageInfo<OptionalQuestions> pageInfo = new PageInfo<>(optList);
        mav.addObject("optList",pageInfo);
        mav.setViewName("OptQueList");
        return mav;
    }

    @RequestMapping("/opt_add")
    public ModelAndView OptAdd(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("Opt_add");
        return mav;
    }

    @RequestMapping("/opt_edit/{id}")
    public ModelAndView OptEdit(@PathVariable int id){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("Opt_edit");
        return mav;
    }


}

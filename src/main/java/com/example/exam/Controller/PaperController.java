package com.example.exam.Controller;

import com.example.exam.Entity.Paper;
import com.example.exam.Entity.Questions;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.PaperService;
import com.example.exam.Service.QueService;
import com.example.exam.Utils.QueUtils;
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

    @Autowired
    private PaperService paperService;

    @RequestMapping("/paperList")
    public ModelAndView PaperList(){
        ModelAndView mav = new ModelAndView();
        Paper papers1 = new Paper();
        Paper papers2 = new Paper();
        Paper papers3 = new Paper();
        Questions que2 = queService.getOptById(2);
        Questions que3 = queService.getBlankById(3);
        ArrayList<Questions> queList = new ArrayList<>();
        ArrayList<Paper> paperList = new ArrayList<>();
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

    @RequestMapping("/PaperAdmin")
    public ModelAndView PaperAdd(){
        ArrayList<Questions> AllOptList = new ArrayList<>();
        ArrayList<Questions> AllBlankList = new ArrayList<>();
        ArrayList<Questions> OptList = new ArrayList<>();
        ArrayList<Questions> BlankList = new ArrayList<>();
        AllOptList = (ArrayList)queService.getOptList();
        AllBlankList = (ArrayList)queService.getBlankList();
        logger.info("Opt大小:"+AllOptList.size());
        logger.info("Blank大小:"+AllBlankList.size());
        OptList = QueUtils.getRandomList(AllOptList,3);//从选择题题库选择指定数目的题目
        BlankList = QueUtils.getRandomList(AllBlankList,3);//从填空题题库选择指定数目的题目
        logger.info("Opt大小:"+OptList.size());
        logger.info("Blank大小:"+BlankList.size());
        OptList.addAll(BlankList);//合并两个list
        ArrayList<Paper> paperList = new ArrayList<>();

//        paperList = QueUtils.Que2Paper(OptList,1);
//        paperService.addAll(paperList);

        ModelAndView mav = new ModelAndView();
        mav.addObject("queList",OptList);
        logger.info("合并后大小:"+OptList.size());
        mav.setViewName("ChooseList");
        return mav;

    }
}

package com.example.exam.Controller;

import com.example.exam.Entity.Paper;
import com.example.exam.Entity.Questions;
import com.example.exam.Entity.ResultCode;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.PaperService;
import com.example.exam.Service.QueService;
import com.example.exam.Utils.QueUtils;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView PaperList(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        QueUtils queUtils = new QueUtils();
        int num = Integer.parseInt(request.getParameter("p"));
        ArrayList<Paper> paperList = new ArrayList<>();
        ArrayList<Questions> queList = new ArrayList<>();
        queList = paperService.getQueInPaper(num,10);
//        paperList = paperService.getPaperList(1,num,10);
//        logger.info("paperList大小："+paperList.size());
//        queList = Paper2Que(paperList);
        PageInfo<Questions> pageInfo = new PageInfo<>(queList);
        mav.addObject("queList",pageInfo);
        mav.setViewName("paper_list");
        return mav;
    }

    @RequestMapping("/ReCombinePaper")
    public @ResponseBody ResultCode PaperCombine(){

        paperService.deleteAll();
        ArrayList<Questions> AllOptList = new ArrayList<>();
        ArrayList<Questions> AllBlankList = new ArrayList<>();
        ArrayList<Questions> OptList = new ArrayList<>();
        ArrayList<Questions> BlankList = new ArrayList<>();

        AllOptList = (ArrayList)queService.getOptList();
        AllBlankList = (ArrayList)queService.getBlankList();
        logger.info("Opt大小:"+AllOptList.size());
        logger.info("Blank大小:"+AllBlankList.size());
        OptList = QueUtils.getRandomList(AllOptList,10);//从选择题题库选择指定数目的题目
        BlankList = QueUtils.getRandomList(AllBlankList,10);//从填空题题库选择指定数目的题目
        logger.info("Opt大小:"+OptList.size());
        logger.info("Blank大小:"+BlankList.size());
        OptList.addAll(BlankList);//合并两个list
        ArrayList<Paper> paperList = new ArrayList<>();

        ResultCode resultCode = new ResultCode();

        try{
            paperList = QueUtils.Que2Paper(OptList,1);
            paperService.addAll(paperList);
        }catch (Exception e){
            resultCode.setStatus("failed");
        }
        resultCode.setStatus("success");

        return resultCode;

    }

    @RequestMapping("replace_list")
    public ModelAndView ReplaceList(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int num = Integer.parseInt(request.getParameter("p"));
        int queId = Integer.parseInt(request.getParameter("queId"));
        ArrayList<Questions> queList = (ArrayList<Questions>)queService.getAllList(num,10);
        PageInfo<Questions> pageInfo = new PageInfo<>(queList);
        mav.addObject("queList",pageInfo);
        mav.addObject("sourceId",queId);
        mav.setViewName("ReplaceList");
        return mav;
    }

    @RequestMapping("doReplace")
    public @ResponseBody ResultCode DoReplace(HttpServletRequest request){
        ResultCode resultCode = new ResultCode();
        int result = 0;
        int sourceId = Integer.parseInt(request.getParameter("sourceId"));
        int replaceId = Integer.parseInt(request.getParameter("replaceId"));

        try{
            Paper paper = paperService.getPaperByQueId(sourceId);
            logger.info("getPaperByQueId获得的queId是"+paper.getQue_id());
            paper.setQue_id(replaceId);
            result = paperService.Update(paper);
        }catch (Exception e){
            logger.info("替换发生异常");
            e.printStackTrace();
            resultCode.setStatus("failed");

        }
        if(result != 0){
            resultCode.setStatus("success");
        }else{
            resultCode.setStatus("failed");
        }
        return resultCode;
    }


    //将paperlist转化为quelist,之所以放这里而没有放在工具类是因为工具类无法注入service，导致service不可用。
    public ArrayList<Questions> Paper2Que(ArrayList<Paper> list){
        ArrayList<Questions> newList = new ArrayList<>();
        for(Paper p:list){
            logger.info("每个que的id: "+p.getQue_id());
            Questions que = queService.getOptById(p.getQue_id());
            if(que != null){
                newList.add(que);
            }else{
                que = queService.getBlankById(p.getQue_id());
                if(que != null){
                    newList.add(que);
                }
            }
        }
        return newList;
    }
}

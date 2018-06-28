package com.example.exam.Controller;

import com.example.exam.Entity.Questions;
import com.example.exam.Entity.ResultCode;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.QueService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/question")
public class QueController {
    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Autowired
    public QueService queService;

    //打开选择题列表页面
    @RequestMapping("/OptQueList")
    public ModelAndView getOptQueList(){
        ModelAndView mav = new ModelAndView();
        ArrayList<Questions> optList = new ArrayList<>();
        optList = (ArrayList)queService.getOptList(1,10);
        logger.info("选择题列表大小:"+optList.size());
        PageInfo<Questions> pageInfo = new PageInfo<>(optList);
        mav.addObject("queList",pageInfo);
        mav.setViewName("OptQueList");
        return mav;
    }

    //打开填空题列表页面
    @RequestMapping("/BlankQueList")
    public ModelAndView getBlankQueList(){
        ModelAndView mav = new ModelAndView();
        ArrayList<Questions> blankList = new ArrayList<>();
        blankList = (ArrayList)queService.getBlankList(1,10);
        logger.info("选择题列表大小:"+blankList.size());
        PageInfo<Questions> pageInfo = new PageInfo<>(blankList);
        mav.addObject("queList",pageInfo);
        mav.setViewName("BlankQueList");
        return mav;
    }

    //打开添加选择题页面
    @RequestMapping("/opt_add")
    public ModelAndView OptAdd(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("Opt_add");
        return mav;
    }

    //添加选择题信息
    @RequestMapping(value = "/optAdd",method = RequestMethod.POST)
    public @ResponseBody ResultCode OptQueAdd(Questions questions){
        ResultCode resultCode = new ResultCode();
        Integer result = 0;
        try{
            result = queService.addOpt(questions);
        }catch (Exception e){
            resultCode.setStatus("failed");
        }
        if(result != 0){
            resultCode.setStatus("success");
        }else{
            resultCode.setStatus("success");
        }
        logger.info("添加结果:"+resultCode.getStatus());
        return resultCode;
    }

    //打开选择题编辑页面
    @RequestMapping("/opt_edit/{id}")
    public ModelAndView OptEdit(@PathVariable int id){
        Questions que = queService.getOptById(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("que",que);
        mav.setViewName("Opt_edit");
        return mav;
    }

    //确定更新试题信息，此处把opt与blank的更新合并在同一个方法
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public @ResponseBody ResultCode QueUpdate(Questions questions){
        ResultCode resultCode = new ResultCode();
        Integer result = 0;
        String type = questions.getQue_Type();
        if(type.equals("opt")){
            try{
                result= queService.updateOpt(questions);
            }catch (Exception e){
                resultCode.setStatus("failed");
            }
        }else{
            try{
                result = queService.updateBlank(questions);
            }catch (Exception e){
                resultCode.setStatus("failed");
            }
        }
        if(result != 0){
            resultCode.setStatus("success");
        }else{
            resultCode.setStatus("failed");
        }
        logger.info("更改结果:"+resultCode.getStatus());
        return resultCode;
    }

    //确定更新试题信息，此处把opt与blank的更新合并在同一个方法
    @RequestMapping(value = "/delete/{id}")
    public @ResponseBody ResultCode QueDelete(@PathVariable Integer id){
        ResultCode resultCode = new ResultCode();
        Integer result = 0;
        try{
            result = queService.deleteById(id);
        }catch (Exception e){
            resultCode.setStatus("failed");
        }
        if(result != 0){
            resultCode.setStatus("success");
        }else{
            resultCode.setStatus("failed");
        }
        return resultCode;


    }


}

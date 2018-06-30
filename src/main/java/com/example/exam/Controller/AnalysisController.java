package com.example.exam.Controller;

import com.example.exam.Entity.ResultCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {

    @RequestMapping("/echarts1")
    public ModelAndView eCharts1(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("echarts1");
        return mav;
    }
}

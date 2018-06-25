package com.example.exam.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
    @GetMapping("/home")
    public ModelAndView index(){
        ModelMap model = new ModelMap();
        model.addAttribute("name","king");
        return new ModelAndView("home",model);

    }
}

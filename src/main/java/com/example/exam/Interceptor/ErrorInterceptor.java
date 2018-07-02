package com.example.exam.Interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ErrorInterceptor implements HandlerInterceptor {

    private final static Logger logger = LoggerFactory.getLogger(ErrorInterceptor.class);

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if(response.getStatus() == 404){

            if(modelAndView != null){
                logger.info("拦截404");
                modelAndView.setViewName("404");
            }
        }
        if(response.getStatus() == 405){

            if(modelAndView != null){
                logger.info("拦截404");
                modelAndView.setViewName("404");
            }
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

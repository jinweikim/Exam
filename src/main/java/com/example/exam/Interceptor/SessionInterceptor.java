package com.example.exam.Interceptor;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SessionInterceptor implements HandlerInterceptor {

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getRequestURI().equals("/account/login")){
            return true;

        }
        Object obj = request.getSession().getAttribute("_session_user");
        if(obj == null){
            logger.info("进行拦截:"+request.getRequestURI());
            response.sendRedirect("/account/login");
            return false;
        }
        return true;
    }
}

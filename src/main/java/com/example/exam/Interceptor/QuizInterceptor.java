package com.example.exam.Interceptor;

import com.example.exam.Entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class QuizInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        User user = (User)request.getSession().getAttribute("_session_user");
        if(user.getGrade() != 0){
            response.sendRedirect("RepeatSubmit");
            return false;
        }
        return true;
    }
}

package com.example.exam.Controller;

import com.example.exam.Entity.User;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.AccountService;
import com.example.exam.Service.UserService;
import com.example.exam.Service.UserServiceImpl;
import org.apache.ibatis.annotations.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/account")
public class AccountController {
    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Autowired
    public UserService userService;

    @Autowired
    AccountService accountService;

    @RequestMapping(value="/login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/valid",method = RequestMethod.POST)
    public String valid(User user,HttpServletRequest request){
//        User user = new User();
//        user.setId("1501");
//        user.setUsername(request.getParameter("name"));
//        user.setPassword(request.getParameter("password"));
        //       userService.add(user);
//        User user1 = userService.getUserById("1500");
        if(accountService.valid(user)){
            request.getSession().setAttribute("_session_user",user);
            logger.info("登录成功");
            return "index";
        }else{
            logger.info("登录失败");
            return "error";
        }
    }

    @RequestMapping("/user")
    public @ResponseBody User getuser(HttpServletRequest request){
        User user1 = userService.getUserById("1500");
        return user1;
    }

    @RequestMapping("/member_list")
    public String getMemeberList(HttpServletRequest request){
        return "member_list";
    }


}

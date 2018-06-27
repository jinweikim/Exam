package com.example.exam.Controller;

import com.example.exam.Entity.User;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.AccountService;
import com.example.exam.Service.UserService;
import com.example.exam.Service.UserServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

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
        User user1 = userService.getUserById("1500");
        logger.info(user1.getUsername());
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

    @RequestMapping("/student_list")
    public ModelAndView getStudentList(HttpServletRequest request){
        ArrayList<User> studentList = new ArrayList<>();
        PageHelper.startPage(1,10);
        studentList = (ArrayList)userService.getUserListPage(2,2);
        PageInfo<User> pageInfo = new PageInfo<User>(studentList);
        logger.info(""+studentList.size());
        logger.info(studentList.get(0).getUsername());
        ModelAndView mav = new ModelAndView();
        mav.addObject("studentList",pageInfo);
        mav.setViewName("student_list");
        return mav;
    }

    @RequestMapping("/student_edit/{id}")
    public ModelAndView studentEdit(@PathVariable String id){
        User user = userService.getUserById(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("user",user);
        mav.setViewName("student_edit");
        return mav;
    }

    @RequestMapping(value = "/student_delete/{id}")
    public ModelAndView StudentDelete(@PathVariable String id){
        userService.deleteById(id);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("student_edit");
        return mav;

    }

    @RequestMapping("/student_add")
    public ModelAndView studentAdd(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("student_add");
        return mav;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public ModelAndView UserUpdate(User user){
        ModelAndView mav = new ModelAndView();
        logger.info("更改用户信息:"+user.getUsername());
        logger.info("更改用户信息:"+user.getPassword());
        userService.update(user);
        mav.setViewName("student_list");
        return mav;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public ModelAndView UserAdd(User user){
        ModelAndView mav = new ModelAndView();
        logger.info("添加用户信息:"+user.getUsername());
        logger.info("添加用户信息:"+user.getPassword());
        userService.add(user);
        mav.setViewName("student_list");
        return mav;
    }


}

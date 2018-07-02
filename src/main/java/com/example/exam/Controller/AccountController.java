package com.example.exam.Controller;

import com.example.exam.Entity.ResultCode;
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
import org.springframework.ui.Model;
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
    private final static Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    public UserService userService;

    @Autowired
    AccountService accountService;

    //打开登录界面
    @RequestMapping(value="login")
    public ModelAndView login(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        String msg = (String)   request.getAttribute("msg");
        logger.info("msg:"+msg);
        if(msg != null) {
                mav.addObject("error", "登录失败!");
        }
        mav.setViewName("login");
        return mav;
    }

    //欢迎界面
    @RequestMapping(value = "welcome")
    public ModelAndView welcome(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("welcome");
        return mav;
    }

    //点击登录后验证合法性
    @RequestMapping(value = "/valid",method = RequestMethod.POST)
    public String valid(User user,HttpServletRequest request,Model model){
        ModelAndView mav = new ModelAndView();
        User dbuser;
        dbuser = userService.getUser(user.getId(),user.getPassword());
        if(accountService.valid(dbuser)){
            request.getSession().setAttribute("_session_user",dbuser);
            logger.info("登录成功");
            if(user.getId().equals("1000")){
                return "index";
            }else {
                logger.info("开始考试");
                return "redirect:/quiz/start";
            }
        }else{
            logger.info("登录失败");
            model.addAttribute("msg","error");
            return "forward:/account/login";
        }
    }

    //用户测试
    @RequestMapping("/user")
    public @ResponseBody User getuser(HttpServletRequest request){
        User user1 = userService.getUserById("1500");
        return user1;
    }

    //打开学生列表页
    @RequestMapping("/student_list")
    public ModelAndView getStudentList(HttpServletRequest request){
        ArrayList<User> studentList = new ArrayList<>();
        //PageHelper.startPage(1,10);
        int num = Integer.parseInt(request.getParameter("p"));
        studentList = (ArrayList)userService.getUserListPage(num,10);
        PageInfo<User> pageInfo = new PageInfo<User>(studentList);
        logger.info(""+studentList.size());
        logger.info(studentList.get(0).getUsername());
        ModelAndView mav = new ModelAndView();
        mav.addObject("studentList",pageInfo);
        mav.setViewName("student_list");
        return mav;
    }


    //打开学生信息编辑页面
    @RequestMapping("/student_edit/{id}")
    public ModelAndView studentEdit(@PathVariable String id){
        User user = userService.getUserById(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("user",user);
        mav.setViewName("student_edit");
        return mav;
    }

    //对学生信息进行删除
    @RequestMapping(value = "/student_delete/{id}")
    public @ResponseBody ResultCode StudentDelete(@PathVariable String id){
        ResultCode resultCode = new ResultCode();
        int result = 0;
        try{
            result = userService.deleteById(id);
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

    //打开添加学生信息页面
    @RequestMapping("/student_add")
    public ModelAndView studentAdd(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("student_add");
        return mav;
    }

    //对学生信息进行更新
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public @ResponseBody ResultCode UserUpdate(User user){
        logger.info("更改用户信息:"+user.getUsername());
        logger.info("更改用户信息:"+user.getPassword());
        ResultCode resultCode = new ResultCode();
        Integer result = 0;
        try{
            result = userService.update(user);
        }catch (Exception e){
            logger.info("Exception!!!");
            resultCode.setStatus("failed");
        }
        logger.info("result:"+result);
        if(result != 0){
            resultCode.setStatus("success");
        }else {
            resultCode.setStatus("failed");
        }
        return resultCode;
    }

    //添加学生信息
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public @ResponseBody ResultCode UserAdd(User user){
        ResultCode resultCode = new ResultCode();
        logger.info("添加用户信息:"+user.getUsername());
        logger.info("添加用户信息:"+user.getPassword());
        Integer result = 0;
        try{
            result = userService.add(user);
        }catch (Exception e){
            logger.info("Exception!!!");
            resultCode.setStatus("failed");
        }
        logger.info("更改结果:"+result);
        if(result != 0){
            resultCode.setStatus("success");
        }else {
            resultCode.setStatus("failed");
        }
        return resultCode;
    }


}

package com.example.exam.Service;

import com.example.exam.Entity.User;
import com.example.exam.Interceptor.SessionInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
    @Autowired
    public UserService userService;

    public boolean valid(User user){
        logger.info("判断用户信息");
        User dbuser;
        dbuser = userService.getUser(user.getId(),user.getPassword());
        if(dbuser != null){
            return true;
        }else{
            return false;
        }

    }

}

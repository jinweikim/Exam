package com.example.exam.Service;

import com.example.exam.Entity.User;
import com.example.exam.Interceptor.SessionInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class AccountService {

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    public boolean valid(User user){
        logger.info("判断用户信息");
        if("admin".equals(user.getUsername()) && "123".equals(user.getPassword())){
            return true;
        }else{
            return false;
        }
    }

}

package com.example.exam.Service;

import com.example.exam.Entity.User;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.dao.UserMapper;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserById(String id) {
        logger.info("SELECT * FROM UserInfo WHERE user_id="+id);
        return userMapper.getUserById(id);
    }

    @Override
    public User getUserByName(String name) {
        return userMapper.getUserByName(name);
    }

    @Override
    public User getUserByGrade(int grade){
        return userMapper.getUserByGrade(grade);
    }

    @Override
    public List<User> getUserList() {
        logger.info("SELECT * FROM UserInfo");
        return userMapper.getUserList();
    }

    @Override
    public Integer add(User user) {
        return userMapper.add(user);
    }

    @Override
    public Integer deleteById(String id) {
        return userMapper.deleteById(id);
    }

    @Override
    public Integer update(User user) {
        logger.info("Updating");
        return userMapper.update(user);
    }

    @Override
    public List<User> getUserListPage(int page,int rows) {
        PageHelper.startPage(page,rows);
        return userMapper.getUserList();
    }

    @Override
    public User getUser(String id, String pwd) {
        return userMapper.getUser(id,pwd);
    }
}

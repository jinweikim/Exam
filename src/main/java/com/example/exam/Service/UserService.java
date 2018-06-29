package com.example.exam.Service;

import com.example.exam.Entity.User;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.List;

public interface UserService {
    User getUserById(String id);
    User getUserByName(String name);
    User getUserByGrade(int grade);
    List<User> getUserList();
    List<User> getUserListPage(int page,int rows);
    Integer add(User user);
    Integer deleteById(String id);
    Integer update(User user);
    User getUser(String id,String pwd);
}

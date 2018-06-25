package com.example.exam.Service;

import com.example.exam.Entity.User;

import java.util.List;

public interface UserService {
    User getUserById(String id);
    User getUserByName(String name);
    User getUserByGrade(int grade);
    public List<User> getUserList();
    public int add(User user);
}

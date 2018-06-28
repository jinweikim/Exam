package com.example.exam.dao;

import com.example.exam.Entity.User;


import java.util.List;

public interface UserMapper {



//    @Select("SELECT * FROM UserInfo WHERE user_id = #{_id_}")
//    @Results({
//            @Result(property = "id",column = "user_id"),
//            @Result(property = "username",column = "user_name"),
//            @Result(property = "password",column = "user_password"),
//            @Result(property = "grade",column = "user_grade"),
//            @Result(property = "userClass",column = "user_class")
//    })
    User getUserById(String id);

    User getUserByName(String name);

    User getUserByGrade(int grade);

    List<User> getUserList();

    Integer add(User user);

    Integer deleteById(String id);

    Integer update(User user);




}

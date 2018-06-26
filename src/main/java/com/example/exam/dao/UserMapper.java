package com.example.exam.dao;

import com.example.exam.Entity.User;
import com.example.exam.Interceptor.SessionInterceptor;
import org.apache.ibatis.annotations.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
//
//    @Select("SELECT * FROM UserInfo WHERE user_name = #{name}")
//    @Results({
//            @Result(property = "id",column = "user_id"),
//            @Result(property = "username",column = "user_name"),
//            @Result(property = "password",column = "user_password"),
//            @Result(property = "grade",column = "user_grade"),
//            @Result(property = "userClass",column = "user_class")
//    })
    User getUserByName(String name);
//
//    @Select("SELECT * FROM UserInfo WHERE user_grade = #{grade}")
//    @Results({
//            @Result(property = "id",column = "user_id"),
//            @Result(property = "username",column = "user_name"),
//            @Result(property = "password",column = "user_password"),
//            @Result(property = "grade",column = "user_grade"),
//            @Result(property = "userClass",column = "user_class")
//    })
    User getUserByGrade(int grade);
//
//    @Select("SELECT * FROM UserInfo WHERE user_grade=90")
    List<User> getUserList();
//    @Results({
//            @Result(property = "id",column = "user_id"),
//            @Result(property = "username",column = "user_name"),
//            @Result(property = "password",column = "user_password"),
//            @Result(property = "grade",column = "user_grade"),
//            @Result(property = "userClass",column = "user_class")
//    })
//
//    @Insert("INSERT INTO UserInfo(user_id,user_name,user_password,user_grade,user_class) VALUES(#{id},#{username},#{password},#{grade},#{userClass})")
    public int add(User user);




}

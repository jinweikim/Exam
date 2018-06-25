package com.example.exam.dao;

import com.example.exam.Entity.Item;
import org.apache.ibatis.annotations.Select;

public interface ItemMapper {

    @Select("SELECT * FROM UserInfo WHERE user_id = #{_id_}")
    Item getItemById(int id);

}

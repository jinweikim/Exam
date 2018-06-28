package com.example.exam.dao;

import com.example.exam.Entity.Questions;

import java.util.List;

public interface QueMapper {

    List<Questions> getOptList();

    List<Questions> getBlankList();

    Integer addOpt(Questions que);

    Integer addBlank(Questions que);

    Integer deleteById(Integer id);

    Integer updateOpt(Questions que);

    Integer updateBlank(Questions que);

    Questions getOptById(Integer id);

    Questions getBlankById(Integer id);
}

package com.example.exam.dao;

import com.example.exam.Entity.OptionalQuestions;

import java.util.List;

public interface OptMapper {

    List<OptionalQuestions> getOptList();

    Integer add(OptionalQuestions opt);

    Integer deleteById(Integer id);

    Integer update(OptionalQuestions opt);

    OptionalQuestions getUserById(String id);

}

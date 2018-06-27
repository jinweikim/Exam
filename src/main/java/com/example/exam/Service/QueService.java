package com.example.exam.Service;

import com.example.exam.Entity.BlankQuestions;
import com.example.exam.Entity.OptionalQuestions;
import com.example.exam.Entity.Questions;

import java.util.List;


public interface QueService {

    List<Questions> getOptList(int page,int rows);

    List<Questions> getBlankList(int page,int rows);

    Integer addOpt(Questions que);

    Integer addBlank(Questions que);

    Integer deleteOpt(Integer id);

    Integer deleteBlank(Integer id);

    Integer updateOpt(Questions que);

    Integer updateBlank(Questions que);

    Questions getOptById(Integer id);

    Questions getBlankById(Integer id);
}

package com.example.exam.Service;

import com.example.exam.Entity.BlankQuestions;
import com.example.exam.Entity.OptionalQuestions;

import java.util.List;


public interface QueService {

    List<BlankQuestions> getBlankList();
    List<OptionalQuestions> getOptList();
}

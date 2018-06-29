package com.example.exam.dao;

import com.example.exam.Entity.Paper;
import com.example.exam.Entity.Questions;

import java.util.ArrayList;

public interface PaperMapper {

    Integer add(Paper paper);

    Paper getPaperByQueId(Integer id);

    ArrayList<Paper> getPaperList(int group);

    Integer deleteAll();

    ArrayList<Questions> getQueInPaper();

    Integer update(Paper paper);


}

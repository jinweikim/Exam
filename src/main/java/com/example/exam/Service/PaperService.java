package com.example.exam.Service;

import com.example.exam.Entity.Paper;
import com.example.exam.Entity.Questions;

import java.util.ArrayList;

public interface PaperService {

    Integer addAll(ArrayList<Paper> list);

    Paper getPaperByQueId(Integer id);

    ArrayList<Paper> getPaperList(int group,int page,int rows);

    Integer deleteAll();

    ArrayList<Questions> getQueInPaper(int page,int rows);

    Integer Update(Paper paper);

}

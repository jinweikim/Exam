package com.example.exam.Service;

import com.example.exam.Entity.Paper;
import com.example.exam.Entity.Questions;
import com.example.exam.dao.PaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class PaperServiceImpl implements PaperService {

    @Autowired
    private PaperMapper paperMapper;

    @Override
    public Integer addAll(ArrayList<Paper> list){
        for(Paper p:list){
            paperMapper.add(p);
        }
        return 0;
    }
}

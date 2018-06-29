package com.example.exam.Service;

import com.example.exam.Entity.Paper;
import com.example.exam.Entity.Questions;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.dao.PaperMapper;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class PaperServiceImpl implements PaperService {

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Autowired
    private PaperMapper paperMapper;

    @Override
    public Integer addAll(ArrayList<Paper> list){
        for(Paper p:list){
            paperMapper.add(p);
        }
        return 0;
    }

    @Override
    public Paper getPaperByQueId(Integer id){
        return paperMapper.getPaperByQueId(id);
    }

    @Override
    public ArrayList<Paper> getPaperList(int group,int page,int rows) {
        PageHelper.startPage(page,rows);
        return paperMapper.getPaperList(group);
    }

    @Override
    public Integer deleteAll() {
        return paperMapper.deleteAll();
    }

    @Override
    public ArrayList<Questions> getQueInPaper(int page,int rows) {
        PageHelper.startPage(page,rows);
        return paperMapper.getQueInPaper();
    }

    @Override
    public Integer Update(Paper paper) {
        return paperMapper.update(paper);

    }
}

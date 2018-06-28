package com.example.exam.Service;

import com.example.exam.Entity.Questions;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.dao.QueMapper;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QueServiceImpl implements QueService {

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Autowired
    private QueMapper queMapper;



    @Override
    public List<Questions> getOptList(int page, int rows) {
        PageHelper.startPage(page,rows);
        return queMapper.getOptList();
    }

    @Override
    public List<Questions> getBlankList(int page, int rows) {
        PageHelper.startPage(page,rows);
        return queMapper.getBlankList();
    }

    @Override
    public Integer addOpt(Questions que) {
        return null;
    }

    @Override
    public Integer addBlank(Questions que) {
        return null;
    }

    @Override
    public Integer deleteById(Integer id) {
        return null;
    }



    @Override
    public Integer updateOpt(Questions que) {
        return null;
    }

    @Override
    public Integer updateBlank(Questions que) {
        return null;
    }

    @Override
    public Questions getOptById(Integer id) {
        return queMapper.getOptById(id);
    }

    @Override
    public Questions getBlankById(Integer id) {
        return queMapper.getBlankById(id);
    }
}

package com.example.exam.Service;

import com.example.exam.Entity.BlankQuestions;
import com.example.exam.Entity.OptionalQuestions;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.dao.BlankMapper;
import com.example.exam.dao.OptMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QueServiceImpl implements QueService {

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Autowired
    private OptMapper optMapper;

    @Autowired
    private BlankMapper blankMapper;

    @Override
    public List<BlankQuestions> getBlankList() {
        return blankMapper.getBlankList();
    }

    @Override
    public List<OptionalQuestions> getOptList() {
        return optMapper.getOptList();
    }
}

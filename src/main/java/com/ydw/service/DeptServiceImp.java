package com.ydw.service;

import com.ydw.bean.Dept;
import com.ydw.dao.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImp implements DeptService{

    @Autowired
    private DeptMapper mapper;
    @Override
    public List<Dept> getDepts() {
        return mapper.selectByExample(null);
    }
}

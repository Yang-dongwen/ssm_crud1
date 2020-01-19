package com.ydw.service;

import com.ydw.bean.Employee;
import com.ydw.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("empService")
public class EmployeeServiceImp implements EmployeeService {
    @Autowired
    EmployeeMapper mapper;
    @Override
    public List<Employee> getAll() {
        List<Employee> emps = mapper.selectByExample(null);
        return emps;
    }
}

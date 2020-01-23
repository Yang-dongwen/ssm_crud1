package com.ydw.service;

import com.ydw.bean.Employee;
import com.ydw.bean.EmployeeExample;
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

    @Override
    public int addEmployee(Employee employee) {
        int i = mapper.insertSelective(employee);
        return i;
    }

    @Override
    public boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long l = mapper.countByExample(example);
        return l == 0;
    }

    @Override
    public Employee getEmployee(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateEmp(Employee employee) {

        return mapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public int removeEmp(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        mapper.deleteByExample(example);
    }
}

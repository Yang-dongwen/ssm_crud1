package com.ydw.service;

import com.ydw.bean.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> getAll();
    int addEmployee(Employee employee);

    boolean checkUser(String empName);

    Employee getEmployee(Integer id);

    int updateEmp(Employee employee);

    int removeEmp(Integer id);

    void deleteBatch(List<Integer> ids);
}

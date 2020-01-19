package com.ydw.test;

import com.ydw.bean.Dept;
import com.ydw.bean.Employee;
import com.ydw.dao.DeptMapper;
import com.ydw.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:application.xml"})
public class CRUDTest {
    @Autowired
    DeptMapper mapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void test(){
        Dept dept = new Dept(001,"人事部");
        mapper.insert(dept);
    }

    @Test
    public void addEmployee(){
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 50; i++){
            String uid = UUID.randomUUID().toString().substring(0,5);
            mapper.insertSelective(new Employee(null,uid,"W",uid+"@ydw",1));
        }
        System.out.println("批量成功");
    }
}

package com.ydw.test;

import com.ydw.bean.Dept;
import com.ydw.dao.DeptMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:application.xml"})
public class CRUDTest {
    @Autowired
    DeptMapper mapper;

    @Test
    public void test(){
        Dept dept = new Dept(001,"人事部");
        mapper.insert(dept);
    }
}

package com.ydw.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ydw.bean.Employee;
import com.ydw.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService empservice;

    /**
     *查询所有员工信息（分页查询）
     */
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        // 查询之前只需调用，传入页码，以及分页页面的大小。
        PageHelper.startPage(pn,5);
        // startPage 后面紧跟的查询就是个分页查询
        List<Employee> emps = empservice.getAll();

        // 使用pageInfo包装查询结果  封装了详细的信息，，包括我们查出来的结果数据 传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);

        model.addAttribute("pageInfo", page);
        return "list";
    }
}

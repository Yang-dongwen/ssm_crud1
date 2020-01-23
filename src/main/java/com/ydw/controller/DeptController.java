package com.ydw.controller;

import com.ydw.bean.Dept;
import com.ydw.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理和部门有管的请求
 */
@Controller
public class DeptController {

    @Autowired
    private DeptService service;

    @RequestMapping("/depts")
    @ResponseBody
    public List<Dept> getDept(){
        return service.getDepts();
    }

}

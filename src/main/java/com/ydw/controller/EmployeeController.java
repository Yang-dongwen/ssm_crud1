package com.ydw.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ydw.bean.Employee;
import com.ydw.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService empservice;

    /**
     * 通过员工id进行查询
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/emps/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Employee getEmployee(@PathVariable("id") Integer id) {
        Employee employee = empservice.getEmployee(id);
        return employee;
    }

    /**
     * 根据id修改员工数据
     */
    /**
     * ajax不能直接发PUT请求 （引发血案）
     * 若发送PUT请求，请求体中的数据将无法封装成对象
     * 请求体中的数据request.getParameter("")都拿不到
     * Tomcat一看是PUT请求就不会封装请求体中的数据为map
     * 可以使用post请求在请求体中添加 &_method=PUT 即可
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emps/{empId}",method = RequestMethod.PUT)
    public String updateEmp(Employee employee) {
        int i = empservice.updateEmp(employee);
        return "code:" + i;
    }

    @ResponseBody
    @RequestMapping("/checkUser")
    public String getEmpByName(String empName) {
        /**
         * 用户名重复校验,后端校验JSR303
         * tamcat7以上只需导入hibernate-validator该jar包
         * tomcat7以下的服务器 需给服务器的lib包中替换标准的el
         */
        //  先判断用户民是否合法
        String regName = "(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
        if (!empName.matches(regName)) {
            return null;
        }
        boolean checkUser = empservice.checkUser(empName);
        if (checkUser) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 添加员工信息
     * @param employee
     * @param result
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emps", method = RequestMethod.POST)
    public String addEmp(@Valid Employee employee, BindingResult result, Model model) {
        if (result.hasErrors()) {
            List<FieldError> fieldErrors = result.getFieldErrors();
            model.addAttribute("field", fieldErrors);
            return "error";
        }
        empservice.addEmployee(employee);

        return "success";

    }

    /**
     * 利用ajax请求分页查询
     */
    @RequestMapping(value = "/emps", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo getEmps_2(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 查询之前只需调用，传入页码，以及分页页面的大小。
        PageHelper.startPage(pn, 5);
        // startPage 后面紧跟的查询就是个分页查询
        List<Employee> emps = empservice.getAll();

        // 使用pageInfo包装查询结果  封装了详细的信息，，包括我们查出来的结果数据 传入连续显示的页数
        PageInfo page = new PageInfo(emps, 5);

        return page;
    }

    /**
     * 查询所有员工信息（分页查询）
     */
//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {

        // 查询之前只需调用，传入页码，以及分页页面的大小。
        PageHelper.startPage(pn, 5);
        // startPage 后面紧跟的查询就是个分页查询
        List<Employee> emps = empservice.getAll();

        // 使用pageInfo包装查询结果  封装了详细的信息，，包括我们查出来的结果数据 传入连续显示的页数
        PageInfo page = new PageInfo(emps, 5);

        model.addAttribute("pageInfo", page);
        return "list";
    }

    @ResponseBody
    @RequestMapping(value = "emps/{ids}",method = RequestMethod.DELETE)
    public String delEmployeeById(@PathVariable("ids") String ids){               //  单个删除和批量删除结合在一起
        if (ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] id_s = ids.split("-");
            //  组装id的集合
            for (String id : id_s){
                int i = Integer.parseInt(id);
                del_ids.add(i);
            }
            empservice.deleteBatch(del_ids);
            return "success1";
        }else {
            int id = Integer.parseInt(ids);
            empservice.removeEmp(id);
            return "success2";
        }


    }
}

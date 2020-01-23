<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DW
  Date: 2020/1/18
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>
<head>
    <title>SSM_CRUD</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-min.js"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"/>

    <link type="text/css" src="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body lang="zh-CN">
<hr>
<h2>hello</h2>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM_CRUD</h1>
            </div>
        </div>
        <div class="row">
        <h2>hello</h2>
        </div>
        <div class="row">

        </div>
        <div class="row">

        </div>
    </div>
</body>
</html>--%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="but_add_emp">新增</button>
            <button class="btn btn-danger" id="but_del_emp">删除</button>
        </div>
    </div>
    <%--新增模态框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加员工信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-6">
                                <input type="text" name="empName" class="form-control" id="input_empName"
                                       placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="email" id="input_email"
                                       placeholder="email@ydw.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2" value="W"> 女
                                </label>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">d_name</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="select_dept"> <%--提交部门id--%>

                                </select>
                            </div>

                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="addEmp_but">添加</button>
                </div>
            </div>
        </div>
    </div>
    <%--员工修改模态框--%>
    <div class="modal fade" id="empUpdate_myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="emp_update_Name">email@example.com</p>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="email" id="update_input_email"
                                       placeholder="email@ydw.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender"  value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender"  value="W"> 女
                                </label>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">d_name</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="select_update_dept"> <%--提交部门id--%>

                                </select>
                            </div>

                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="update_Emp_but">更新</button>
                </div>
            </div>
        </div>
    </div>

    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emp_table">
                <thead>
                <tr>
                    <th><input type="checkbox" class="check_items"/></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptNo</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>

        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">

        <div class="col-md-6" id="page_info">

        </div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav">
            <nav aria-label="Page navigation">

            </nav>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var currentPage;
    // 用户名重复校验   添加button组件改变事件
    $("#input_empName").change(function () {
        var empName = $("#input_empName").val()
        // 发送ajax请求检查用户名是否可用
        $.ajax({
            url: "${pageContext.request.contextPath}/checkUser",
            data: "empName=" + empName,
            type: "GET",
            success: function (result) {
                if (result == "error") {
                    show_validate_msg("#input_empName", "error", "用户名已存在")
                    $("#addEmp_but").attr("invalid", "error")
                } else if (result == "success") {
                    show_validate_msg("#input_empName", "success", "用户名可用")
                    $("#addEmp_but").attr("invalid", "success")
                } else {
                    show_validate_msg("#input_empName", "error", "用户名输入格式有误（可以是中文2到5位，也可以是小写和数字的组合）")
                    $("#addEmp_but").attr("invalid", "error")
                }
            }
        })
    })

    // 提交数据的正确性校验
    function validate_add_form() {
        //  1. 拿到要校验的数据
        // 校验用户名信息
        var empName = $("#input_empName").val();
        var regName = /(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            // alert("用户名输入格式有误（可以是中文2到5位，也可以是小写和数字的组合）")
            show_validate_msg("#input_empName", "error", "用户名输入格式有误（可以是中文2到5位，也可以是小写和数字的组合）")
            return false
        } else {
            show_validate_msg("#input_empName", "success", "")
        }
        // 校验email信息
        var email = $("#input_email").val()
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if (!regEmail.test(email)) {
            // alert("邮箱输入格式不正确")
            show_validate_msg("#input_email", "error", "邮箱输入格式不正确")
            return false
        } else {
            show_validate_msg("#input_email", "success", "")
        }

        return true
    }

    // 显示校验结果的提示信息
    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error")
        $(ele).next("span").text("")
        if ("success" == status) {
            $(ele).parent().addClass("has-success")
            $(ele).next("span").text(msg)
        } else {
            $(ele).parent().addClass("has-error")
            $(ele).next("span").text(msg)
        }
    }

    /**
     * 点击添加按钮，保存信息
     */
    $("#addEmp_but").click(function () {

        // 先对要提交给服务器的数据进行校验
        if (!validate_add_form()) {
            return;
        }
        if ($(this).attr("invalid") == "error") {
            return;
        }

        // alert($("#myModal form").serialize()) 通过该方式传递给后台 后台执行添加操作
        $.ajax({
            url: "${pageContext.request.contextPath}/emps",
            type: "POST",
            data: $("#myModal form").serialize(),
            success: function (result) {
                /*for(var i = 0; i < result.length; i++){
                    if (item.field == "email") {
                        show_validate_msg("#input_email", "error", item.defaultMessage)
                    }
                    if (item.field == "empName") {
                        show_validate_msg("#input_empName", "error", item.defaultMessage)
                    }
                }*/
                // alert(result)
                /*$.each(result, function (index, item) {
                    if (item.field == "email") {
                        show_validate_msg("#input_email", "error", item.defaultMessage)
                    }
                    if (item.field == "empName") {
                        show_validate_msg("#input_empName", "error", item.defaultMessage)
                    }
                })
*/
                // 员工保存成功
                // 模态框关闭
                $("#myModal").modal('hide')
                // 来到最后一页
                to_page(9999)


            }
        })
    })

    /**
     * 点击新增按钮，弹出模态框
     * */
    $("#but_add_emp").click(function () {
        $("#myModal form")[0].reset();
        $("#myModal div").removeClass("has-success has-error")
        $("#myModal form").find(".help-block").text("")
        //  ajax发送部门信息，获取弹出下拉列表信息
        getdepts("#select_dept")

        //  弹出模态框
        $("#myModal").modal({
            backdrop: "static"
        })
    })
    /**
     * 默认前往第一页
     * */
    $(function () {
        to_page(1)
    })

    /**
     * 去向number页
     */
    function to_page(number) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emps",
            data: "pn=" + number,
            type: "get",
            success: function (result) {
                var emps = result.list;
                getEmps(emps)
                page_info(result)
                page_nav(result)
            }
        })
    }

    // 解析表格数据
    function getEmps(result) {
        $("#emp_table tbody").empty()
        $.each(result, function (index, item) {
            var checkBox = $("<td><input type='checkbox' class='check_item'/></td>")
            var empId = $("<td></td>").append(item.empId)
            var empName = $("<td></td>").append(item.empName)
            var gender = $("<td></td>").append(item.gender == "M" ? "男" : "女")
            var email = $("<td></td>").append(item.email)
            var dId = $("<td></td>").append(item.dId)
            var editBut = $("<button>  编辑</button>").addClass("btn btn-success btn-sm edit_button").append("<span></span>").addClass("glyphicon glyphicon-pencil").attr("empNo",item.empId)
            var delBut = $("<button>  删除</button>").addClass("btn btn-warning btn-sm del_button").append("<span></span>").addClass("glyphicon glyphicon-folder-close").attr("empNo",item.empId).attr("empName",item.empName)
            $("<tr></tr>").append(checkBox).append(empId).append(empName).append(gender).append(email).append(dId).append(editBut).append(delBut).appendTo("#emp_table tbody")
        })
    }

    // 解析显示分页信息
    function page_info(result) {
        $("#page_info").empty()
        $("#page_info").append("当前" + result.pageNum + " 页，总" + result.pages + "共页，总" + result.total + "条记录")
        currentPage = result.pageNum
    }


    // 解析分页条数据  点击分页条要能显示下一页
    function page_nav(result) {
        $("#page_nav nav").empty()
        // $("#page_nav").append()
        var ul = $("<ul></ul>").addClass("pagination")
        var firstLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"))
        var perLiLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"))
        if (result.hasPreviousPage == false) {
            firstLi.addClass("disabled")
            perLiLi.addClass("disabled")
        }
        // 为首页和上一页添加点击事件
        firstLi.click(function () {
            to_page(1)
        })
        perLiLi.click(function () {
            to_page(result.pageNum - 1)
        })
        ul.append(firstLi).append(perLiLi).append()
        $.each(result.navigatepageNums, function (index, item) {
            var nav_li = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"))
            if (result.pageNum == item) {
                nav_li.addClass("active")
            }
            nav_li.click(function () {
                to_page(item)
            })
            ul.append(nav_li)
        })

        var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"))

        var lastLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"))
        if (result.hasNextPage == false) {
            nextLi.addClass("disabled")
            lastLi.addClass("disabled")
        }
        // 为末页和下一页添加点击事件
        nextLi.click(function () {
            to_page(result.pageNum + 1)
        })
        lastLi.click(function () {
            to_page(result.pages)
        })
        ul.append(nextLi).append(lastLi).appendTo("#page_nav nav")

    }
    /**
     *
     * */
    function getdepts(ele){
        $.ajax({
            url: "${pageContext.request.contextPath}/depts",
            type: "GET",
            success: function (result) {
                // console.log(result)
                $("#select_update_dept").empty()
                $.each(result, function (index, item) {
                    var options = $("<option></option>").append(item.deptName).attr("value", item.deptId)
                    options.appendTo(ele)
                })
            }

        })
    }
    function getEmp(id){
// 发送ajax请求，显示员工信息
        $.ajax({
            url:"${pageContext.request.contextPath}/emps/" + id,
            type:"GET",
            success:function (result) {
                // console.log(result)
                var empName = result.empName;
                $("#emp_update_Name").text(empName)
                var email = result.email;
                $("#update_input_email").val(email)
                var gender = result.gender;
                $("#empUpdate_myModal input[name=gender]").val([gender])
                var did = result.dId
                $("#empUpdate_myModal select").val([did])
            }
        })
    }

    /**
     * 点击编辑按钮弹出模态框
     */
    $(document).on("click",".edit_button",function () {

        getdepts("#select_update_dept")
        var empNo = $(this).attr("empNo")
        getEmp(empNo)
        // 将员工id传到模态框的更新按钮中
        $("#update_Emp_but").attr("empNo",empNo)
        //  弹出修改模态框
        $("#empUpdate_myModal").modal({
            backdrop: "static"
        })
    })
    /**
     * 点击更新按钮发送ajax请求
     */
    $("#update_Emp_but").click(function () {
        // 校验email信息
        var email = $("#update_input_email").val()
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if (!regEmail.test(email)) {
            // alert("邮箱输入格式不正确")
            show_validate_msg("#update_input_email", "error", "邮箱输入格式不正确")
            return false
        } else {
            show_validate_msg("#update_input_email", "success", "")
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/emps/" + $(this).attr("empNo"),
            type:"PUT",
            data:$("#empUpdate_myModal form").serialize(), //+ "&_method=PUT",
            success:function (result) {
                // 模态框关闭
                $("#empUpdate_myModal").modal('hide')
                // 回到本页面
                to_page(currentPage)
            }
        })
    })
    /*
    点击删除按钮弹出提示信息
     */
    $(document).on("click",".del_button",function () {
        if (confirm("是否确定删除【" + $(this).attr("empName") + "】吗？")) {
            $.ajax({
                url:"${pageContext.request.contextPath}/emps/" + $(this).attr("empNo"),
                type:"POST",
                data:"_method=DELETE",
                success:function (result) {
                    // 模态框关闭
                    $("#empUpdate_myModal").modal('hide')
                    // 回到本页面
                    to_page(currentPage)
                }
            })
        }else{
            return ;
        }
    })

    /**
     * 完成全选全不选的功能
     */
    $(".check_items").click(function () {
        // attr 获取checked 是undefined
        // alert($(this).prop("checked"))   // 用prop来修改和读取原生属性的值
        var status = $(this).prop("checked");
        $(".check_item").prop("checked",status)
    })
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length == $(".check_item").length; // 所有的复选框按钮都选中 flag为true
        $(".check_items").prop("checked",flag)

    })
    /**
     * 点击全部删除，实现批量删除
     */
    $("#but_del_emp").click(function () {
        var empNames = ""
        var del_ids = ""
        $.each($(".check_item:checked"),function () {
            // alert($(this).parents("tr").find("td:eq(2)").text())  // 显示所选的所有员工姓名
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ","   // 组装员工姓名字符串
            del_ids += $(this).parents("tr").find("td:eq(1)").text() + "-"   // 组装员工id字符串
        })
        empNames = empNames.substring(0,empNames.length - 1);
        del_ids = del_ids.substring(0,del_ids.length - 1)
        if (confirm("确认删除【" + empNames + "】吗？")){  // 确认之后发送请求删除所选员工
            $.ajax({
                url:"${pageContext.request.contextPath}/emps/" + del_ids,
                type:"DELETE",
                success:function (result) {
                    // alert(result)
                    // 回到当前页面
                    to_page(currentPage)
                    $(".check_items").prop("checked",false)  // 如果全选按钮是选中状态 取消该状态
                }

            })
        }
    })


</script>
</body>
</html>

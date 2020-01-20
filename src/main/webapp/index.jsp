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
            <button class="btn btn-primary">新增</button><button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emp_table">
                <thead>
                <tr>
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
            <nav aria-label="Page navigation" >

            </nav>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        to_page(1)
    })
    function to_page(number) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emps",
            data:"pn=" + number,
            type: "get",
            success:function (result) {
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
        $.each(result, function (index ,item) {
            var empId = $("<td></td>").append(item.empId)
            var empName = $("<td></td>").append(item.empName)
            var gender = $("<td></td>").append(item.gender=="M"?"女":"男")
            var email = $("<td></td>").append(item.email)
            var dId = $("<td></td>").append(item.dId)
            var buttons = $("<td></td>").append("<button></button>")
            var editBut = $("<button>  编辑</button>").addClass("btn btn-success btn-sm").append("<span></span>").addClass("glyphicon glyphicon-pencil")
            var delBut = $("<button>  删除</button>").addClass("btn btn-warning btn-sm").append("<span></span>").addClass("glyphicon glyphicon-folder-close")
            $("<tr></tr>").append(empId).append(empName).append(gender).append(email).append(dId).append(editBut).append(delBut).appendTo("#emp_table tbody")
        })
    }
    // 解析显示分页信息
    function page_info(result) {
        $("#page_info").empty()
        $("#page_info").append("当前" + result.pageNum + " 页，总" + result.pages + "共页，总" + result.total + "条记录")
    }



    // 解析分页条数据  点击分页条要能显示下一页
    function page_nav(result) {
        $("#page_nav nav").empty()
        // $("#page_nav").append()
        var ul = $("<ul></ul>").addClass("pagination")
        var firstLi =  $("<li></li>").append($("<a></a>").append("首页").attr("href","#"))
        var perLiLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"))
        if(result.hasPreviousPage == false){
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
        $.each(result.navigatepageNums,function (index,item) {
            var nav_li =  $("<li></li>").append($("<a></a>").append(item).attr("href","#"))
            if(result.pageNum == item){
                nav_li.addClass("active")
            }
            nav_li.click(function () {
                to_page(item)
            })
            ul.append(nav_li)
        })

        var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"))

        var lastLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"))
        if(result.hasNextPage == false){
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
</script>
</body>
</html>

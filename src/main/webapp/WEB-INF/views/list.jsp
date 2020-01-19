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
            <button class="btn btn-primary btn-lg">新增</button><button class="btn btn-danger btn-lg">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptNo</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <td>${emp.empId}</td>
                    <td>${emp.empName}</td>
                    <td>${emp.gender="M"?"男":"女"}</td>
                    <td>${emp.email}</td>
                    <td>${emp.dId}</td>

                    <td>
                        <button class="btn btn-success">
                            <span class="glyphicon glyphicon-pencil">
                                编辑
                            </span>
                        </button>
                        <button  class="btn btn-warning">
                            <span class="glyphicon glyphicon-folder-close">
                                删除
                            </span>
                        </button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">

        <div class="col-md-6">
            当前第${pageInfo.pageNum}页,总共${pageInfo.pages}页 总记录数${pageInfo.total}
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                        <c:if test="${page == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page != pageInfo.pageNum}">
                            <li><a href="emps?pn=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li><a href="emps?pn=${pageInfo.pages}">末页</a></li>
                    </c:if>

                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>

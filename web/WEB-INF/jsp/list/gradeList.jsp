<%--
  Created by IntelliJ IDEA.
  User: praver
  Date: 2022/5/6
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/layui.js" rel="script">
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>院系详情列表 —— 显示所有院系</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 colmn">
            <button id="add" data-method="offset" data-type="t" class="layui-btn layui-btn-normal">增加</button>
            <div style="margin-top: 15px">
            </div>
        </div>
            <div class="col-md-4 colmn"></div>
            <div class="col-md-4 colmn">
                <form class="form-inline" action="queryGradeByName.do" method="post" style="float: right">
                    <input type="text" name="name" class="form-control" placeholder="请输入要查询的院系名称">
                    <input type="submit" class="btn btn-primary" value="查询">
                </form>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-hover table-striped">
                    <thead>
                    <th></th>
                    <th>院系ID</th>
                    <th>院系名称</th>
                    <th>院系简介</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach var="grade" items="${requestScope.get('gradeList')}">
                        <tr>
                            <td></td>
                            <td>${grade.getId()}</td>
                            <td>${grade.getName()}</td>
                            <td>${grade.getRemark()}</td>
                            <td>
                                <a  href="toUpdateGrade.do?id=${grade.getId()}" type="button" class="layui-btn layui-btn-primary layui-btn-sm query"><i class="layui-icon"></i></a>
                                <a  href="deleteGrade.do?id=${grade.getId()}" type="button" class="layui-btn layui-btn-primary layui-btn-sm delete"><i class="layui-icon"></i></a>
                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<script src="layui/layui.js"></script>

<script>
    $("#add").click(function show(){
        var a = layer.open({
            type: 1,
            area: ['60%','auto'],
            fix: true,
            title: '添加院系',
            shadeClose: true,
            offset:'t',
            content:$('#addGrade')
        });
    })



</script>

<%--添加--%>
<div id="addGrade" style="text-align: center" hidden>
    <ul class="layui-tab-title"></ul>
    <form action="addGrade.do" method="post" style="width: 1020px;">
        <div class="layui-form-item" style="width:1020px;">
            <label class="layui-form-label" style="width:340px;">院系名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" style="width:340px;">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label" style="width:340px;">院系描述</label>
            <div class="layui-input-block">
                <textarea name="remark" placeholder="请输入内容" class="layui-textarea" style="width: 340px; height: 100px;"></textarea>
            </div>
        </div>
        <input type="submit" class="layui-btn layui-btn-normal layui-btn-radius" value="提交">
    </form>
    <ul class="layui-tab-title"></ul>
</div>

</body>
</html>

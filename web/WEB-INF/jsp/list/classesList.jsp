<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: praver
  Date: 2022/5/8
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
                    <small>班级详情列表 —— 显示所有班级</small>
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
        <div class="col-md-8 colmn">
            <form class="form-inline" action="queryClassesByName.do" method="post" style="float: right">
                <select name="gradeid" lay-filter="aihao" class="form-control">
                    <option value="0">请选择院系</option>
                    <c:forEach var="grade" items="${requestScope.get('gradeList')}">
                        <option value="${grade.getId()}">${grade.getName()}</option>
                    </c:forEach>
                </select>
                <input type="text" name="queryName" class="form-control" placeholder="请输入要查询的班级名">
                <input type="submit" class="btn btn-primary" value="查询">
            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <th></th>
                <th>班级ID</th>
                <th>班级名称</th>
                <th>所属院系</th>
                <th>院系简介</th>
                <th>操作</th>
                </thead>
                <tbody>
                <c:forEach var="classes" items="${requestScope.get('classesList')}">
                    <tr>
                        <td></td>
                        <td>${classes.getId()}</td>
                        <td>${classes.getName()}</td>
                        <td>${classes.grade.getName()}</td>
                        <td>${classes.getRemark()}</td>
                        <td>
                            <a  href="toUpdateClasses.do?id=${classes.getId()}" type="button" class="layui-btn layui-btn-primary layui-btn-sm query"><i class="layui-icon"></i></a>
                            <a  href="deleteClasses.do?id=${classes.getId()}" type="button" class="layui-btn layui-btn-primary layui-btn-sm delete"><i class="layui-icon"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<%--添加--%>
<div id="addClasses" style="text-align: center" style="width: 1020px;" hidden>
    <form id="form" class="layui-form layui-form-pane" action="" method="post">

        <%--        姓名--%>
        <div class="layui-form-item">
            <label class="layui-form-label">班级名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <%--        选择院系--%>
        <div class="layui-form-item">
            <label class="layui-form-label">选择院系</label>
            <div class="layui-input-block">
                <select name="grade" lay-filter="aihao">
                    <option value=""></option>
                    <c:forEach var="grade" items="${requestScope.get('gradeList')}">
                        <option value="${grade.getId()}">${grade.getName()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <%--        remark--%>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">班级简介</label>
            <div class="layui-input-block">
                <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <input type="text" name="userType" value="2" hidden>
        <%--        提交--%>
        <div class="layui-form-item">
            <button type="button" id="subBtn" class="layui-btn layui-btn-normal layui-btn-radius" value="提交"
                    onclick=" setTimeout(function (){document.location.href='showClasses.do';},500)">
                提交
            </button>
        </div>
    </form>
</div>

<script src="layui/layui.js"></script>
<script>
    $("#add").click(function show(){
        layer.open({
            type: 1,
            area: ['60%','auto'],
            fix: true,
            title: '添加班级',
            shadeClose: true,
            offset:'t',
            content:$('#addClasses')
        });
    })




    $("#subBtn").click(function addClasses() {
        console.log("提交");
        var name = $("input[name='name']").val();
        var gradeid = $("select[name='grade']").val();
        var remark = $("textarea[name='remark']").val();


        setTimeout(function () {
            console.log("进入方法");

            $.ajax({
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                type: "post",
                url: "addClasses.do",
                data: JSON.stringify(
                    {
                        "name": name,
                        "gradeid": gradeid,
                        "remark": remark
                    }
                ),
                success: function () {
                    layer.closeAll();
                    console.log("添加成功!");
                },
                error: function (){
                    console.log("添加失败!");
                }
            });
        },0)

        console.log("方法执行结束!");
    })



</script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: praver
  Date: 2022/5/8
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/layui.js" rel="script">
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div id="updateStudent" style="text-align: center" style="width: 1020px;">
    <form id="form" class="layui-form layui-form-pane" action="/updateStudent.do" method="post">

        <input type="text" name="id" value="${student.getId()}" hidden>

        <div class="layui-form-item">
            <label class="layui-form-label">选择班级</label>
            <div class="layui-input-block">
                <select name="classId" lay-filter="aihao">
                    <option value="0"></option>
                    <c:forEach var="classes" items="${requestScope.get('classesList')}">
                        <option value="${classes.getId()}">${classes.getName()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <%--        姓名--%>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input" value="${student.getName()}">
            </div>
        </div>

        <%--        账号--%>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="username" placeholder="请输入账号" value="${student.getUsername()}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--        密码--%>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" name="password" placeholder="请输入密码" value="${student.getPassword()}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--        性别--%>
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="">
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <%--        选择院系--%>
        <div class="layui-form-item">
            <label class="layui-form-label">选择老师</label>
            <div class="layui-input-block">
                <select name="tid" lay-filter="aihao">
                    <option value="0"></option>
                    <c:forEach var="teacher" items="${requestScope.get('teacherList')}">
                        <option value="${teacher.getId()}">${teacher.getName()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <%--        remark--%>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">简介</label>
            <div class="layui-input-block">
                <textarea name="remark" placeholder="请输入内容" class="layui-textarea">${student.getRemark()}</textarea>
            </div>
        </div>
        <input type="text" name="userType" value="2" hidden>
        <%--        提交--%>
        <div class="layui-form-item">
            <button type="button" id="ASB" class="layui-btn layui-btn-normal layui-btn-radius"
                    value="提交" onclick=" setTimeout(function (){document.location.href='showStudent.do'},1000)">提交
            </button>
        </div>
    </form>
</div>

<script src="layui/layui.js"></script>
<script>
    $("#ASB").click(function addTeacher() {
        console.log("提交");

        var id = $("input[name='id']").val();
        var classId = $("select[name='classId']").val();
        var name = $("input[name='name']").val();
        var sex = $("input[name='sex']:checked").val();
        var username = $("input[name='username']").val();
        var password = $("input[name='password']").val();
        var tid = $("select[name='tid']").val();
        var remark = $("textarea[name='remark']").val();

        console.log("进入方法前");

        setTimeout(function addTeacher() {

            console.log("进入了");

            $.ajax({
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                type: "post",
                url: "updateStudent.do",
                data: JSON.stringify(
                    {
                        "id": id,
                        "name": name,
                        "sex": sex,
                        "username": username,
                        "password": password,
                        "classId": classId,
                        "tid": tid,
                        "remark": remark
                    }
                ),
                success: function () {
                    console.log("执行成功!");
                },
                error: function () {
                    console.log("执行失败!");
                }
            });
        }, 0)
    })
</script>
</body>
</html>

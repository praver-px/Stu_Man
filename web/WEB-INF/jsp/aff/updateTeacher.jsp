<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: praver
  Date: 2022/5/7
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/layui.js" rel="script">
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div id="addTeacher" style="text-align: center" style="width: 1020px;">
    <form id="form" class="layui-form layui-form-pane" action="updateTeacher.do" method="post">
        <input type="text" name="id" value="${teacher.getId()}" hidden>
        <%--        姓名--%>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input" value="${teacher.getName()}">
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
        <%--        账号--%>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="username" placeholder="请输入账号" value="${teacher.getUsername()}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--        密码--%>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" name="password" placeholder="请输入密码" value="${teacher.getPassword()}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--        手机号--%>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="tel" name="mobile" lay-verify="required" value="${teacher.getMobile()}"
                       placeholder="请输入" autocomplete="off"
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
            <label class="layui-form-label">教师简介</label>
            <div class="layui-input-block">
        <textarea name="remark" placeholder="请输入内容" class="layui-textarea">${teacher.getRemark()}</textarea>
            </div>
        </div>
        <input type="text" name="userType" value="2" hidden>
        <%--        提交--%>
        <div class="layui-form-item">
            <button type="button" id="UTB" class="layui-btn layui-btn-normal layui-btn-radius"
                    value="提交" onclick=" setTimeout(function (){document.location.href='showTeacher.do';},2000)">提交
            </button>
        </div>
    </form>
</div>

<script src="layui/layui.js"></script>

<script>

    $("#UTB").click(function () {

        var id = $("input[name='id']").val();
        var name = $("input[name='name']").val();
        var sex = $("input[name='sex']:checked").val();
        var username = $("input[name='username']").val();
        var password = $("input[name='password']").val();
        var mobile = $("input[name='mobile']").val();
        var gradeid = $("select[name='grade']").val();
        var remark = $("textarea[name='remark']").val();
        var userType= 2;

        console.log("方法执行前!");

        setTimeout(function updateTeacher() {
            $.ajax({
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                type: "post",
                url: "updateTeacher.do",
                data: JSON.stringify(
                    {
                        "id": id,
                        "name": name,
                        "sex": sex,
                        "username": username,
                        "password": password,
                        "mobile": mobile,
                        "gradeid": gradeid,
                        "remark": remark,
                        "userType":userType
                    }
                ),
                success:function (){
                    console.log("执行成功！");
                },
                error:function (){
                    console.log("执行失败！");
                }
            });
        },0)
        console.log("方法执行后！");
    })

</script>
</body>
</html>

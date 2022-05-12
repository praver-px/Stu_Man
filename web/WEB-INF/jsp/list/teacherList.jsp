<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: praver
  Date: 2022/5/6
  Time: 21:45
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
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>教师详情列表 —— 显示所有老师</small>
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
            <form class="form-inline" action="queryTeacherByName.do" method="post" style="float: right">
                <select name="grade" lay-filter="aihao" class="form-control">
                    <option value="0">请选择院系</option>
                    <c:forEach var="grade" items="${requestScope.get('gradeList')}">
                        <option value="${grade.getId()}">${grade.getName()}</option>
                    </c:forEach>
                </select>
                <input type="text" name="queryName" class="form-control" placeholder="请输入要查询的教师名称">
                <input type="submit" class="layui-btn layui-btn-normal" value="查询">
            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <th></th>
                <th>教师ID</th>
                <th>教师姓名</th>
                <th>用户名</th>
                <th>教师性别</th>
                <th>所属院系</th>
                <th>手机号</th>
                <th>教师简介</th>
                <th>操作</th>
                </thead>
                <tbody>
                <c:forEach var="teacher" items="${requestScope.get('teacherList')}">
                    <tr>
                        <td></td>
                        <td>${teacher.getId()}</td>
                        <td>${teacher.getName()}</td>
                        <td>${teacher.getUsername()}</td>
                        <td>${teacher.getSex()}</td>
                        <td>${teacher.getGrade().getName()}</td>
                        <td>${teacher.getMobile()}</td>
                        <td>${teacher.getRemark()}</td>
                        <td>
                            <a href="toUpdateTeacher.do?id=${teacher.getId()}" type="button"
                               class="layui-btn layui-btn-primary layui-btn-sm query"><i class="layui-icon"></i></a>
                            <a href="deleteTeacher.do?id=${teacher.getId()}" type="button"
                               class="layui-btn layui-btn-primary layui-btn-sm delete"><i class="layui-icon"></i></a>
                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>



<%--添加--%>
<div id="addTeacher" style="text-align: center" style="width: 1020px;" hidden>
    <form id="form" class="layui-form layui-form-pane"  method="post">

        <%--        姓名--%>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input">
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
                <input type="text" name="username" placeholder="请输入账号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--        密码--%>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--        手机号--%>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="tel" name="mobile" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <%--        选择院系--%>
        <div class="layui-form-item">
            <label class="layui-form-label">选择院系</label>
            <div class="layui-input-block">
                <select name="gradeid" lay-filter="aihao">
                    <option value="0"></option>
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
                <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <input type="text" name="userType" value="2" hidden>
        <%--        提交--%>
        <div class="layui-form-item">
            <button type="button" id="ATB" class="layui-btn layui-btn-normal layui-btn-radius"
                    value="提交" onclick=" setTimeout(function (){document.location.href='showTeacher.do'},1000)">提交
            </button>
        </div>
    </form>
</div>


<script src="layui/layui.js"></script>
<script>
    $(function () {
        $("#add").click(function show() {
            layer.open({
                type: 1,
                area: ['60%', 'auto'],
                fix: true,
                title: '添加教师',
                shadeClose: true,
                offset: 't',
                content: $('#addTeacher')
            });
        })



        $("#ATB").click(function addTeacher() {
            console.log("提交");

            var name = $("input[name='name']").val();
            var sex = $("input[name='sex']:checked").val();
            var username = $("input[name='username']").val();
            var password = $("input[name='password']").val();
            var mobile = $("input[name='mobile']").val();
            var gradeid = $("select[name='gradeid']").val();
            var remark = $("textarea[name='remark']").val();

            console.log("进入方法前");

            setTimeout(function addTeacher() {

                console.log("进入了");

                $.ajax({
                    dataType: "json",
                    contentType: "application/json;charset=UTF-8",
                    type: "post",
                    url: "addTeacher.do",
                    data: JSON.stringify(
                        {
                            "name": name,
                            "sex": sex,
                            "username": username,
                            "password": password,
                            "mobile": mobile,
                            "gradeid": gradeid,
                            "remark": remark
                        }
                    ),
                    success: function () {
                        console.log("执行成功!");
                    },
                    error:function (){
                        console.log("执行失败!");
                    }
                });
            },0)
        })

    })
</script>
</body>
</html>

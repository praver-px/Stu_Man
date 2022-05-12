<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: praver
  Date: 2022/5/8
  Time: 15:06
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
<div id="addClasses" style="text-align: center" style="width: 1020px;" >
    <form id="form" class="layui-form layui-form-pane" action="updateClasses.do" method="post">

        <input type="text" name="id" value="${classes.getId()}" hidden>

        <%--        姓名--%>
        <div class="layui-form-item">
            <label class="layui-form-label">班级名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input" value="${classes.getName()}">
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
                <textarea name="remark" placeholder="请输入内容" class="layui-textarea">${classes.getRemark()}</textarea>
            </div>
        </div>
        <input type="text" name="userType" value="2" hidden>
        <%--        提交--%>
        <div class="layui-form-item">
            <button type="button" id="subBtn" class="layui-btn layui-btn-normal layui-btn-radius" value="提交"
                    onclick=" setTimeout(function (){document.location.href='showClasses.do';},2000)">
                提交
            </button>
        </div>
    </form>
</div>

<script src="layui/layui.js"></script>
<script>
    $("#subBtn").click(function addClasses() {
        console.log("提交");
        var id = $("input[name='id']").val();
        var name = $("input[name='name']").val();
        var gradeid = $("select[name='grade']").val();
        var remark = $("textarea[name='remark']").val();


        setTimeout(function () {
            console.log("进入方法");

            $.ajax({
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                type: "post",
                url: "updateClasses.do",
                data: JSON.stringify(
                    {
                        "id":id,
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

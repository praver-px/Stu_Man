<%--
  Created by IntelliJ IDEA.
  User: praver
  Date: 2022/5/6
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/layui.js" rel="script">
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>

<%--修改--%>
<div id="queryGrade" style="text-align: center">
    <ul class="layui-tab-title"></ul>
    <form action="updateGrade.do" action="updateGrade.do"method="post" style="width: 1020px;">
        <input type="text" name="id" value="${grade.getId()}" hidden>
        <div class="layui-form-item" style="width:1020px;">
            <label class="layui-form-label" style="width:340px;">院系名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input" value="${grade.getName()}"
                       style="width:340px;">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label" style="width:340px;">院系描述</label>
            <div class="layui-input-block">
                <textarea  id="remark" name="remark" placeholder="请输入内容"
                           class="layui-textarea" style="width: 340px;
                          height: 100px;" >${grade.getRemark()}</textarea>
            </div>
        </div>
        <button type="submit" class="layui-btn layui-btn-normal layui-btn-radius"
                onclick=" setTimeout(function (){document.location.href='showTeacher.do';},2000)"> 提交</button>
        <button href="system/index.do" class="layui-btn layui-btn-normal layui-btn-radius">返回</button>
    </form>

    <ul class="layui-tab-title"></ul>
</div>
</body>
</html>

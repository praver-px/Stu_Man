<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
  <base href="<%=basePath%>">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>管理系统</title>
  <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">学生管理系统</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <h2 class="layui-layout-left" style="color: white; margin:15px;">
       欢迎您！<span>${sessionScope.sessionUser.name} </span>
    </h2>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <span>${sessionScope.sessionUser.name}</span>
        </a>
        <dl class="layui-nav-child">
          <dd><a href="logout.do">退出登陆</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
       &nbsp;
      </li>
    </ul>
  </div>

  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <c:if test="${userType == 1 || userType == 2}">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">人员管理</a>
          <dl class="layui-nav-child">
            <c:if test="${sessionScope.userType == 1}">
            <dd><a href="javascript:;" data-type=" toAdd" class="subMenu" data-id="1" data-title="院系详情" data-url="showGrade.do"><i
                    class="iconfont  icon-yonghu iconset"></i>院系管理</a></dd>
            <dd><a href="javascript:;" data-type=" toAdd" class="subMenu" data-id="2" data-title="教师详情" data-url="showTeacher.do"><i
                    class="iconfont  icon-yonghu iconset"></i>教师管理</a></dd>
            </c:if>
            <dd><a href="javascript:;" data-type=" toAdd" class="subMenu" data-id="3" data-title="班级详情" data-url="showClasses.do"><i
                    class="iconfont  icon-yonghu iconset"></i>班级管理</a></dd>
            <dd><a href="javascript:;" data-type=" toAdd" class="subMenu" data-id="4" data-title="学生详情" data-url="showStudent.do"><i
                    class="iconfont  icon-yonghu iconset"></i>学生管理</a></dd>
          </dl>
        </li>
        </c:if>
        <li class="layui-nav-item"><a href="logout.do">退出系统</a></li>
      </ul>
    </div>
  </div>

  <div class="layui-body" id="container">
    <div class="layui-container-fluid">
      <div class="layui-tab" lay-filter="tabs" lay-allowClose="true">
        <ul class="layui-tab-title">
        </ul>
        <div class="layui-tab-content">
        </div>
      </div>
    </div>

  </div>

  <div class="layui-footer">
    <!-- 底部固定区域 -->
    编写人@praver ----- 此项目为数据课程设计项目，bug较多
  </div>
</div>
<script src="layui/layui.js"></script>
<script>
  //JS
  layui.use(['element', 'layer', 'util'], function(){
    var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

    //头部事件
    util.event('lay-header-event', {
      //左侧菜单事件
      menuLeft: function(othis){
        layer.msg('展开左侧菜单的操作', {icon: 0});
      }
      ,menuRight: function(){
        layer.open({
          type: 1
          ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
          ,area: ['260px', '100%']
          ,offset: 'rt' //右上角
          ,anim: 5
          ,shadeClose: true
        });
      }
    });

  });

  layui.use(['element'], function() {
    var element = layui.element;
    // var layer = layui.layer;
    var $ = layui.$;
    // 配置tab实践在下面无法获取到菜单元素
    $('.subMenu').on('click', function() {
      var dataid = $(this);
      //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
      if ($(".layui-tab-title li[lay-id]").length <= 0) {
        //如果比零小，则直接打开新的tab项
        active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
      } else {
        //否则判断该tab项是否以及存在
        var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
        $.each($(".layui-tab-title li[lay-id]"), function() {
          //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
          if ($(this).attr("lay-id") == dataid.attr("data-id")) {
            isData = true;
          }
        })
        if (isData == false) {
          //标志为false 新增一个tab项
          active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
        }
      }
      //最后不管是否新增tab，最后都转到要打开的选项页面上
      active.tabChange(dataid.attr("data-id"));
    });

    var active = {
      //在这里给active绑定几项事件，后面可通过active调用这些事件
      tabAdd: function(url, id, name) {
        //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
        //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
        //tabs:中间主体的fiter名
        element.tabAdd('tabs', {
          title: name,
          content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url +
                  '" style="width:100%;height:99%;"></iframe>',
          id: id //规定好的id
        })
        FrameWH(); //计算ifram层的大小
      },
      tabChange: function(id) {
        //切换到指定Tab项
        element.tabChange('tabs', id); //根据传入的id传入到指定的tab项
      },
      tabDelete: function(id) {
        element.tabDelete("tabs", id); //删除
      }
    };

    function FrameWH() {
      var h = $(window).height();
      $("iframe").css("height", h + "px");
    }
  });
</script>
</body>
</html>
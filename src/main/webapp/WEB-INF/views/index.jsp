<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018/6/25
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>

</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="">在线考试系统</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <%--<ul class="layui-nav left fast-add" lay-filter="">--%>
        <%--<li class="layui-nav-item">--%>
            <%--<a href="javascript:;">+新增</a>--%>
            <%--<dl class="layui-nav-child"> <!-- 二级菜单 -->--%>
                <%--<dd><a onclick="x_admin_show('资讯','http://www.baidu.com')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>--%>
                <%--<dd><a onclick="x_admin_show('图片','http://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>--%>
                <%--<dd><a onclick="x_admin_show('用户','http://www.baidu.com')"><i class="iconfont">&#xe6b8;</i>用户</a></dd>--%>
            <%--</dl>--%>
        <%--</li>--%>
    <%--</ul>--%>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">admin</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="/account/login">退出</a></dd>
            </dl>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>考生管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="student_list?p=1">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>考生列表</cite>

                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>试题管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/question/OptQueList?p=1">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>选择题列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/question/BlankQueList?p=1">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>填空题列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/paper/paperList?p=1">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>试卷管理</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6ce;</i>
                    <cite>系统统计</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/analysis/echarts1">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>成绩分布分析</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/analysis/echarts2">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>班级成绩分析</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/analysis/echarts3">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>试卷难易程度</cite>
                        </a>
                    </li>

                </ul>
            </li>

        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>欢迎</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/account/welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<%--<div class="footer">--%>
    <%--<div class="copyright">Copyright ©2018 x-admin v2.3 All Rights Reserved</div>--%>
<%--</div>--%>
<!-- 底部结束 -->
</body>
</html>

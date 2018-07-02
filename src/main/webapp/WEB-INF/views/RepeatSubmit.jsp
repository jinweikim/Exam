<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="/css/head.css?v=20180622183805">
    <link type="text/css" rel="stylesheet" href="/css/common.css?v=20180622183805">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <link rel="stylesheet" href="/css/xadmin.css">

    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <title>重复提交</title>
</head>
<body >

<div class="stu_ks" style="margin: auto;width: 80%;height: 100%" align="center">
    <h1 class="stu_ks_tit">
        阅卷结果
    </h1>
    <table class="layui-table" style="margin: 20px">
        <tbody>
        <tr style="text-align: center">
            <td style="background-color:#e4e4e4;">学号</td>
            <td>${sessionScope._session_user.id}</td>
            <td style="background-color:#e4e4e4;">姓名</td>
            <td>
                ${sessionScope._session_user.username}
            </td>
            <td style="background-color:#e4e4e4;">分数</td>
            <td>
                ${grade}
            </td>
        </tr>
        </tbody>
    </table>
    <a title="确定" href="javascript:history.back(1)">
        <span class="layui-btn layui-btn-normal layui-btn-mini" style="background:#ff4927">确定</span>
    </a>
</div>

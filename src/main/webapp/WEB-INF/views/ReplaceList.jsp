<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018/6/25
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎来到在线考试系统管理区</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-anim">
<div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <span class="x-right" style="line-height:40px">条</span>
        <span class="x-right" style="line-height:40px" id="total">${queList.total}</span>
        <span class="x-right" style="line-height:40px">共有数据:</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th width="70%">题目</th>
            <th >答案</th>
            <th >操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${queList.list}" var="q">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i
                            class="layui-icon">&#xe605;</i></div>
                </td>

                <td>${q.que_head} <a onclick="optionDisplay(this,${q.que_id})" href="javascript:;" style="text-decoration:underline;color:blue">展开</a><br/>
                    <span id="option_${q.que_id}" style="display:none">
                    <c:if test="${not empty q.que_opt_a}">A.${q.que_opt_a} <br/></c:if>
                    <c:if test="${not empty q.que_opt_b}">B.${q.que_opt_b} <br/></c:if>
                    <c:if test="${not empty q.que_opt_c}">C.${q.que_opt_c} <br/></c:if>
                    <c:if test="${not empty q.que_opt_d}">D.${q.que_opt_d}<br/></c:if>
                    <c:if test="${not empty q.que_opt_e}">E.${q.que_opt_e}</c:if>
                    </span>
                </td>
                <td>${q.que_ans}</td>
                <td class="td-manage" align="center">
                    <a title="编辑" onclick="x_admin_show('用此替换','doReplace?replaceId=${q.que_id}&sourceId=${sourceId}',600,400)" href="javascript:;">
                        <span class="layui-btn layui-btn-normal layui-btn-mini">用此替换</span>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="num" href="replace_list?p=${queList.firstPage}&queId=${sourceId}">首页</a>
            <c:if test="${queList.pageNum!=1}">
                <a class="num" href="replace_list?p=${queList.prePage}&queId=${sourceId}">前页</a>
            </c:if>
            <b class="current">第${queList.pageNum}页</b>
            <c:if test="${queList.pageNum!=queList.lastPage}">
                <a class="num" href="replace_list?p=${queList.nextPage}&queId=${sourceId}">后页</a>
            </c:if>
            <a class="num" href="replace_list?p=${queList.lastPage}&queId=${sourceId}">尾页</a>
        </div>
    </div>

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function optionDisplay(obj,id){
        var span=document.getElementById('option_'+id);

        if($(obj).text()=='隐藏'){
            span.style.display="none";
            $(obj).text("展开");
        }
        else{
            span.style.display="inline";
            $(obj).text("隐藏");
        }
    }

    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {

            //发异步删除数据
            $.ajax({
                type: "get",
                url: "/question/delete/"+id,
                success: function (response) {
                    if (response.status != null && response.status == 'success') {
                        $(obj).parents("tr").remove();
                        var elem = $('#total');
                        var last = elem.text();
                        elem.text(last-1);
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    }
                    else {
                        layer.msg('删除失败!', {icon: 1, time: 1000});
                    }
                },
                error: function () {
                    layer.msg('删除失败!', {icon: 1, time: 1000});
                }
            });
        });
    }

    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>
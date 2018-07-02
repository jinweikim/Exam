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

<body class="layui-anim layui-anim-fadein">
<div class="x-body">
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','ReCombinePaper',600,400)"><i class="layui-icon"></i>重新生成试卷</button>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
        <span class="x-right" style="line-height:40px">共有数据:${queList.total}条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>题号</th>
            <th width="70%">题目</th>
            <th>答案</th>
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

                <td>${q.que_id}</td>
                <td>${q.que_head}
                    <c:if test="${q.que_type=='opt'}">
                        <a onclick="optionDisplay(this,${q.que_id})" href="javascript:;" style="text-decoration:underline;color:blue">选项</a><br/>
                        <span id="option_${q.que_id}" style="display:none">
                            A.${q.que_opt_a} <br/>
                            B.${q.que_opt_b} <br/>
                            C.${q.que_opt_c} <br/>
                            D.${q.que_opt_d}<br/>
                        <c:if test="${not empty q.que_opt_e}"> E.${q.que_opt_e}</c:if>
                        </span>
                    </c:if>
                </td>
                <td>${q.que_ans}</td>
                <td class="td-manage" align="center">
                    <a title="编辑" onclick="x_admin_show('编辑','replace_list?p=1&queId='+${q.que_id},600,400)" href="javascript:;">
                        <span class="layui-btn layui-btn-normal layui-btn-mini">替换</span>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="num" href="paperList?p=${queList.firstPage}">首页</a>
            <c:if test="${queList.pageNum!=1}"><a class="num" href="paperList?p=${queList.prePage}">前页</a></c:if>
            <b class="current">第${queList.pageNum}页</b>
            <c:if test="${queList.pageNum!=queList.lastPage}"><a class="num" href="paperList?p=${queList.nextPage}">后页</a></c:if>
            <a class="num" href="paperList?p=${queList.lastPage}">尾页</a>
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
    /*用户-停用*/
    function optionDisplay(obj,id){
        var span=document.getElementById('option_'+id);

        if($(obj).text()=='隐藏'){
            span.style.display="none";
            $(obj).text("选项");
        }
        else{
            span.style.display="inline";
            $(obj).text("隐藏");
        }
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
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
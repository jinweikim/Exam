<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018/6/26
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>考生信息编辑</title>
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

<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="L_id" class="layui-form-label">
                <span class="x-red">*</span>学号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_id" value=${user.id} name="id" readonly required=""
                       autocomplete="off" class="layui-input" style="background-color:lightgrey;color:grey">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_username" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_username" value=${user.username} name="username" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_password" class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_password" value=${user.password} name="password" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_grade" class="layui-form-label">
                <span class="x-red">*</span>分数
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_grade" value=${user.grade} name="grade" required="" lay-verify="repass"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_userClass" class="layui-form-label">
                <span class="x-red">*</span>班级
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_userClass" value=${user.userClass} name="userClass" required="" lay-verify="repass"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" >
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">
                更改
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function(value){
                if(value.length < 5){
                    return '昵称至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });

        // $("#update_btn").click(function () {
        //     $.post("/account/update",
        //         $('#accountUpdate').serialize(),
        //         function (data) {
        //         layer.alert("增加成功", {icon: 6}, function () {
        //             // 获得frame索引
        //             var index = parent.layer.getFrameIndex(window.name);
        //             //关闭当前frame
        //             parent.layer.close(index);
        //         });
        //     });
        // });


//监听提交
        form.on('submit(add)', function (data) {
            $.ajax({
                type: "post",
                url: "/account/update",
                data: data.field,
                success: function (response) {
                    var message, iconNumber;
                    if (response.status != null && response.status == 'success') {
                        message = "更新成功";
                        iconNumber = 6;
                    }
                    else {
                        message = "更新失败";
                        iconNumber = 5;
                    }
                    var latterOperation = function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);

                        //关闭当前frame
                        window.parent.location.reload();
                        parent.layer.close(index);
                    };
                    layer.alert(message, {icon: iconNumber}, latterOperation);
                },
                error: function () {
                    var message = "更新失败";
                    var latterOperation = function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);

                        //关闭当前frame
                        window.parent.location.reload();
                        parent.layer.close(index);
                    };
                    layer.alert(message, {icon: 5}, latterOperation);
                }
            });
            return false;
        });

    });


</script>
</body>

</html>

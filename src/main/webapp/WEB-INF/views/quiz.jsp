<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="/css/head.css?v=20180622183805">
    <link type="text/css" rel="stylesheet" href="/css/common.css?v=20180622183805">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <title>考卷</title>
</head>
<body>


<center>
    <div class="stu_ks">
        <h1 class="stu_ks_tit">
            课程考试
        </h1>
        <table class="ksgl_table" cellpadding="0" cellspacing="0" style="margin:30px auto;">
            <tbody>
            <tr>
                <td style="background-color:#e4e4e4;">考生考号</td>
                <td>${sessionScope._session_user.id}</td>
                <td style="background-color:#e4e4e4;">考生姓名</td>
                <td>
                    ${sessionScope._session_user.username}
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</center>
<div class="xk_con">
    <div class="content">
        <div class="ks_left ptb30">
            <h1 class="ks_left_tit" id="keguanti">
                客观题
                <span class="col666 fs14 ml8">
    			(共${fn:length(queList)}题)
    			</span>
            </h1>
            <form method="post" id="myForm" action="/quiz/end">
                <c:forEach items="${queList}" var="q" varStatus="status">
                    <div>
                        <ul class="mt30 fl">
                            <li class="ks_t_xh" for="option${status.index+1}">${status.index+1}</li>
                            <li class="ks_tm mb10" id="${status.index+1}">${q.que_head}</li>
                            <div class="clear"></div>
                            <c:choose>
                                <c:when test="${q.que_type=='opt'}">
                                    <div id="option${status.index+1}">
                                        <p class="tm_xx">
                                            <input type="radio" class="mr5" name="ans_${status.index}" value="A">A.&nbsp;&nbsp;${q.que_opt_a}
                                        </p>
                                        <p class="tm_xx">
                                            <input type="radio" class="mr5" name="ans_${status.index}" value="B">B.&nbsp;&nbsp;${q.que_opt_b}
                                        </p>
                                        <p class="tm_xx">
                                            <input type="radio" class="mr5" name="ans_${status.index}" value="C">C.&nbsp;&nbsp;${q.que_opt_c}
                                        </p>
                                        <p class="tm_xx">
                                            <input type="radio" class="mr5" name="ans_${status.index}" value="D">D.&nbsp;&nbsp;${q.que_opt_d}
                                        </p>
                                        <c:if test="${not empty q.que_opt_e}">
                                            <p class="tm_xx">
                                                <input type="radio" class="mr5" name="ans_${status.index}" value="E">E.&nbsp;&nbsp;${q.que_opt_e}
                                            </p></c:if>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" id="option${status.index+1}" name="ans_${status.index}"
                                           autocomplete="off" class="layui-input">
                                </c:otherwise></c:choose>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </c:forEach>
                <div style="width:100%;" align="center"><input class="layui-btn" style="width:40%;margin: 20px" readonly
                                                               value="提交试卷"
                                                               onclick="beforeSubmit(this)">
                </div>
            </form>


        </div>
        <div class="ks_right">
            <div id="div_question_menu" style="position: fixed; background-color: rgb(255, 255, 255); top: 207px;">
                <ul class="ks_cs">
                    <li class="r_top_sl mt10" style="font-size:20px;">
                        客观题共<span class="col_red">${fn:length(queList)}</span> 题，
                        满分<span class="col_red" id="span_objRightCount">100</span> 分。
                    </li>

                </ul>
                <dl class="ks_r_cen mt20" style="margin-bottom:50px;font-size:16px;">
                    <dt class="r_cen_dl"><img src="/images/ks_r_ywhite.png"><a class="r_cen_tit" href="#keguanti">客观题</a></dt>
                    <c:forEach var="item" varStatus="status" begin="1" end="${fn:length(queList)}" step="4">
                        <dd class="rr_cen_dd">
                            <a class="rr_cen_xh" id="obj_nav_${status.index}" name="obj_nav" href="#${status.index}">${status.index} - ${status.index+3}</a>
                        </dd>
                    </c:forEach>
                    <dt class="r_cen_js"></dt>
                </dl>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<script>
    $(window).scroll(function () {
        var div = document.getElementById("div_question_menu");
        if (div != null) {
            var topHeight = 207;
            var top = document.documentElement.scrollTop || document.body.scrollTop;
            if (top >= topHeight) {
                div.style.top = "0px";
            } else {
                var mytop = topHeight - top;
                div.style.top = mytop + "px";
            }
        }
    });

    function beforeSubmit(button) {
        var canSend = true;
        for (var i = 0; i < 20; i++) {
            var temp = $("#myForm").serializeArray()[i];
            if (temp == null || temp.name != ('ans_' + i)) {
                canSend = false;
                layer.alert('第' + (i + 1) + '题未做!');
                $("html,body").animate({scrollTop: $("#" + (i + 1)).offset().top - 200}, 800);
                break;
            }
        }
        if (canSend == true) {
            $("#myForm").submit();
        }
    }
</script>
</body>
</html>

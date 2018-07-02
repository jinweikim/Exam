<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="/css/head.css?v=20180622183805">
    <link type="text/css" rel="stylesheet" href="/css/common.css?v=20180622183805">
    <link rel="stylesheet" href="/css/style.css" type="text/css">

    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <title>考试结果</title>
</head>
<body>


<center>
    <div class="stu_ks">
        <h1 class="stu_ks_tit">
            阅卷结果
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
    			(共20题)
    			</span>
            </h1>
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
                                        <input type="radio" class="mr5" name="ans_${status.index}" value="A" disabled="" <c:if test="${stuAns[status.index].que_ans=='A'}">checked=""</c:if>>A.&nbsp;&nbsp;${q.que_opt_a}
                                    </p>
                                    <p class="tm_xx">
                                        <input type="radio" class="mr5" name="ans_${status.index}" value="B" disabled="" <c:if test="${stuAns[status.index].que_ans=='B'}">checked=""</c:if>>B.&nbsp;&nbsp;${q.que_opt_b}
                                    </p>
                                    <p class="tm_xx">
                                        <input type="radio" class="mr5" name="ans_${status.index}" value="C" disabled="" <c:if test="${stuAns[status.index].que_ans=='C'}">checked=""</c:if>>C.&nbsp;&nbsp;${q.que_opt_c}
                                    </p>
                                    <p class="tm_xx">
                                        <input type="radio" class="mr5" name="ans_${status.index}" value="D" disabled="" <c:if test="${stuAns[status.index].que_ans=='D'}">checked=""</c:if>>D.&nbsp;&nbsp;${q.que_opt_d}
                                    </p>
                                    <c:if test="${not empty q.que_opt_e}">
                                        <p class="tm_xx">
                                            <input type="radio" class="mr5" name="ans_${status.index}" value="E" disabled="" <c:if test="${stuAns[status.index].que_ans=='E'}">checked=""</c:if>>E.&nbsp;&nbsp;${q.que_opt_e}
                                        </p></c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <input type="text" id="option${status.index+1}" value="${stuAns[status.index].que_ans}" disabled="" name="ans_${status.index}"
                                       autocomplete="off" class="layui-input" style="text-align: center">
                            </c:otherwise></c:choose>
                        <p class="tm_xx">
                            正确答案:<span style="color: red;padding-left: 10px"
                                       id="correctAnswer_${status.index+1}">${q.que_ans}</span>
                        </p>
                    </ul>
                    <ul class="fr mr23" style="margin-top:70px;">
                        <c:choose>
                            <c:when test="${stuAns[status.index].que_ans==q.que_ans}">
                                <span class="fs30 col_red" style="" id="span_right_3170">√</span>
                            </c:when>
                            <c:otherwise>
                                <span class="fs30 col_red" style="" id="span_wrong_3170">x</span>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <div class="clear"></div>
                </div>
            </c:forEach>


        </div>
        <div class="ks_right">
            <div id="div_question_menu" style="position: fixed; background-color: rgb(255, 255, 255); top: 207px;">
                <ul class="ks_cs">
                    <li class="r_top_time fs22" id="timer">
                        得分：<span class="col_red">${grade}</span>
                    </li>
                    <li class="r_top_sl mt10">
                        客观题：作答 <span class="col_red">20</span> 题，
                        <%--答对<span class="col_red" id="span_objRightCount">${grade/5}</span> 题，--%>
                        得 <span class="col_red">${grade}</span> 分。
                    </li>

                </ul>
                <dl class="ks_r_cen mt20" style="margin-bottom:50px;">
                    <dt class="r_cen_dl"><img src="/images/ks_r_ywhite.png"><a class="r_cen_tit"
                                                                               href="#keguanti">客观题</a></dt>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_1" name="obj_nav" href="#1">1 - 4</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_5" name="obj_nav" href="#4">5 - 8</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_9" name="obj_nav" href="#9">9 - 12</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_13" name="obj_nav" href="#13">13 - 16</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_17" name="obj_nav" href="#17">17 - 20</a>
                    </dd>
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
    })
</script>
</body>
</html>

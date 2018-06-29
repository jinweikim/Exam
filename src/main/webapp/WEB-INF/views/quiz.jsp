<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="/css/head.css?v=20180622183805">
    <link type="text/css" rel="stylesheet" href="/css/common.css?v=20180622183805">
    <link rel="stylesheet" href="/css/style.css" type="text/css">

    <script type="text/javascript" src="http://static.njcedu.com/JSLib/CDOJS/Utility.js?v=20180622183805"></script>
    <script type="text/javascript" src="http://static.njcedu.com/JSLib/CDOJS/HashMap.js?v=20180622183805"></script>
    <script type="text/javascript" src="http://static.njcedu.com/JSLib/CDOJS/CDO.js?v=20180622183805"></script>
    <script type="text/javascript" src="http://static.njcedu.com/JSLib/CDOJS/JSON.js?v=20180622183805"></script>
    <script type="text/javascript" src="http://static.njcedu.com/JSLib/CDOJS/HttpClient.js?v=20180622183805"></script>
    <script type="text/javascript" src="http://static.njcedu.com/js/jquery-1.7.2.min.js?v=20180622183805"></script>
    <title>查看试卷 - 新锦成就业教育平台</title>
</head>
<body>





<!-- 分数处理 -->

<!-- 分数处理 end -->

<center>
    <div class="stu_ks">
        <h1 class="stu_ks_tit">
            2015级大学生就业创业课程考试三年级2
        </h1>
        <table class="ksgl_table" cellpadding="0" cellspacing="0" style="margin:30px auto;">
            <tbody><tr>
                <td style="background-color:#e4e4e4;">考生</td>
                <td>眭镇涛 &nbsp;-&nbsp; 151303127</td>
                <td style="background-color:#e4e4e4;">总分/及格分</td>
                <td>
                    100 / 60
                </td>
                <td style="background-color:#e4e4e4;">时长/用时</td>
                <td>90/12分钟</td>
            </tr>
            <tr>
                <td style="background-color:#e4e4e4;">提交情况</td>
                <td>
                    ${queList[0].que_head}
                </td>
                <td style="background-color:#e4e4e4;">开始考试</td>
                <td>
                    2018-06-13 22:53:29
                </td>
                <td style="background-color:#e4e4e4;">提交时间</td>
                <td>
                    2018-06-13 23:05:57
                </td>
            </tr>
            </tbody></table>


        <input type="hidden" id="dtEndTime" value="2018-06-22 23:59:59">
        <input type="hidden" id="dtStartTime" value="2018-06-11 18:19:08">
        <input type="hidden" id="nTimeLength" value="90">
        <input type="hidden" id="lSchoolId" value="204">
        <input type="hidden" id="lUserId" value="48800009075">
        <input type="hidden" id="nExaminType" value="0">
        <input type="hidden" id="lExaminId" value="10270000066">
        <input type="hidden" id="lPlanId" value="10270000035">
        <input type="hidden" id="nUsedTime" value="12">
        <input type="hidden" id="nExaminState" value="2">
        <input type="hidden" id="nScoreState" value="1">

    </div>
</center>
<div class="xk_con">
    <div class="content">
        <div class="ks_left ptb30">
            <h1 class="ks_left_tit" id="keguanti">
                客观题
                <span class="col666 fs14 ml8">
    			(共100题,每题1分)
    			</span>
            </h1>

            <c:forEach items="${queList}" var="q">
                <div>
                    <ul class="mt30 fl">
                        <li class="ks_t_xh">1</li>
                        <li class="ks_tm mb10" id="3300">${q.que_head}</li>
                        <div class="clear"></div>
                        <div id="option3300">
                            <p class="tm_xx"><input type="radio" class="mr5" name="radio_3300" value="A" disabled="">A.&nbsp;&nbsp;${q.que_opt_a}
                            </p>
                            <p class="tm_xx"><input type="radio" class="mr5" name="radio_3300" value="B" disabled="">B.&nbsp;&nbsp;${q.que_opt_b}
                            </p>
                            <p class="tm_xx"><input type="radio" class="mr5" name="radio_3300" value="C" disabled="">C.&nbsp;&nbsp;${q.que_opt_c}
                            </p>
                            <p class="tm_xx"><input type="radio" class="mr5" name="radio_3300" value="D" disabled=""
                                                    checked="">D.&nbsp;&nbsp;${q.que_opt_d}</p>
                        </div>
                        <p class="tm_xx">
                            正确答案:<span style="color: red;padding-left: 10px" id="correctAnswer_3300">${q.que_ans}</span>
                        </p>
                    </ul>
                    <div class="clear"></div>
                </div>
            </c:forEach>


        </div>
        <div class="ks_right">
            <div id="div_question_menu" style="position: fixed; background-color: rgb(255, 255, 255); top: 207px;">
                <ul class="ks_cs">
                    <li class="r_top_time fs22" id="timer">
                        得分：<span class="col_red">100</span>
                    </li>
                    <li class="r_top_sl mt10">
                        客观题：作答 <span class="col_red">100</span> 题，
                        答对<span class="col_red" id="span_objRightCount">100</span> 题，得<span class="col_red">100</span> 分。
                    </li>

                </ul>
                <dl class="ks_r_cen mt20" style="margin-bottom:50px;">
                    <dt class="r_cen_dl"><img src="/images/ks_r_ywhite.png"><a class="r_cen_tit" href="#keguanti">客观题</a></dt>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3300" name="obj_nav" onclick="swithClass('3300')" href="#3300">1 - 3</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3153" name="obj_nav" onclick="swithClass('3153')" href="#3153">4 - 6</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2504" name="obj_nav" onclick="swithClass('2504')" href="#2504">7 - 9</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3181" name="obj_nav" onclick="swithClass('3181')" href="#3181">10 - 12</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3155" name="obj_nav" onclick="swithClass('3155')" href="#3155">13 - 15</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2513" name="obj_nav" onclick="swithClass('2513')" href="#2513">16 - 18</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3173" name="obj_nav" onclick="swithClass('3173')" href="#3173">19 - 21</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2559" name="obj_nav" onclick="swithClass('2559')" href="#2559">22 - 24</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2570" name="obj_nav" onclick="swithClass('2570')" href="#2570">25 - 27</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2541" name="obj_nav" onclick="swithClass('2541')" href="#2541">28 - 30</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2555" name="obj_nav" onclick="swithClass('2555')" href="#2555">31 - 33</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2534" name="obj_nav" onclick="swithClass('2534')" href="#2534">34 - 36</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2540" name="obj_nav" onclick="swithClass('2540')" href="#2540">37 - 39</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2566" name="obj_nav" onclick="swithClass('2566')" href="#2566">40 - 42</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3282" name="obj_nav" onclick="swithClass('3282')" href="#3282">43 - 45</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2554" name="obj_nav" onclick="swithClass('2554')" href="#2554">46 - 48</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2561" name="obj_nav" onclick="swithClass('2561')" href="#2561">49 - 51</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3954" name="obj_nav" onclick="swithClass('3954')" href="#3954">52 - 54</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2592" name="obj_nav" onclick="swithClass('2592')" href="#2592">55 - 57</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2620" name="obj_nav" onclick="swithClass('2620')" href="#2620">58 - 60</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2624" name="obj_nav" onclick="swithClass('2624')" href="#2624">61 - 63</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2932" name="obj_nav" onclick="swithClass('2932')" href="#2932">64 - 66</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2589" name="obj_nav" onclick="swithClass('2589')" href="#2589">67 - 69</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2626" name="obj_nav" onclick="swithClass('2626')" href="#2626">70 - 72</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2614" name="obj_nav" onclick="swithClass('2614')" href="#2614">73 - 75</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2645" name="obj_nav" onclick="swithClass('2645')" href="#2645">76 - 78</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2654" name="obj_nav" onclick="swithClass('2654')" href="#2654">79 - 81</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2719" name="obj_nav" onclick="swithClass('2719')" href="#2719">82 - 84</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3223" name="obj_nav" onclick="swithClass('3223')" href="#3223">85 - 87</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_2716" name="obj_nav" onclick="swithClass('2716')" href="#2716">88 - 90</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3198" name="obj_nav" onclick="swithClass('3198')" href="#3198">91 - 93</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3217" name="obj_nav" onclick="swithClass('3217')" href="#3217">94 - 96</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh_xz" id="obj_nav_3206" name="obj_nav" onclick="swithClass('3206')" href="#3206">97 - 99</a>
                    </dd>
                    <dd class="rr_cen_dd">
                        <a class="rr_cen_xh" id="obj_nav_3197" name="obj_nav" onclick="swithClass('3197')" href="#3197">100 - 102</a>
                    </dd>

                    <dt class="r_cen_js"></dt>
                </dl>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>



<!-- 主观题考生答案信息提取 start -->
<script>
    var strQuestionIds1 = "";
    var strQuestionAnswer1 = ;
    var strScoreDetail1 = "";
    //主观题考生答案信息提取
    showAnswer1(strQuestionIds1,strQuestionAnswer1,strScoreDetail1);
</script>
<!-- 主观题考生答案信息提取 end -->
<!-- 客观题考生答案信息提取 start -->
<script>
    var strQuestionIds0 = "3300,3170,3177,3153,2514,2502,2504,3298,2505,3181,2501,2522,3155,3164,3159,2513,3182,3297,3173,2507,2524,2559,2535,2550,2570,2565,2526,2541,2569,2552,2555,2546,2531,2534,2539,2545,2540,2525,3266,2566,2571,2568,3282,2558,2544,2554,2547,2537,2561,2563,2648,3954,2604,2599,2592,2658,2657,2620,2601,2603,2624,3967,2650,2932,3953,2631,2589,2602,2653,2626,2630,2662,2614,2618,2600,2645,2607,3955,2654,2617,2702,2719,2705,2720,3223,3235,3221,2716,3184,2697,3198,3242,2686,3217,2718,2703,3206,2711,3195,3197";
    //客观题考生答案信息提取
    showAnswer0(strQuestionIds0);
</script>


<!-- 客观题考生答案信息提取 end -->

<script type="text/javascript" src="http://static.njcedu.com/js/WebView.js?v=20180622183805"></script><span style="display:none;" id="cnzz_stat_icon_1256124091"><a href="http://www.cnzz.com/stat/website.php?web_id=1256124091" target="_blank" title="站长统计">站长统计</a></span><script src=" http://s11.cnzz.com/z_stat.php?id=1256124091" type="text/javascript"></script><script src="http://c.cnzz.com/core.php?web_id=1256124091&amp;t=z" charset="utf-8" type="text/javascript"></script>
<script>
    $(window).scroll(function()
    {
        var div = document.getElementById("div_question_menu");
        if (div != null)
        {
            var topHeight = 207;
            var top = document.documentElement.scrollTop || document.body.scrollTop;
            if (top >= topHeight)
            {
                div.style.top = "0px";
            } else
            {
                var mytop = topHeight - top;
                div.style.top = mytop + "px";
            }
        }
    })
</script>
</body>
</html>

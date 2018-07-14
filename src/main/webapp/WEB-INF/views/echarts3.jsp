<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018/6/29
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>分析图3</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
</head>
<body>
<div class="x-body">
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 100%;height:600px;float: left"></div>
</div>
<script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart1 = echarts.init(document.getElementById('main'));

    option1 = {
        title:{
            text:'难易程度分析表'
        },
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data:['通过人数','未通过人数']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : []
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'联盟广告',
                type:'bar',
                stack: '广告',
                data:[],
                stack:"人数"
            },
            {
                name:'直接访问',
                type:'bar',
                data:[],
                stack:"人数",
                barWidth:70,
            },
        ]
    };


    myChart1.setOption(option1);
    myChart1.showLoading();
    $.ajax({
        url: "/analysis/echarts3_data",
        type: "post",
        async: true,
        dataType: "json",
        success : function (result) {
            var names=[];
            var pass_user=[];
            var sum_pass=0;
            var sum_all=0;
            var nopass_user=[];
            console.log(result);
            console.log(result.length);
            console.log("进入填充数据环节");
            for(var i=0;i<result.length;i++){
                sum_all += result[i].all_user;
                sum_pass += result[i].pass_user;
                names.push(result[i].user_class);
                pass_user.push(result[i].pass_user);
                nopass_user.push(result[i].all_user-result[i].pass_user)
            }
            var diff = sum_pass/sum_all;
            myChart1.hideLoading();
            myChart1.setOption({
                title:{
                    subtext:'试卷难易度为'+diff.toFixed(2)
                },
                xAxis : [
                    {
                        data : names
                    }
                ],
                series : [
                    {
                        name:'通过人数',
                        data:pass_user,
                    },
                    {
                        name:'未通过人数',
                        data:nopass_user,
                    },
                ]
            })
        },
        error : function(errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            myChart1.hideLoading();
        }
    })



</script>
</body>
</html>

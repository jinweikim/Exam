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
    <title>分析图1</title>
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
    <div id="main1" style="width: 50%;height:600px;float: left"></div>
    <div id="main2" style="width: 50%;height:600px;float: left"></div>
</div>
<script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart1 = echarts.init(document.getElementById('main1'));
    var myChart2 = echarts.init(document.getElementById('main2'));
    // 指定图表的配置项和数据
    var option1 = {
        title: {
            text: '成绩分布图'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['成绩']
        },
        xAxis: {
            name: '分数区间',
            data: ['60分以下','60-70分','70-80分','80-90分','90分以上']
        },
        yAxis: {
            name: '人数/人',
            type: 'value',
            data: []
        },
        series: [
            {
                name:'成绩',
                type:'bar',
                data:[]
            }

        ]
    };

    var option2 = {
        title : {
            text: '成绩分布饼状图',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['60分以下','60-70分','70-80分','80-90分','90分以上']
        },
        series : [
            {
                name: '分数分布',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    myChart1.setOption(option1);
    myChart2.setOption(option2);
    myChart1.showLoading();
    myChart2.showLoading();
    $.ajax({
        url: "/analysis/echarts1_data",
        type: "post",
        async: true,
        dataType: "json",
        success : function (result) {
            var nums=[];
            console.log(result);
            console.log(result.length);
            console.log("进入填充数据环节");
            nums.push(result['low60']);
            nums.push(result['six7']);
            nums.push(result['seven8']);
            nums.push(result.eight9);
            nums.push(result.nine10);

            console.log(nums);
            myChart1.hideLoading();
            myChart2.hideLoading();
            myChart1.setOption({
                series: [
                    {
                        data:nums
                    }

                ]
            })
            myChart2.setOption({
                series:[{
                    data:[
                        {value:result['low60'],name:'60分以下'},
                        {value:result['six7'],name:'60-70分'},
                        {value:result['seven8'],name:'70-80分'},
                        {value:result['eight9'],name:'80-90分'},
                        {value:result['nine10'],name:'90分以上'}
                    ]
                }]
            })
        },
        error : function(errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            myChart.hideLoading();
        }
    })



</script>
</body>
</html>

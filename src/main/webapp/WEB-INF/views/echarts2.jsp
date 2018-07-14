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
    <title>分析图2</title>
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
    <div id="main" style="width: 100%;height:600px;"></div>
</div>
<script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        animation:false,
        title: {
            text: '班级成绩分析'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['最高分','最低分','平均分']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: []
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'最高分',
                type:'line',
                data:[]
            },
            {
                name:'最低分',
                type:'line',
                data:[]
            },
            {
                name:'平均分',
                type:'line',
                data:[]
            },

        ]
    };

    myChart.setOption(option);
    myChart.showLoading();
    $.ajax({
        url: "/analysis/echarts2_data",
        type: "post",
        async: true,
        dataType: "json",
        success : function (result) {
            var Name=[];
            var Max=[];
            var Min=[];
            var Avg=[];
            console.log(result);
            console.log(result.length);
            console.log("进入填充数据环节");
            for(var i=0;i<result.length;i++){
                Name.push(result[i].class_name);
                Max.push(result[i].maxGrade);
                Min.push(result[i].minGrade);
                Avg.push(result[i].averageGrade);
            }

            myChart.hideLoading();
            myChart.setOption({
                xAxis: {
                    data: Name
                },
                series: [
                    {
                        data:Max
                    },
                    {
                        data:Min
                    },
                    {
                        data:Avg
                    }

                ]
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

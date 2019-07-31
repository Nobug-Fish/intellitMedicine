<%--
  Created by IntelliJ IDEA.
  User: 18302
  Date: 2019/7/5
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.7.2/echarts.js"></script>
    <title>平台信息可视化</title>
    <style>
        .head{
            background-color: #337ab7;
            height: 100px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="head">
    <p style="text-align:left;font-size: 45px;color: white;padding-top: 20px;padding-left: 2%">平台信息可视化&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;<a style="color: white" href="rootHome.do">管理员首页</a> &nbsp;<a style="color: white" href="/userExit.do">退出登录</a></p>
</div>
    <div id="userAgeCount" style="height: 50%;width: 100%;">
        <div id="main"  style="height: 90%;width: 40%;background-color: #31b0d5; float:left;margin-top: 1%">
        </div>
        <div id="askAndReply"  style="height: 90%;width: 40%;background-color: #31b0d5;margin-left: 50%;margin-top:1%">
        </div>
    </div>

    <div  id="userDoctorCount" style="height: 45%;width: 100%;">
        <div id="userDoctor"  style="height:90%;width: 40%;background-color: #31b0d5">
        </div>
    </div>


<script>

    //表示要在id为main的盒子中绘制图片
    var dom = document.getElementById('main');
    //表示对echarts图表进行初始化
    var echart = echarts.init(dom);
    //options表示进行基本的配置项配置
    var options = {
        title:{
            text:'用户年龄分布统计                               用户总人数：${userCount}',
            left:'center',
            textStyle:{
                //文字颜色
                color:'#0c0b12',
                //字体风格,'normal','italic','oblique'
                fontStyle:'normal',
                //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
                fontWeight:'bold',
                //字体系列
                fontFamily:'sans-serif',
                //字体大小
                fontSize:18
            }
        },
        xAxis: {
            data: ['30岁以下','30-45岁','45-60岁','60-75岁','75-90岁','90岁以上']
        },
        yAxis: {
            type:"value"
        },
        series: [{
            name: '用户人数',
            type: 'bar',//line为折线图，scatter为散点图
            data:[${ageCount.low30},${ageCount._30_45},${ageCount._45_60},${ageCount._60_75},${ageCount._75_90},${ageCount.up90}],
            itemStyle: {
                normal: {
                    label: {
                        show: true,		//开启显示
                        position: 'top',	//在上方显示
                        textStyle: {	    //数值样式
                            color: 'black',
                            fontSize: 16
                        }
                    }
                }
            }
        }],
        color: ['rgb(109,112,255)']
    }
    //对配置项进行最终展现，或者说是重新绘制
    echart.setOption(options);

    //表示要在id为main的盒子中绘制图片
    var dom1 = document.getElementById('userDoctor');
    //表示对echarts图表进行初始化
    var echart1 = echarts.init(dom1);
    //options表示进行基本的配置项配置

    var option = {
        title:{
            text:'用户医生人数占比',
            left:'center',
            textStyle: {
                //文字颜色
                color: '#0c0b12',
                //字体风格,'normal','italic','oblique'
                fontStyle: 'normal',
                //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
                fontWeight: 'bold',
                //字体系列
                fontFamily: 'sans-serif',
                //字体大小
                fontSize: 18
            },
        },
        series:[{
            name:'访问量',
            type:'pie',
            radius:'60%',
            data:[
                {value:${userCount},name:'用户'},
                {value:${doctorCount},name:'医生'}
            ],
            itemStyle: {
                normal:{
                    label:{
                        show: true,
                        formatter: '{b} : {c} ({d}%)'
                    },
                    labelLine :{show:true}
                }
            }
        }]
    };

    echart1.setOption(option);

</script>
</body>

</html>

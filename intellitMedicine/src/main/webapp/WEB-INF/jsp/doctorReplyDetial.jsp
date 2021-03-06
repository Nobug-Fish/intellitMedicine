<%--
  Created by IntelliJ IDEA.
  User: cielab
  Date: 2019/7/3
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>医生回复用户问诊</title>
    <style>
        .header1{
            height: 90px;
            line-height: 6px;
            background: #00568e;
        }
        .logo{
            padding-left: 50px;
            height: 100px;
        }
        .logo p{
            color: #fff;
            text-align:left;
            font-size: 45px;
            padding-top: 38px
        }
        .medium{
            height: 2%;
            background: #fff;
        }

        body{
            font:12px/1.5 'Helvetica Neue',Helvetica,Arial,Sans-serif;
            color:#333;
            _height:100%;
            background-attachment:fixed;
        }
        .clearfix:after{
            clear:both;
            content:".";
            display:block;
            height:20px;
            visibility:hidden;
        }
        .clearfix{
            *zoom:1
        }
        .wrapper{
            width:980px;
            height:515px;
            margin:0 auto;
            padding-top: 3%;
        }
        .content-left{
            width:720px;
            height:515px;
            float:left;
            border: #00568e 1px solid;
        }
        .aside-right{
            width:250px;
            height:515px;
            float:right;
            border:#00568e 1px solid
        }
        .qs02,.qs04b2 p,.qs07b ul,.qs11_left div,.qs11g1 p,.qs04b3 div ol p,.qs07b2 ul a,.qs07b2 ul p,.qs07b dl input{
            background-image:url(img/question.gif);
            background-repeat:no-repeat;
        }
        .qs_left{
            float:left;
            width:291px;
            padding-bottom:75px;
            position:relative;
            overflow:hidden;
            zoom:1;
        }
        .qs_left_con{
            clear:both;
            width:240px;
            padding:10 31px 0 19px;
            position:relative;
            overflow:hidden;
            zoom:1;
        }
        .qs01{
            clear:both;
            height:40px;
            font-weight:normal;
            font-size:18px;
            font-family:"寰蒋闆呴粦", "榛戜綋";
            line-height:26px;
        }
        .qs01 span{
            color:#e6567a;
            padding:0 6px;
            font-family:Arial, Helvetica, sans-serif;
        }
        .qs02{
            clear:both;
            border:1px solid #eaeaea;
            background-color:#fbfbfb;
            padding:42px 17px 0 44px;
            height:70px;
            line-height:20px;
            background-position:10px -11px;
            color:#666;
            width:145px;
        }
        .qs02a{
            background-position:-261px -11px;
        }
        .qs02b{
            background-position:-541px -4px;
        }
        .footer{
            width:100%;
            height:60px;
            padding-top:10px;
            text-align:center;
        }
        .footer p{
            color:#696969;
            line-height:25px;
        }
        .line{
            width:100%;
            height:55px;
            border-bottom:#d8d8da 1px solid;
        }
        .btn-login{
            float:left;
            width:150px;
            height:30px;
            line-height:38px;
            background:#0566c5;
            font-size:16px;
            color:#fff;
            margin-left: 70px;
            margin-top: 20px;
        }

    </style>
</head>
<body>
<div class="header1">
    <div class="logo">
        <p>问诊记录详情  &nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;
            <a  style="color: white" href="/doctorHome.do">医生首页</a> &nbsp;  &nbsp; &nbsp;<a  style="color: white" href="/doctorExit.do">退出登录</a></p>
    </div>
</div>
<div class="medium">
</div>
<div class="wrapper clearfix">
    <div class="content-left">
        <div class="askbox">
            <div class="clearfix"></div>
            <form action="doctorReplyForm.do" method="post" id="ask_form" >
                <div class="" style="padding-left: 10%;padding-right: 10%">
                    <%----%>
                    <div class="" style="margin-top: 10px;padding-left: 5%">
                        <div class="" style="font-size: x-large;padding-top: 1%">病人情况：<span style="color: #8c8c8c"></span></div>
                        <div class="" style="margin-top: 1%;padding-left: 3%;height:20%;background-color: #fbfbfb;border:1px solid #eaeaea;">
                            <span style="font-size: larger">&nbsp;&nbsp;&nbsp;&nbsp;${onlineRec.inquiryData}</span>
                        </div>

                        <c:if test="${!empty onlineRec.onlineAskPaper}">
                            <div class="">
                                <div class="" id=""  >
                                    <br> <a href="${onlineRec.onlineAskPaper}" style="color: #383fff;font-size: x-large">查看病人检查单</a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <%----%>
                    <div class="" style="margin-top: 10px;padding-left: 5%">
                        <div class="" style="font-size: x-large;padding-top: 1%">医生回复信息：
                        </div>
                        <div class="" style="margin-top: 1%">
                        <textarea style="width: 100%;height: 20%;font-size: larger" autocomplete="off" name="replyData" id="new_disease_desc" class="form-desc" maxlength="500" >
                            ${onlineRec.replyData}
                        </textarea>
                        </div>
                    </div>
                    <div style="margin-left: 28%;margin-top: 10px">
                        <button type="submit" class="btn-login" onclick="return submitCheak() ">提交</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
    <div class="aside-right">
        <div class="qs_left">
            <div class="qs_left_con">
                <h2 class="qs01">问答流程</h2>
                <ul class="qs02">
                    填写好您的症状，描述清楚您的健康问题
                </ul>
                <ul class="qs02 qs02a">
                    等待医生回答<br>
                </ul>
                <ul class="height15"></ul>
                <h2 class="qs01">向您承诺</h2>
                <ul class="qs02 qs02b">
                    由专业医生为您提供健康咨询
                </ul>
            </div>
        </div>
        <!--广告位5-->
    </div>
</div>
<div class="medium">
</div>
<div class="line"></div>
<div class="footer">
    <p>服务热线  800861270</p>
    <p>版权所有 智慧医养公共服务平台</p>
</div>
<script type="text/javascript">
    function  imgOnclick() {
        //动态创建文件选择框
        var fileObj = document.createElement("input");
        fileObj.type="file";
        //文件选择框的onchange事件
        fileObj.onchange = function(){
            HeadPortUpload(fileObj);
        }
        //激活文件选择框
        fileObj.click();
    }
    //ajax的文件上传
    function HeadPortUpload(fileObj){
        //alert(fileObj.files.length+"\n"+fileObj.files[0].name);
        var formData = new FormData();
        formData.append("file", fileObj.files[0]);
        $.ajax({
            url: "uploadExamine.do",
            type: "POST",
            data: formData,
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (data) {
                $("#headPort").val(data);
                $("#upload").html("<img src='"+data+"' width='200px' onclick='imgOnclick()'>");
            },
            error: function () {
                alert("上传失败！");
            }
        });
    }

    function submitCheak(){
        if ($("#new_disease_desc").val() == "") {
            $("#new_disease_desc").focus();
            alert("疾病描述不不能为空！");
            return false;
        } else {
            alert("提交成功！");
            return true;
        }
    }
</script>
</body>
</html>

<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: 18302--%>
<%--  Date: 2019/6/29--%>
<%--  Time: 12:02--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>医生回复用户问诊</title>--%>
<%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">--%>
<%--    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>--%>
<%--    <style>--%>
<%--        .head{--%>
<%--            background-color: #337ab7;--%>
<%--            height: 100px;--%>
<%--            /*margin-bottom: 20px;*/--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="head" style="padding-left: 1%;width: 60%;align-content: center;margin-left: 20%;margin-top: 10px">--%>
<%--    <p style="text-align:left;font-size: 45px;color: white;padding-top: 20px">在线回复 </p>--%>
<%--    <hr style ="size: 200px;color:#51b748">--%>
<%--</div>--%>
<%--<br>--%>
<%--<div class="miandiv" style="padding-left: 14%;" >--%>

<%--    <form action="doctorReplyForm.do" method="post" id="ask_form" >--%>
<%--        <div class="" style="padding-left: 10%;padding-right: 10%">--%>
<%--&lt;%&ndash;&ndash;%&gt;--%>
<%--            <div class="" style="margin-top: 10px;padding-left: 5%">--%>
<%--                <div class="" style="font-size: x-large;padding-top: 1%">病人情况：<span style="color: #8c8c8c"></span></div>--%>
<%--                <div class="" style="margin-top: 1%;padding-left: 3%">--%>
<%--                    <span style="font-size: larger">&nbsp;&nbsp;&nbsp;&nbsp;${onlineRec.inquiryData}</span>--%>
<%--                </div>--%>

<%--                <c:if test="${!empty onlineRec.onlineAskPaper}">--%>
<%--                    <div class="">--%>
<%--                        <div class="" id="" style="padding-left: 3%" >--%>
<%--                            <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${onlineRec.onlineAskPaper}" style="color: #383fff">查看病人检查单</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:if>--%>
<%--            </div>--%>
<%--&lt;%&ndash;&ndash;%&gt;--%>
<%--                <div class="" style="margin-top: 10px;padding-left: 5%">--%>
<%--                    <div class="" style="font-size: x-large;padding-top: 1%">医生回复信息：--%>
<%--                    </div>--%>
<%--                    <div class="" style="margin-top: 1%">--%>
<%--                        <textarea style="width: 65%;height: 20%;font-size: larger" autocomplete="off" name="replyData" id="new_disease_desc" class="form-desc" maxlength="500" >--%>
<%--                            ${onlineRec.replyData}--%>
<%--                        </textarea>--%>
<%--&lt;%&ndash;                        <c:if test="${!empty onlineRec.replyData}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <script type="text/javascript">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                $("#new_disease_desc").val(${onlineRec.replyData});&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </script>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </c:if>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div style="margin-left: 28%;margin-top: 10px">--%>
<%--                    <button type="submit" class="col-sm-2 btn btn-success" onclick="return submitCheak() ">提交</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--    </form>--%>
<%--</div>--%>
<%--<script type="text/javascript">--%>
<%--    function  imgOnclick() {--%>
<%--        //动态创建文件选择框--%>
<%--        var fileObj = document.createElement("input");--%>
<%--        fileObj.type="file";--%>
<%--        //文件选择框的onchange事件--%>
<%--        fileObj.onchange = function(){--%>
<%--            HeadPortUpload(fileObj);--%>
<%--        }--%>
<%--        //激活文件选择框--%>
<%--        fileObj.click();--%>
<%--    }--%>
<%--    //ajax的文件上传--%>
<%--    function HeadPortUpload(fileObj){--%>
<%--        //alert(fileObj.files.length+"\n"+fileObj.files[0].name);--%>
<%--        var formData = new FormData();--%>
<%--        formData.append("file", fileObj.files[0]);--%>
<%--        $.ajax({--%>
<%--            url: "uploadExamine.do",--%>
<%--            type: "POST",--%>
<%--            data: formData,--%>
<%--            cache: false,//上传文件无需缓存--%>
<%--            processData: false,//用于对data参数进行序列化处理 这里必须false--%>
<%--            contentType: false, //必须--%>
<%--            success: function (data) {--%>
<%--                $("#headPort").val(data);--%>
<%--                $("#upload").html("<img src='"+data+"' width='200px' onclick='imgOnclick()'>");--%>
<%--            },--%>
<%--            error: function () {--%>
<%--                alert("上传失败！");--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    function submitCheak(){--%>
<%--        if ($("#new_disease_desc").val() == "") {--%>
<%--            $("#new_disease_desc").focus();--%>
<%--            alert("疾病描述不不能为空！");--%>
<%--            return false;--%>
<%--        } else {--%>
<%--            alert("提交成功！");--%>
<%--            return true;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>


<%--
  Created by IntelliJ IDEA.
  User: cielab
  Date: 2019/6/28
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人中心</title>
<%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">--%>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <style>
        .header{
            height: 90px;
            line-height: 6px;
            background: #00568e;
            margin-left: 10%;
            margin-right: 8%;
        }
        ul
        {
            list-style-type:none;
            margin:0;
            padding:0;
        }
        li
        {
            display:inline;
            padding: 0 15px;
        }
        .logo{
            padding-left: 50px;
            height: 100px;
        }
        .medium{
            /*margin-left: 50%;*/
            height: 3%;
            background: #fff;
        }
        .bottom{
            width:100%;
            height:100%;
            padding-left:2%;
            padding-right:250px;
            padding-top:50px;
            display: flex;
        }
        .left{
            flex:40%;
            hight:80%;
            float:left;
            text-align: center;
            margin-left: 5%;
        }
        .right{
            flex:80%;
            hight:80%;
            float:left;
        }
        .logo p{
            color: #fff;
            text-align:left;
            font-size: 45px;
            padding-top: 38px
        }
        .update{
            font-size: 24px;
            margin-top: 40px;
            width:150px;
        }
        li{
            display: block;
            line-height: 80px;
            font-size: 28px;
        }
        .length{
            width:550px;
            height: 42px;
        }
        .block{
            font-size: 24px;
            margin-top:10px;
            padding-left: 320px;
        }
    </style>
</head>
<body>
<div>
    <div class="header">
        <div class="logo">
            <p>个人中心 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: white" href="/doctorHome.do">用户首页</a>&nbsp;&nbsp;&nbsp;<a style="color: white" href="/userExit.do">退出登录</a></p>
        </div>
    </div>
    <form id="form1" action="/updateDoctorInfor.do" method="post">
    <div class="bottom">
        <div class="left" id="upload">
            <img src="${curLoginDoctor.headAdd}" style="height:60%;width: 60%;margin-top: 30px" onclick="imgClick()"><br>
<%--            <img src="img/yuanHui.png" style="height:60%;width: 60%;margin-top: 30px" onclick="imgClick()"><br>--%>

        </div>
        <div class="right">
                <ul>
                    <li>
                        姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" id="name" name="name" class="length" value=${curLoginDoctor.doctorName}>
                    </li>
                    <li>
                        性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type="text" id="sex" name="sex" class="length" list="list2" value=${curLoginDoctor.sex}>
                        <datalist id="list2">
                            <option value="female">女</option>
                            <option value="male">男</option>
                        </datalist>
                    </li>
                    <li>
                         出生日期：<input id="birthday"  name="birthday" type="date" value="${curLoginDoctor.birthday}"/>
                    </li>
                    <li>
                        联系电话：<input type="text" id="phone" name="phone" class="length" value=${curLoginDoctor.phone}>
                    </li>
                    <li>
                        所属机构：<input type="text" id="organization" name="organization" class="length" list="list1" value=${curLoginDoctor.hosId}>
                        <datalist id="list1">
                            <option value="区人民医院"/>1
                            <option value="中医院"/>2
                            <option value="妇幼保健院"/>3
                            <option value="村卫生室"/>4
                        </datalist>
                    </li>
                    <li>
                        所属科室：<input type="text" id="department" name="department" class="length" value=${curLoginDoctor.department}>
                    </li>
                    <li>
                        家庭住址：<input type="text" id="address" name="address" class="length" value=${curLoginDoctor.homeAdd}>
                    </li>
<%--                    <li>--%>
<%--                        毕业院校：<input type="text" id="graduate" name="graduate" class="length" value=${curLoginDoctor.graSchool}>--%>
<%--                    </li>--%>
                </ul>
                <div class="block" >
                    <div>
                        <input type="submit" id="submit" value="修&nbsp;&nbsp;改" class="update">
                    </div>
                </div>
        </div>
    </div>
    </form>
   </div>
</div>
<script>
    function imgClick(){
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
            url: "doctorHeadImg.do",
            type: "POST",
            data: formData,
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (data) {
                $("#headPort").val(data);
                $("#upload").html("<img style=\"height:60%;width:50%;margin-top: 30px\" src='"+data+"' width='200px' onclick='imgClick()'>");
            },
            error: function () {
                alert("上传失败！");
            }
        });
    }

</script>
</body>
</html>

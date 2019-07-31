<%--
  Created by IntelliJ IDEA.
  User: cielab
  Date: 2019/6/27
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery211.min.js"></script>
        <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="js/bootstrap337.min.js"></script>
        <title>在线咨询</title>
        <style>
            .head{
            background-color: #337ab7;
            height: 100px;
            /*margin-bottom: 20px;*/
            }
            .choose{
            font-size: 2em;
            width: 100%;
            display: flex;
            align-items: center;
            justify-items: center;
            margin-top: 20px;
            margin-left: 100px;
            }
            .choose ul{
            display: flex;
            flex-direction: row;
            list-style-type: none;
            }
            .choose ul li{
            text-align: center;
            }
            .choose ul li a{
            margin-right: 100px;
            }
            .block1{
            display: flex;
            flex-direction: column;
            width: 100%;
            }
            .block2 ul{
            display: flex;
            flex-direction: row;
            list-style-type: none;
            }
            .block2 ul li{
            font-size: 2em;
            padding-top: 20px;
            margin-right: 50px;
            margin-left: 50px;
            text-align: center;
            }

             .table{
                 background-color: white;
                 width: 100%;
                 align-items: center;
                 justify-items: center;
                 margin-left: 100px;

             }
            .table th{
                text-align: center;

            }
            .table td{
                vertical-align: middle;
                text-align: center;
            }
            .input-group{
                float:left !important;
            }

        </style>
    </head>
    <body>
        <div class="head">
            <p style="text-align:left;font-size: 45px;color: white;padding-top: 20px;padding-left: 30px">在线咨询 &nbsp; &nbsp; &nbsp; &nbsp;<a href="/userAskRec.do" style="padding-right: 30px;color: white">我的咨询记录</a> &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; <a  href="/userHome.do" style="padding-right: 90px;color: white">用户首页</a> <a  style="padding-right:200px;color: white" href="/userExit.do">退出登录</a></p>
        </div>
        <hr>
        <form id="form1" method="post">
            <input type="hidden" id="curPage" name="curPage" value="${page.curPage}"/>
            <input type="hidden" id="row4Page" name="row4Page" value="${page.row4Page}"/>
            <input type="hidden" id="maxPage" name="maxPage" value="${page.maxPage}"/>
        </form>
            <div id="house" class="choose" >
                选择咨询科室：
                <ul class="special" style="padding-top: 7px">
                    <div style="padding-right: 30px">
                    <li><button class="btn btn-success" onclick="queryDoctor(1)">妇科</button></li>
                    </div>
                    <div style="padding-right: 30px">
                        <li><button class="btn btn-success" onclick="queryDoctor(2)">儿科</button></li>
                    </div>
                    <div style="padding-right: 30px">
                        <li><button class="btn btn-success" onclick="queryDoctor(3)">外科</button></li>
                    </div>
                    <div style="padding-right: 30px">
                        <li><button class="btn btn-success" onclick="queryDoctor(4)">内科</button></li>
                    </div>
                </ul>
            </div>
            <hr>
        <div style="align-items: center;margin-left: 5%;margin-right: 5%">
            <table class="table" id="userTable" border="1" align="right" style="align-content: center">
                <tr>
<%--                    <th>序号</th>--%>
                    <th>头像</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>科室</th>
                    <th>级别</th>
                    <th>咨询</th>
                </tr>
            </table>
        </div>
        <div class="text-center" style="width: 100%">
            <button class="btn btn-success" onclick="queryUser(1)">首页</button>
            <button class="btn btn-success" onclick="queryUser(2)">上一页</button>
            <span class="control-label" id="showInfo" style="color: #201b41"> 第 1 页 / 共 1 页 </span>
            <button class="btn btn-success" onclick="queryUser(3)">下一页</button>
            <button class="btn btn-success" onclick="queryUser(4)">末页</button>
        </div>
        </div>


        <script type="application/javascript">
            var department;
            // var i =1;

            function queryDoctor(key){
                queryUser(0);

                switch (key){
                    case 1:
                       department = "妇科";
                        break;
                    case 2:
                        department = "儿科";
                    case 3:
                        department = "外科";
                        break;
                    case 4:
                        department = "内科";
                        break;
                }
            }

            $(function(){
                queryUser(0);
            });

            function queryUser(key){

                // if(key==0){
                //      i = 1;
                // } else if(key==1){
                //      i=1;
                // } else if(key==2){
                //      if(i<=4)
                //          return false;
                //      if(i>4){
                //          yu =$("#maxPage").val()%4
                //          i=
                //      }
                // }

                var curPage = $("#curPage").val();
                var maxPage = $("#maxPage").val();
                var row4Page = $("#row4Page").val();
                switch (key){
                    case 0:
                        $("#curPage").val(1);
                        $("#maxPage").val(1);
                        $("#row4Page").val(4);
                        curPage = 1;
                        maxPage = 1;
                        row4Page = 4;
                        break;
                    case 1:
                        $("#curPage").val(1);
                       // i=1;
                        break;
                    case 2:
                        $("#curPage").val(curPage>1?curPage-1:curPage);
                       // i = ($("#curPage").val)*4
                        break;
                    case 3:
                        $("#curPage").val(curPage<maxPage?curPage*1+1:maxPage);
                        // i = ($("#curPage").val-1)*4
                        break;
                    case 4:
                        $("#curPage").val(maxPage);
                        // i = ($("#maxPage").val-1)*4
                        break;
                }
                $.ajax({
                    url:"queryAllUser2Page.do",
                    data:{
                        curPage: $("#curPage").val(),
                        row4Page: $("#row4Page").val(),
                        maxPage: $("#maxPage").val(),
                        department:department,
                    },
                    type:"Post",
                    success:function(page){
                      refreshTable(page);
                    },
                    error:function(){
                        alert("SOMETHING WRONG ");
                    }
                });
            }
            /**
             * 刷新表格
             * @param page
             */
            function refreshTable(page){
                var i = 1;
                $("#curPage").val(page.curPage);
                $("#maxPage").val(page.maxPage);
                $("#row4Page").val(page.row4Page);
                $("#showInfo").html(" 第 "+page.curPage+" 页 / 共 "+page.maxPage+" 页 ");
                var userList = page.objList;
                //获取表格行集合
                var trList = $("#userTable tr");
                //遍历删除表格行
                $.each(trList,function (index,item) {
                    if(index>0){
                        $(item).remove();
                    }
                });
                //刷新表格行
                userList.forEach(function(doctor){
                    var headAdd = doctor.headAdd;
                    var htmlStr = "<tr>" +
                        // "<td id='"+doctor.doctorId+"'>"+i+"</td>" +
                        // "<td>"+doctor.headAdd+"</td>"+
                        //"<td><a> <img src=\" '"+ doctor.certAdd+"'\"></a></td>"+
                        "<td><a> <img  style='width:100px ;height:65px' src='"+headAdd+"'></a></td>"+
                         "<td>"+doctor.doctorName+"</td>"+
                         "<td>"+doctor.sex+"</td>"+
                        "<td>"+doctor.department+"</td>"+
                        "<td>"+doctor.title+"</td>"+
                    "<td>" +
                        "<button class=\"btn   btn-success center-block\"   onclick=\"onlineAsk("+doctor.doctorId+")\">点击咨询</button>" +
                        "</td></tr>";
                    // "<a href='onlineAskDoctor.do?doctorId='+doctor.doctorId+'>点击查询"+
                    // "</td></tr>";
                    i = i+1;
                    $("#userTable").append(htmlStr);
                });
            }

            function onlineAsk(doctorId) {
                // alert("doctor.doctorId;"+doctorId);
                window.location.href="onlineAskDoctor.do?doctorId="+doctorId;

            }
        </script>
    </body>

</html>

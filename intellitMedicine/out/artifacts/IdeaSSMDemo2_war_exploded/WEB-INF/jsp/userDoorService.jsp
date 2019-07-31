<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/7/2
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上门服务申请页面</title>
    <style>
        .title {
            background-color: #337ab7;
            height: 100px;
            margin-bottom: 20px;
        }

        .div1 {
            text-align: center;
            margin: 10px;
            padding-top: 20px;
            padding-left: 30px;
            padding-right: 30px;
        }
    </style>
    <script type="text/javascript" src="../../js/jquery-1.8.2.js"></script>

</head>
<body>
<%
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    String time = df.format(new Date());// new Date()为获取当前系统时间
    request.setAttribute("time", time);
    String docId = request.getParameter("docId");
    System.out.println(docId);
    request.setAttribute("docId", docId);
%>
<div class="title">
    <p style="text-align:left;font-size: 45px;color: white;padding-top: 20px">申请上门服务</p>
</div>
<hr/>

<div class="div1">
    <form id="form1" action="/userAssignStore.do" method="post">
        <input type="hidden" id="userId" name="userId" value="${curLoginUser.userId}"/>
        <input type="hidden" id="doctorId" name="doctorId" value="<%=docId%>"/>
        <input type="hidden" id="time" name="time" value="<%=time%>"/>
        <textarea name="area" id="area" cols="100" rows="20" style="font-size: 20px" placeholder="简述自身基本情况及需求"></textarea><br/>
        <input type="submit" style="font-size: 18px;margin: 50px;width: 150px"  value="提交申请" onclick="alert('提交申请成功，请耐心等待')"/>
    </form>

</div>


</body>
</html>

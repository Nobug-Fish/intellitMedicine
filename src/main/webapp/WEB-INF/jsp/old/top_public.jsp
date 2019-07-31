<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="js/jquery211.min.js"></script>
    <script type="text/javascript" src="js/bootstrap337.min.js"></script>
    <script type="application/javascript">
        /**
         * 时间格式化方法
         * @param fmt
         * @returns {*}
         * @constructor
         */
        Date.prototype.Format = function(fmt) {
            var o = {
                "M+" : this.getMonth()+1,                 //月份
                "d+" : this.getDate(),                    //日
                "h+" : this.getHours(),                   //小时
                "m+" : this.getMinutes(),                 //分
                "s+" : this.getSeconds(),                 //秒
                "q+" : Math.floor((this.getMonth()+3)/3), //季度
                "S"  : this.getMilliseconds()             //毫秒
            };
            if(/(y+)/.test(fmt))
                fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
            for(var k in o)
                if(new RegExp("("+ k +")").test(fmt))
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            return fmt;
        }
    </script>
    <style type="text/css">
        body {
           // background: url("img/299672.jpg") no-repeat center center fixed;
            webkit-background-size: cover;
            moz-background-size: cover;
            background-size: cover;
            background-size: cover;
        }
        .navbar-nav > li > a, .navbar-brand {
            padding-top: 4px !important;
            padding-bottom: 0 !important;
            height: 28px;
        }
        .navbar {
            min-height: 28px !important;
        }
        .span12 {
            position: relative;
            top: 130px;
            width: 80%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top center-block" role="navigation" style="width:80%;">
    <img alt="" src="img/5cc0126914422.jpg" width="100%" height="100px">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="active"><a href="/index.do">首页</a></li>
            <c:if test="${!empty curLoginuser and curLoginuser.userType==1}">
            <li><a href="/userManagerPage.do">用户管理</a></li>
            </c:if>
        </ul>
        <ul class="nav navbar-nav pull-right">
            <c:if test="${empty curLoginuser}">
                <li><a href="/loginPage.do">登录</a></li>
                <li><a href="/regPage.do">注册</a></li>
            </c:if>
            <c:if test="${!empty curLoginuser}">
                <li><a href="/editUserInfo.do">${curLoginuser.account}</a></li>
                <li><a href="/userExit.do">退出</a></li>
            </c:if>
        </ul>
    </div>
</nav>
</body>
</html>
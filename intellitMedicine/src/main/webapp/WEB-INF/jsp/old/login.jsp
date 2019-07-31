<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--<jsp:include page="top_public.jsp"/>--%>
<%@include file="top_public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
	<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
	<style type="text/css">
		body {
			display: flex;
			justify-content: center;
			align-items: center;
			min-height: 100vh;
		}
		.LoginDiv {
			width: 400px;
		}
		.col-sm-10 {
			width: 260px;
		}
	</style>
</head>
<body>

<div class="LoginDiv">
	<c:if test="${!empty msg}">
		<div style="text-align: center;">${msg}</div>
	</c:if>
	<form class="form-horizontal" action="userLogin.do" method="post">
		<div class="form-group">
			<label class="col-sm-3 control-label">帐号</label>
			<div class="col-sm-10">
				<input type="text" id="account" name="account" class="form-control" placeholder="输入帐号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">密码</label>
			<div class="col-sm-10">
				<input type="text" id="psw" name="password" class="form-control" placeholder="输入密码">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-5">
				<button type="submit" class="col-sm-7 btn btn-success">登 录</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%--<jsp:include page="top_public.jsp"/>--%>
<%@include file="top_public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
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
		.infoEdit {
			width: 400px;
		}
		.col-sm-10 {
			width: 260px;
		}
	</style>
</head>
<body>
	<div class="infoEdit">
		<form action="UpdateUserInfo.do" method="post">
			<input type="hidden" name="userid" value="${user.userid}">
			<input type="hidden" id="headPort" name="headPort" value="${user.headPort}">
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">头像：</label>
				<div class="col-sm-10"  id="upload">
					<c:if test="${user.headPort!=null && user.headPort!=''}">
						<img alt="用户头像" src="${user.headPort}" width="200px"  onclick="imgClick()">
					</c:if>
					<c:if test="${user.headPort==null || user.headPort==''}">
						<img alt="默认头像" src="img/5cc0126914422.jpg" width="200px" onclick="imgClick()">
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">姓名：</label>
				<div class="col-sm-10">
					<input type="text" id="name" name="name" value="${user.name}" class="form-control" placeholder="姓名">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">性别：</label>
				<div class="col-sm-10">
					<input type="text" id="sex" name="sex" value="${user.sex}" class="form-control" placeholder="性别">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">生日：</label>
				<div class="col-sm-10">
					<input type="text" id="birthday" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>" class="form-control" placeholder="生日">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">电话：</label>
				<div class="col-sm-10">
					<input type="text" id="phone" name="phone" value="${user.phone}" class="form-control" placeholder="电话">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">地址：</label>
				<div class="col-sm-10">
					<input type="text" id="address" name="address" value="${user.address}" class="form-control" placeholder="地址">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<button type="submit" class="col-sm-7 btn btn-success">提  交</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		//图片的点击事件
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
                url: "HeadPortUpload.do",
                type: "POST",
                data: formData,
                cache: false,//上传文件无需缓存
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (data) {
                	$("#headPort").val(data);
                	$("#upload").html("<img src='"+data+"' width='200px' onclick='imgClick()'>");
                },
                error: function () {
                    alert("上传失败！");
                }
            });
		}
		
	</script>
</body>
</html>
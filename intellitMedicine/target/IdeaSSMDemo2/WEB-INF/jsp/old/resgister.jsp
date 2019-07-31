<%--
  Created by IntelliJ IDEA.
  User: 18302
  Date: 2019/6/25
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>
<div class="RegDiv">
    <form class="form-horizontal" action="userReg.do" method="post">
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">帐号</label>
            <div class="col-sm-10">
                <input type="text" id="name" name="account" class="form-control" placeholder="输入帐号">
            </div>
            <label for="name" id="accountCheakStart" class="control-label"></label>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">密码</label>
            <div class="col-sm-10">
                <input type="text" id="psw" name="password" class="form-control" placeholder="输入密码">
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">重复密码</label>
            <div class="col-sm-10">
                <input type="text" id="psw2" class="form-control" placeholder="再次输入密码">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-5">
                <button type="submit" class="col-sm-7 btn btn-success" onclick="return submitCheak()">注   册</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    var msg = "${msg}";
    //帐号输入框失去焦点时进行帐号重复验证
    $("#name").blur(function () {
        var account = this.value;
        if (account != undefined && account != null && account != "") {
            //ajax做后台验证
            $.get("accountCheck.do", {"account": account}, function (data) {
                if (data == "ok") {
                    $("#accountCheakStart").html('<i class="fa fa-check" aria-hidden="true" style="color:green;font-size: 22px;"></i>');
                } else {
                    $("#accountCheakStart").html('<i class="fa fa-close" aria-hidden="true" style="color:red;font-size: 22px;"></i>');
                }
            });
        } else {
            $("#accountCheakStart").html("");
        }
    });

    //提交时做校验
    function submitCheak() {
        if ($("#name").val() == "") {
            $("#name").focus();
            alert("账号不能为空！");
            return false;
        }
        if ($("#psw").val() == "") {
            $("#psw").focus();
            alert("密码不能为空！");
            return false;
        }
        if ($("#psw").val() != $("#psw2").val()) {
            $("#psw2").focus();
            alert("两次密码不同！");
            return false;
        }
        return true;
    }

</script>
</body>
</html>

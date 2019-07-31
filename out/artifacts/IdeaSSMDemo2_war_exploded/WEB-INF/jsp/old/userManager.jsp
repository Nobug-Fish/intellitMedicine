<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="top_public.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人中心</title>
    <style>
        .table{
            background-color: white;
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
<div class="span12  center-block">
    <form id="form1" method="post">
        <input type="hidden" id="curPage" name="curPage" value="${page.curPage}"/>
        <input type="hidden" id="row4Page" name="row4Page" value="${page.row4Page}"/>
        <input type="hidden" id="maxPage" name="maxPage" value="${page.maxPage}"/>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">帐号:</span>
            <input type="text" class="form-control" placeholder="帐号" name="account">
        </div>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">姓名:</span>
            <input type="text" class="form-control" placeholder="姓名" name="userDetailed.name">
        </div>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">性别:</span>
            <input type="text" class="form-control" placeholder="性别" name="userDetailed.sex">
        </div>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">电话:</span>
            <input type="text" class="form-control" placeholder="电话" name="userDetailed.phone">
        </div>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">地址:</span>
            <input type="text" class="form-control" placeholder="地址" name="userDetailed.address">
        </div>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">生日:</span>
            <input type="text" class="form-control" placeholder="生日" name="userDetailed.birthday">
        </div>
    </form>
    <button class="btn btn-sm col-sm-2 btn-success" onclick="queryUser()">查询</button>
    <table class="table" id="userTable">
        <tr>
            <th><input type="checkbox"></th>
            <th>帐号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>生日</th>
            <th>电话</th>
            <th>地址</th>
            <th>操作</th>
        </tr>
    </table>
    <div class="text-center">
        <button class="btn btn-success" onclick="queryUser(1)">首页</button>
        <button class="btn btn-success" onclick="queryUser(2)">上一页</button>
        <span class="control-label" id="showInfo" style="color: #ffffff"> 第 1 页 / 共 1 页 </span>
        <button class="btn btn-success" onclick="queryUser(3)">下一页</button>
        <button class="btn btn-success" onclick="queryUser(4)">末页</button>
    </div>
</div>

<script type="application/javascript">
    $(function(){
        queryUser(0);
    });

    function queryUser(key){
        var curPage = $("#curPage").val();
        var maxPage = $("#maxPage").val();
        var row4Page = $("#row4Page").val();
        switch (key){
            case 0:
                curPage = 1;
                maxPage = 1;
                row4Page = 3;
                break;
            case 1:
                $("#curPage").val(1);
                break;
            case 2:
                $("#curPage").val(curPage>1?curPage-1:curPage);
                break;
            case 3:
                $("#curPage").val(curPage<maxPage?curPage*1+1:maxPage);
                break;
            case 4:
                $("#curPage").val(maxPage);
                break;
        }
        $.ajax({
            url:"queryAllUser2Page.do",
            data:$('#form1').serialize(),
            type:"Post",
            success:function(page){
                refreshTable(page);
            },
            error:function(){
                alert("error");
            }
        });
    }
    /**
     * 刷新表格
     * @param page
     */
    function refreshTable(page){
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
        userList.forEach(function(user){
            var htmlStr = "<tr>" +
                "<td id='"+user.id+"'><input type=\"checkbox\"></td>" +
                "<td>"+user.account+"</td>";
            if(user.userDetailed!=null){
                htmlStr += "<td>"+user.userDetailed.name+"</td>" +
                    "<td>"+user.userDetailed.sex+"</td>" +
                    "<td>"+new Date(user.userDetailed.birthday).Format("yyyy-MM-dd")+"</td>" +
                    "<td>"+user.userDetailed.phone+"</td>" +
                    "<td>"+user.userDetailed.address+"</td>";
            }else{
                htmlStr += "<td></td><td></td><td></td><td></td><td></td>";
            }
            htmlStr +="<td>" +
                "<button class=\"btn col-sm-4 btn-xs btn-success center-block\" onclick=\"\">修改</button>&emsp; " +
                "<button class=\"btn col-sm-4 btn-xs btn-success center-block\" onclick=\"delUser("+user.id+")\">删除</button>" +
                "</td></tr>";
            $("#userTable").append(htmlStr);
        });
    }

    /**
     * 删除指定用户
     * @param id
     */
    function delUser(id){
        var input1 = $("<input type='hidden' name='id' />")
        input1.attr('value',id);
        var form = $('#form1');
        form.append(input1);
        $.ajax({
            url:"delUser.do",
            data:form.serialize(),
            //     {
            //     id:id,
            //     curPage:$("#curPage").val(),
            //     row4Page:$("#row4Page").val(),
            //     maxPage:$("#maxPage").val(),
            // },
            type:"Post",
            success:function(page){
                refreshTable(page);
            },
            error:function(){
                alert("error");
            }
        });
    }
</script>


</body>
</html>
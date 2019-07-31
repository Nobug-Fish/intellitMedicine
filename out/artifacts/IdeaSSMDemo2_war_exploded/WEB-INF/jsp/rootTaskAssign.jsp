<%--
  Created by IntelliJ IDEA.
  User: 18302
  Date: 2019/6/27
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员任务指派</title>
    <style>
        .title {
            text-align: left;
            padding: 10px;
            margin: 0;
        }
        .title2 {
            text-align: center;
            padding: 10px;
            margin: 10px;
        }
    </style>
    <script type="text/javascript" src="../../js/jquery-1.8.2.js"></script>
</head>
<body>
<div class="title">
    <h1>任务指派</h1>
</div>

<form method="post">
    <input type="hidden" id="curPage" name="curPage" value="${page.curPage}"/>
    <input type="hidden" id="row4Page" name="row4Page" value="${page.row4Page}"/>
    <input type="hidden" id="maxPage" name="maxPage" value="${page.maxPage}"/>
</form>


<div class="title2">
    <h2>待处理申请</h2>
</div>
<hr>

<div>
    <table width="90%" height="100px" style="table-layout:fixed;text-align:center;padding-top: 30px" id="table">
        <tr>
            <th>申请用户</th>
            <th>具体需求</th>
            <th style="width: 100px;text-align: center">请求时间</th>
            <th></th>
        </tr>
    </table>

    <div class="title3" style="text-align: center">
        <button class="div_btn" onclick="queryDoc(1)">首页</button>
        <button class="div_btn" onclick="queryDoc(2)">上一页</button>
        <span class="" id="showInfo" style="color: black"> 第 1 页 / 共 1 页 </span>
        <button class="div_btn" onclick="queryDoc(3)">下一页</button>
        <button class="div_btn" onclick="queryDoc(4)">末页</button>
    </div>
</div>

<script type="application/javascript">

    $(function () {
        queryDoc(0);

    });


    function queryDoc(key) {
        var curPage = $("#curPage").val();
        var maxPage = $("#maxPage").val();
        var row4Page = $("#row4Page").val();

        switch (key) {
            case 0:
                $("#curPage").val(1);
                $("#maxPage").val(1);
                $("#row4Page").val(3);
                curPage = 1;
                maxPage = 1;
                row4Page = 3;
                break;
            case 1:
                $("#curPage").val(1);
                break;
            case 2:
                $("#curPage").val(curPage > 1 ? curPage - 1 : curPage);
                break;
            case 3:
                $("#curPage").val(curPage < maxPage ? curPage * 1 + 1 : maxPage);
                break;
            case 4:
                $("#curPage").val(maxPage);
                break;
        }
        $.ajax({
            url: "/rootCheckAssign.do",
            data:
                {
                    "curPage": $("#curPage").val(),
                    "row4Page": $("#row4Page").val(),
                    "maxPage": $("#maxPage").val()
                }
            ,
            type: "Post",
            success: function (page) {
                refreshTable(page);
            },
            error: function () {
                alert("error");
            }
        });
    }
    function newController(applyId) {


        $.ajax({
            url: "/rootReleaseMission.do",
            data:
                {
                    "applyId":applyId
                }
            ,
            type: "Post",
            success: function () {
                queryDoc(0);
                alert("处理成功")
            },
            error: function () {
                alert("error");
            }
        });
    }
    /**
     * 刷新表格
     * @param page
     */

    function refreshTable(page) {

        $("#curPage").val(page.curPage);
        $("#maxPage").val(page.maxPage);
        $("#row4Page").val(page.row4Page);

        $("#showInfo").html(" 第 " + page.curPage + " 页 / 共 " + page.maxPage + " 页 ");
        var List = page.objList;
        //获取表格行集合
        var trList = $("#table tr");
        //遍历删除表格行
        $.each(trList, function (index, item) {
            if (index > 0) {
                $(item).remove();
            }
        });
        //刷新表格行
        if (!List) {
            return;
        }
        List.forEach(function (data) {
            var check=data.is_checked;

            var htmlStr = "<tr style='padding: 10px'>" +
                "<td><h5> "+data.userId+"</h5> </td>"+
                "<td>" +data.applyIntro+"</td>" +
                "<td>"+data.applyTime+"</td>"+
                "<td><button class='div_btn' onclick='newController("+data.applyId+")'>处理</button></td>"+
                "</tr>";

            if(check!="true"){
                $("#table").append(htmlStr);
            }

        });
    }
</script>
</body>
</html>

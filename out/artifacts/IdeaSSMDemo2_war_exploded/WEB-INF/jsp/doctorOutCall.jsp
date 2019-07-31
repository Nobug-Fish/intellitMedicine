<%--
  Created by IntelliJ IDEA.
  User: 18302
  Date: 2019/6/27
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>医生我的出诊</title>
    <style>
        .head {
            background-color: #337ab7;
            height: 100px;
            margin-bottom: 20px;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        table {
            width: 100%;
            border-spacing: 10px;
        }

        table tr {
            text-align: center;
            margin-top: 20px;
        }

        tr th {
            background-color: #9dcce3;
            font-size: 22px;
        }
        .div_btn1{
            margin-left: 20px;
            margin-right: 20px;
            margin-top: 10px;
        }

    </style>
    <script type="text/javascript" src="../../js/jquery-1.8.2.js"></script>
</head>
<body>
<div class="head">
    <p style="text-align:left;font-size: 45px;color: white;padding-top: 20px">我的出诊</p>
</div>

<div>
    <hr>
    <form method="post">
        <input type="hidden" id="curPage" name="curPage" value="${page.curPage}"/>
        <input type="hidden" id="row4Page" name="row4Page" value="${page.row4Page}"/>
        <input type="hidden" id="maxPage" name="maxPage" value="${page.maxPage}"/>
    </form>
    <table id="table">
        <tr>
            <th>用户姓名</th>
            <th>联系方式</th>
            <th>家庭住址</th>
            <th>请求时间</th>
            <th>请求内容</th>
            <th>可选操作</th>

        </tr>
    </table>
    <hr>
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


    function update(id) {
        $.ajax({
            url: "/docRefuseMission.do",
            data:
                {
                    "applyId": id
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

    function finish(id1,id2) {
        $.ajax({
            url: "/docFinishMission.do",
            data:
                {
                    "userId": id1,
                    "applyId": id2
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
            url: "/queryDocAssignList.do",
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
        // if (!List) {
        //     return;
        // }
        List.forEach(function (data) {

            var htmlStr = "<tr style='padding: 10px'>" +
                "<td>" +data.user.userName+ "</td>" +
                "<td>" +data.user.phone + "</td>" +
                "<td>" +data.user.homeAdd + "</td>" +
                "<td>" +data.applyTime+ "</td>" +
                "<td>" + data.applyIntro + "</td>" +
                "<td><button class='div_btn1' onclick='update(" + data.applyId + ")'>暂时拒绝</button><br>" +
                "<button class='div_btn1' onclick='finish(" + data.userId +","+data.applyId+ ")'>完成申请</button>"+
                           "</td>" +
                "</tr><br>";
            if(data.is_checked=="true"){
                $("#table").append(htmlStr);
            }

        });
    }
</script>
</body>
</html>

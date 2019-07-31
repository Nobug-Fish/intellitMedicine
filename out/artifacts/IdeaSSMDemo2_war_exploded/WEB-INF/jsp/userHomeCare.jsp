<%--
  Created by IntelliJ IDEA.
  User: 18302
  Date: 2019/6/27
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>居家养老</title>
    <style>
        .title {
            background-color: #337ab7;
            height: 100px;
            margin-bottom: 20px;
        }
        .title3 {
            padding-left: 10px;
            padding-right: 50px;
            padding-bottom: 20px;
            text-align: center;
            clear: both;
            margin: 0;
        }
        .div_oneline {
            margin: 10px;
            padding: 30px;
            display: inline-block;
            _display: inline;
            *display: inline;
            zoom: 1;
        }
        .div_oneline button{
            border:none;
            background: white;
            font-size: 20px;
        }
        .div_btn {
            margin-left: 10px;
        }
        table{
            width: 100%;
            border-spacing: 10px;
        }
        table tr{
            font-size: 20px;
            text-align: center;
        }
        tr th{
            width: 33%;
            background-color: #9dcce3;
        }

    </style>
    <script type="text/javascript" src="../../js/jquery-1.8.2.js"></script>
</head>
<body>
<div class="title">
    <p style="margin-left: 2%;text-align:left;font-size: 45px;color: white;padding-top: 20px">居家养老</p>
</div>
<form method="post">
    <input type="hidden" id="curPage" name="curPage" value="${page.curPage}"/>
    <input type="hidden" id="row4Page" name="row4Page" value="${page.row4Page}"/>
    <input type="hidden" id="maxPage" name="maxPage" value="${page.maxPage}"/>
</form>

<div>
    <hr/>
    <div class="title2">
        筛选：
        <div class="div_oneline">
            <button onclick="docChoose(1)">区级</button>
        </div>
        <div class="div_oneline">
            <button onclick="docChoose(2)">村级</button>
        </div>
    </div>

    <table width="90%" height="100px" style="table-layout:fixed;text-align:center" id="table">
        <tr>
            <th>医生姓名</th>
            <th>基本信息</th>
            <th>申请服务</th>
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
    var type;
    $(function () {
        queryDoc(0);

    });

    function docChoose(key) {
        queryDoc(0);
        switch (key) {
            case 1:
                type = "1";
                break;
            case 2:
                type = "2";
                break;
        }
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
            url: "/queryDocPage.do",
            data:
                {
                    "type":type,
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

    function newService(doctorId) {
        window.location.assign("/userDoorService.do?docId="+doctorId);
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

            var htmlStr = "<tr>" +
                "<td><img src='' height='10px' width='10px'><h5> "+data.doctorName+"</h5> </td>"+
                "<td><label style='text-align: center;width: 40px;height:20px '>电话：" +data.phone+"</label><br/>" +
                "<label style='text-align: center;width: 40px;height:20px '>所属科室："+data.department+"</label></td>"+
                "<td><button class='div_btn' onclick='newService("+data.doctorId+");'>申请上门服务</button></td>"+
                "</tr>";

            $("#table").append(htmlStr);
        });
    }
</script>
</body>
</html>

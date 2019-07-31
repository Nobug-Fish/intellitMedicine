<%--
  Created by IntelliJ IDEA.
  User: cielab
  Date: 2019/6/27
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处方记录</title>
    <style>
        table{
            width: 100%;
            border-spacing: 10px;
        }
        table tr{
            font-size: 20px;
            text-align: center;
        }
        tr th{
            background-color: #9dcce3;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>时间</th>
        <th>医生</th>
        <th>详细报告</th>
    </tr>
    <tr>
        <td>2019-05-21</td>
        <td>石久让</td>
        <td><input type="button" id="check1" name="check" value="查看详情"></td>
    </tr>
    <tr>
        <td>2019-05-21</td>
        <td>石久让</td>
        <td><input type="button" id="check2" name="check" value="查看详情"></td>
    </tr>
</table>

</body>
</html>

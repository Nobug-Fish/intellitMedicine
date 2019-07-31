<%--
  Created by IntelliJ IDEA.
  User: cielab
  Date: 2019/6/28
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>已解读</title>
    <style>
        body {
            display: block;
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
        }
        * {
            box-sizing: border-box;
        }
        .header{
            height: 90px;
            line-height: 6px;
            background: #00568e;
        }
        ul
        {
            list-style-type:none;
            margin:0;
            padding:0;
        }
        li
        {
            display:inline;
            padding: 0 15px;
        }
        .bar a{
            color: #fff;
            font-size: 26px;
        }
        .daohang {
            display:block;
            float: right;
            margin-top: 37px;
        }
        .daohang a{
            font-size: 30px;
            color: #fff;
            text-decoration: none;
        }
        .last{
            float:right;
            padding-right: 35px;
        }
        .logo{
            padding-left: 50px;
            height: 100px;
        }
        .medium{
            height: 3%;
            background: #fff;
        }
        .bottom{
            with:100%;
            height:100%;
            display: flex;
        }
        .bottom1{
            flex: 3%;
            background: #fff;
            float:left;
        }
        .bottom2{
            flex: 15%;
            background: #00568e;
            float:left;
        }
        .bottom3{
            float:left;
            flex:78%;
            padding-left:50px;
        }
        .logo p{
            color: #fff;
            text-align:left;
            font-size: 45px;
            padding-top: 38px
        }
        .menu
        {
            padding-top: 15px;
            font-size: 26px;
            height: 50px;
        }
        .bar
        {
            list-style-type: none;
            width: 100%;
            line-height: 60px;
            margin: 0px 0px;
            padding: 0px 0px 0px 0px;
        }
        .bar a{
            color: #fff;
            text-decoration: none;
            font-size: 30px;
        }
        #myMenu li a{
            display:block;
        }
        #myMenu li a:hover {
            background-color: #eee;
        }
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }
        .tablelist {
            border: solid 2px #020202;
            width: 100%;
            font-size: 23px;
        }
        .content a{
            text-decoration: none;
        }
        thead{
            background-color: rgb(225, 231, 210);
        }
        th{
            text-align:center;
        }
        button {
            font-size: 22px;
        }
        .tablelink a, a:focus {
            text-decoration: none;
            color: #000;
            outline: none;
            blr: expression(this.onFocus=this.blur());
        }
        .tablelist tbody{
            background: #f5f8fa;
        }
        td{
            text-align:center;
        }
        tr {
            height:70px;
        }
        .page{
            font-size: 24px;
            text-align: center;
            margin-top: 50px;
        }
        .page a，.page span{
            text-decoration: none;
            padding: 5px 7px;
            cursor: pointer;
        }
        .page a:hover,.page span:hover,button:hover{
            color: #056dae;
        }
    </style>

    <script type="text/javascript">
        function myFunction() {
            var filter, ul, li, a, i;
            ul = document.getElementById("myMenu");
            li = ul.getElementsByTagName("li");
            for (i = 0; i < li.length; i++) {
                a = li[i].getElementsByTagName("a")[0];
                if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    li[i].style.display = "";
                } else {
                    li[i].style.display = "none";
                }
            }
        }
    </script>
</head>

<body>


<div class="header">
    <div class="logo">
        <p>健康解读</p>
    </div>
    <div class="last">
        <ul class="daohang">
            <li>
                <a  href="/">首 页</a>
            </li>
        </ul>
    </div>
</div>
<div class="medium">
</div>
<div class="bottom">
    <div class="bottom1">
    </div>
    <div class="bottom2">
        <div class="menu">
            <ul class="bar" id="myMenu">
                <li><a href="http://localhost:8080/jiankangjiedu.do">&nbsp;&nbsp;&nbsp;&nbsp;未解读的体检报告</a></li>
                <li><a href="http://localhost:8080/jiankangjiedu2.do">&nbsp;&nbsp;&nbsp;&nbsp;已解读的体检报告</a></li>
            </ul>
        </div>
    </div>
    <div class="bottom3">
        <table class="tablelist">
            <thead>
            <tr>
                <th>报告序号</th>
                <th>患者姓名</th>
                <th>时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody class="content">
            <tr>
                <td>1</td>
                <td>刀盘</td>
                <td>2013-09-09 15:05</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>2</td>
                <td>稳定器</td>
                <td>2013-09-08 14:02</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>3</td>
                <td>主承轴</td>
                <td>2013-09-07 13:16</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>4</td>
                <td>辅助推进油缸</td>
                <td>2013-09-06 10:36</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>5</td>
                <td>管片安装机</td>
                <td>2013-09-05 13:25</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>6</td>
                <td>皮带机</td>
                <td>2013-09-04 12:00</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>7</td>
                <td>驱动电机</td>
                <td>2013-09-03 00:05</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>8</td>
                <td>支撑盾</td>
                <td>2013-09-02 15:05</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>9</td>
                <td>管片</td>
                <td>2013-09-01 10:26</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>10</td>
                <td>支撑盾</td>
                <td>2013-09-02 15:05</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>11</td>
                <td>管片</td>
                <td>2013-09-01 10:26</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>

            <tr>
                <td>12</td>
                <td>支撑盾</td>
                <td>2013-09-02 15:05</td>
                <td><button type="button">查&nbsp;看</button>     <button type="button">删&nbsp;除</button></td>
            </tr>
            </tbody>
        </table>

        <div class="page">
            <span>上一页</span>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <span>下一页</span>
        </div>

    </div>
</div>




</body>
</html>

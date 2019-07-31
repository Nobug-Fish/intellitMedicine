<%--
  Created by IntelliJ IDEA.
  User: cielab
  Date: 2019/6/27
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>药品查询</title>
    <script type="text/javascript" src="js/jquery211.min.js"></script>
    <script type="text/javascript" src="js/bootstrap337.min.js"></script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* *x选择器：选择所有元素 */
        * {
            box-sizing: border-box;
        }

        /* 使用Flexbox创建一个列布局
        flex 的定义和用法
        1.flex 属性用于设置或检索弹性盒模型对象的子元素如何分配空间。
        2.flex 属性是 flex-grow、flex-shrink 和 flex-basis 属性的简写属性。
        注意：如果元素不是弹性盒模型对象的子元素，则 flex 属性不起作用。
        */
        .row {
            display: flex;
        }

        /* 左列(菜单) */
        .left {
            flex: 15%; /*让所有弹性盒模型对象的子元素的长度为15%，且忽略它们内部的内容*/
            padding: 15px ;
            height: 100%;
            padding-top: 20px;
            margin-left: 20px;
        }

        .left h2 {
            padding-left: 8px;
            background-color: #337ab7;
        }

        /* 右侧(内容) */
        .right {
            flex: 85%; /*让所有弹性盒模型对象的子元素的长度为85%，且忽略它们内部的内容*/
            padding-left: 15px;
            height: 100%
        }

        /* 左侧导航 */
        #myMenu {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        /*左侧导航标签*/
        #myMenu li a {
            background-color: #1784bb;
            padding: 13px;
            text-decoration: none;
            font-size: 26px;
            color: white;
            display: block;
        }
        /*左侧导航标签效果*/
        #myMenu li a:hover {
            background-color: #eee;
        }
        .head{
            background-color: #337ab7;
            height: 100px;
            margin-bottom: 20px;
        }
    </style>
    <script type="text/javascript">
        function myFunction() {
            var input, filter, ul, li, a, i;
            //input = document.getElementById("mySearch");
            //filter = input.value.toUpperCase();
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
<div class="head">
    <p style="text-align:left;font-size: 45px;color: white;padding-top: 20px;margin-left: 1%">药品查询 &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; <a  href="/userHome.do" style="padding-right: 90px;color: white">用户首页</a> <a  style="padding-right:200px;color: white" href="/userExit.do">退出登录</a></p>
</div>
<div class="row">
    <div class="left" style="background-color:#1784bb;margin-left: 1%">
        <ul id="myMenu">
            <li style="padding-left: 20%"><a href="/queryMedicineByDis.do" target="abc">对症找药</a></li>
            <li style="padding-left: 20%"><a href="/queryMedicineByLabel.do?medicineLabel=1" target="abc">家庭常备</a></li>
            <li style="padding-left: 20%"><a href="/queryMedicineByLabel.do?medicineLabel=2" target="abc">营养保健</a></li>
            <li style="padding-left: 20%"><a href="/queryMedicineByLabel.do?medicineLabel=3" target="abc">食品滋补</a></li>
        </ul>
    </div>

    <div class="right" >
        <iframe  id="myframe" name="abc" style="width: 100%;height: 100%" src="/queryMedicineByDis.do"/>
    </div>
</div>
</body>
</html>

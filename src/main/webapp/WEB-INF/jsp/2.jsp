<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2019/12/9
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="http://cdn.bootcss.com/echarts/3.2.3/echarts.min.js"></script>
<style type="text/css">
    #id{
        background-color:#000;
    }
    b{
        color:#FFF;
    }
    #c{
        background-color:#000;
        bottom: 0;
        position: absolute;
        width: 100%;
    }
    #d{
        bottom: 100px;

    }
    .nav-link {
        position: relative;
        padding: 0 14px;
        line-height: 34px;
        font-size: 10px;
        font-weight: bold;
        color: #555;
        text-decoration: none;
    }
    .nav-link:hover {
        color: #333;
        text-decoration: underline;
    }

    .nav-counter {

        top: -1px;
        right: 1px;
        min-width: 8px;
        height: 20px;
        line-height: 20px;

        padding: 0 6px;
        font-weight: normal;
        color: white;
        text-align: center;
        text-shadow: 0 1px rgba(0, 0, 0, 0.2);
        background: #e23442;
        border: 1px solid #911f28;
        border-radius: 11px;
        background-image: -webkit-linear-gradient(top, #e8616c, #dd202f);
        background-image: -moz-linear-gradient(top, #e8616c, #dd202f);
        background-image: -o-linear-gradient(top, #e8616c, #dd202f);
        background-image: linear-gradient(to bottom, #e8616c, #dd202f);
        -webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
        box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
    }

    .nav-counter-green {
        background: #75a940;
        border: 1px solid #42582b;
        background-image: -webkit-linear-gradient(top, #8ec15b, #689739);
        background-image: -moz-linear-gradient(top, #8ec15b, #689739);
        background-image: -o-linear-gradient(top, #8ec15b, #689739);
        background-image: linear-gradient(to bottom, #8ec15b, #689739);
    }

    .nav-counter-blue {
        background: #3b8de2;
        border: 1px solid #215a96;
        background-image: -webkit-linear-gradient(top, #67a7e9, #2580df);
        background-image: -moz-linear-gradient(top, #67a7e9, #2580df);
        background-image: -o-linear-gradient(top, #67a7e9, #2580df);
        background-image: linear-gradient(to bottom, #67a7e9, #2580df);
    }
    .main_left{
        width: 140px;
        height: 100%;
        float:left;
        background: #5585c0;
        cursor:pointer;
    }
</style>
<body>
<script>
    $(function(){
        $(".main_left li").on("click",function(){
            var address =$(this).attr("data-src");
            $("iframe").attr("src",address);
        });
    });
</script>
<div class="main_left" style="height:100%">
    <ul >
        <li><a href="/hello7"  target="targetText">我的信息</a></li>
        &emsp;
        <li><a href="/hello"  target="targetText">发布失物</a></li>
        &emsp;
        <li><a href="/hello1"  target="targetText">发布招领</a></li>
        &emsp;
        <li><a href="/hello2"  target="targetText">查询招领</a></li>
        &emsp;
        <li><a href="/hello3"  target="targetText">查询失物</a></li>
        &emsp;
        <li><a href="/hello4"  target="targetText">网站大厅</a></li>
    </ul>
</div>
<div>
    <%
        String name= (String) request.getSession().getAttribute("name");
        File file=new File("D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+name);
        if(!file.exists())
        {
            file.mkdir();
        }
%>
</div>
<div class="main_right"> <iframe frameborder="0" scrolling="yes" style="width:80%;height:100%" src="/hello4" name="targetText"></iframe>        </div>


</body>
</html>

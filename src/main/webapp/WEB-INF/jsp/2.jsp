<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="liqiqi.text.total" %>
<%@ page import="java.util.List" %><%--
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
<link href="file:///C|/Users/VULCAN/AppData/Roaming/Adobe/Dreamweaver CS6/zh_CN/Configuration/Temp/Assets/eamD91.tmp/SpryMenuBarVertical.css" rel="stylesheet" type="text/css">
<script src="http://cdn.bootcss.com/echarts/3.2.3/echarts.min.js"></script>
<style type="text/css">
    #id{
        background-color:#000;
    }
    b{
        color:#FFF;
    }
    ul.MenuBarVertical iframe
    {
        position: absolute;
        z-index: 1010;
        filter:alpha(opacity:0.1);
    }
    ul.MenuBarVertical
    {
        margin: 0;
        padding: 0;
        list-style-type: none;
        font-size: 100%;
        cursor: default;
        width: 8em;
    }
    ul.MenuBarActive
    {
        z-index: 1000;
    }
    ul.MenuBarVertical li
    {
        margin: 0;
        padding: 0;
        list-style-type: none;
        font-size: 100%;
        position: relative;
        text-align: left;
        cursor: pointer;
        width: 8em;
    }
    ul.MenuBarVertical ul
    {
        margin: -5% 0 0 95%;
        padding: 0;
        list-style-type: none;
        font-size: 100%;
        position: absolute;
        z-index: 1020;
        cursor: default;
        width: 8.2em;
        left: -1000em;
        top: 0;
    }
    ul.MenuBarVertical
    {
        border: 1px solid #CCC;
    }
    ul.MenuBarVertical ul
    {
        border: 1px solid #CCC;
    }
    ul.MenuBarVertical a
    {
        display: block;
        cursor: pointer;
        background-color: #EEE;
        padding: 0.5em 0.75em;
        color: #333;
        text-decoration: none;
    }
    .main_left{
        width: 140px;
        height:90%;
        float:left;

        cursor:pointer;
        margin-top: 0px;
        margin-bottom: 0px;
        margin-left: 0px;
        position: relative;
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
<h1 align="center" style="background-color: #EEE">失物招领系统</h1>
<div class="main_left"  >
    <ul id="MenuBar1" class="MenuBarVertical">
       <li class="c"><a href="/hello7"  target="targetText">我的信息</a></li>
        &emsp;
        <li class="c"><a href="/hello"  target="targetText">发布失物</a></li>
        &emsp;
        <li class="c"><a href="/hello1"  target="targetText">发布招领</a></li>
        &emsp;
        <li class="c"><a href="/hello2"  target="targetText">查询招领</a></li>
        &emsp;
        <li class="c"> <a href="/hello3"  target="targetText">查询失物</a></li>
        &emsp;
        <li class="c"><a href="/hello4"  target="targetText">网站大厅</a></li>
    </ul>
</div>
<div>
    <%
        String name= (String) request.getSession().getAttribute("name");
        File file=new File("D:/新建文件夹 (2)/text/src/main/webapp/"+name);
        if(!file.exists())
        {
            file.mkdir();
        }
        InputStream inputStream=null;
        inputStream= Resources.getResourceAsStream("mapping/config1.xml");
        SqlSessionFactory sqlSessionFactory= new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession=sqlSessionFactory.openSession();
        List<String> list=sqlSession.selectList("test.cout");
        int i=0,j=0;
        for(String s:list)
        {
            if((name+"1").equals(s))
            {
                i=1;
            }
            if((name+"2").equals(s))
            {
                j=1;
            }

        }
        if(i==0)
            sqlSession.update("test.upp",name+"1");
        if(j==0)
            sqlSession.update("test.upp",name+"2");





%>
</div>
<div class="main_right"> <iframe frameborder="0" scrolling="yes" style="width:80%;height:100%" src="/hello4" name="targetText"></iframe> </div>
</body>
</html>

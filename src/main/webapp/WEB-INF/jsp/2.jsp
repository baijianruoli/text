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

</style>
<body>
<div  id="id" align="center" >
    <p >&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span ><a href="/WEB-INF/jsp/2.jsp" ><b>我的信息</b></a></span>
        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span ><a href="/hello" ><b>发布失物</b></a></span>
        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span><a href="/hello1" ><b>发布招领</b></a></span>
        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span><a href="/hello2" ><b>查询招领</b></a></span>
        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span><a href="/hello3" ><b>查询失物</b></a></span>
        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span><a href="/hello4" ><b>网站大厅</b></a></span>
    </p>
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
<table>

</table>
</div>
<marquee direction="right" onmouseout="start()" onmouseover="stop()"  behavior="alternate" id="d">欢迎进入失物招领系统
</marquee>
<div  align="center" id="c">
    <span ><b>失物招领系统</b></span>
</div>

</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="liqiqi.text.load" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2019/12/14
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    .main_left{

        float:left;
        cursor:pointer;
    }
    .main_right{

        float:left;
        cursor:pointer;
    }
    .a{
        width: 100%;
        height: 80px;
        background-color: black;
        color:blanchedalmond;
        text-align: center;
        font-size: 60px;

    }
    .b{
        width: 50%;
        float: left;

    }
    .c{
        width: 50%;
        float: left;

    }
    。d{
        background-color: black;

    }
</style>
<body>
<%  int i=1;
    int ans=0;
    ArrayList<load> aa=new ArrayList();
    ArrayList<load> bb=new ArrayList();
    String name= (String) request.getSession().getAttribute("name");
            int j=1;
            String path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+name+"/2/"+j+".html";
            File file=new File(path);
            while(file.exists())
            {
                String k="sc/"+name+"/2/"+j+".html";
                String g="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+name+"/2/"+j+".txt";
                File file1=new File(g);
                if(!file1.exists())
                    break;
                FileInputStream in=new FileInputStream(file1);
                byte a[]=new byte [1000];
                in.read(a);
                String text=new String(a);
                load l=new load();
                l.setHtml(k);
                l.setImage(text);
                aa.add(l);
                ans++;
                j++;
                path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+name+"/2/"+j+".html";
                file=new File(path);
                in.close();
            }
     j=1;
    path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+name+"/1/"+j+".html";
    file=new File(path);
    while(file.exists())
    {
        String k="sc/"+name+"/1/"+j+".html";
        String g="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+name+"/1/"+j+".txt";
        File file1=new File(g);
        if(!file1.exists())
            break;
        FileInputStream in=new FileInputStream(file1);
        byte a[]=new byte [1000];
        in.read(a);
        String text=new String(a);
        load l=new load();
        l.setHtml(k);
        l.setImage(text);
        bb.add(l);
        ans++;
        j++;
        path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+name+"/1/"+j+".html";
        file=new File(path);
        in.close();
    }
    int suma=aa.size();
    request.getSession().setAttribute("suma",suma);
    request.getSession().setAttribute("sumb",bb.size());
    request.getSession().setAttribute("bb",bb);
    request.getSession().setAttribute("aa",aa);%>
<div class="a"><p><%=name%>的个人主页</p></div>
<div class="b" align="center">
    <span class="d"><p>我发布的招领帖</p></span>
<form action="/handle5">
<table border="1" align="center">
    <c:forEach var="i" items="${aa}"   varStatus="it">
        <tr align="center"><td><a href="<c:out value="${i.html}"/>"/><c:out value="${i.image}"></c:out></td><td><input type="submit" value="删除" name="${it.index}"></td></tr>
    </c:forEach>
</table>
</form >
  </div>
<div class="c" align="center">
    <span class="d"><p>我发布的丢失帖</p></span>
    <form action="/handle6">
    <table border="1" align="center" >
        <c:forEach var="i" items="${bb}"   varStatus="it">
        <tr align="center"><td><a href="<c:out value="${i.html}"/>"/><c:out value="${i.image}"></c:out></td><td><input type="submit" value="删除" name="${it.index}"></td></tr>
        </c:forEach>
    </table>
</form>
</div>
</body>
</html>

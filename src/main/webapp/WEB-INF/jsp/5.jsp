<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="liqiqi.text.load" %><%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2019/12/10
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% int i=1;
    int ans=0;
    ArrayList<load> aa=new ArrayList();
    String w[]=new String[100000];
    try{
        int sum= (int) request.getSession().getAttribute("sum");
        for(;i<=sum;i++)
        {
            String h= (String) request.getSession().getAttribute(""+i);
            int j=1;
            String path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+j+".html";
            File file=new File(path);
            while(file.exists())
            {
                String k="sc/"+h+"/1/"+j+".html";
                String g="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+j+".txt";
                File file1=new File(g);
                if(!file1.exists())
                    break;
                FileInputStream in=new FileInputStream(file1);
                byte a[]=new byte [100];
                in.read(a);
                String text=new String(a);
                load l=new load();
                l.setHtml(k);
                l.setName(text);
                aa.add(l);
                ans++;
                j++;
                path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+j+".html";
                file=new File(path);
                in.close();
            }
        }

    }
    catch(IOException s)
    {
        s.printStackTrace();
    }

    request.getSession().setAttribute("aa",aa);%>
<table border="1" align="center">
    <c:forEach var="i" items="${aa}" >
        <tr><td><a href="${i.html}"/>${i.name}</td></tr>
    </c:forEach>
</table>
</body>
</html>

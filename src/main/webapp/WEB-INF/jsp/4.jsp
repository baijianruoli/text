<%@ page import="liqiqi.text.load" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2019/12/11
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%  int i=1;
    int ans=0;
    ArrayList<load> aa=new ArrayList();
    int sum= (int) request.getSession().getAttribute("sum");
    try{
        for(;i<=sum;i++)
        {
            String h= (String) request.getSession().getAttribute(""+i);
            int j=1;
            String path="D:/新建文件夹 (2)/text/src/main/webapp/"+h+"/2/"+j+".jsp";
            File file=new File(path);
            while(file.exists())
            {
                String k="/"+h+"/2/"+j+".jsp";
                String g="D:/新建文件夹 (2)/text/src/main/webapp/"+h+"/2/"+j+".txt";
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
                path="D:/新建文件夹 (2)/text/src/main/webapp/"+h+"/2/"+j+".jsp";
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
        <tr><td><a href="<c:out value="${i.html}"/>"/><c:out value="${i.image}"></c:out></td></tr>
    </c:forEach>
</table>
</body>
</html>

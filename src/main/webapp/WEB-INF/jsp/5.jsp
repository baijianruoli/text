<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2019/12/10
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <% int i=1;
       int j=1;
    int sum= (int) request.getSession().getAttribute("sum");
    try{


   for(;i<=sum;i++)
    {
        String h= (String) request.getSession().getAttribute(""+i);
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
           byte a[]=new byte [10000000];
              in.read(a);
              String text=new String(a);


    %>
         <tr><td><a href="<%=k%>"/><%=text%>></td></tr>
    <%   j++;
         path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+j+".html";
           file=new File(path);
        }
    }
        }
    catch(IOException a)
    {
        System.out.println(1);
        a.printStackTrace();
    }
    %>
</table>
</body>
</html>

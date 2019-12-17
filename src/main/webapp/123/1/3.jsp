<%@ page import="java.util.ArrayList" %>
<%@ page import="liqiqi.text.comment" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
 <style type="text/css">
.a1{width: 200px;height: 200px;background: url(3.jpg) no-repeat center center;
}
li {
    border: solid 1px #ff62ee
}
</style><body>
<div><a href='3.jpg'><div class='a1'></div></a></div>
<div>发布人:<a href='/hello7?ID=123'>123</a></div>
<div>丢失物品游戏</div>
<div>丢失所在地点餐厅</div>
<div>丢失日期11</div>
<div>其他描述  11</div>
<form action="/handle7">
    <textarea name="a" ></textarea>
    <input type="submit" value="评论">
    <input type="hidden" value=/123/1/3 name="b">
</form>
<ul style="border: 1px red solid; width: 50%;">
<%  File file=new File("D:/新建文件夹 (2)/text/src/main/webapp/123/1/3.dat");
    if(file.exists())
    {

    ObjectInputStream in=new ObjectInputStream(new FileInputStream(file));
    ArrayList<comment> list= (ArrayList<comment>) in.readObject();
    for(comment c:list)
    {
 %>
    <li >
        <p> <%=c.getName()%>  评论:</p>
       <div style="width: 50%"><%=c.getComments()%><br> ---发布时间<%=c.getDate()%></div>
    </li>


<%
    }
    in.close();
    }
%>
</ul>
</body>
</html>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="liqiqi.text.title" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.ObjectInputStream" %>
<%@ page import="liqiqi.text.comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2019/12/19
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% InputStream in=null;
in= Resources.getResourceAsStream("mapping/config1.xml");
String user= (String) request.getSession().getAttribute("name");
    SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(in);
    SqlSession sqlSession=sqlSessionFactory.openSession();
    String name=request.getParameter("name");
    String from= request.getParameter("from");
    String id=request.getParameter("id");
    if(name!=null)
    {
        request.getSession().setAttribute("user",name);
        request.getSession().setAttribute("from",from);
        request.getSession().setAttribute("id",id);
    }
    name= (String) request.getSession().getAttribute("user");
    from=(String) request.getSession().getAttribute("from");
    id=(String) request.getSession().getAttribute("id");
    System.out.println(name+"  "+from+" "+id);
    HashMap<String,String> map=new HashMap<>();
    map.put("a1",name+from);
    map.put("a2",id);
    title t=sqlSession.selectOne("test.selectid",map);
    String g[]=t.getPicture().split("/");
    String v="/"+g[g.length-3]+"/"+g[g.length-2]+"/"+g[g.length-1];
    String na= (String) request.getSession().getAttribute("name");
    String b=request.getParameter("b");
    String a=request.getParameter("a");
    if(b!=null&&a!=null)
    {
        String cc=request.getParameter("a");
       HashMap<String,String> hashMap=new HashMap<>();
       hashMap.put("a1",name+"0"+from+id);
       hashMap.put("a2",na);
       hashMap.put("a3",new Date().toString());
       hashMap.put("a4",cc);
       sqlSession.insert("test.into",hashMap);
       sqlSession.commit();

    }
    String time=request.getParameter("time");
    if(time!=null)
    {
        HashMap<String,String> hashMap=new HashMap<>();
        hashMap.put("a1",name+"0"+from+id);
        hashMap.put("a2",time);
        sqlSession.delete("test.deletedate",hashMap);
        sqlSession.commit();
    }
%>
<style type="text/css">
    .a1{width: 200px;height: 200px;background: url(<%=v%>) no-repeat center center;
    }
    li {
        border: solid 1px #ff62ee
    }
</style>
<% if(from.equals("1"))
{

%>
<div align="center">
    <div><a href=<%=v%>><div class='a1'></div></a></div>
    发布人 ： <a href="/hello7?ID=<%=name%>"><%=t.getName()%></a><br>
     丢失物品 : <%=t.getSome()%><br>
     丢失地点： <%=t.getPlace()%><br>
      丢失日期:  <%=t.getDate()%><br>
      其他 :   <%=t.getOther()%><br>
</div>
<%}
else
{
%>
<div align="center">
    <div><a href=<%=v%>><div class='a1'></div></a></div>
    发布人 ： <a href="/hello7?ID=<%=name%>"><%=t.getName()%></a><br>
    拾到物品 : <%=t.getSome()%><br>
    拾到地点： <%=t.getPlace()%><br>
    拾到日期:  <%=t.getDate()%><br>
    其他 :   <%=t.getOther()%><br>
</div>
<%}
%>
<div align="center">
<form >
    <textarea name="a" ></textarea>
    <input type="submit" value="评论" name="b">
</form>
</div>
<div align="center">
<ul style="border: 1px red solid; width: 50%;" >
    <%
        List<comment> l=sqlSession.selectList("test.selectal",name+"0"+from+id);
        for(comment c:l)
        {
    %>
    <form >
    <li >
        <p> <a href="/hello7?ID=<%=c.getName()%>"><%=c.getName()%> </a> 评论:</p>
        <div style="width: 50%"><%=c.getOther()%><br> ---发布时间<%=c.getDate()%><% if(user.equals(c.getName())){%><input type="submit" name="sumbit" value="删除"><input type="hidden" value="<%=c.getDate()%>" name="time"><%}%> </div>
    </li>
    </form>

    <%
        }
    %>
</ul>
</div>
</body>
</html>

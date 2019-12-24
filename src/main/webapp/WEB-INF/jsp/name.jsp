<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="liqiqi.text.load" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="liqiqi.text.title" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %><%--
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

                          *{
                              margin: 0px;
                              padding: 0px;
                              box-sizing: border-box;
                          }
    body{
        /*no-repeat center 图片不重复，居中，这里不使用*/
        width: 100%;
        height: 100%;
        background-size: cover;
        position: absolute;
    }

    .rg_layout{
        width: 900px;
        height: 500px;
        border: 8px solid #EEEEEE; /*边框*/
        background-color: white;
        /*让div水平居中*/
        margin: auto;
        margin-top: 55px;
    }

    .rg_left{
        /*border:1px solid #99ffff;*/ /*边框不要*/
        float: left;
        margin: 15px;	/*外边距*/
    }

    .rg_left > p:first-child{
        color:#FFD026;
        font-size: 20px;
    }
    .rg_left > p:last-child{
        color: #A6A6A6;
        font-size: 20px;
    }

    .rg_center{
        /*border:1px solid #99ffff;*/
        margin-top: 100px;
        float: left;
        width: 450px;

    }
    .rg_right{
        /*border:1px solid #99ffff;*/
        float: right;
        margin: 15px;	/*外边距*/
    }
    .rg_right > p:first-child{

        font-size: 15px;
    }
    .rg_right p a{
        color: pink;
    }

    .td_left{
        width: 100px;
        text-align: right;
        height: 45px;
    }

    .td_right{
        padding-left: 50px;
    }

    #username,#password,#email,#name,#tel,#birthday,#checkcode{
        width: 350px;
        height: 32px;
        border:1px solid #A6A6A6;
        /*设置边框*/
        border-radius: 5px;
        padding-left: 10px;
    }
    #checkcode{
        width: 110px;
    }

    #img_check{
        height: 32px;
        vertical-align: middle;
    }

    .btn_sub{
        width: 50px;
        height: 40px;
        background-color:#ffffcc;
        border:1px solid #ffffcc;
    }

</style>

<body>
<%  int i=1;
    int ans=0;
    ArrayList<load> aa=new ArrayList();
    ArrayList<load> bb=new ArrayList();
    String name= (String) request.getSession().getAttribute("name");
    InputStream inputStream=null;
    inputStream= Resources.getResourceAsStream("mapping/config1.xml");
    SqlSessionFactory sqlSessionFactory= new SqlSessionFactoryBuilder().build(inputStream);
    SqlSession sqlSession=sqlSessionFactory.openSession();
    List<title> list=sqlSession.selectList("test.selectall",name+"2");
    for(title u:list)
    {
        String m;
        m=u.getSome()+"--拾到地点"+u.getPlace()+"--发布人"+u.getName();
        load l=new load();
        l.setImage(m);
        l.setHtml("/hello5?name="+name+"&from=2&id="+u.getId());
        l.setName(u.getId());
        aa.add(l);

    }
    List<title> li=sqlSession.selectList("test.selectall",name+"1");
    for(title u:li)
    {
        String m;
        m=u.getSome()+"--丢失地点"+u.getPlace()+"--发布人"+u.getName();
        load l=new load();
        l.setImage(m);
        l.setHtml("/hello5?name="+name+"&from=1&id="+u.getId());
        l.setName(u.getId());
        bb.add(l);

    }
    request.getSession().setAttribute("bb",bb);
    request.getSession().setAttribute("aa",aa);%>
<div class="a"><p><%=name%>的个人主页</p></div>
<div class="b" align="center">
    <span class="d"><p>我发布的招领帖</p></span>
<form action="/handle5">
<table  align="center">
    <c:forEach var="i" items="${aa}"   varStatus="it">
        <tr align="center"><td id="birthday"><a href="<c:out value="${i.html}"/>"/><c:out value="${i.image}"></c:out></td><td><input type="submit" value="删除" name="${it.index}" class="btn_sub"></td></tr>
        <input type="hidden"  value="${i.name}"  name="index">
        <input type="hidden"  value="2"  name="from">
    </c:forEach>
</table>
</form >
  </div>
<div class="c" align="center">
    <span class="d"><p>我发布的丢失帖</p></span>
    <form action="/handle5">
    <table  align="center" >
        <c:forEach var="i" items="${bb}"   varStatus="it">
        <tr align="center"><td id="birthday"><a href="<c:out value="${i.html}"/>"/><c:out value="${i.image}"></c:out></td><td><input type="submit" value="删除" name="${it.index}" class="btn_sub"></td></tr>
            <input type="hidden"  value="${i.name}"  name="index">
            <input type="hidden"  value="1"  name="from">
        </c:forEach>
    </table>
</form>
</div>
</body>
</html>

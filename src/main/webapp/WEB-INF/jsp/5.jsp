<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.ArrayList" %><%--
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
<table border="1">

    <c:forEach var="i" items="${aa}" >
        <tr><td><a href="<c:out value="${i.html}"/>"/><c:out value="${i.image}"></c:out></td></tr>
    </c:forEach>

</table>
</body>
</html>

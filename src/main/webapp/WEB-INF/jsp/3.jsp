<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>123</title>
</head>
<body>
<%    String a= (String) request.getSession().getAttribute("mm");


     if(a.equals("1"))
     {
%>
<script>
    alert("验证码错误");
    window.history.back(-1);
</script>
<% }
   else{
       %>
<script>
    alert("用户信息错误");
    window.history.back(-1);

</script>
<%}%>

</body>
</html>

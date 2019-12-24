<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="liqiqi.text.total" %>
<%@ page import="liqiqi.text.user" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2019/12/15
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="http://cdn.bootcss.com/echarts/3.2.3/echarts.min.js"></script>
<body>
<%
    String name= (String) request.getSession().getAttribute("name");
    InputStream inputStream=null;
    inputStream= Resources.getResourceAsStream("mapping/config.xml");
    SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
    SqlSession sqlSession=sqlSessionFactory.openSession();
    List<user> list=sqlSession.selectList("testa.selectall");
    int q=0,p=0;
    for(user u:list)
    {
        InputStream in=Resources.getResourceAsStream("mapping/config1.xml");
        SqlSessionFactory sqlSessionFactor=new SqlSessionFactoryBuilder().build(in);
        SqlSession sql=sqlSessionFactor.openSession();
        int h=sql.selectOne("test.coutt",u.getUsername()+"1");
        q+=h;
        h=sql.selectOne("test.coutt",u.getUsername()+"2");
        p+=h;
    }
    System.out.println(q+""+p);
    total t=new total();
    t.setPush(q);
    t.setPop(p);
    sqlSession.update("testa.de");
    sqlSession.insert("testa.up",t);
    sqlSession.commit();

%>
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    var option = {
        title: {
            text: '发帖情况统计',
            subtext: '实时数据',
            left: 'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            // orient: 'vertical',
            // top: 'middle',
            bottom: 10,
            left: 'center',
            data:['招领帖','丢失帖']
        },
        series : [
            {
                type: 'pie',
                radius : '65%',
                center: ['50%', '50%'],
                selectedMode: 'single',
                data:[{name: '招领帖',value: <%=p%>},{name: '丢失帖',value:<%=q%>}],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    myChart.setOption(option);
</script>
</body>
</html>

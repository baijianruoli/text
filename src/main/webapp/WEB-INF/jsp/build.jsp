<%@ page import="java.io.File" %><%--
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
    int i= (int) request.getSession().getAttribute("sum");
    int j=1;
    int ans=0;
    for(;j<=i;j++)
    {
        String h= (String)request.getSession().getAttribute(""+j);
        int k=1;
        String path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+k+".html";
        File file=new File(path);
        while(file.exists())
        {
            String g="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+k+".txt";
            File file1=new File(g);
            if(!file1.exists())
                break;
            ans++;
            k++;
            path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+k+".html";
            file=new File(path);
        }
    }
    request.getSession().setAttribute("first",ans);
    j=1;
    ans=0;
    for(;j<=i;j++)
    {
        String h= (String)request.getSession().getAttribute(""+j);
        int k=1;
        String path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/2/"+k+".html";
        File file=new File(path);
        while(file.exists())
        {
            String g="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/2/"+k+".txt";
            File file1=new File(g);
            if(!file1.exists())
                break;
            ans++;
            k++;
            path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/2/"+k+".html";
            file=new File(path);
        }
    }
    request.getSession().setAttribute("second",ans);
    int first= (int) request.getSession().getAttribute("first");
    int second= (int) request.getSession().getAttribute("second");
    String name= (String) request.getSession().getAttribute("name");


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
                data:[{name: '招领帖',value: <%=second%>},{name: '丢失帖',value:<%=first%>}],
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

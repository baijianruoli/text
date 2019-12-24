<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="liqiqi.text.load" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="liqiqi.text.title" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.io.Resources" %><%--
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
    <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.7.0/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.7.0/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.7.0/demo.css">
    <script type="text/javascript" src="/jquery-easyui-1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
</head>
<style type="text/css">
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

    #username,#password,#email,#name,#tel,.birthday,#checkcode{
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

    #btn_sub{
        width: 150px;
        height: 40px;
        background-color: #EEE;

    }

</style>
<body>
<%  int i=1;
    int ans=0;
    ArrayList<title> aa=new ArrayList();
    String mo=request.getParameter("mo");
    String hu=request.getParameter("hu");
    int sum= (int) request.getSession().getAttribute("sum");
    try{
        for(;i<=sum;i++)
        {
            String h= (String) request.getSession().getAttribute(""+i);

            InputStream inputStream=null;
            inputStream= Resources.getResourceAsStream("mapping/config1.xml");
            SqlSessionFactory sqlSessionFactory= new SqlSessionFactoryBuilder().build(inputStream);
            SqlSession sqlSession=sqlSessionFactory.openSession();
            List<title> list=sqlSession.selectList("test.selectall",h+"1");
            if(mo==null&&hu==null)
            {
                for(title u:list)
                {
                    String m;
                    m=u.getSome()+"--丢失地点"+u.getPlace()+"--发布人"+u.getName();
                    load l=new load();
                    l.setImage(m);
                    l.setHtml("/hello5?name="+h+"&from=1&id="+u.getId());
                    aa.add(u);

                }
            }
            else
            {
                for(title u:list)
                {

                    if(u.getSome().contains(mo))
                    {
                        String m;
                        m=u.getSome()+"--丢失地点"+u.getPlace()+"--发布人"+u.getName();
                        load l=new load();
                        l.setImage(m);
                        l.setHtml("/hello5?name="+h+"&from=1&id="+u.getId());
                        aa.add(u);
                    }


                }
            }




        }
    }
    catch(IOException s)
    {
        s.printStackTrace();
    }
    ArrayList<title> bb=new ArrayList();
    Random randomn=new Random();
    int t=aa.size();
    while(aa.size()!=0)
    {
        bb.add(aa.remove(randomn.nextInt(aa.size())));
    }
    request.getSession().setAttribute("aa",bb);
    int b=0;%>
<div class="rg_layout">
    <form>
        <div align="center"><input type="text" name="mo"  class="birthday" placeholder="请输入模糊搜索关键字"><input type="submit" value="搜索" name="hu"><span align="right"><input type="submit" value="刷新" align="right" id="btn_sub"></span></div>

    </form>

    <div style="margin:20px 0;"></div>

    <table id="dg" title="失物查询" style="width:700px;height:300px" data-options="
                rownumbers:true,
                singleSelect:true,
                autoRowHeight:false,
                pagination:true,
                pageSize:10
" align="center">
        <thead>
        <tr>
            <th field="inv" width="140" data-options="formatter: rowformater">发布人</th>
            <th field="date" width="140">丢失物品</th>
            <th field="name" width="120">丢失所在地点</th>
            <th field="amount" width="130" align="right">丢失日期</th>
            <th field="price" width="120" align="right">其他描述</th>
            <th field="id"  width="0"></th>

        </tr>
        </thead>
    </table>
    <script type="text/javascript">
        function rowformater(value, row, index) {
            return "<a href='/hello5?name=" + row.inv+"&from=1&id="+row.id + "' >" + row.inv + "</a>";
        }
    </script>
    <script>
        (function($){
            function pagerFilter(data){
                if ($.isArray(data)){    // is array
                    data = {
                        total: data.length,
                        rows: data
                    }
                }
                var target = this;
                var dg = $(target);
                var state = dg.data('datagrid');
                var opts = dg.datagrid('options');
                if (!state.allRows){
                    state.allRows = (data.rows);
                }
                if (!opts.remoteSort && opts.sortName){
                    var names = opts.sortName.split(',');
                    var orders = opts.sortOrder.split(',');
                    state.allRows.sort(function(r1,r2){
                        var r = 0;
                        for(var i=0; i<names.length; i++){
                            var sn = names[i];
                            var so = orders[i];
                            var col = $(target).datagrid('getColumnOption', sn);
                            var sortFunc = col.sorter || function(a,b){
                                return a==b ? 0 : (a>b?1:-1);
                            };
                            r = sortFunc(r1[sn], r2[sn]) * (so=='asc'?1:-1);
                            if (r != 0){
                                return r;
                            }
                        }
                        return r;
                    });
                }
                var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
                var end = start + parseInt(opts.pageSize);
                data.rows = state.allRows.slice(start, end);
                return data;
            }

            var loadDataMethod = $.fn.datagrid.methods.loadData;
            var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
            $.extend($.fn.datagrid.methods, {
                clientPaging: function(jq){
                    return jq.each(function(){
                        var dg = $(this);
                        var state = dg.data('datagrid');
                        var opts = state.options;
                        opts.loadFilter = pagerFilter;
                        var onBeforeLoad = opts.onBeforeLoad;
                        opts.onBeforeLoad = function(param){
                            state.allRows = null;
                            return onBeforeLoad.call(this, param);
                        }
                        var pager = dg.datagrid('getPager');
                        pager.pagination({
                            onSelectPage:function(pageNum, pageSize){
                                opts.pageNumber = pageNum;
                                opts.pageSize = pageSize;
                                pager.pagination('refresh',{
                                    pageNumber:pageNum,
                                    pageSize:pageSize
                                });
                                dg.datagrid('loadData',state.allRows);
                            }
                        });
                        $(this).datagrid('loadData', state.data);
                        if (opts.url){
                            $(this).datagrid('reload');
                        }
                    });
                },
                loadData: function(jq, data){
                    jq.each(function(){
                        $(this).data('datagrid').allRows = null;
                    });
                    return loadDataMethod.call($.fn.datagrid.methods, jq, data);
                },
                deleteRow: function(jq, index){
                    return jq.each(function(){
                        var row = $(this).datagrid('getRows')[index];
                        deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                        var state = $(this).data('datagrid');
                        if (state.options.loadFilter == pagerFilter){
                            for(var i=0; i<state.allRows.length; i++){
                                if (state.allRows[i] == row){
                                    state.allRows.splice(i,1);
                                    break;
                                }
                            }
                            $(this).datagrid('loadData', state.allRows);
                        }
                    });
                },
                getAllRows: function(jq){
                    return jq.data('datagrid').allRows;
                }
            })
        })(jQuery);

        function getData(){
            var rows = [];
            <%for(int p=0;p<bb.size();p++){%>
            rows.push({
                inv: '<%=bb.get(p).getName()%>',
                date: '<%=bb.get(p).getSome()%>',
                name: '<%=bb.get(p).getPlace()%>',
                amount:'<%=bb.get(p).getDate()%>',
                price: '<%=bb.get(p).getOther()%>',
                id:'<%=bb.get(p).getId()%>'
            });

            <%}%>
            return rows;
        }

        $(function(){
            $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
        });
    </script>
</div>
</div>
</body>
</html>

package liqiqi.text.Handle;

import liqiqi.text.user;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
public class handle {
   @RequestMapping("/handle")
    public String hand(HttpServletRequest requset) throws IOException {

       InputStream inputStream=null;
       inputStream = Resources.getResourceAsStream("mapping/config.xml");
       SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(inputStream );
       SqlSession session=factory.openSession();
       // Person a= session.selectOne("testa.findPersonByName", "dong");
       //System.out.println(a);
       List<user> list=session.selectList("testa.selectall");
       //int n=session.selectOne("testa.cout");
       // System.out.println(n);
       String a1=null;
       String a2=null;
       String a3=null;
       String a4=null;
       String b1=null;
       String b2=null;
       String s=null;
       a1=requset.getParameter("a1");
       a2=requset.getParameter("a2");
       a3=requset.getParameter("a3");
        a4=requset.getParameter("a4");
        b1=requset.getParameter("b1");
       b2=requset.getParameter("b2");
       s= (String) requset.getSession().getAttribute("image");
       int i=1;
       for(user b:list)
       {
           requset.getSession().setAttribute(""+i,b.getUsername());
           i++;
       }
       requset.getSession().setAttribute("sum",i-1);
       if(b2==null)
       {
           for(user a:list)
           {
               if(a1.equals(a.getUsername())&&a2.equals(a.getPassword())&&s.equals(a3))
               {
                   requset.getSession().setAttribute("name",a1);
                   return "/WEB-INF/jsp/2.jsp";
               }
           }
           if(!s.equals(a3))
           {
               requset.getSession().setAttribute("mm" ,"1");
           }
           else
           {
               requset.getSession().setAttribute("mm" ,"0");
           }
           return "/WEB-INF/jsp/3.jsp";
       }
       else
       {
           return "sc/register.html";
       }

   }
}

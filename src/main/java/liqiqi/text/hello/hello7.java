package liqiqi.text.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class hello7 {
@RequestMapping("/hello7")
    public String cc(HttpServletRequest request)
{
     String user=null;
    user=  request.getParameter("ID");
     String name= null;
             name=(String) request.getSession().getAttribute("name");

     if(user==null)
         return "/WEB-INF/jsp/name.jsp";
     else
         return "/WEB-INF/jsp/user.jsp";


}
}

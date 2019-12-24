package liqiqi.text.Handle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class  handle4 {
   @RequestMapping("/handle4")
    public String cc(HttpServletRequest request)
   {

       return "/5.jsp";
   }
}

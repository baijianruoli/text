package liqiqi.text.Handle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class handle3 {
 @RequestMapping("/handle3")
    public  String cc(HttpServletRequest request)
 {

     return "/4.jsp";
 }
}

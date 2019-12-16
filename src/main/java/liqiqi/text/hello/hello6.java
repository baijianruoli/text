package liqiqi.text.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class hello6 {
    @RequestMapping("/hello6")
    public String cc()
    {
        return "/WEB-INF/jsp/2.jsp";
    }
}

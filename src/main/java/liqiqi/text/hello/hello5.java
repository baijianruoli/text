package liqiqi.text.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class hello5 {
@RequestMapping("/hello5")
    public String cc()
{
    return "/WEB-INF/jsp/perform.jsp";
}
}

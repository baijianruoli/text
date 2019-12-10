package liqiqi.text.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class hello1 {
    @RequestMapping("hello1")
    public String cc()
    {
        return "sc/3.html";
    }

}

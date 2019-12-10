package liqiqi.text.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class hello2 {
    @RequestMapping("hello2")
    public String cc()
    {
        return "sc/4.html";
    }
}

package liqiqi.text.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class hello4 {
    @RequestMapping("hello4")
    public String cc()
    {
        return "sc/6.html";
    }
}

package liqiqi.text.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class hello3 {
    @RequestMapping("hello3")
    public String cc()
    {
        return "/handle4";
    }
}

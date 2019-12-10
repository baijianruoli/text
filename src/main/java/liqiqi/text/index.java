package liqiqi.text;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class index {
    @RequestMapping("/")
    public String a()
    {
        return "sc/1.html";
    }

}

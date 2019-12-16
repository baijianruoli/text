package liqiqi.text.Handle;

import liqiqi.text.load;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

@Controller
public class  handle4 {
   @RequestMapping("/handle4")
    public String cc(HttpServletRequest request)
   {

       return  "/WEB-INF/jsp/5.jsp";
   }
}

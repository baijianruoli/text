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
       int i=1;
       int ans=0;
       ArrayList<load> aa=new ArrayList();
       try{
       int sum= (int) request.getSession().getAttribute("sum");
           for(;i<=sum;i++)
           {
               String h= (String) request.getSession().getAttribute(""+i);
               int j=1;
               String path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+j+".html";
               File file=new File(path);
               while(file.exists())
               {
                   String k="sc/"+h+"/1/"+j+".html";
                   String g="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+j+".txt";
                   File file1=new File(g);
                   if(!file1.exists())
                       break;
                   FileInputStream in=new FileInputStream(file1);
                   byte a[]=new byte [10000000];
                   in.read(a);
                   String text=new String(a);
                   load l=new load();
                   l.setHtml(k);
                   l.setImage(text);
                   aa.add(l);
                   ans++;
                   j++;
                   path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+h+"/1/"+j+".html";
                   file=new File(path);
               }
           }
       }
       catch(IOException s)
       {
           s.printStackTrace();
       }

         request.getSession().setAttribute("aa",aa);
       return  "/WEB-INF/jsp/5.jsp";
   }
}

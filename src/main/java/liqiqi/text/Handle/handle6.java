package liqiqi.text.Handle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
public class handle6 {
@RequestMapping("/handle6")
    public String cc(HttpServletRequest request)
{
    int sum= (int) request.getSession().getAttribute("sumb");
    String name= (String) request.getSession().getAttribute("name");
    int k=0;
    for(int j=0;j<sum;j++)
    {
        if(k==1)
        {
            int i=j+1;
            String path1="D:/新建文件夹 (2)/text/src/main/webapp/"+name+"/1/"+i+".jsp";
            String path11="D:/新建文件夹 (2)/text/src/main/webapp/"+name+"/1/"+i+".txt";
            String path111="D:/新建文件夹 (2)/text/src/main/webapp/"+name+"/1/"+i+".jpg";
            File file1=new File(path1);
            File file11=new File(path11);
            File file111=new File(path111);
            file1.renameTo(new File("D:/新建文件夹 (2)/text/src/main/webapp/"+name+"/1/"+j+".jsp"));
            file11.renameTo(new File("D:/新建文件夹 (2)/text/src/main/webapp/"+name+"/1/"+j+".txt"));
            file111.renameTo(new File("D:/新建文件夹 (2)/text/src/main/webapp//"+name+"/1/"+j+".jpg"));

        }
        if(request.getParameter(""+j)!=null)
        {
            int i=j+1;
            String path1="D:/新建文件夹 (2)/text/src/main/webapp/"+name+"/1/"+i+".jsp";
            String path11="D:/新建文件夹 (2)/text/src/main/webapp/"+name+"/1/"+i+".txt";
            String path111="D:/新建文件夹 (2)/text/src/main/webapp/"+name+"/1/"+i+".jpg";
            File file1=new File(path1);
            File file11=new File(path11);
            File file111=new File(path111);
            file1.delete();
            file11.delete();
            file111.delete();
            k=1;
        }

    }


    return  "/WEB-INF/jsp/name.jsp";
}
}

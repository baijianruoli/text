package liqiqi.text.Handle;


import liqiqi.text.comment;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Controller
public class handle7 {
    @RequestMapping("/handle7")
    public String cc(HttpServletRequest request) throws IOException, ClassNotFoundException {
        String path=request.getParameter("b");
      String  path1="D:/新建文件夹 (2)/text/src/main/webapp"+path+".dat";

        ObjectOutputStream out=null;
      File file=new File(path1);
        ArrayList<comment>  arrayList=new ArrayList<comment>();
      if(!file.exists())
      {
          System.out.println("123");
          FileOutputStream outputStream= new FileOutputStream(file);
          out= new ObjectOutputStream(outputStream);
          comment c=new comment();
          c.setComments(request.getParameter("a"));
          c.setName((String) request.getSession().getAttribute("name"));
          c.setDate(new Date());
          arrayList.add(c);
          out.writeObject(arrayList);
          out.close();
      }
          else
      {
          System.out.println("111");
          ObjectInputStream in=new ObjectInputStream(new FileInputStream(file));
         arrayList= (ArrayList<comment>) in.readObject();
          out= new ObjectOutputStream(new FileOutputStream(file));
          comment c=new comment();
          c.setComments(request.getParameter("a"));
          c.setName((String) request.getSession().getAttribute("name"));
          c.setDate(new Date());
          arrayList.add(c);
          out.writeObject(arrayList);
          out.close();
          in.close();

      }
        return  "redirect:"+path+".jsp";
    }

}

package liqiqi.text.Handle;

import liqiqi.text.load;
import liqiqi.text.title;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
@Controller
public class handle5 {
   @RequestMapping("/handle5")
    public String cc(HttpServletRequest request) throws IOException {
      String name = (String) request.getSession().getAttribute("name");
       String index = (String) request.getParameter("index");
      String from=request.getParameter("from");
      System.out.println(name+" "+from+" "+index);
       InputStream in=null;
       in= Resources.getResourceAsStream("mapping/config1.xml");
       SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(in);
       SqlSession sqlSession=sqlSessionFactory.openSession();
       HashMap<String,String> hashMap=new HashMap<>();
       hashMap.put("a1",name+from);
       hashMap.put("a2",index);
       HashMap<String,String> k=new HashMap<>();
       k.put("a1",name+from);
       k.put("a2",index);
      title t=sqlSession.selectOne("test.selectid",k);
      String path=t.getPicture();
      File file=new File(path);
      if(file.exists())
      {
          file.delete();

      }
       sqlSession.delete("test.delete1",hashMap);
       sqlSession.update("test.up1",name+"0"+from+index);
       sqlSession.commit();


             return  "/WEB-INF/jsp/name.jsp";
   }
}

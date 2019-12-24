package liqiqi.text.Handle;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class handle2 {
@RequestMapping("/handle2")
    public String cc(HttpServletRequest requset) throws IOException {
    int i=1;
    String a1=null;
    String a2=null;
    String a3=null;
    String a5=null;
    String b=null;
    a1=requset.getParameter("a1");
    a2=requset.getParameter("a2");
    a3=requset.getParameter("a3");
    a5=requset.getParameter("a5");
    b=(String)requset.getSession().getAttribute("name");
    String  s=a1+"  ---发布者:"+b;
    MultipartHttpServletRequest multipartHttpServletRequest =( MultipartHttpServletRequest)requset;
    List<MultipartFile> list=multipartHttpServletRequest.getFiles("a4");
    for(MultipartFile multipartFile:list)
    {
        String filename=multipartFile.getOriginalFilename();
        InputStream inputStream=multipartFile.getInputStream();
        String path="D:/新建文件夹 (2)/text/src/main/webapp/"+b+"/2/"+i+".jpg";
        File file=new File("D:/新建文件夹 (2)/text/src/main/webapp/"+b+"/2");
        if(!file.exists())
            file.mkdir();
        file=new File(path);
        while(file.exists())
        {
            i++;
            path="D:/新建文件夹 (2)/text/src/main/webapp/"+b+"/2/"+i+".jpg";
            file=new File(path);
        }
        OutputStream outputStream=new FileOutputStream(file);
        byte[] bs=new byte[10000000];
        int res=0;
        while((res=inputStream.read(bs))!=-1)
        {
            outputStream.write(bs,0,res);
        }
        inputStream.close();
        outputStream.close();
        String name= (String) requset.getSession().getAttribute("name");
        InputStream in=null;
        in= Resources.getResourceAsStream("mapping/config1.xml");
        SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession=sqlSessionFactory.openSession();
        Map<String,String> m=new HashMap<>();
        m.put("a0",name+"2");
        m.put("a1",b);
        m.put("a2",a1);
        m.put("a3",a2);
        m.put("a4",a3);
        m.put("a5",a5);
        m.put("a6",path);
        m.put("a7",i+"");
        sqlSession.insert("test.ii",m);
        sqlSession.update("test.pp",name+"02"+i);
        sqlSession.commit();

    }

    return "redirect:/hello4";
    }
}

package liqiqi.text.Handle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;

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
    b=requset.getParameter("b");
    String  s=a1+"   ---发布者:"+b;
    MultipartHttpServletRequest multipartHttpServletRequest =( MultipartHttpServletRequest)requset;
    List<MultipartFile> list=multipartHttpServletRequest.getFiles("a4");
    for(MultipartFile multipartFile:list)
    {
        String filename=multipartFile.getOriginalFilename();
        InputStream inputStream=multipartFile.getInputStream();
        String path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+b+"/2/"+i+".jpg";
        File file=new File("D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+b+"/2");
        if(!file.exists())
            file.mkdir();
        file=new File(path);
        while(file.exists())
        {
            i++;
            path="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+b+"/2/"+i+".jpg";
            file=new File(path);
        }
        OutputStream outputStream=new FileOutputStream(file);
        byte[] bs=new byte[10000];
        int res=0;
        while((res=inputStream.read(bs))!=-1)
        {
            outputStream.write(bs,0,res);
        }
        String path1="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+b+"/2/"+i+".txt";
        file=new File(path1);
        outputStream=new FileOutputStream(file);
        outputStream.write(s.getBytes());
        String f=i+".jpg";
        String  h="<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Title</title>\n" +
                "</head>\n <style type=\"text/css\">\n" +
                ".a1{width: 200px;height: 200px;background: url("+i+".jpg) no-repeat center center;}\n" +
                "</style>" +
                "<body>\n";
        h+="<div><a href='"+f+"'/><div class='a1'></div></a></div>\n";
        h+="<div>发布人:<a href='/hello7?ID="+b+"'>"+b+"</a></div>\n";
        h+="<div>丢失物品"+a1+"</div>\n";
        h+="<div>丢失所在地点"+a2+"</div>\n";
        h+="<div>丢失日期"+a3+"</div>\n";
        h+="<div>其他描述"+a5+"</div>\n" +
                "</body>\n" +
                "</html>";

        String path2="D:/新建文件夹 (2)/text/src/main/resources/static/sc/"+b+"/2/"+i+".html";
        file=new File(path2);
        outputStream=new FileOutputStream(file);
        outputStream.write(h.getBytes());
        outputStream.flush();
        outputStream.close();
        inputStream.close();
    }
    return "redirect:/hello4";
    }
}

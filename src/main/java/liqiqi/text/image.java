package liqiqi.text;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;
@ServletComponentScan
@WebServlet("urlPatterns = /image")
public class image extends HttpServlet {
    int i=0;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.reset();
        response.setContentType("image/jpeg");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader("Expires", 0);
        int width=60,height=20;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        java.awt.Graphics g=image.getGraphics();
        g.setColor(getRandColor(200,500));
        g.fillRect(0, 0, width, height);
        Random random=new Random();
        g.setColor(getRandColor(160,200));
        for(int i=0;i<155;i++)
        {
            int x=random.nextInt(width);
            int y=random.nextInt(height);
            int x1=random.nextInt(width);
            int y1=random.nextInt(height);
            g.drawLine(x,y, x1+x, y+y1);
        }
        g.setFont(new Font("Times New Roman",Font.PLAIN,18));
        String srand="";
        for(int i=0;i<4;i++)
        {
            String rand=String.valueOf(random.nextInt(10));
            srand+=rand;
            g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
            g.drawString(rand, 13*i+6, 16);
        }
        request.getSession().setAttribute("key", srand);
        g.dispose();
        OutputStream a=response.getOutputStream();
        ImageIO.write(image,"JPEG", a);
        request.getSession().setAttribute("image",srand);
        a.close();

    }
    private Color getRandColor(int fc,int bc)
    {
        Random random=new Random();
        if(fc>255)
            fc=255;
        if(bc>255)
            bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);


        return new Color(r,g,b);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         doPost(request,response);
    }
}

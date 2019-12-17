package liqiqi.text;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
public class register {
    @RequestMapping("/register")
    public String cc(HttpServletRequest requset) throws IOException {
        InputStream inputStream=null;
        inputStream = Resources.getResourceAsStream("mapping/config.xml");
        SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(inputStream );
        SqlSession session=factory.openSession();
        List<user> list=session.selectList("testa.selectall");
        String a1=requset.getParameter("a1");
        String a2=requset.getParameter("a2");
        for(user u:list)
        {
            if(u.getUsername().equals(a1))
                return  "sc/7.html";
        }
            user u=new user();
            u.setPassword(a2);
            u.setUsername(a1);
            session.insert("testa.insert",u);
            session.commit();
            return "sc/1.jsp";

    }

}

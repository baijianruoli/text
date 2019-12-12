package liqiqi.text;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//新增加一个类用来添加虚拟路径映射



@Configuration

public class MyPicConfig implements WebMvcConfigurer {

    @Override

    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("sc/123/**").addResourceLocations("file:D:/新建文件夹 (2)/text/src/main/resources/static/sc/123/");
        registry.addResourceHandler("sc/liqiqi/**").addResourceLocations("file:D:/新建文件夹 (2)/text/src/main/resources/static/sc/liqiqi/");
        registry.addResourceHandler("sc/linux/**").addResourceLocations("file:D:/新建文件夹 (2)/text/src/main/resources/static/sc/linux/");

    }

}



package liqiqi.text;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
@ServletComponentScan(basePackages = "text")
@SpringBootApplication
public class TextApplication {

    public static void main(String[] args) {

        SpringApplication.run(TextApplication.class, args);
    }

}

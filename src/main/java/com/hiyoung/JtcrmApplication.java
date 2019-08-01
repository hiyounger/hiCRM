package com.hiyoung;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan("com.hiyoung.*.*.dao")
//@ComponentScan({"com.hiyoung.realm","com.hiyoung.config","com.hiyoung.system"})
public class JtcrmApplication {
    public static void main(String[] args) {
        SpringApplication.run(JtcrmApplication.class, args);
    }

}

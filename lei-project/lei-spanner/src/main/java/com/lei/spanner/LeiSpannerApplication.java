package com.lei.spanner;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@ServletComponentScan
@MapperScan("com.lei.spanner.mapper")
@EnableTransactionManagement
@SpringBootApplication
public class LeiSpannerApplication {

    public static void main(String[] args) {
        SpringApplication.run(LeiSpannerApplication.class, args);
    }

}

package com.pj;

import cn.dev33.satoken.SaManager;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SaTokenThymeleafDemoApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(SaTokenThymeleafDemoApplication.class, args); 
		System.out.println("\n启动成功：sa-token配置如下：" + SaManager.getConfig());
	}
	
}
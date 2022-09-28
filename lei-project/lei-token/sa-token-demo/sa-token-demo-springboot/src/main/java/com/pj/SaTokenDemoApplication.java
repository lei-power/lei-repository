package com.pj;

import cn.dev33.satoken.SaManager;
import cn.dev33.satoken.config.SaTokenConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Sa-Token整合SpringBoot 示例 
 * @author kong
 *
 */
@SpringBootApplication
public class SaTokenDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SaTokenDemoApplication.class, args);
		SaTokenConfig config = SaManager.getConfig();
		String confingStr = config.toString();

		System.out.println("\n启动成功：Sa-Token配置如下：\r\n" + confingStr.replace(",",",\r\n"));
	}
	
}

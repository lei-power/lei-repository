package com.lei.spanner.config;

import com.lei.spanner.config.SwaggerUtils.groupName;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Created by shuxi.zhang on 2017/12/13.
 */
@Configuration
@EnableSwagger2 // 启用 Swagger
public class SwaggerConfig {

    @Bean(SwaggerUtils.groupName.spanner)
    public Docket Api() {
        return SwaggerUtils.getDocket(groupName.spanner,"com.lei.spanner.controller","LeiGe的工具箱");
    }


}

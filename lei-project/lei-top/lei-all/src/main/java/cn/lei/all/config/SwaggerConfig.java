package cn.lei.all.config;

import cn.lei.core.util.TextUtils;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Created by shuxi.zhang on 2017/12/13.
 */
@Configuration
@EnableSwagger2 // 启用 Swagger
public class SwaggerConfig {

    @Bean(name = "lei-all")
    public Docket Api() {
        //设置消息头显示字段
        ParameterBuilder tokenPar = new ParameterBuilder();
        List<Parameter> pars = new ArrayList<Parameter>();
        String title = "";
        if (TextUtils.isEmpty(title)) {
            title = "内部系统";
        }
        ApiInfo apiInfo = new ApiInfoBuilder().title(title)//大标题
                                              .version("1.0")//版本
                                              .build();

        return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo).useDefaultResponseMessages(false).select().build().globalOperationParameters(pars);
    }


}

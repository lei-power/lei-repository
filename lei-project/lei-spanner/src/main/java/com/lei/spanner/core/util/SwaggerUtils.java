package com.lei.spanner.core.util;

import java.util.ArrayList;
import java.util.List;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

public class SwaggerUtils {

    public static class groupName{
        public static final String co = "coApi";
        public static final String admin = "adminApi";
        public static final String oper = "operApi";
        public static final String consume = "consumeApi";
        public static final String face = "faceApi";
        public static final String gov = "govApi";
        public static final String spanner = "spannerApi";
    }

    /**
     *
     * @param groupName :群组名称，固定取值，请使用SwaggerUtils.groupName中的值来赋值：
     *                  例如：企业端群组为SwaggerUtils.groupName.co,
     *                       消费者端群组为SwaggerUtils.groupName.consume;
     * @param scanPackage:扫描包路径
     * @param title：系统名称，例如：企业端用户系统
     * @return
     */
    public static Docket getDocket(String groupName,String scanPackage,String title){
        //设置消息头显示字段
        ParameterBuilder tokenPar = new ParameterBuilder();
        List<Parameter> pars = new ArrayList<Parameter>();
         if(TextUtils.isEmpty(title)){
            title = "内部系统";
        }
        ApiInfo apiInfo = new ApiInfoBuilder()
                .title(title)//大标题
                .version("1.0")//版本
                .build();

        return new Docket(DocumentationType.SWAGGER_2)
                .groupName(groupName)
                .apiInfo(apiInfo)
                .useDefaultResponseMessages(false)
                .select()
                //.apis(predicate)
                .apis(RequestHandlerSelectors.basePackage(scanPackage))
                .build()
                .globalOperationParameters(pars);
    }


}

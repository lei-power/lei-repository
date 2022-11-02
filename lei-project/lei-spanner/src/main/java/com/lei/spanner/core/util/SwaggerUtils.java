package com.lei.spanner.core.util;

import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.spring.web.plugins.Docket;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;

import java.util.ArrayList;
import java.util.List;

public class SwaggerUtils {

    public static class groupName{
        public static final String co = "coApi";
        public static final String admin = "adminApi";
        public static final String oper = "operApi";
        public static final String consume = "consumeApi";
        public static final String face = "faceApi";
        public static final String gov = "govApi";
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
        tokenPar.name("accessToken").description("用户访问安全令牌，需要登录才能访问的接口必须传该参数").modelRef(new ModelRef("string")).parameterType("header").required(false).build();
        pars.add(tokenPar.build());
        pars.add(new ParameterBuilder().name("clientType").description("客户端类型;1-web，2-app").modelRef(new ModelRef("String")).parameterType("header").required(false).build());
        pars.add(new ParameterBuilder().name("requestId").description("传一个随机UUID，用于日志追踪").modelRef(new ModelRef("String")).parameterType("header").required(false).build());
        pars.add(new ParameterBuilder().name("platformType").description("平台登陆类型：1：大数据平台，2：中台").modelRef(new ModelRef("String")).parameterType("header").required(false).build());

        pars.add(new ParameterBuilder().name("Authorization").description("token校验（农机相关）：bearer+空格+accessToken").modelRef(new ModelRef("String")).parameterType("header").required(false).build());
        pars.add(new ParameterBuilder().name("companyId").description("租户id").modelRef(new ModelRef("String")).parameterType("header").required(false).build());
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

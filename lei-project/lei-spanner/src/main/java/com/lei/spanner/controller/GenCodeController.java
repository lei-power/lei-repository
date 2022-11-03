package com.lei.spanner.controller;

import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.entity.req.GenCodeSnkoudaiReq;
import com.lei.spanner.service.GenCodeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/***
 *@author wanglei
 *@Date 2022/11/2 17:17
 ***/

@RequestMapping(value = "/genCode")
@Slf4j
@Api(value = "/genCode", description = "代码生成模块")
@RestController
public class GenCodeController {

    @Autowired
    private GenCodeService genCodeService;


    @PostMapping("/snkd/excel")
    @ApiOperation(value = "神农口袋风格代码生成 excel导入", httpMethod = "POST", notes = "用于：神农口袋项目")
    public BaseResp snkdGenByExcel(@RequestBody MultipartFile reqModel) {
            return genCodeService.snkdGenByExcel(reqModel);
    }

    @PostMapping("/snkd/json")
    @ApiOperation(value = "神农口袋风格代码生成 json入参", httpMethod = "POST", notes = "用于：神农口袋项目")
    public BaseResp snkdGenByJson(@RequestBody List<GenCodeSnkoudaiReq> reqModel) {
        return genCodeService.snkdGenByJson(reqModel);
    }

    @PostMapping("/spanner/json")
    @ApiOperation(value = "lei-spanner代码生成 json入参", httpMethod = "POST", notes = "用于：spanner项目")
    public BaseResp spannerGenByJson(@RequestBody List<GenCodeSnkoudaiReq> reqModel) {
        return genCodeService.spannerGenByJson(reqModel);
    }


    @PostMapping("/spanner/excel")
    @ApiOperation(value = "lei-spanner代码生成 excel导入", httpMethod = "POST", notes = "用于：spanner项目")
    public BaseResp spannerGenByExcel(@RequestBody MultipartFile reqModel) {
        return genCodeService.spannerGenByExcel(reqModel);
    }

}

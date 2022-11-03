package com.lei.spanner.controller;


import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.service.GenAreaLocalService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RequestMapping(value = "/genAreaLocal")
@Slf4j
@Api(value = "/genAreaLocal", description = "gis数据发布流程-镇村数据处理")
@RestController
public class GenAreaLocalController {

    @Autowired
    private GenAreaLocalService genAreaLocalService;

    @PostMapping("/matchOfArea")
    @ApiOperation(value = "手动镇村数据处理接口,上传\"权属单位代码表.xls\"", httpMethod = "POST", notes = "用于：gis数据发布流程-镇村数据处理-手动匹配镇村接口")
    public BaseResp matchingAreaLocal(@RequestBody MultipartFile excel) {
        return genAreaLocalService.matchingAreaLocal(excel);
    }



    @PostMapping("/gisFieldsAdd")
    @ApiOperation(value = "gis数据处理时，需要新增字段 type:0-确权，1-三调，2-高标准，3-轮廓", httpMethod = "POST", notes = "用于：gis数据发布流程-新增字段")
    public String gisFieldsAdd(@RequestParam("tableName") String tableName, @RequestParam("type") Integer type) {
        return genAreaLocalService.gisFieldsAdd(tableName, type);
    }


    @PostMapping("/getQueQuanUpdateSql")
    @ApiOperation(value = "获取确权数据需要更新的数据.sql文件接口,上传\"地块编码表.xlsx\"", httpMethod = "POST", notes = "用于：gis数据发布流程_获取确权数据需要更新的数据")
    public BaseResp getQueQuanUpdateSql(@RequestBody MultipartFile excel,@RequestParam("tableName") String tableName) {
        return genAreaLocalService.getQueQuanUpdateSql(excel,tableName);
    }

}



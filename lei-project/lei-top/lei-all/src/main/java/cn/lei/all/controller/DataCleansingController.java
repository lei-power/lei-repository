package cn.lei.all.controller;

import cn.lei.all.entity.BaseResp;
import cn.lei.all.entity.req.DataCleansingAgriproduceLandReq;
import cn.lei.all.service.DataCleansingService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/***
 *@author wanglei
 *@Date 2022/12/28 15:08
 ***/

@RequestMapping(value = "/dataCleansing")
@Slf4j
@Api(value = "/dataCleansing", description = "数据清洗工具")
@RestController
public class DataCleansingController {

    @Autowired
    private DataCleansingService dataCleansingService;

    /**
     * 数据清洗，已废弃，不是很好用，连接正式服不稳定
     * @param reqModel
     * @return
     */
    @Deprecated
    @PostMapping("/cleaningAgriproduceLand")
    @ApiOperation(value = "清洗正式服中已经同步到神农口袋的农业生产用地")
    public BaseResp cleaningAgriproduceLand(@RequestBody DataCleansingAgriproduceLandReq reqModel) {
        return dataCleansingService.cleaningAgriproduceLand(reqModel);
    }


}

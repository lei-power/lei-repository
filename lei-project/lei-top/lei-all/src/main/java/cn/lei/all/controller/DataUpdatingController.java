package cn.lei.all.controller;

import cn.lei.all.entity.BaseResp;
import cn.lei.all.service.DataUpdatingService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/***
 *@author wanglei
 *@Date 2023/02/07 15:08
 ***/

@RequestMapping(value = "/dataUpdating")
@Slf4j
@Api(value = "/dataUpdating", description = "数据更新工具")
@RestController
public class DataUpdatingController {

    @Autowired
    private DataUpdatingService dataUpdatingService;

    /**
     * 数据更新——农安监管大屏（合格证打印及扫码、监管记录）
     * 数据更新——农安监管大屏——合格证打印
     * @param reqModel
     * @return
     */
    @Deprecated
    @PostMapping("/updateJianguanPrint")
    @ApiOperation(value = "数据更新——农安监管大屏——合格证打印")
    public BaseResp updateJianguanPrint(@RequestBody MultipartFile excel) {
        return dataUpdatingService.updateJianguanPrint(excel);
    }


}

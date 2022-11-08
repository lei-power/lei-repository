//package cn.lei.all.controller;
//
//import com.lei.spanner.service.GisDataProcessService;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
///***
// *@author wanglei
// *@Date 2022/11/2 17:17
// ***/
//
//@RequestMapping(value = "/gisDataProcess")
//@Slf4j
//@Api(value = "/gisDataProcess", description = "gis相关数据处理")
//@RestController
//public class GisDataProcessContrller {
//
//    @Autowired
//    private GisDataProcessService gisDataProcessService;
//
//
//    @PostMapping("/showTableName")
//    @ApiOperation(value = "获取sde数据的所有业务表名  type:1-确权，2-三调，3-高标准，4-轮廓  0-查全部", httpMethod = "POST", notes = "用于：gis相关数据处理")
//    public String showTableName(@RequestParam("type") Integer type) {
//        return gisDataProcessService.showTableName(type);
//    }
//}

package com.lei.spanner.entity.req;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/***
 *@author wanglei
 *@Date 2022/11/2 17:23
 ***/

@Data
@ApiModel
public class GenCodeSnkoudaiReq {
    @ApiModelProperty(value = "表名")
    private String tableName;
    @ApiModelProperty(value = "文件名")
    private String fileName;
    @ApiModelProperty(value = "包名")
    private String packageName;

}
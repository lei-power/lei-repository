package cn.lei.all.entity.req;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/***
 *@author wanglei
 *@Date 2022/12/28 15:15
 ***/

@Data
@ApiModel
public class DataCleansingAgriproduceLandReq {
    @ApiModelProperty(value = "清洗的服务器 100-prod 101-test 102-testb 103-testc")
    private Integer flag;

}

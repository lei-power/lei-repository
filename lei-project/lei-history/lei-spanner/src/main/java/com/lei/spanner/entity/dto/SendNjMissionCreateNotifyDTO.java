package com.lei.spanner.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * Created by z.j on 2022/8/24.
 */
@Data
public class SendNjMissionCreateNotifyDTO {

    @ApiModelProperty("下单农业主体名称")
    private String farm;

    @ApiModelProperty("作业类型+作物种类")
    private String work;

    @ApiModelProperty("任务地块的面积")
    private String area;

    @ApiModelProperty("订单联系方式")
    private String phone;

    @ApiModelProperty("农业主体的地址")
    private String address;

}

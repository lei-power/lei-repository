package com.lei.spanner.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * Created by z.j on 2022/8/24.
 */
@Data
public class SendNjMissionBatchCreateNotifyDTO {

    @ApiModelProperty("作业类型+作物种类")
    private String work;

    @ApiModelProperty("任务地块的面积")
    private String area;

}

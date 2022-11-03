package com.lei.spanner.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import lombok.Data;

@Data
public class SendSmsRespDTO implements Serializable {

    @ApiModelProperty("短信发送状态：false：失败；true：成功")
    private Boolean msgSendFlag;

    @ApiModelProperty("code")
    private String code;

    @ApiModelProperty("失败原因")
    private String message;


}
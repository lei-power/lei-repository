package cn.lei.all.entity.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel
public class SendSmsByAgriResApplyDto {

    @ApiModelProperty("农资名称")
    private String agriResName;
    @ApiModelProperty("生产厂商")
    private String productor;
    @ApiModelProperty(value = "手机号", required = true)
    private String phone;
    @ApiModelProperty(value = "签名类型：0-神农口袋，1-口袋宅配,2-农业ERP", required = true)
    private Integer signNameType = 0;

}
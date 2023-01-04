package com.lei.spanner.entity.dto;


import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.util.TextUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel
public class SendSmsByAddUserDTO {

    @ApiModelProperty(value = "手机号", required = true)
    private String phone;
    @ApiModelProperty(value = "运营商产品名称", required = true)
    private String produceName;
    @ApiModelProperty(value = "企业名称", required = true)
    private String companyName;
    @ApiModelProperty(value = "是否官方运营商", required = true)
    private boolean defaultOperateFlag = true;
    @ApiModelProperty(value = "签名类型：0-神农口袋，1-口袋宅配,2-农业ERP", required = true)
    private int signNameType = 0;
    @ApiModelProperty(value = "运营商id", required = true)
    private Long operateSubjectId;


    public BaseResp checkParam() {
        if (TextUtils.isEmpty(phone)) {
            return BaseResp.failByParamError();
        }
        if (TextUtils.isEmpty(this.companyName)) {
            return BaseResp.failByParamError();
        }
        return BaseResp.success();
    }
}

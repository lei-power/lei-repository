package com.lei.spanner.entity.dto;


import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.util.TextUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel
public class SendSmsVcodeByValidateDTO {

    @ApiModelProperty(value = "手机号value", required = true)
    private String phone;
    @ApiModelProperty(value = "验证码类型：1注册登录，2更换手机号，3等等，暂时只用1", required = true)
    private Integer type;

    @ApiModelProperty(value = "短信验证码签名类型：0-神农口袋，1-口袋宅配，2-农场erp,不传值默认取0", required = true)
    private Integer signNameType = 0;


    @ApiModelProperty(value = "验证码唯一标示，获取验证码接口会下发该字段", required = true)
    private String codeId;
    @ApiModelProperty(value = "用户输入的验证码值", required = true)
    private String value;

    public BaseResp checkParam() {
        if (TextUtils.isEmpty(phone)) {
            return BaseResp.failByParamError();
        }
        if (!TextUtils.isPhoneNo(this.phone)) {
            return BaseResp.failByParamError();
        }
        if (this.type == null || this.type <= 0) {
            return BaseResp.failByParamError();
        }

        if (TextUtils.isEmpty(this.codeId)) {
            return BaseResp.failByParamError();
        }
        if (TextUtils.isEmpty(this.value)) {
            return BaseResp.failByParamError();
        }
        return BaseResp.success();
    }
}

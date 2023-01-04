package com.lei.spanner.entity.dto;

import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.util.TextUtils;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import lombok.Data;

/**
 * @author ： coder.Yang
 * @date ： 2022/8/4 19:24
 * @description ：
 */
@Data
public class CheckValidateCodeDTO implements Serializable {

    private static final long serialVersionUID = 5519103848542728183L;
    @ApiModelProperty(value = "验证码唯一标示，获取验证码接口会下发该字段", required = true)
    private String codeId;
    @ApiModelProperty(value = "用户输入的验证码值", required = true)
    private String value;

    public BaseResp checkParam() {
        if (TextUtils.isEmpty(this.codeId)) {
            return BaseResp.failByParamError();
        }
        if (TextUtils.isEmpty(this.value)) {
            return BaseResp.failByParamError();
        }

        return BaseResp.success();
    }
}

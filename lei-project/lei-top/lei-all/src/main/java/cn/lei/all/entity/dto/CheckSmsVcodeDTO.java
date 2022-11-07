package cn.lei.all.entity.dto;


import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.util.TextUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value = "CheckSmsVcodeReq")
public class CheckSmsVcodeDTO {

    @ApiModelProperty(value="手机号",required = true)
    private String phone;
    @ApiModelProperty(value="短信验证码",required = true)
    private String vcode;
    @ApiModelProperty(value="验证码类型：1注册登录，2更换手机，3等等",required = true)
    private Integer type;
    @ApiModelProperty(value="是否要改变短信验证码记录状态。true，则改变验证码状态，false不改变。客户端调用，默认使用false",required = true)
    private Boolean changeStatusFlag;

    public BaseResp checkParam(){
        if(TextUtils.isEmpty(phone)){
            return BaseResp.failByParamError();
        }
        if(TextUtils.isEmpty(this.vcode)){
            return BaseResp.failByParamError();
        }
        if(this.type==null || this.type<=0){
            return BaseResp.failByParamError();
        }
        if(changeStatusFlag==null){
            return BaseResp.failByParamError();
        }
        return BaseResp.success();
    }
}

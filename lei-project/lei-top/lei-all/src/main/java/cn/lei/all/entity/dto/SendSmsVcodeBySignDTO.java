package cn.lei.all.entity.dto;


import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.util.TextUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel
public class SendSmsVcodeBySignDTO {

    @ApiModelProperty(value="手机号value",required = true)
    private String phone;
    @ApiModelProperty(value="验证码类型：1注册登录，2更换手机号，3等等，暂时只用1",required = true)
    private Integer type;

    @ApiModelProperty(value="短信验证码签名类型：0-神农口袋，1-口袋宅配，2-农场erp,不传值默认取0",required = true)
    private Integer signNameType=0;

    @ApiModelProperty(value = "当前时间戳，例如：1601788940549，服务端校验该时间处于5分钟内有效", required = true)
    private Long  timestamp;

    @ApiModelProperty(value = "签名", required = true)
    private String sign;

    public BaseResp checkParam(){
        if(TextUtils.isEmpty(phone)){
            return BaseResp.failByParamError();
        }
        if(!TextUtils.isPhoneNo(this.phone)){
            return BaseResp.failByParamError();
        }
        if(this.type==null || this.type<=0){
            return BaseResp.failByParamError();
        }
        if(this.timestamp==null || this.timestamp<=0){
            return BaseResp.failByParamError();
        }

        if (TextUtils.isEmpty(this.sign)) {
            return BaseResp.failByParamError();
        }
        return BaseResp.success();
    }
}

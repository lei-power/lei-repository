package cn.lei.all.entity.dto;


import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.util.TextUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import lombok.Data;

@ApiModel
@Data
public class SendSmsByCropAddNotify implements Serializable {

    @ApiModelProperty(value = "手机号", required = true)
    private String phone;

    @ApiModelProperty(value = "作物名称", required = true)
    private String cropName;

    @ApiModelProperty(value = "签名类型：0-神农口袋，1-口袋宅配,2-农业ERP", required = true)
    private int signNameType = 0;
    @ApiModelProperty(value = "运营商id", required = true)
    private Long operateSubjectId;


    public BaseResp checkParam() {
        if (TextUtils.isEmpty(phone)) {
            return BaseResp.failByParamError();
        }
        if (TextUtils.isEmpty(this.cropName)) {
            return BaseResp.failByParamError();
        }

        return BaseResp.success();
    }
}

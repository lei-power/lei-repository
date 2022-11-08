package cn.lei.all.entity;


import cn.lei.core.cons.RespCons;
import cn.lei.core.util.TextUtils;
import com.alibaba.fastjson.annotation.JSONField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@ApiModel
public class BaseResp<T> {

    @ApiModelProperty(value="返回编码，0表示成功，其他取值表示失败，失败原因参见respDesc字段",required = true)
    private int respCode;
    @ApiModelProperty(value="返回描述",required = true)
    private String respDesc;
    @ApiModelProperty(value="当前服务器时间",required = true)
    private Date curDate;

    private T obj;


    @JSONField(serialize=false)
    public boolean isSuccess(){
        return this.respCode == RespCons.GLOBAL_SUCCESS;
    }

    public boolean isFailed(){
        return !isSuccess();
    }


    //用户编码不等于0时，返回错误状态
    public BaseResp(BaseResp resp) {
        this.respCode = resp.getRespCode();
        this.respDesc = resp.getRespDesc();
        this.curDate = new Date();
    }


    public BaseResp() {
        this.respCode = RespCons.GLOBAL_SUCCESS;
        this.respDesc = RespCons.respMap.get(respCode);
        this.curDate = new Date();
    }

    public BaseResp(int respCode) {
        this.respCode = respCode;
        this.curDate = new Date();
        this.respDesc = RespCons.respMap.get(respCode);
    }

    public BaseResp(int respCode, String respDesc) {
        super();
        this.respCode = respCode;
        this.respDesc = respDesc;
        this.curDate = new Date();
    }

    public BaseResp(T obj) {
        this();
        this.obj=obj;
        this.curDate = new Date();
    }

    public BaseResp(int respCode, T obj) {
        this(respCode);
        this.obj=obj;
        this.curDate = new Date();
    }

    public BaseResp(int respCode, String respDesc, T obj) {
        this(respCode,respDesc);
        this.obj=obj;
        this.curDate = new Date();
    }


    //////


    //用户编码不等于0时，返回错误状态
    public static BaseResp returnResp(BaseResp resp){
        BaseResp returnResp = new BaseResp<>();
        returnResp.setRespCode(resp.getRespCode());
        returnResp.setRespDesc(resp.getRespDesc());
        returnResp.setCurDate(new Date());
        return returnResp;
    }


    /**
     * 指定编码的自定义错误
     * @param respCode
     * @return
     */
    public static BaseResp fail(int respCode){
        BaseResp returnResp = new BaseResp<>();
        returnResp.setRespCode(respCode);
        returnResp.setRespDesc(RespCons.respMap.get(respCode));
        return returnResp;
    }

    public static BaseResp fail(int respCode, String respDesc){
        BaseResp returnResp = new BaseResp<>();
        returnResp.setRespCode(respCode);
        returnResp.setRespDesc(respDesc);
        return returnResp;
    }



    /**
     * 获取参数错误的resp
     * @param respDesc：错误提示
     * @return
     */
    public static BaseResp failByParamError(String respDesc){
        if(TextUtils.isEmpty(respDesc)){
            return BaseResp.fail(RespCons.GlOBAL_PARAMS_ERROR);
        }else{
            return BaseResp.fail(RespCons.GlOBAL_PARAMS_ERROR,respDesc);
        }
    }

    /**
     * 获取参数错误的resp
     * @return
     */
    public static BaseResp failByParamError(){
        return BaseResp.fail(RespCons.GlOBAL_PARAMS_ERROR);
    }


    /**
     * 服务离线错误
     * @return
     */
    public static BaseResp failByServerOffLine(){
        return BaseResp.fail(RespCons.GLOBAL_SERVER_OFFLINE);
    }

    /**
     * 这个编码用户companyId，farmId等错误，导致用户无数据访问权限
     * @return
     */
    public static BaseResp failByNoAccessAuth(){
        return BaseResp.fail(RespCons.GLOBAL_NO_ACCESS_AUTH);
    }


    /**
     *获取正确编码的resp
     */
    public static BaseResp success(){
        BaseResp returnResp = new BaseResp<>();
        returnResp.setRespCode(RespCons.GLOBAL_SUCCESS);
        returnResp.setRespDesc(RespCons.respMap.get(RespCons.GLOBAL_SUCCESS));
        return returnResp;
    }

    /**
     *获取正确编码的resp
     */
    public static <T> BaseResp<T> success(T obj){
        BaseResp<T> returnResp = new BaseResp<>();
        returnResp.setRespCode(RespCons.GLOBAL_SUCCESS);
        returnResp.setRespDesc(RespCons.respMap.get(RespCons.GLOBAL_SUCCESS));
        returnResp.setObj(obj);
        return returnResp;
    }

    /**
     *获取正确编码的resp
     */
    public static <T> BaseResp<T> success(String respDesc, T obj){
        BaseResp<T> returnResp = new BaseResp<>();
        returnResp.setRespCode(RespCons.GLOBAL_SUCCESS);
        returnResp.setRespDesc(respDesc);
        returnResp.setObj(obj);
        return returnResp;
    }


}

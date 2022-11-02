package com.lei.spanner.core.base.constants;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Ivan Lee .
 */
public class RespCons {


    public static Map<Integer, String> respMap = new HashMap<>();


    public static final int GLOBAL_SUCCESS = 0;

    public static final int GlOBAL_PARAMS_ERROR = 300;

    public static final int GlOBAL_ACCESSTOKEN_ERROR = 400;

    public static final int GLOBAL_GOV_PLATFORM_ERROR = 401;

    public static final int GLOBAL_GOV_PLATFORM_OVERTIME_ERROR = 402;

    /**
     * 这个编码用户companyId，farmId等错误，导致用户无数据访问权限
     */
    public static final int GLOBAL_NO_ACCESS_AUTH = 404;

    public static final int GLOBAL_OTHER_ERROR = 500;

    public static final int GLOBAL_SERVER_OFFLINE = 600;


    /**
     * 溯源码模块
     * 30001溯源码失效
     */
    public static final int QRCODE_INVALID = 30001; // 溯源码失效
    public static final int BARCODE_NOT_EXIST = 40001; // 溯源码不存在


    //10000-10099短信验证码预留
    public static final int SMS_VCODE_INCORRECT = 10001;//无效验证码
    public static final int SMS_VCODE_IN_SEND_GAP = 10002;//验证码发送间隔内，请稍后再试
    public static final int SMS_VCODE_SEND_FAIL = 10003;//验证码发送失败
    public static final int SMS_VCODE_IS_EXPIRE = 10004;//验证码已失效
    public static final int SMS_SEND_FAIL = 10005;//短信发送失败


    //10100-10199用户模块预留
    public static final int DELIVERY_PLAN_ORDER_NO = 20001;//下单已截止
    public static final int CUSTOMERPACKAGE_CANNUMBER_NO = 20002;//剩余次数为0
    public static final int CUSTOMERPACKAGE_EXPIRE = 20003;//套餐过期
    public static final int DELIVERY_PLAN_GOODS_NO = 20004;//菜品不足
    public static final int DELIVERY_PLAN_STARTTIME_NO = 20005;//未到开始时间，不允许下单
    public static final int DELIVERY_PLAN_GOODSNUM_PASS = 20006;//下单菜品超过设定\
    public static final int GOODS_NO_EXIST = 20007;//农产品删除后不存在


    // 10200-10210 图片验证码预留
    public static final int VCODE_EXPIRED = 10200;//图片验证码已失效

    // 10300-10350 保单补录
    public static final int  INSURANCE_PARAM_ERROR = 10300;//保单补录参数异常
    public static final int  INSURANCE_LAND_EXIT_ERROR = 10301;//保单补录-地块已投保
    public static final int  INSURANCE_OPERATION_ERROR = 10302;//保单补录-操作失败
    public static final int  INSURANCE_NOT_EXIT_ERROR = 10303;//保单补录-保单不存在
    public static final int  INSURANCE_FARM_NOT_EXIT_ERROR = 10304;//保单补录-经营主体不存在
    public static final int  INSURANCE_LAND_NOT_EXIT_ERROR = 10305;//保单补录-地块不存在
    public static final int  INSURANCE_SURRENDER_EXIT_ERROR = 10307;//保单补录-保单已退保
    public static final int  INSURANCE_LAND_STATUS_ERROR = 10308;//保单补录-地块已下架
    public static final int  INSURANCE_UPDATE_STATUS_ERROR = 10309;//保单补录-退保状态不允许编辑
    public static final int  INSURANCE_DEL_STATUS_ERROR = 10310;//保单补录-退保状态不允许编辑
    public static final int  INSURANCE_ADD_STATUS_ERROR = 10311;//保单补录-退保状态不允许编辑
    public static final int  INSURANCE_LAND_STATUS_EXIT_ERROR = 10312;//保单补录-保单地块已存在

    //10350-10400 绿色证书
    public static final int  GREEN_CERTIFICATE_EXIT_ERROR = 10351;//证书不存在
    public static final int  GREEN_CERTIFICATE_FARM_EXIT_ERROR = 10352;//农场未绑定证书
    public static final int  GREEN_CERTIFICATE_KEY_ERROR = 10353;//key重复
    public static final int  GREEN_CERTIFICATE_DEL_ERROR = 10354;//删除状态不准编辑
    public static final int  GREEN_CERTIFICATE_ADD_ERROR = 10355;//证书添加失败
    public static final int  GREEN_CERTIFICATE_CERTIFICATE_ERROR = 10356;//证书关联合格证


    //10401-10450 马陆葡萄发码机制
    public static final int  TRACEABLE_FARM_EXIST_ERROR = 10401;//经营主体存在异常
    public static final int  TRACEABLE_NO_EXIST_ERROR = 10402;//编号已存在
    public static final int  TRACEABLE_FARM_NOT_EXIST_ERROR = 10403;//经营主体不存在异常
    public static final int  TRACEABLE_ID_NOT_EXIST_ERROR = 10404;//数据不存在异常
    public static final int  TRACEABLE_PARAM_ERROR = 10405;//参数异常
    public static final int  TRACEABLE_MEMBER_EXIST_ERROR = 10406;//会员已存在
    public static final int  TRACEABLE_MEMBER_NOT_EXIST_ERROR = 10407;//会员不存在
    public static final int  TRACEABLE_HANDLE_BUSY_ERROR = 10408;//排队生成中
    public static final int  TRACEABLE_FARM_NO_EXIST_ERROR = 10409;//
    public static final int  TRACEABLE_MEMBER_NO_EXIST_ERROR = 10410;//社员编号已存在
    public static final int  TRACEABLE_CODE_TOTAL_NUM_ERROR = 10411;//朝鲜异常


    //20007-20020小程序定义
    public static final int CONSUME_DELIVERY_PLAN_GOODS_NO = 20007;//小程序端固定套餐菜品不足
    public static final int CONSUME_DELIVERY_PLAN_NO = 20008;//小程序宅配计划不存在
    public static final int CONSUME_FARM_NO = 20009;//小程序农场不存在
    public static final int CONSUME_COMPANY_NO = 20010;//小程序公司不存在
    public static final int CONSUME_ADDRESS_NO = 20011;//小程序地址不存在
    public static final int CONSUME_NO = 20012;//小程序客户不存在
    public static final int CONSUME_RULE_CHANGE = 20013;//小程序规则变更
    public static final int CONSUME_PACKAGE_NO_USER = 20014;//小程序宅配套餐不可用
    public static final int CONSUME_PACKAGE_NO = 20015;//小程序宅配套餐不存在
    public static final int CONSUME_ORDER_NO = 20016;//小程序订单不存在
    public static final int CONSUME_GOODS_NO_EXIST = 20017;//小程序菜单不存在
    public static final int CONSUME_PHONE_NO_EXIST = 20018;//小程序手机号不存在
    public static final int CONSUME_ALL_NO_EXIST = 20019;//所有企业用户不存在
    public static final int CONSUME_CODE_ERROR = 20020;//所有Code不正确

    //40001-50001 co端使用
    public static final int CHECK_ADD_MISION = 40001;//企业端记农事
    public static final int CHECK_CO_ENUM_ERROR = 40002;//co枚举异常
    public static final int CHECK_CO_USER_ERROR = 40003;//co用户异常
    public static final int CHECK_CO_BarcodeTemplate_ERROR = 40003;//co用户异常
    public static final int CHECK_CO_CERTIFICATE_ERROR = 40004;//co合格证异常
    public static final int CHECK_CO_SHENNONGQRCODE_ERROR = 40005;//申农码调用异常
    public static final int CHECK_CO_CERTIFICATE_FAILURE_ERROR = 40006;//co合格证失效异常

    //50600至50699 极光预留
    public static final int Jiguang_Connection_Exception = 50600;//极光服务连接异常，请稍后再试
    public static final int Jiguang_Api_Request_Exception = 50601;//极光服务API请求异常

    //60001-70001 expert预留
    public static final int EXPERT_NO_ACCESS_AUTH = 60001;//账号异常，请联系管理员
    public static final int QUESTION_DELETE = 60002;//该问题已被删除

    //70001-70100 安信保险预留
    public static final int INSURE_LAND_FAIL = 70002;//投保地块失败
    //70101-70201 执法
    public static final int TEMPLATE_PERMISSION = 70101;//检查模板不可用，或已被禁用



    //80001-80100 销售预留
    public static final int SELL_LIST_FAIL = 80001;//销售未开放

    //90001-90100 销售预留
    public static final int MESSAGE_EXPERT_QUESTION_DELETE = 90001;//专家端问题被删除
    public static final int MESSAGE_EXPERT_REPLY_DELETE = 90002;//专家端回复被删除
    public static final int MESSAGE_NOtiCE_DELETE = 90003;//公告系统公告删除


    //系统内部错误
    public static final int GLOBAL_SYSTEM_ERROR = 417;//系统内部错误

    public static final Boolean BOOLEAN_TEMPLATE=true;

    static {
        respMap.put(GLOBAL_SUCCESS, "成功");
        respMap.put(GlOBAL_PARAMS_ERROR, "参数错误");
        respMap.put(GlOBAL_ACCESSTOKEN_ERROR, "accessToken验证失败");
        respMap.put(GLOBAL_NO_ACCESS_AUTH, "您的权限无法使用该功能，可联系超级管理员修改权限");
        respMap.put(GLOBAL_OTHER_ERROR, "其它错误");
        respMap.put(GLOBAL_SERVER_OFFLINE, "服务器繁忙，请稍后再试"); // 从服务离线修改为服务器繁忙，请稍后再试
        respMap.put(GLOBAL_GOV_PLATFORM_ERROR,"没有平台登录权限");
        respMap.put(GLOBAL_SYSTEM_ERROR, "系统内部错误");

        respMap.put(SMS_VCODE_INCORRECT, "无效验证码");
        respMap.put(SMS_VCODE_IN_SEND_GAP, "验证码发送间隔内，请稍后再试");
        respMap.put(SMS_VCODE_SEND_FAIL, "验证码发送失败");
        respMap.put(SMS_VCODE_IS_EXPIRE, "验证码已失效");
        respMap.put(SMS_SEND_FAIL, "短信发送失败");

        respMap.put(DELIVERY_PLAN_ORDER_NO, "下单截止");
        respMap.put(CUSTOMERPACKAGE_CANNUMBER_NO, "客户剩余次数已小于0");
        respMap.put(CUSTOMERPACKAGE_EXPIRE, "套餐已过期，不能下单");
        respMap.put(DELIVERY_PLAN_GOODS_NO, "菜品不足，请重新下单");
        respMap.put(DELIVERY_PLAN_STARTTIME_NO, "该宅配计划已到下单截止时间，不允许添加客户");
        respMap.put(DELIVERY_PLAN_GOODSNUM_PASS, "下单菜品超过设定");
        respMap.put(CONSUME_DELIVERY_PLAN_NO, "宅配计划不存在");
        respMap.put(CONSUME_FARM_NO, "农场不存在");
        respMap.put(CONSUME_COMPANY_NO, "公司不存在");
        respMap.put(CONSUME_ADDRESS_NO, "收货地址不存在");


        respMap.put(VCODE_EXPIRED, "图片验证码已失效");
        respMap.put(CHECK_ADD_MISION, "部分农资与农事不符或已失效，或农事类型已被禁用，请重新尝试");

        respMap.put(Jiguang_Connection_Exception, "极光服务连接异常，请稍后再试");
        respMap.put(Jiguang_Api_Request_Exception, "极光服务API请求异常");

        respMap.put(EXPERT_NO_ACCESS_AUTH, "账号异常，请联系管理员");
        respMap.put(QUESTION_DELETE, "该问题已被删除");


        respMap.put(INSURANCE_PARAM_ERROR, "参数异常");
        respMap.put(INSURANCE_LAND_EXIT_ERROR, "所选地块已被投保，请刷新页面重新提交");
        respMap.put(INSURANCE_OPERATION_ERROR, "操作失败");
        respMap.put(INSURANCE_NOT_EXIT_ERROR, "保单不存在");
        respMap.put(INSURANCE_FARM_NOT_EXIT_ERROR, "经营主体不存在");
        respMap.put(INSURANCE_LAND_NOT_EXIT_ERROR, "地块不存在");
        respMap.put(INSURANCE_SURRENDER_EXIT_ERROR, "保单已退保");
        respMap.put(INSURANCE_LAND_STATUS_ERROR, "地块已下架，请刷新页面重新提交");
        respMap.put(INSURANCE_UPDATE_STATUS_ERROR, "退保/过期状态，不允许编辑操作");
        respMap.put(INSURANCE_DEL_STATUS_ERROR, "退保/过期状态，不允许删除操作");
        respMap.put(INSURANCE_ADD_STATUS_ERROR, "退保/过期状态，不允许添加操作");
        respMap.put(INSURANCE_LAND_STATUS_EXIT_ERROR, "保单地块已存在");
        respMap.put(GREEN_CERTIFICATE_EXIT_ERROR, "证书不存在");
        respMap.put(GREEN_CERTIFICATE_FARM_EXIT_ERROR, "农场未绑定证书");
        respMap.put(GREEN_CERTIFICATE_KEY_ERROR, "key重复");
        respMap.put(GREEN_CERTIFICATE_DEL_ERROR, "该证书已删除，无法编辑");
        respMap.put(GREEN_CERTIFICATE_ADD_ERROR, "证书添加失败");
        respMap.put(TRACEABLE_FARM_EXIST_ERROR, "添加失败，此农场已经在XXXX年内");
        respMap.put(TRACEABLE_NO_EXIST_ERROR, "添加失败,编号已经存在");
        respMap.put(TRACEABLE_FARM_NOT_EXIST_ERROR, "添加失败，农场不存在");
        respMap.put(TRACEABLE_ID_NOT_EXIST_ERROR, "数据不存在");
        respMap.put(TRACEABLE_PARAM_ERROR, "参数异常");
        respMap.put(TRACEABLE_MEMBER_EXIST_ERROR, "添加失败，此社员已经在XXXX内");
        respMap.put(TRACEABLE_MEMBER_NOT_EXIST_ERROR, "会员不存在");
        respMap.put(TRACEABLE_HANDLE_BUSY_ERROR, "正在处理中，请稍后重试");
        respMap.put(TRACEABLE_FARM_NO_EXIST_ERROR, "经营主体编码重复，请修改后提交");
        respMap.put(TRACEABLE_MEMBER_NO_EXIST_ERROR, "社员编码重复，请修改后提交");
        respMap.put(TRACEABLE_CODE_TOTAL_NUM_ERROR, "单个社员最多发码999999个");


        respMap.put(80001, "暂不支持该作物销售");
        respMap.put(TEMPLATE_PERMISSION,"检查模板不可使用，或已被禁用，请重新选择其他模板进行检查");
        respMap.put(MESSAGE_EXPERT_QUESTION_DELETE,"该问题已删除");
        respMap.put(MESSAGE_EXPERT_REPLY_DELETE,"该回复已删除");
        respMap.put(MESSAGE_NOtiCE_DELETE,"该公告已删除");
    }

}

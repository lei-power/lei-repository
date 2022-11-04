package com.lei.spanner.core.base.constants;

import com.google.common.collect.Maps;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 该类为数据库字典常用类。
 * 数据库字段取值类型，都由该类定义
 */
public class DictCons {


    /**
     * 客户端类型
     */
    public static class ClientType {
        public static int WEB = 1;
        public static int APP = 2;
        public static int WXMINI = 3;
    }


    /**
     * 大数据平台类型
     */
    public static class GovSubjectPlatformType {
        public static int BIG_DADA_PLATFORM = 1; //大数据平台
        public static int MIDDLE_PLATFORM = 2; //中台
    }

    //========================================================基础模块start-------------------------------------------------------

    /**
     * 短信验证码类型
     */
    public static class SmsType {
        public static int LOGIN = 1;//登录注册
        public static int ChangePhone = 2;//更滑手机号
    }

    /**
     * 数据软删除标志位，全库通用
     */
    public static class DelFlag {
        public static int YES = 1;//已删除
        public static int NO = 0;//未删除
    }

    /**
     * 数据软删除标志位，全库通用
     */
    public static class StatusFlag {
        public static Byte ENABLE = 1;//启用
        public static Byte PROHIBIT = 0;//冻结
    }

    //-------------------------------------------------用户service模块start-------------------------------------------------------


    /**
     * 用户账号冻结状态
     */
    public static class UserEnable {
        public static int NORMAL = 1;//正常
        public static int FROZEN = 0;//冻结
    }

    /**
     * 用户账号激活状态
     */
    public static class UserDemoFlag {
        public static int YES = 1;//是演示账号
        public static int NO = 0;//不是演示账号
    }

    /**
     * 用户在企业中是否激活
     */
    public static class UserCompanyRefActiveFlag {
        public static int YES = 1;//激活
        public static int NO = 0;//未激活
    }

    /**
     * 用户是否选中当前企业
     */
    public static class UserCompanyRefChooseFlag {
        public static int YES = 1;
        public static int NO = 0;
    }

    /**
     * 用户是否拥有当前企业
     */
    public static class UserCompanyRefOwnFlag {
        public static int YES = 1;
        public static int NO = 0;
    }

    public static class UserFarm {
        public static byte isChoose = 1;//选中;
        public static byte isNotChoose = 0;//未选中
    }

    /**
     * 用户是否实名认证
     */
    public static class UserAuthFlag {
        public static int YES = 1;
        public static int NO = 0;
    }


    /**
     * 角色类型，对应角色id字段
     */
    public static class RoleType {
        public static long SUPER_ADMIN = 1L; //超级管理员
        public static long ADMIN = 2L; // 管理员
        public static long CHARGE_FARM = 3L; // 农场负责人
        public static long SELLER = 4L; // 销售人员
        public static long SERVICE = 5L; // 客服
        public static long CHARGE_PRODUCE = 6L; // 生产负责人
        public static long CHARGE_WAREHOUSE = 7L; // 仓库负责人
    }

    /**
     * 角色：多选标识
     */
    public static class RoleMutiChooseFlag {
        public static int YES = 1;//允许多选
        public static int NO = 0;//不允许多选
    }

    /**
     * 是否管理所有农场:1-是，0-否，-1-角色不合规（该取值仅仅表示状态，不会存数据库）
     */
    public static class RoleFarmFlag {
        public static int NO_LEGAL = -1;//角色不合规
        public static int YES = 1;//是
        public static int NO = 0;//否
    }


    public static class UserTokenStatus {
        public static int YES = 1;//可用
        public static int NO = 1;//不可用
    }


    public static class GovUserTokenStatus {
        public static byte YES = 1;//可用
        public static byte NO = 1;//不可用
    }

    public static class CompanyQualificationFlag {
        public static int UN_CHECK = 0;//未审核、
        public static int SUCCESS = 1;//审核成功
        public static int FAIL = 2;//审核失败
    }

    public static class SupervisionFlag {
        public static int YES = 1;//监管
        public static int NO = 0;//没有监管
    }

    /**
     * 区域等级
     */
    public static class Level {
        public static final int ONE = 1;// 省
        public static final int TWO = 2;// 市
        public static final int THREE = 3;// 区
        public static final int FOUR = 4;// 镇
        public static final int FIVE = 5;// 村
    }

    /**
     * 企业等级
     */
    public static class RankType {
        public static final int FREE = 0;// 免费版
        public static final int CHARGE = 1;// 专业版
        public static final int FLAGSHIP = 2;// 旗舰版
    }

    /**
     * 溯源logo开关
     */
    public static class QrCodeLogoOpenFlag {
        public static final int CLOSE = 0;// 关
        public static final int OPEN = 1;// 开
    }
    //-------------------------------------------------标准生产service模块start-------------------------------------------------------

    public static class GenDemoData {
        public static int SUCCESS = 1;//成功
        public static int FAIL = 0;//失败
    }

    public static class LandStatus {
        public static int PLANT = 1;//种植
        public static int FALLOW = 2;//休耕
    }

    //地块面积单位类型：1-亩，2-分，3-平方米
    public static class LandAreaUnit {
        public static byte MU = 1;//亩
        public static byte FEN = 2;//分
        public static byte SQM = 3;//平方米
    }

    public static class MissionStatus {
        public static byte Notcomplete = 10;//未完成
        public static byte Complete = 20;//完成
    }

    //完成任务反馈类型：1-无反馈，2-拍照反馈，3-视频反馈，4-位置反馈
    public static class FeedbackType {
        public static byte NO = 1;//不需要拍照
        public static byte PHOTO = 2;//需要拍照
        public static byte VIDEO = 3;//视频反馈
        public static byte POSITION = 4;//位置反馈
    }


    public static class PlantPlanStatus {
        public static byte PlanPLANT = 1;//计划种植
        public static byte CurPLANT = 2;//当前种植
        public static byte HistoryPLANT = 3;//历史种植
    }


    public static class BarcodeTemplateStatusFlag {
        public static Integer UpperShelf = 1;//上架
        public static Integer LowerShelf = 0;//下架
    }

    public static class BarcodeGroup {
        public static Integer notAutoGen = 1;//手动
        public static Integer autoGen = 2;//app自动生成
    }


    //购买链接类型：1-有赞/微店，2-微信小程序，3-淘宝天猫，4-其他电商
    public static class GoodsBuyShopType {
        public static int youzan = 1;
        public static int wechat = 2;
        public static int taobao = 3;
        public static int other = 4;
    }


    //1-一等品,2-二等品,3-三等品,4-四等品,5-五等品
    public static class GoodLevel {
        public static final int one = 1;//一等品
        public static final int two = 2;//二等品
        public static final int three = 3;//三等品
        public static final int four = 4;//四等品
        public static final int five = 5;//五等品
        //需要及时更新
        public static String getValue(int key) {
            switch (key) {
                case one:
                    return "一等品";
                case two:
                    return "二等品";
                case three:
                    return "三等品";
                case four:
                    return "四等品";
                case five:
                    return "五等品";
                default:
                    return null;
            }
        }
    }

    //0：未打印，1：已打印  3：部分已打印
    public static class CertificateFlag {
        public static final int NO_PRINT = 0;//未打印
        public static final int HAVE_PRINT = 1;//已打印
        public static final int PART_PRINT = 3;//部分已打印
        //需要及时更新
        public static String getValue(int key) {
            switch (key) {
                case NO_PRINT:
                    return "未打印";
                case HAVE_PRINT:
                    return "已打印";
                case PART_PRINT:
                    return "部分打印";
                default:
                    return "";
            }
        }
    }

    //入库或销售类型：1-放入仓库,2-田头销售,3-赠送,4-扔掉,5-其他,6-死亡,7-更换养殖区,8-本地-超市,9-本地-企业事业单位,10-本地-菜场,11-本地-批发市场,12配送中心,13-本地-粮管所,14-外地
    public static class PickType {
        //需要时，在添加
        public static final int PUT_IT_IN_THE_WAREHOUSE = 1;
        public static final int TIANTOU_SALES = 2;
        public static final int GIVE = 3;
        public static final int THROW_AWAY = 4;
        public static final int OTHER = 5;
        public static final int DEATH = 6;
        public static final int REPLACEMENT_OF_BREEDING_AREA = 7;
        public static final int LOCAL_SUPERMARKET = 8;
        public static final int LOCAL_ENTERPRISES_AND_INSTITUTIONS = 9;
        public static final int LOCAL_MARKET = 10;
        public static final int LOCAL_WHOLESALE_MARKET = 11;
        public static final int DISTRIBUTION_CENTRE = 12;
        public static final int LOCAL_GRAIN_MANAGEMENT_OFFICE = 13;
        public static final int OUT_OF_TOWN = 14;

        //需要及时更新
        public static String getValue(int key) {
            switch (key) {
                case PUT_IT_IN_THE_WAREHOUSE:
                    return "放入仓库";
                case TIANTOU_SALES:
                    return "田头销售";
                case GIVE:
                    return "赠送";
                case THROW_AWAY:
                    return "扔掉";
                case OTHER:
                    return "其他";
                case DEATH:
                    return "死亡";
                case REPLACEMENT_OF_BREEDING_AREA:
                    return "更换养殖区";
                case LOCAL_SUPERMARKET:
                    return "本地-超市";
                case LOCAL_ENTERPRISES_AND_INSTITUTIONS:
                    return "本地-企业事业单位";
                case LOCAL_MARKET:
                    return "本地-菜场";
                case LOCAL_WHOLESALE_MARKET:
                    return "本地-批发市场";
                case DISTRIBUTION_CENTRE:
                    return "配送中心";
                case LOCAL_GRAIN_MANAGEMENT_OFFICE:
                    return "本地-粮管所";
                case OUT_OF_TOWN:
                    return "外地";
                default:
                    return null;
            }
        }
    }

    public static class PickChooseFlag {
        public static byte NO = 0; // 未选中
        public static byte YES = 1;// 选中
    }


    public static class QrCodeModuleOpenFlag {
        public static int OPEN = 1;//1开
        public static int CLOSE = 0;//0关开
    }

    public static class MarchiningOpenFlag {
        public static int OPEN = 1;//1开
        public static int CLOSE = 0;//0关
    }

    public static class ModuleTypeOpenFlag {
        public static int yes = 1;//开启访问
        public static int no = 2;//关闭访问
    }


    public static class IotType {
        public static Byte SENSOR = 1;//传感器
        public static Byte CAMERA = 2;//摄像头
        public static Byte WEATHER_STATION = 3;//气象站
    }

    public static class doseUnit {
        public static byte MU = 1; // 亩
        public static byte FEN = 2; // 分
        public static byte SQM = 3; // 平方米

    }


    public static class InpsectReportType {
        public static Integer auth = 1; // 认证
        public static Integer check = 2; // 检测
    }


    public static class farmshow {
        // 农场秀状态
        public static class showStatus {
            public static Integer open = 1; //开放 可访问
            public static Integer close = 2; // 不可访问
        }

        // 供应农产品类型：1-自动展示当前的农场品；2-手动展示当前农场品
        public static class suplyGoodsType {
            public static Integer automatic = 1; //自动
            public static Integer manual = 2; // 手动
        }


        // 高端会员定期配送可见性开关。1：开2关
        public static class deliveryFlag {
            public static Integer open = 1; //开
            public static Integer close = 2; // 关
        }

        // 高端会员定期配送-申请成为会员开关：1-开启，2-关闭
        public static class deliveryApplyFlag {
            public static Integer open = 1; //开
            public static Integer close = 2; // 关
        }

        // 高端会员定期配送-会员规则开关1-开启，2-关闭
        public static class deliveryRuleFlag {
            public static Integer open = 1; //开
            public static Integer close = 2; // 关
        }

        // 商城自由开关。1开2关，默认1
        public static class shopFlag {
            public static Integer open = 1; //开
            public static Integer close = 2; // 关
        }

        // 商城自由选择，线上购买开关。1开启2关闭
        public static class shopBuyFlag {
            public static Integer open = 1; //开
            public static Integer close = 2; // 关
        }


    }


    public static class farmshowAgri {
        // 可见状态1可见|2不可见，默认1
        public static class showflag {
            public static Integer show = 1; //可见
            public static Integer hide = 2; // 不可见
        }

        // 附件类型，1图片|2视屏|0没有附件
        public static class fileType {
            public static Integer photo = 1; //1图片
            public static Integer video = 2; // 2视屏
            public static Integer nothing = 0; // 0没有附件
        }

        public static String[] agriNameArr = {"土壤处理", "选种子", "施肥", "病虫防治", "除草"};
    }

    public static class farmshowPage {
        //  页面类型：1-农场介绍；2-坚持有机种植，3-食品安全科普；4-种植标准；5-检测认证；6-供应农产品；7-销售模式
        public static class pageType {
            public static Integer farm = 1;
            public static Integer plant = 2;
            public static Integer food = 3;
            public static Integer standard = 4;
            public static Integer check = 5;
            public static Integer crop = 6;
            public static Integer sale = 7;
        }

        // 可见状态，1可见|2不可见
        public static class showFlag {
            public static int show = 1;
            public static int hide = 2;
        }
    }

    public static class farmshowModel {
        public static class goodsCheckedFlag {
            public static Long NO = 0L; // 未全选
            public static Long Yes = 1L; // 全选
        }

        public static class defaultModelFlag {
            public static Byte NO = 0; // 否
            public static Byte Yes = 1; // 是
        }

        public static class statusFlag {
            public static Byte NO = 0; // 不可使用
            public static Byte Yes = 1; // 可使用
        }
    }

    public static class farmshowGoods {
        public static class typeFlag {
            public static Long NOT_CHECKED = 0L; // 未选中
            public static Long CHECKED = 1L; // 选中
        }

        public static class checkedFlag {
            public static Integer NOT_CHECKED = 0; // 未选中
            public static Integer CHECKED = 1; // 选中
        }
    }

    public static class farmshowModelPage {
        //  页面类型：1-农场介绍；2-坚持有机种植，3-食品安全科普；4-种植标准；5-检测认证；6-供应农产品；7-销售模式
        public static class pageType {
            public static Integer farm = 1;
            public static Integer plant = 2;
            public static Integer food = 3;
            public static Integer standard = 4;
            public static Integer check = 5;
            public static Integer crop = 6;
            public static Integer sale = 7;
        }
    }


    /**
     * 地块绑定物联网设备或摄像头显示表示
     */
    public static class zaiotLandDeviceShowFlag {
        public static int SHOW = 1; // 现实
        public static int HIDDEN = 0; // 不显示
    }

    /**
     * 作物大类唯一标识
     */
    public static class CropSubjectIdentifer {
        public static final String AGRI = "agri";//农业
        public static final String ANIAML = "animal";//牧业
        public static final String FORESTRY = "forestry";//林业
        public static final String FISHERY = "fishery";//渔业
    }

    public static final Map<Integer, String> PARAM_MAP = Maps.newHashMap();

    static {
        PARAM_MAP.put(1, "移栽");
        PARAM_MAP.put(2, "育苗");
        PARAM_MAP.put(3, "播种");
    }

    /**
     * 养殖/种植方法
     */
    public static class PlantMethod {
        public static final int PLANTINT = 1;//移栽
        public static final int SEEDLING = 2;//育苗
        public static final int SOWING = 3;//直播

        public static final int FangYang = 10;//放养
        public static final int JuanYang = 11;//圈养
        public static final int FangYang_JuanYang = 12;//放养+圈养

        public static final int RenGongWeiYang = 20;//人工喂养
        public static final int WuXuWeiYang = 21;//无需喂养

    }

    /**
     * 作物生长周期
     */
    public static class CropGrowthCycle {
        public static int ONE_YEAR = 1;//一年生
        public static int MULTI_YEAR = 2;//多年生
    }

    /**
     * 株间距单位
     */
    public static class PlantSpacingUnit {
        public static int CM = 1;//厘米
        public static int DM = 10;//分米
        public static int M = 100;//米
    }

    /**
     * 是否热门
     */
    public static class HotFlag {
        public static int HOT = 1;//热门
        public static int NOT_HOT = 0;//不热门
    }

    /**
     * 病虫害类型
     */
    public static class MorbidityType {
        public static int DISEASE = 0; // 病害
        public static int PEST = 1; // 虫害
    }

    /**
     * 作物分类是否关联了病虫害
     */
    public static class DiseasePestFlag {
        public static int YES = 1; // 已关联病虫害
        public static int NO = 0; // 没有关联病虫害
    }

    /**
     * 是否打开专家系统
     */
    public static class ExpertFlag {
        public static int YES = 1;//关联专家问答
        public static int NO = 0; //没有关联专家问答
    }

    /**
     * 是否开启农机作业
     */
    public static class NjFlag {
        public static int YES = 1;//关联农机作业
        public static int NO = 0; //没有关联农机作业
    }

    /**
     * 农场是否参与统计
     */
    public static class StatisticsFlag {
        public static int YES = 1; // 是
        public static int NO = 0; // 否
    }

    /**
     * 作物是否下架
     */
    public static class ShowFlag {
        public static Byte YES = 1; // 是
        public static Byte NO = 0; // 否
    }

    /**
     * 是否集团版本
     */
    public static class GroupFlag {
        public static int YES = 1; // 是
        public static int NO = 0; // 否
    }

    /**
     * 角色创建方式
     */
    public static class RoleCreateMode {
        public static int ADMIN_PLATFORM = 1; //运营平台主体创建角色
        public static int MIDDLE_PLATFORM = 2; //中台创建的角色
    }

    /**
     * 是否是超级管理员角色 0 否  1是
     */
    public static class AdminFlag {
        public static int NO = 0; //否
        public static int YES = 1; //是
    }

    //合格证类型 0普通合格证， 1绿色合格证
    public static class certificateTemplateType {
        public static final int NORMAL_CERTIFICATE = 0;
        public static final int LVSE_CERTIFICATE = 1;

        //需要及时更新
        public static String getValue(int key) {
            switch (key) {
                case NORMAL_CERTIFICATE:
                    return "普通合格证";
                case LVSE_CERTIFICATE:
                    return "绿色合格证";
                default:
                    return "";
            }
        }
    }

    //品种来源 1采收，2外采
    public static class dataOrigin {
        public static final int HARVEST = 1;
        public static final int OUT_HARVEST= 2;

        //需要及时更新
        public static String getValue(int key) {
            switch (key) {
                case HARVEST:
                    return "采收";
                case OUT_HARVEST:
                    return "外采";
                default:
                    return "";
            }
        }
        //需要及时更新，合格证导出名拼接使用
        public static String getExportValue(int key) {
            switch (key) {
                case HARVEST:
                    return "采收库存";
                case OUT_HARVEST:
                    return "外采库存";
                default:
                    return "";
            }
        }
    }

    //农资阈值 1肥料 2农药
    public static class argiLeisure {
        public static final int fertilizer = 1;
        public static final int pesticide = 2;
    }

    //获取上海省上海市id
    public static class getAreaId {
        public static final int shanghaiProvince = 310000;
        public static final int shanghaiCity = 310100;
    }
    //施肥、用药、用兽药、用渔药
    public static class MissionCategory {
        public static final Long FEITILIZER= 1L;
        public static final Long PESTICIDE= 2L;
        public static final Long YONGSHOUYAO = 17L;
        public static final Long YONGYUYAO = 24L;

    }
    //农事表是否逾期字段,0逾期，1未逾期
    public static class OverdueStatus {
        public static final int OVERDUE = 0;
        public static final int NO_OVERDUE= 1;
    }
    /**
     * 神农口袋web定时任务名称--用于确定导出业务查询的数据表和导出的数据结构
     */
    public static class WebExportTasktName {

        public static final String TASK_WEB_AGRI_RES_MISSION_EXPORT = "TASK_WEB_AGRI_RES_MISSION_EXPORT"; // 生产统计-明细-农资使用记录导出
        public static final String TASK_WEB_PLANT_PLAN_AGRI_EXPORT = "TASK_WEB_PLANT_PLAN_AGRI_EXPORT"; // 生产统计-明细-种养品种导出（农业）
        public static final String TASK_WEB_PLANT_PLAN_FORESTRY_EXPORT = "TASK_WEB_PLANT_PLAN_FORESTRY_EXPORT"; // 生产统计-明细-种养品种导出（林业）
        public static final String TASK_WEB_PLANT_PLAN_ANIMAL_EXPORT = "TASK_WEB_PLANT_PLAN_ANIMAL_EXPORT"; // 生产统计-明细-种养品种导出（禽畜）
        public static final String TASK_WEB_PLANT_PLAN_FISHERY_EXPORT = "TASK_WEB_PLANT_PLAN_FISHERY_EXPORT"; // 生产统计-明细-种养品种导出（渔业）
        public static final String TASK_WEB_MISSION_LIST_EXPORT = "TASK_WEB_MISSION_LIST_EXPORT"; // 生产统计-明细-农事记录
        public static final String TASK_WEB_PICK_RECORD_AGRI_EXPORT = "TASK_WEB_PICK_RECORD_AGRI_EXPORT"; // 生产统计-明细-采收/出栏/捕捞记录（农业）
        public static final String TASK_WEB_PICK_RECORD_FORESTRY_EXPORT = "TASK_WEB_PICK_RECORD_FORESTRY_EXPORT"; // 生产统计-明细-采收/出栏/捕捞记录（林业）
        public static final String TASK_WEB_PICK_RECORD_ANIMAL_EXPORT = "TASK_WEB_PICK_RECORD_ANIMAL_EXPORT"; // 生产统计-明细-采收/出栏/捕捞记录（禽畜）
        public static final String TASK_WEB_PICK_RECORD_FISHERY_EXPORT = "TASK_WEB_PICK_RECORD_FISHERY_EXPORT"; // 生产统计-明细-采收/出栏/捕捞记录（渔业）
        public static final String TASK_WEB_SELL_LIST_GROUP_EXPORT = "TASK_WEB_SELL_LIST_GROUP_EXPORT"; // 生产统计-明细-销售记录
    }

    //-------------------------------------------------订单service模块start-------------------------------------------------------
    public static class OrderType {
        public static int COMMON = 1;//普通订单
        public static int DELIVERY = 2;//宅配会员订单
    }

    public static class OrderStatus {
        public static int NODELIVERY = 10;//未发货
        public static int DELIVERY = 20;//已发货
    }

    public static class OrderFrom {
        public static int PLAT = 1;//后台添加
        public static int OTHER = 2;//小程序添加
    }

    public static class WeightUnit {
        public static int GRAM = 1;//克
        public static int KILOGRAM = 2;//斤
    }

    public static class FreeFlag {
        public static int FREE = 1;//赠送
        public static int NOFREE = 0;//不赠送
    }

    //-------------------------------------------------客户service模块start-------------------------------------------------------

    public static class CustomerType {
        public static int PERSION = 1;//个人
        public static int ENTERPRISE = 2;//企业
    }

    public static class FromType {
        public static int NOCHOOSE = 0;//未选择
        public static int SALVESMAN = 1;//销售人员推荐
        public static int WEIXIN = 2;//微信公众号
        public static int CUSTOMER = 3;//其他客户推荐
        public static int ACTION = 4;//活动
        public static int OTHER = 5;//其他
    }

    public static class DefaultFlag {
        public static int DEFAULT = 1;//是
        public static int NO = 0;//不是
    }

    public static class DayOFWeek {
        public static int MON = 1;//周一
        public static int TUE = 2;//周二
        public static int WED = 4;//周三
        public static int THU = 8;//周四
        public static int FRI = 16;//周五
        public static int SAT = 32;//周六
        public static int SUN = 64;//星期天
    }

    public static class ConsumeType {
        public static int IN = 1;//入账
        public static int OUT = 2;//出账
    }

    public static class AmountRecordType {
        public static int ADDPACKAGE = 1;//添加套餐
        public static int RENEW = 2;//续费
        public static int REFUND = 3;//退款
        public static int ADDCOMMONORDER = 4;//普通订单新增
        public static int DELCOMMONORDER = 5;//普通订单删除
    }

    public static class OperateType {
        public static int ADDPACKAGE = 1;//添加套餐
        public static int DELPACKAGE = 2;//删除套餐
        public static int EDITDAYOFWEEK = 3;//修改配送时间
        public static int EDITEXPIREDATE = 4;//修改失效时间
        public static int DONATE = 5;//赠送套餐次数
        public static int RENEW = 6;//续费
        public static int REFUND = 7;//退款
        public static int DELDELIVERYORDER = 8;//删除宅配订单
        public static int ADDDELIVERYORDER = 9;//添加宅配订单
    }

    public static class CustomerTokenStatus {
        public static int YES = 1;//可用
        public static int NO = 1;//不可用
    }

    public static class CustomerPackageStatus {
        public static int NOEFFECT = 1;//未生效
        public static int EFFECT = 2;//已生效
        public static int EXPIRED = 3;//已过期
        public static int USED = 4;//已用完
    }

    //-------------------------------------------------宅配计划service模块start-------------------------------------------------------

    public static class MenuType {
        public static int FREE = 1;//客户自由搭配
        public static int FIX = 2;//固定菜单
    }

    public static class CustomerChooseType {
        public static int NO = 0;//未配置
        public static int WEIGHT = 1;//按重量选菜
        public static int SUM = 2;//按数量选菜
    }

    public static class EnableFlag {
        public static int NO = 0;//不可用
        public static int YES = 1;//可用
    }


    //-------------------------------------------------管理系统adminuser模块start-------------------------------------------------------

    public static class SysUserEnable {
        public static int NORMAL = 1;//正常
        public static int FROZEN = 0;//冻结
    }

    public static class SysUserAdminFlag {
        public static int YES = 1;//是否超级管理员:是
        public static int NO = 0;//是否超级管理员:否
    }

    public static class SysResourceType {
        public static int MENU = 1;//菜单
        public static int BUTTON = 2;//按钮
    }

    // -------------------------------------------管理appconfig模块----------------------------------------------------------

    public static class AppConfig {
        public static class AppStatus {
            public static int NORMAL = 1;//正常
            public static int FROZEN = 0;//冻结
        }
    }

    public static class CropFeedback {
        public static class statusFlag {
            public static Byte PASS = 2;//通过
            public static Byte NOPASS = 3;//不通过
            public static Byte IGNORE = 4;//忽略
        }
    }

    public static class AgriResFeedback {
        public static class statusFlag {
            public static Byte PASS = 2;//通过
            public static Byte NOPASS = 3;//不通过
            public static Byte IGNORE = 4;//忽略
        }
    }

    public static class SysConf {
        public static class ConfType {
            public static Integer QRCODE = 1;//溯源码
        }
    }

    // -------------------------------------------政府模块----------------------------------------------------------

    public static class GovernmentUser {
        public static int NORMAL = 1;//正常
        public static int FROZEN = 0;//冻结
    }

    public static class AccountType {
        public static int platformCreate = 1;//一级账号（通过管理后台创建）
        public static int govCreate = 2;//二级账号（政府端创建）
    }


    public static class YearOutputValueFlag {
        public static int close = 0;
        public static int open = 1;
    }

    public static class GisMapFlag {
        public static int Google = 0;
        public static int Gis_sh = 1;
    }

    public static class DataTargetFlag {
        public static int snkoudai = 0;
        public static int zhongzhiye = 1;
    }


    // ---------------------------------------------运营商模块------------------------------------------------------
    public static class OperateUserAdminFlag {
        public static int YES = 1;//是否超级管理员:是
        public static int NO = 0;//是否超级管理员:否
    }

    public static class operateSubject {
        public static int openRegister = 1;//开启注册
        public static int closeRegister = 0;//关闭注册


        public static int IS_DEFAULT_CONF = 1;//默认配置
        public static int IS_NOT_DEFAULT_CONF = 0;//非默认配置


        public static int OPEN_ADD_COMPANY = 1;//开启添加企业
        public static int CLOSE_ADD_COMPANY = 0;//关闭添加企业
    }

    /**
     * 运营商等级开关
     */
    public static class OperateRankOpenFlag {
        public static int YES = 1;//开
        public static int NO = 0;//关
    }

    //=====================================种植管理系统模块========================================

    public static class ScFarmFtype {
        public static final String SC_PLAN = "0";
        public static final String SC_FERT = "1";
        public static final String SC_FLOODING = "2";
        public static final String SC_OTHERFARM = "3";
        public static final String SC_REAP = "4";
        public static final String SC_SELLDIR = "5";
        public static final String SC_USEPEST = "6";
    }

    //=====================================田头价相关========================================
    public static class CropPriceApiName {
        public static final String ncpttpflsdsjgApi = "ncpttpflsdsjgApi";
        public static final String ncpjiagetjApi = "ncpjiagetjApi";
    }

    public static class CropPriceStatistic {
        public static final int Daily = 1;
        public static final int Week = 2;
        public static final int Month = 3;
        public static final int Year = 4;
    }

    /**
     * 作物来源：1田头价(零售、批发、电商)作物、2神农口袋作物
     */
    public static class CropPriceCropFrom {
        public static final int TtjLsjPfjDsj = 1;
        public static final int Snkd = 2;
    }

    /**
     * 1田头价、2批发价、3电商价、4零售价
     */
    public static class CropPriceType {
        public static final int Ttj = 1;
        public static final int Pfj = 2;
        public static final int Dsj = 3;
        public static final int Lsj = 4;
    }
    //=====================================地块编组相关========================================

    /**
     * 删除状态;0-未删除 ，1-已删除
     */
    public static class LandGroupDeleteFlag {
        public static final int NO = 0;
        public static final int YES = 1;
    }

    //=====================================政府段数据导出业务相关========================================

    /**
     * 导出状态，0-排队中，1-导出中，2-导出完成，3-导出失败
     */
    public static class ExportFlag {
        public static final int WAIT = 0;//排队中
        public static final int EXPORTING = 1;//导出中
        public static final int SUCCESS = 2;//导出成功
        public static final int FAIL = 3;//导出失败
    }

    /**
     * 定时任务名称--用于确定导出业务查询的数据表和导出的数据结构
     */
    public static class ExportTasktName {
        public static final String TASKPATROLRECORD = "TASKPATROLRECORD";//安全监管数据导出任务
        public static final String TASKLVSELANDCERTIFICATE = "TASKLVSELANDCERTIFICATE";//绿色认证数据导出任务
        public static final String TASKFARMBUSINESS = "TASKFARMBUSINESS";//神农口袋经营主体导出任务
        public static final String TASKZZBASCOMPANY = "TASKZZBASCOMPANY";//种植业经营主体导出任务
        public static final String TASKCROPGROUPAREA = "TASKCROPGROUPAREA";//在田统计导出任务
        public static final String TASKFARMOPERATION = "TASKFARMOPERATION";//生产作业统计导出任务
        public static final String TASKFARMOPERATIONREPORT = "TASKFARMOPERATIONREPORT";//生产作业上报导出任务
        public static final String TASKPDCOMPANY = "TASKPDCOMPANY";//浦东经营主体导出任务
        public static final String TASKGROWINGSTORAGEFISHERY = "TASKGROWINGSTORAGEFISHERY";//囤塘量上报明细导出
        public static final String TASK_MIDDLE_PLATFORM_FARM = "TASK_MIDDLE_PLATFORM_FARM";//中台主体信息列表导出
        public static final String TASK_MIDDLE_PLATFORM_SHUCAI_ONLAND_FARM = "TASK_MIDDLE_PLATFORM_SHUCAI_ONLAND_FARM";//中台蔬菜在田统计-经营主体统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_SHUCAI_PLANTING_FARM = "TASK_MIDDLE_PLATFORM_SHUCAI_PLANTING_FARM";//中台蔬菜播种面积统计-经营主体统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_SHUCAI_SUBSIDY_FARM = "TASK_MIDDLE_PLATFORM_SHUCAI_SUBSIDY_FARM";//中台蔬菜补贴面积测算-经营主体统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_LVYECAI_QUALITY_FARM = "TASK_MIDDLE_PLATFORM_LVYECAI_QUALITY_FARM";//中台-绿叶菜核心基地-列表导出
        public static final String TASK_MIDDLE_PLATFORM_SHUCAI_QUALITY_FARM = "TASK_MIDDLE_PLATFORM_SHUCAI_QUALITY_FARM";//中台-蔬菜标准园-列表导出
        public static final String TASK_MIDDLE_PLATFORM_SHUICHAN_HEALTHY_BREEDING = "TASK_MIDDLE_PLATFORM_SHUICHAN_HEALTHY_BREEDING";//中台-水产健康养殖示范场-列表导出
        public static final String TASK_MIDDLE_PLATFORM_SHUICHAN_GREEN_BREEDING = "TASK_MIDDLE_PLATFORM_SHUICHAN_GREEN_BREEDING";//中台-水产养殖绿色生产方式-列表导出
        public static final String TASK_MIDDLE_PLATFORM_SHUCAI_ONLAND_AREA = "TASK_MIDDLE_PLATFORM_SHUCAI_ONLAND_AREA";//中台-蔬菜在田统计-区域列表导出
        public static final String TASK_MIDDLE_PLATFORM_INFO_REPORT_FARM = "TASK_MIDDLE_PLATFORM_INFO_REPORT_FARM";//中台-信息直报统计-经营主体统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_GIS_FARM = "TASK_MIDDLE_PLATFORM_GIS_FARM";//中台-基础数据管理-经营主体管理列表导出
        public static final String TASK_MIDDLE_PLATFORM_RUWANG_ONLAND_FARM = "TASK_MIDDLE_PLATFORM_RUWANG_ONLAND_FARM";//中台-入网地块统计-经营主体列表导出
        public static final String TASK_MIDDLE_PLATFORM_ZZY_FARM = "TASK_MIDDLE_PLATFORM_ZZY_FARM";//中台-种植业播种采收统计-经营主体统计导出
        public static final String TASK_MIDDLE_PLATFORM_FARM_BARCODE = "TASK_MIDDLE_PLATFORM_FARM_BARCODE";//中台-合格证打印统计-经营主体列表导出
        public static final String TASK_MIDDLE_PLATFORM_ZZY_ONLAND_FARM = "TASK_MIDDLE_PLATFORM_ZZY_ONLAND_FARM";//种植业在田统计-经营主体统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_FERTI_USED_FARM = "TASK_MIDDLE_PLATFORM_FERTI_USED_FARM";//肥料使用统计-经营主体统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_PESTIC_USED_FARM = "TASK_MIDDLE_PLATFORM_PESTIC_USED_FARM";//农药使用统计-经营主体统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_CROP_GROUP_AREA = "TASK_MIDDLE_PLATFORM_CROP_GROUP_AREA";//中台-蔬菜在田统计-作物统计导出
        public static final String TASK_MIDDLE_PLATFORM_CROP_GROUP_SOWN = "TASK_MIDDLE_PLATFORM_CROP_GROUP_SOWN";//中台-蔬菜播种面积统计-作物统计导出
        public static final String TASK_MIDDLE_PLATFORM_VEGETABLE_DECLARE_COUNTY = "TASK_MIDDLE_PLATFORM_VEGETABLE_DECLARE_COUNTY";//分区蔬菜行业管理申报-汇总页面-区域统计导出
        public static final String TASK_MIDDLE_PLATFORM_VEGETABLE_DECLARE_TOWN = "TASK_MIDDLE_PLATFORM_VEGETABLE_DECLARE_TOWN";//分区蔬菜行业管理申报-汇总页面-街镇统计导出
        public static final String TASK_MIDDLE_PLATFORM_AGRI_MECHANISATION_STATISTICS = "TASK_MIDDLE_PLATFORM_AGRI_MECHANISATION_STATISTICS";//农业机械化统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_AGRI_MECHANISATION_DETAIL_STATISTICS = "TASK_MIDDLE_PLATFORM_AGRI_MECHANISATION_DETAIL_STATISTICS";//农业机械化统计列表明细导出


        public static final String TASK_MIDDLE_PLATFORM_AQUACULTURE_FARM_AREA = "TASK_MIDDLE_PLATFORM_AQUACULTURE_FARM_AREA";//水产类目经营主体面积统计
        public static final String TASK_MIDDLE_PLATFORM_AQUACULTURE_CROP_GROUP_AREA = "TASK_MIDDLE_PLATFORM_AQUACULTURE_CROP_GROUP_AREA";//水产类目作物面积统计

        public static final String TASK_MIDDLE_PLATFORM_SHUCAI_ONLAND_ALL_FARM_DETAIL = "TASK_MIDDLE_PLATFORM_SHUCAI_ONLAND_ALL_FARM_DETAIL";//中台蔬菜在田统计-所有经营主体明细统计列表导出
        public static final String TASK_MIDDLE_PLATFORM_ARCHIVE_SUBSIDY_LAND_YEAR_FARM_DETAIL = "TASK_MIDDLE_PLATFORM_ARCHIVE_SUBSIDY_LAND_YEAR_FARM_DETAIL";//中台蔬菜补贴统计-经营主体详情导出
        public static final String TASK_MIDDLE_PLATFORM_FARMCROPDAY_ALL_FARM_DETAIL = "TASK_MIDDLE_PLATFORM_FARMCROPDAY_ALL_FARM_DETAIL";//中台蔬菜播种统计-所有经营主体明细统计列表导出

        public static final String TASK_MIDDLE_PLATFORM_FERTI_USED_FARM_LAND = "TASK_MIDDLE_PLATFORM_FERTI_USED_FARM_LAND";//施肥明细导出
        public static final String TASK_MIDDLE_PLATFORM_PESTIC_USED_FARM_LAND = "TASK_MIDDLE_PLATFORM_PESTIC_USED_FARM_LAND";//农资明细导出

        public static final String TASK_MIDDLE_PLATFORM_CERTIFICATE_FARM_DESC = "TASK_MIDDLE_PLATFORM_CERTIFICATE_FARM_DESC";//合格证统计导出


        //种植业直报播种采收统计-经营主体明细
        public static final String TASK_PLANTATION_ONLAND_FARM_DETAIL = "TASK_PLANTATION_ONLAND_FARM_DETAIL";


        //种植业直报在田面积-经营主体在田明细
        public static final String TASK_ONLAND_ZZY_FARM_DETAIL = "TASK_ONLAND_ZZY_FARM_DETAIL";

        //空闲地块——经营主体统计
        public static final String TASK_LAND_LEISURE = "TASK_LAND_LEISURE";

        //经营主体库存统计
        public static final String Task_Farm_Agri_Res_Stock_And_To_Be_Used = "Task_Farm_Agri_Res_Stock_And_To_Be_Used";

        //经营主体库存统计明细
        public static final String Task_Farm_Agri_Res_Stock_And_To_Be_Used_Detail = "Task_Farm_Agri_Res_Stock_And_To_Be_Used_Detail";

        //库存统计列表
        public static final String TASK_FARM_AGRI_RES_STOCK_AND_TO_BE_USED_AGRI_RES_DETAIL = "TASK_FARM_AGRI_RES_STOCK_AND_TO_BE_USED_AGRI_RES_DETAIL";

        //经营主体超期种植 列表
        public static final String TASK_FARM_CROP_OVERDUE_AREA_DAY = "TASK_FARM_CROP_OVERDUE_AREA_DAY";

        //蔬菜直报在田面积-在田明细列表导出
        public static final String TASK_SHUCAI_DETAIL_EXPORT = "TASK_SHUCAI_DETAIL_EXPORT";

        //单一作物在田统计 区域统计 列表导出
        public static final String TASK_LIST_SINGLE_CROP_ON_LAND_BY_AREA_EXPORT = "TASK_LIST_SINGLE_CROP_ON_LAND_BY_AREA_EXPORT";

        //单一作物在田统计 主体统计 列表导出
        public static final String TASK_LIST_SINGLE_CROP_ON_LAND_BY_FARM_EXPORT = "TASK_LIST_SINGLE_CROP_ON_LAND_BY_FARM_EXPORT";

        public static final String TASK_VEGETABLE_LAND_FARM_EXPOR = "TASK_VEGETABLE_LAND_FARM_EXPOR";//中台-入网地块统计(菜田)-经营主体列表导出

        public static final String TASK_VEGETABLE_LAND_AREA_EXPOR = "TASK_VEGETABLE_LAND_AREA_EXPOR";//中台-入网地块统计(菜田)-区域列表导出

        //单一作物播种统计 主体统计 列表导出
        public static final String TASK_LIST_SINGLE_CROP_SOW_BY_AREA_EXPORT = "TASK_LIST_SINGLE_CROP_SOW_BY_AREA_EXPORT";

        //单一作物播种统计 经营主体统计 列表导出
        public static final String TASK_LIST_SINGLE_CROP_SOW_BY_FARM_EXPORT = "TASK_LIST_SINGLE_CROP_SOW_BY_FARM_EXPORT";

        //中台-经营主体-地块信息列表导出
        public static final String TASK_MIDDLE_PLATFORM_FARM_LAND = "TASK_MIDDLE_PLATFORM_FARM_LAND";

        //中台-经营主体-种养殖档案-农业
        public static final String TASK_MIDDLE_PLATFORM_PLANT_PLAN_AGRI_LIST = "TASK_MIDDLE_PLATFORM_PLANT_PLAN_AGRI_LIST";

        //中台-经营主体-种养殖档案-林业
        public static final String TASK_MIDDLE_PLATFORM_PLANT_PLAN_FORESTRY_LIST = "TASK_MIDDLE_PLATFORM_PLANT_PLAN_FORESTRY_LIST";

        //中台-经营主体-种养殖档案-牧业
        public static final String TASK_MIDDLE_PLATFORM_PLANT_PLAN_ANIMAL_LIST = "TASK_MIDDLE_PLATFORM_PLANT_PLAN_ANIMAL_LIST";

        //中台-经营主体-种养殖档案-渔业
        public static final String TASK_MIDDLE_PLATFORM_PLANT_PLAN_FISHERY_LIST = "TASK_MIDDLE_PLATFORM_PLANT_PLAN_FISHERY_LIST";

        //中台-经营主体-农事填报记录
        public static final String TASK_MIDDLE_PLATFORM_MISSION_RECORD_LIST = "TASK_MIDDLE_PLATFORM_MISSION_RECORD_LIST";

        //中台-经营主体-农资明细
        public static final String TASK_MIDDLE_PLATFORM_AGRI_RES_SKU_LIST = "TASK_MIDDLE_PLATFORM_AGRI_RES_SKU_LIST";
        //蔬菜直报播种统计-区域统计导出
        public static final String TASK_LIST_VEGETABLES_SOW_STATISTICS_BY_AREA_EXPORT = "TASK_LIST_VEGETABLES_SOW_STATISTICS_BY_AREA_EXPORT";
        //蔬菜直报播种统计-经营主体统计导出
        public static final String TASK_LIST_VEGETABLES_SOW_STATISTICS_BY_FARM_EXPORT = "TASK_LIST_VEGETABLES_SOW_STATISTICS_BY_FARM_EXPORT";
        //蔬菜直报播种统计-经营主体明细统计导出
        public static final String TASK_LIST_VEGETABLES_SOW_CROP_STATISTICS_BY_FARM_EXPORT = "TASK_LIST_VEGETABLES_SOW_CROP_STATISTICS_BY_FARM_EXPORT";
        //蔬菜直报播种统计-作物统计导出
        public static final String TASK_LIST_STATISTICS_BY_CROP_GROUP_BY_CROP_EXPORT = "TASK_LIST_STATISTICS_BY_CROP_GROUP_BY_CROP_EXPORT";

        //绿色食品认证证书 列表导出
        public static final String TASK_GREEN_FOOD_CERT = "TASK_GREEN_FOOD_CERT";

        //地理产品标志认证证书 列表导出
        public static final String TASK_GEO_CERT = "TASK_GEO_CERT";

        //中台-销售去向-区域统计
        public static final String TASK_MIDDLE_PLATFORM_SELL_GROUP_AREA_EXPORT = "TASK_MIDDLE_PLATFORM_SELL_GROUP_AREA_EXPORT";

        //中台-销售去向-经营主体统计
        public static final String TASK_MIDDLE_PLATFORM_SELL_GROUP_FARM_EXPORT = "TASK_MIDDLE_PLATFORM_SELL_GROUP_FARM_EXPORT";

        //中台-销售去向-作物统计
        public static final String TASK_MIDDLE_PLATFORM_SELL_GROUP_CROP_EXPORT = "TASK_MIDDLE_PLATFORM_SELL_GROUP_CROP_EXPORT";

        //中台-经营主体采收开证按作物按日统计-区域统计
        public static final String TASK_FARM_CROP_PICK_CERTIFICAT_AREA = "TASK_FARM_CROP_PICK_CERTIFICAT_AREA";

        //中台-经营主体采收开证按作物按日统计-主体统计
        public static final String TASK_FARM_CROP_PICK_CERTIFICAT_LIST_FARM = "TASK_FARM_CROP_PICK_CERTIFICAT_LIST_FARM";
        //中台-经营主体信息-农资使用记录导出
        public static final String TASK_MIDDLE_AGRI_RES_MISSION_EXPORT = "TASK_MIDDLE_AGRI_RES_MISSION_EXPORT";
        //中台-蔬菜直报补贴统计-区域统计
        public static final String TASK_MIDDLE_SUBSIDY_FARM_ACRE_AREA_YEAR_EXPORT = "TASK_MIDDLE_SUBSIDY_FARM_ACRE_AREA_YEAR_EXPORT";

        //中台-蔬菜直报补贴统计-经营主体统计
        public static final String TASK_MIDDLE_SUBSIDY_FARM_ACRE_YEAR_EXPORT = "TASK_MIDDLE_SUBSIDY_FARM_ACRE_YEAR_EXPORT";

        //中台-蔬菜直报补贴统计-经营主体统计明细-季节性菜田补贴
        public static final String TASK_MIDDLE_SUBSIDY_FARM_LAND_YEAR_DETAIL_EXPORT = "TASK_MIDDLE_SUBSIDY_FARM_LAND_YEAR_DETAIL_EXPORT";

        //中台-蔬菜直报补贴面积-区域统计
        public static final String TASK_MIDDLE_PLATFORM_SHUCAI_SUBSIDY_AREA_EXPORT = "TASK_MIDDLE_PLATFORM_SHUCAI_SUBSIDY_AREA_EXPORT";

        //中台-绿色食品标志使用率-列表导出
        public static final String TASK_LIST_GREEN_CERTIFICATE_BY_AREA_EXPORT = "TASK_LIST_GREEN_CERTIFICATE_BY_AREA_EXPORT";

        //中台-单一作物播种采收统计-区域列表导出
        public static final String TASK_LIST_DAY_OUTPUT_BY_AREA_EXPORT = "TASK_LIST_DAY_OUTPUT_BY_AREA_EXPORT";

        //中台-经营主体信息-溯源码列表导出（渔业）
        public static final String TASK_LIST_DAY_OUTPUT_BY_FARM_EXPORT = "TASK_LIST_DAY_OUTPUT_BY_FARM_EXPORT";

        //中台-经营主体信息-溯源码列表导出（农业）
        public static final String TASK_LIST_BARCODE_AGRI_EXPORT = "TASK_LIST_BARCODE_AGRI_EXPORT";

        //中台-经营主体信息-溯源码列表导出（林业）
        public static final String TASK_LIST_BARCODE_FORESTRY_EXPORT = "TASK_LIST_BARCODE_FORESTRY_EXPORT";

        //中台-经营主体信息-溯源码列表导出（牧业）
        public static final String TASK_LIST_BARCODE_ANIMAL_EXPORT = "TASK_LIST_BARCODE_ANIMAL_EXPORT";

        //中台-经营主体信息-溯源码列表导出（渔业）
        public static final String TASK_LIST_BARCODE_FISHERY_EXPORT = "TASK_LIST_BARCODE_FISHERY_EXPORT";

        //中台-经营主体信息-溯源码列表导出（渔业）
        public static final String TASK_MIDDLE_CERTIFICATE_LIST_EXPORT = "TASK_MIDDLE_CERTIFICATE_LIST_EXPORT";

        //中台-在田产量旬报统计
        public static final String TASK_MIDDLE_VETETABLE_TEN_DAYS_EXPORT = "TASK_MIDDLE_VETETABLE_TEN_DAYS_EXPORT";

        //中台-播种产量月报统计
        public static final String TASK_MIDDLE_VETETABLE_MONTH_EXPORT = "TASK_MIDDLE_VETETABLE_MONTH_EXPORT";

        //中台-播种产量年报统计
        public static final String TASK_MIDDLE_VETETABLE_YEAR_EXPORT = "TASK_MIDDLE_VETETABLE_YEAR_EXPORT";

        // 蔬菜茬数导出
        public static final String TASK_MIDDLE_VEGETABLES_STUBBLE_EXPORT = "TASK_MIDDLE_VEGETABLES_STUBBLE_EXPORT";
    }

    /**
     * 查看状态；0-未查看，1-已查看
     */
    public static class LookFlag {
        public static final int NO = 0;
        public static final int YES = 1;
    }

    /**
     * 状态;0-下架 ，1-正常
     */
    public static class AgriResStatus {
        public static final int INVALID = 0;
        public static final int NORMAL = 1;
    }

    /**
     * 农资来源;10-老农资 ，20-新农资
     */
    public static class AgriResCreateFrom {
        public static final int OLD = 10;
        public static final int NEW = 20;
    }

    /**
     * 用量分类：1单位用量，2总用量
     */
    public static class DosageType {
        public static final int AVERAGE_DOSAGE = 1;
        public static final int TOTAL_DOSAGE = 2;
    }

    /**
     * 农事类型状态;0-失效 ，1-正常
     */
    public static class MissionCategoryStatus {
        public static final int INVALID = 0;
        public static final int NORMAL = 1;
    }

    /**
     * 1：待审核，2通过，3不通过，4忽略
     */
    public static class AgriResFeedbackStatusFlag {
        public static final int ToBeReviewed = 1;
        public static final int Pass = 2;
        public static final int NoPass = 3;
        public static final int Ignore = 1;

    }

    /**
     * 农资包装单位
     * 状态;0-失效 ，1-正常
     */
    public static class AgriResPackUnitStatus {
        public static final int INVALID = 0;
        public static final int NORMAL = 1;
    }

    /**
     * 农资包装单位
     * 状态;0-失效 ，1-正常
     */
    public static class AgriResInOutCategoryStatus {
        public static final int INVALID = 0;
        public static final int NORMAL = 1;
    }

    public static class AgriResSkuInOutFlag {
        public static final int ADD = 1;
        public static final int REDUCE = 2;
    }

    /**
     * 出入库单位类型：1：零散使用（农资剂量单位）；2：整包装使用（农资包装单位）
     */
    public static class AgriResSkuInOutUnitType {
        public static final int METER = 1;
        public static final int PACK = 2;
    }
    //=====================================专家端业务相关==Start==============================================================

    /**
     * 专家区域类别 0 全国 1 省 2 市 3 区 4 镇  5 村
     */
    public static class ExpertAreaType {
        public static final int Nation = 0;
        public static final int Province = 1;
        public static final int City = 2;
        public static final int County = 3;
        public static final int Town = 4;
        public static final int Villiage = 5;
    }

    /**
     * 专家是否启用：1启用，0冻结
     */
    public static class ExpertEnableFlag {
        public static final int NORMAL = 1;//正常
        public static final int FROZEN = 0;//冻结
    }

    /**
     * 专家审核状态
     */
    public static class ExpertAuthFlag {
        public static int WAIT = 0;//待审核
        public static int YES = 1;//审核通过
        public static int NO = 2;//审核失败
    }

    /**
     * 专家激活状态
     */
    public static class ExpertActiveFlag {
        public static int YES = 1;//激活
        public static int NO = 2;//未激活
    }

    /**
     * 专家创建方式
     */
    public static class ExpertApplyFlag {
        public static int ADMIN_CREATE = 0;//邀请入驻
        public static int CO_REGISTER = 1;//申请入驻
    }

    /**
     * 问题分配状态
     */
    public static class QuestionAssignFlag {
        public static int NO = 0;//待分配
        public static int YES = 1;//已分配
        public static int ERROR = 2;//分配失败
    }

    /**
     * 回复类型 1 文字消息 2 图片消息 3 使用肥料 4 使用农药 5视频监控 6 环境指标
     */
    public static class QuestionReplyType {
        public static final int Text = 1;
        public static final int IMG = 2;
        public static final int ResFertilizer = 3;
        public static final int ResPesticide = 4;
        public static final int Camera = 5;
        public static final int Index = 6;
    }


    /**
     * 问题的专家回复状态 0 未回复 1已回复。
     */
    public static class QuestionExpertReplyFlag {
        public static int NO = 0;//未回复
        public static int YES = 1;//已回复
    }

    /**
     * （我的）问题的专家回复状态。
     */
    public static class QuestionExpertReplyFlagOfMy {
        public static int ALL = 0;//全部问题
        public static int NEW = 1;//未回复
        public static int ISREPLY = 2;//我已回复的问题
    }

    /**
     * 回复人是否专家：1专家，0不是专家
     */
    public static class QuestionReplyUserExpertFlag {
        public static int NO = 0;
        public static int YES = 1;
    }
    //=====================================专家端业务相关===End=============================================================


    //=====================================消息中心===Start============================================================

    /**
     * 消息分类：  1：专家问答【提问端】；2：专家问答【专家端】；3 系统公告；4政府端公告；5神农资讯；6农事通知；
     */
    public static class MessageCategory {
        public static final int ExpertAskClient = 1;
        public static final int ExpertAnswerClient = 2;
        public static final int SystemNotice = 3;
        public static final int GovNotice = 4;
        public static final int ShenNongNotice = 5;
        public static final int Mission = 6;
    }

    /**
     * 消息类型：1 新问题，2新回复:每种dataType对应得主键id:政府公告-notice_id...
     */
    public static class ExpertMessageType {
        public static int NewQuestion = 1;
        public static int NewReply = 2;
    }

    /**
     * 消息已读状态 0 未读 1 已读
     */
    public static class MessageReadFlag {
        public static int NotRead = 0;
        public static int HaveRead = 1;
    }

    /**
     * 是否极光推送标识位：0：不需要；1：需要
     */
    public static class JiGuangPushFlag {
        public static int NO = 0;
        public static int YES = 1;
    }

    /**
     * 极光推送状态：0:待推送，1:成功；2：失败
     */
    public static class JiGuangPushStatus {
        public static int TODO = 0;
        public static int SUCCESS = 1;
        public static int FAIL = 2;
    }
//=====================================消息中心===End============================================================


    //=====================================政府公告===Start============================================================

    public static class GovernmentNoticeTypeStatus {
        public static Integer ENABLE = 1;//启用
        public static Integer PROHIBIT = 0;//冻结
    }

    /**
     * 发布状态：1.已发布；2：定时发布中；3：草稿 ;4:撤回
     */
    public static class GovernmentNoticePublishStatus {
        public static Integer Published = 1;
        public static Integer Timing = 2;
        public static Integer Draft = 3;
        public static Integer Recall = 4;
    }

    /**
     * 发布方式：1：立即发布；2：定时发布；
     */
    public static class GovernmentNoticePublishType {
        public static Integer Now = 1;
        public static Integer Timing = 2;
    }

    /**
     * user服务删除企业 MQ事件类型
     */
    public static class CompanyDelEvent {
        public static String ProduceCompanyDel = "ProduceCompanyDel";
        public static String CustomerCompanyDel = "CustomerCompanyDel";
        public static String OperateCompanyDel = "OperateCompanyDel";

    }

    /**
     * 地块类型
     */
    public static class LandType {
        public static String DA_TIAN = "datian";
        public static String DA_PENG = "dapeng";
        public static String GUO_YUAN = "guoyuan";
        public static String YU_TANG = "shuitang";
        public static String SHAN_DI = "shandi";
        public static String YANGZHI_QU = "yangzhiqu";
    }

    /**
     * 地块用途
     */
    public static class GisLandType {
        public static String LIANG_TIAN = "liangtian";
        public static String CAI_TIAN = "caitian";
        public static String GUO_YUAN = "guoyuan";
        public static String JINGZUO_TIAN = "jingzuotian";
        public static String XUMU_YANGZHI = "yangzhi(xumu)";
        public static String SHUICHAN_YANGZHI = "yangzhi(shuichan)";
    }

    /**
     * 作物小类标识符
     */
    public static class CropCategoryIdentitfier {
        public static String LIANG_SHI = "liangshi";
        public static String YOU_LIAO = "youliao";
        public static String SHU_CAI = "shucai";
        public static String SHUI_GUO = "shuiguo";
        public static String DOU_LEI = "doulei";
        public static String CHA_YE = "chaye";
        public static String ZHONGYAO_CAI = "zhongyaocai";
        public static String XIANWEI_ZUOWU = "xianwei";
        public static String YU = "yu";
        public static String XIA = "xia";
        public static String XIE = "xie";

        /**
         * 经作取反
         */
        public static List<String> JZ_CATEGORIES = Arrays.asList(LIANG_SHI, SHU_CAI, SHUI_GUO);
        /**
         * 种植业取反
         */
        public static List<String> ZZY_CATEGORIES = Arrays.asList(SHU_CAI);

    }

    /**
     * 生产服务 保险可投保作物   '是否启用：1启用，0禁用',
     */
    public static class InsureCropGroupEnableFlag {
        public static Integer ENABLE = 1;//启用
        public static Integer PROHIBIT = 0;//冻结
    }

    /**
     * 生产服务 保险  '是否启用：1启用，0禁用',
     */
    public static class InsureEnableFlag {
        public static Integer ENABLE = 1;//启用
        public static Integer PROHIBIT = 0;//冻结
    }

    /**
     * 生产服务 地区管理单位1：省；2：市；3：区;4：其他
     */
    public static class FarmAreaMangeUnit {
        public static final int Province = 1;
        public static final int City = 2;
        public static final int County = 3;
        public static final int Other = 4;
    }

    /**
     * 0 全国 1 省 2 市 3 区
     */
    public static class InsureAreaRefType {
        public static final int Nation = 0;
        public static final int Province = 1;
        public static final int City = 2;
        public static final int County = 3;
    }

    /**
     * 是否监管企业可投保，0：否(所有企业都可以投保)；1：是（只有被监管的企业可以投保）
     */
    public static class InsureSupervisionFlag {
        public static final int NO = 0;
        public static final int YES = 1;
    }

    /**
     * 保险订单来源
     */
    public static class FarmInsureOrderClientType {
        public static final int Web = 1;
        public static final int App = 2;
    }


    /**
     * 保险订单状态
     */
    public static class FarmInsureOrderStatus {
        public static final String PendingPay = "10";
        public static final String Payed = "20";
        public static final String Cancel = "30";
    }

    /**
     * 保险保单状态
     * 10已出单（保单已生成，还未进入保障中）、 20保障中（进入了起保时间，未到终保时间）、 30、判陪中（保障期结束进入判赔中，时间不确定，在安信未推送理赔结果之前一直是判赔中） 40、未发生理赔（保险保障期，发起理赔，保险公司判处结果，最终无需赔付） 41、判陪成功 50、理赔成功（保险保障期，发起理赔，并理赔成功）
     */
    public static class FarmInsurePolicyStatus {
        public static final String Issued = "10";
        public static final String Safeguard = "20";
        public static final String SentenceAccompany = "30";
        public static final String NoClaimOccurred = "40";
        public static final String ClaimOccurred = "41";
        public static final String SuccessfulClaim = "50";
    }

    /**
     * 结案结果：已结案：1； 未结案   0
     */
    public static class FarmInsurePolicyEndCaseFlag {
        public static final String Yes = "1";
        public static final String No = "0";
    }

    /**
     * 销售去向
     */
    public static class SellType {
        public static final int SELL_1 = 1;
        public static final int SELL_2 = 2;
        public static final int SELL_10 = 10;
        public static final int SELL_11 = 11;
        public static final int SELL_12 = 12;
        public static final int SELL_13 = 13;
        public static final int SELL_14 = 14;
        public static final int SELL_15 = 15;
        public static final int SELL_16 = 16;

        //需要及时更新
        public static String getValue(int key) {
            switch (key) {
                case SELL_1:
                    return "本地";
                case SELL_2:
                    return "外地";
                case SELL_10:
                    return "田头销售";
                case SELL_11:
                    return "超市";
                case SELL_12:
                    return "企业事业单位";
                case SELL_13:
                    return "菜场";
                case SELL_14:
                    return "批发市场";
                case SELL_15:
                    return "粮管所";
                case SELL_16:
                    return "其他";
                default:
                    return "";
            }
        }
    }


    /**
     * 天地类型
     */
    public static class gisLandTypeIdValue {
        public static final int GIS_LAND_TYPE_ID_1 = 1;
        public static final int GIS_LAND_TYPE_ID_2 = 2;
        public static final int GIS_LAND_TYPE_ID_3 = 3;
        public static final int GIS_LAND_TYPE_ID_4 = 4;
        public static final int GIS_LAND_TYPE_ID_5 = 5;
        public static final int GIS_LAND_TYPE_ID_6 = 6;
        public static final int GIS_LAND_TYPE_ID_7 = 7;
        public static final int GIS_LAND_TYPE_ID_8 = 8;
        public static final int GIS_LAND_TYPE_ID_9 = 9;
        public static final int GIS_LAND_TYPE_ID_10 = 10;

        //需要及时更新
        public static String getValue(int key) {
            switch (key) {
                case GIS_LAND_TYPE_ID_1:
                    return "粮田";
                case GIS_LAND_TYPE_ID_2:
                    return "菜田";
                case GIS_LAND_TYPE_ID_3:
                    return "经作田";
                case GIS_LAND_TYPE_ID_4:
                    return "零星用地（其他）";
                case GIS_LAND_TYPE_ID_5:
                    return "零星用地（已征地）";
                case GIS_LAND_TYPE_ID_6:
                    return "零星用地（自留地/集体地）";
                case GIS_LAND_TYPE_ID_7:
                    return "果园";
                case GIS_LAND_TYPE_ID_8:
                    return "林地";
                case GIS_LAND_TYPE_ID_9:
                    return "养殖（畜牧）";
                case GIS_LAND_TYPE_ID_10:
                    return "养殖（水产）";
                default:
                    return "";
            }
        }
    }

    /**
     * 是否是开户同步
     */
    public static class GisfarmOpenFlag {
        public static int YES = 1;//是
        public static int NO = 0;//否
    }

    /**
     * 执法监管模板表 状态
     */
    public static class TemplateStatus {
        public static int ENABLE = 1;//启用
        public static int PROHIBIT = 0;//冻结
    }

    /**
     * 执法记录是否作废状态
     */
    public static class PatrolRecordInvalidFlag {
        public static int YES = 1;//是
        public static int NO = 0;//否
    }

    public static class NoticeVisitHistoryUserType {
        public static int co = 1;
        public static int gov = 2;
        public static int admin = 3;
    }

    public static class ShelfStatus { //状态码须 >-127 <128
        public static final Integer SHELF_STATUS_UP = 0; //地块状态 上架
        public static final Integer SHELF_STATUS_DOWN = 1; //地块状态 下架
    }

    /**
     * 政府端用户是否真实用户
     * 1：是；0：否（内部用户）
     */
    public static class GovernmentUserRealUserFlag {
        public static final Integer YES = 1;
        public static final Integer NO = 0;
    }


    /**
     * 执法监管查询使用农资大类唯一标识
     */
    public static class MissionCategoryId {
        public static final String PESTICIDE = "NZLX101"; //农药

        public static final String VETERINARYDRUGS = "NZLX104"; //兽药

        public static final String FISHERYDRUGS = "NZLX102"; //渔药

    }

    /**
     * 绿叶标准、蔬菜标准、水产健康、水产养殖标准、一周内是否用药、执法记录30天内是否检查
     */
    public static class ArchiveFarmPatrolledRecordDuringTagYes {
        public static final int FARMFREENLEAFYVEGETABLEQUALITYSTATUSYES = 1; //绿叶标准

        public static final int FARMVEGETABLEQUALITYSTATUSYES = 1; //蔬菜标准

        public static final int FARMHEALTHYBREEDINGSTATUSYES = 1; //水产健康

        public static final int FARMGREENBREEDINGSTATUSYES = 1; //水产养殖标准


    }

    /**
     * 绿叶标准、蔬菜标准、水产健康、水产养殖标准、一周内是否用药、执法记录30天内是否检查
     */
    public static class ArchiveFarmPatrolledRecordDuringTagNO {

        public static final int FARMFREENLEAFYVEGETABLEQUALITYSTATUSNO = 0; //绿叶标准

        public static final int FARMVEGETABLEQUALITYSTATUSNO = 0; //蔬菜标准

        public static final int FARMHEALTHYBREEDINGSTATUSNO = 0; //水产健康

        public static final int FARMGREENBREEDINGSTATUSNO = 0; //水产养殖标准


    }

    /**
     * 是否注销 1：是；0：否
     */
    public static class CancelFlag {

        public static final Integer YES = 1;
        public static final Integer NO = 0;
    }
    /**
     *注销类型
     */
    public static class CancelType {

        public static final String nhxw = "1"; //土地承包经营农户消亡
        public static final String sszg = "2"; //丧失土地承包经营资格
        public static final String qlrfq = "3"; //权利人放弃权利
        public static final String fypj = "4"; //因人民法院、仲裁委员会的生效法律文书等导致土地承包经营权注销
        public static final String tdms = "5"; //土地灭失
        public static final String zwjs = "6"; //土地经有批准权限的人民政府或土地主管部门转为建设用地
    }

    /**
     * 审核流程状态
     */
    public static class ProcessStatus {
        public static final String draft = "1"; // 草稿
        public static final String pending_review = "2"; // 待审核
        public static final String success = "3"; // 已通过
        public static final String reject = "4"; //被驳回

    }

    /**
     * 审核流程状态     //操作状态：1：新增  2：编辑  3：删除
     *     private String actionType;
     */
    public static class ActionType {
        public static final String add = "1"; // 新增
        public static final String edit = "2"; // 编辑
        public static final String del = "3"; // 删除

    }

    public static class ArableProcessStatus {

        //国土耕地监管保护系统使用
        public static final String pending = "1"; // 待处理
        public static final String review = "2"; // 待复核
        public static final String audit = "3"; // 待审核
        public static final String reject = "4"; // 审核驳回
        public static final String success = "5"; // 审核通过

    }

    /**
     * 操作动作流程类型
     */
    public static class ProcessActionType {
        public static final String save_draft = "1"; // 保存草稿
        public static final String submit_review = "2"; // 提交申请
        public static final String withdraw = "3"; // 撤回
        public static final String success = "4"; // 通过
        public static final String reject = "5"; //驳回

    }

    public static class ArableProcessActionType {

        //国土耕地监管保护系统使用
        public static final String ai_recognition = "0"; //AI识别
        public static final String input_need_review = "1"; //录入需要复核
        public static final String input_needless_review = "2"; //录入无需复核
        public static final String screening_need_review = "3"; //筛查需要复核
        public static final String screening_needless_review = "4"; //筛查无需复核
        public static final String review = "5"; //复核
        public static final String reject = "6"; //审核驳回
        public static final String success = "7"; //审核通过
        public static final String again_review = "8"; //重新复核
        public static final String edit = "9"; //编辑

    }


    /**
     * 是否入登记簿
     */
    public static class RegisterFlag {
        public static int YES = 1;//已入
        public static int NO = 0;//未入
    }


    public static class RelationType {
        public static final String initial = "1";//初始登记
        public static final String other = "2";//其他方式登记
        public static final String exchange = "3";//互换登记
        public static final String transfer = "4";//转让登记
        public static final String separation = "5";//分户登记
        public static final String merge = "6";//合户登记
        public static final String change_householder = "7";//变更户主登记
        public static final String requisition_land = "8";//征占用地块登记
        public static final String cancel = "9";//注销登记
        public static final String modify_contractor_info = "10";//'更新承包方代表信息登记'
        public static final String modify_contractor_family_info = "11";//'更新家庭成员登记'
        public static final String supplement_land = "12";//'补录地块登记'
        public static final String split_land = "13";//'分割地块登记'
        public static final String modify_land_path = "14";//'更新地块轮廓登记'
    }

    public static class Qzsflq {

        public static final String YES = "1";
        public static final String NO = "2";

    }

    /**
     * 地块检查接口，使用场景
     */
    public static class DkxxFlag {
        public static final int create_cbht = 0;
        public static final int applay_exchange = 1;
        public static final int applay_transfer = 2;
        public static final int supplement_land = 3;
        public static final int requisition_land = 4;
        public static final int modify_land_path = 5;
        public static final int split_land = 6;

    }

    /**
     * 承包方式 110：家庭承包   120：其他方式承包
     */
    public static class Cbfs {

        public static final String family = "110";
        public static final String other = "120";
    }

    /**
     * 承包方类型 1：农户   2：个人  3：单位
     */
    public static class Cbflx {

        public static final String farmer = "1";
        public static final String person = "2";
        public static final String company = "3";
    }

    /**
     * 占用耕地录入方式
     */
    public static class InputType {

        public static final int AUTOINPUT = 0;
        public static final int MANUALINPUT = 1;
    }

    /**
     * patrolRecordPlan检查计划表完成状态
     */

    public static class PatrolRecordPlan {
        public static final int YES = 1; //已完成

        public static final int NO = 0; //未完成
    }

    /**
     * 是否占用
     */
    public static class OccupyFlag {

        public static int YES = 1;//是
        public static int NO = 0;//否
    }

    /**
     * 是否分析
     */
    public static class AnalysisFlag {

        public static int YES = 1;//是
        public static int NO = 0;//否
    }


    public static class NoticeClientType{
        public static int ADMIN = 1;
        public static int MIDDLE_PLATFORM = 2;
    }

    /**
     * 添加公告的内容类型
     * 1：内容；2：外链
     */
    public static class NoticeContentFlag{
        public static int Content = 1;
        public static int OuterChain = 2;
    }
    /**
     * 0-种植期；1-采收期；2-采收已超期；3-种植已严重超期；
     */
    public static class PlantPlanAgriPlantPickStatus {
        public static final int Planting = 0;
        public static final int Picking = 1;
        public static final int OverPicking = 2;
        public static final int BigOverPicking = 3;

    }

    /**
     * 是否在公告中心显示 0 :不显示 1：显示
     */
    public static class NoticeCenterDisplay{
        public static int NOT = 0;
        public static int YES = 1;
    }

    /**
     * 手机系统通知提醒。0：不提醒；1：提醒
     */
    public static class NoticeMobileSystemNoticeReminderFlag{
        public static int NOT = 0;
        public static int YES = 1;
    }

    /**
     * 占用物类型
     */
    public static final Map<String, String> occupyCategory = Maps.newHashMap();

    static {
        occupyCategory.put("0", "其他");
        occupyCategory.put("1", "建筑物");
        occupyCategory.put("2", "水体");
        occupyCategory.put("3", "林地");
    }

    /**
     * 证件类型
     */
    public static final Map<String, String> cyzjlx = Maps.newHashMap();

    static {
        cyzjlx.put("1", "居民身份证");
        cyzjlx.put("2", "军官证");
        cyzjlx.put("3", "行政、企事业单位机构代码证或法人代码证");
        cyzjlx.put("4", "户口簿");
        cyzjlx.put("5", "护照");
        cyzjlx.put("9", "其他证件");
    }

    /**
     * 承包方家庭成员字段
     */
    public static final Map<String, String> cbfJtcyColumn = Maps.newHashMap();

    static {
        cbfJtcyColumn.put("cyxm", "成员姓名");
        cbfJtcyColumn.put("cyxb", "成员性别");
        cbfJtcyColumn.put("cyzjlx", "成员证件类型");
        cbfJtcyColumn.put("cyzjhm", "成员证件号码");
        cbfJtcyColumn.put("yhzgx", "成员与户主关系");
        cbfJtcyColumn.put("cybz", "成员备注");
        cbfJtcyColumn.put("sfgyr", "是否共有人");
        cbfJtcyColumn.put("cybzsm", "成员备注说明");
    }

    public static final Map<String, String> sfgyrColunm = Maps.newHashMap();

    static {
        sfgyrColunm.put("1", "是");
        sfgyrColunm.put("2", "否");
    }

    /**
     * 成员备注
     */
    public static final Map<String, String> cybz = Maps.newHashMap();
    static {
        cybz.put("1", "外嫁女");
        cybz.put("2", "入赘男");
        cybz.put("3", "在校大学生");
        cybz.put("4", "国家公职人员");
        cybz.put("5", "军人（军官、士兵）");
        cybz.put("6", "新生儿");
        cybz.put("7", "去世");
        cybz.put("9", "其他备注");
    }
    /**
     * 与户主关系
     */
    public static final Map<String, String> yhzgx = Maps.newHashMap();

    static {
        yhzgx.put("01", "本人");
        yhzgx.put("02", "户主");
        yhzgx.put("10", "配偶");
        yhzgx.put("11", "夫");
        yhzgx.put("12", "妻");
        yhzgx.put("20", "子");
        yhzgx.put("21", "独生子");
        yhzgx.put("22", "长子");
        yhzgx.put("23", "次子");
        yhzgx.put("24", "三子");
        yhzgx.put("25", "四子");
        yhzgx.put("26", "五子");
        yhzgx.put("27", "养子或继子");
        yhzgx.put("28", "女婿");
        yhzgx.put("29", "其他儿子");
        yhzgx.put("30", "女");
        yhzgx.put("31", "独生女");
        yhzgx.put("32", "长女");
        yhzgx.put("33", "次女");
        yhzgx.put("34", "三女");
        yhzgx.put("35", "四女");
        yhzgx.put("36", "五女");
        yhzgx.put("37", "养女或继女");
        yhzgx.put("38", "儿媳");
        yhzgx.put("39", "其他女儿");
        yhzgx.put("40", "孙子、孙女、外孙子、外孙女");
        yhzgx.put("41", "孙子 ");
        yhzgx.put("42", "孙女");
        yhzgx.put("43", "外孙子");
        yhzgx.put("44", "外孙女");
        yhzgx.put("45", "孙媳妇或外孙媳妇");
        yhzgx.put("46", "孙女婿或外孙女婿");
        yhzgx.put("47", "曾孙子或外曾孙子");
        yhzgx.put("48", "曾孙女或外曾孙女");
        yhzgx.put("49", "其他孙子、孙女、外孙子、外孙女");
        yhzgx.put("50", "父母");
        yhzgx.put("51", "父亲");
        yhzgx.put("52", "母亲");
        yhzgx.put("53", "公公");
        yhzgx.put("54", "婆婆");
        yhzgx.put("55", "岳父");
        yhzgx.put("56", "岳母");
        yhzgx.put("57", "继父或养父");
        yhzgx.put("58", "继母或养母");
        yhzgx.put("59", "其他父母关系");
        yhzgx.put("60", "祖父母 外祖父母");
        yhzgx.put("61", "祖父");
        yhzgx.put("62", "祖母");
        yhzgx.put("63", "外祖父");
        yhzgx.put("64", "外祖母");
        yhzgx.put("65", "配偶的祖父母 外祖父母");
        yhzgx.put("66", "曾祖父");
        yhzgx.put("67", "曾祖母");
        yhzgx.put("68", "配偶的曾祖父母 外曾祖父母");
        yhzgx.put("69", "其他祖父母或外租父母关系");
        yhzgx.put("70", "兄、弟、姐、妹");
        yhzgx.put("71", "兄");
        yhzgx.put("72", "嫂");
        yhzgx.put("73", "弟");
        yhzgx.put("74", "弟媳");
        yhzgx.put("75", "姐姐");
        yhzgx.put("76", "姐夫");
        yhzgx.put("77", "妹妹");
        yhzgx.put("78", "妹夫");
        yhzgx.put("79", "其他兄弟姐妹");
        yhzgx.put("80", "其他");
        yhzgx.put("81", "伯父");
        yhzgx.put("82", "伯母");
        yhzgx.put("83", "叔父");
        yhzgx.put("84", "婶母");
        yhzgx.put("85", "舅父");
        yhzgx.put("86", "舅母");
        yhzgx.put("87", "姨夫");
        yhzgx.put("88", "姨母");
        yhzgx.put("89", "姑父");
        yhzgx.put("90", "姑母");
        yhzgx.put("91", "堂兄弟、堂姐妹");
        yhzgx.put("92", "表兄弟、表姐妹");
        yhzgx.put("93", "侄子");
        yhzgx.put("94", "侄女");
        yhzgx.put("95", "外甥");
        yhzgx.put("96", "外甥女");
        yhzgx.put("97", "其他亲属");
        yhzgx.put("99", "非亲属");

    }


    /**
     * 模板权限 1：向下级政府主体开放 ； 2：仅仅当前政府主体
     */
    public static class TemplatePermission {
         public static final int OpenToLowerSubjectOpen = 1;
        public static final int OnlyOwnSubject = 2;


    }

    /****************************消息相关 start*****************************/
    /**
     * 消息是否被删除
     */
    public static class MessageDeleteFlag {
        public static final int NO = 0;
        public static final int YES = 1;
    }

    /**
     * '是否已读（1：是，0：否）'
     */
    public static class MessageReceiverReadFlag {
        public static final int NO = 0;
        public static final int YES = 1;
    }

    /**
     * '消息接收人是否删除（1：是，0：否）'
     */
    public static class MessageReceiverDeleteFlag {
        public static final int NO = 0;
        public static final int YES = 1;
    }

    /**
     * 消息分类附属小类：1：专家问答【专家端】专家收到农户的回复；；2：专家问答【专家端】专家收到农户新的提问；3 ：专家问答【专家端】专家收到专家的回复；4：专家问答【提问端】 农户收到了专家的回复；5 公告系统：公告发布通知
     *
     */
    public static class MessageTypeSubCode {
        public static final int EXPERT_RECEIVED_THE_REPLY_FROM_THE_FARMERS= 1;
        public static final int EXPERTS_RECEIVE_NEW_QUESTIONS_FROM_FARMERS= 2;
        public static final int EXPERTS_RECEIVE_NEW_REPLY_FROM_EXPERT= 3;
        public static final int FARMERS_RECEIVED_REPLY_FROM_EXPERTS = 4;
        public static final int PUBLISH_NOTICE= 5;
    }

    public static class MessageTypeCode {
        public static final String Notice = "XXLX100";
        public static final String Expert = "XXLX101";
    }

    public static class MessageClientCode {
        public static final String EXPERT = "expert";
        public static final String SNKOUDAI = "snkoudai";
    }
    /**
     * 排序方式常量
     */
    public static class SortType {

        public static final String DESC = "DESC";
        public static final String ASC = "ASC";
    }

    /**
     * 标准库数据上下架状态
     */
    public static class UpLowerShelves {
        // 已上架
        public static final int Upper = 0;
        // 已下架
        public static final int Lower = 1;
    }

    /**
     * 地块操作流程类型
     */
    public static class LandProcessActionType {
        public static final String add = "1";
        public static final String edit = "2";
        public static final String down_shelf = "3";


    }
    /**
     * 地块类别
     */
    public static class Dklb {
        public static final String chengBaoDi = "10";
        public static final String ziLiuDi = "21";
        public static final String jiDongDi = "22";
        public static final String kaiHuangDi = "23";
        public static final String qiTaJiTiTuDi = "99";
    }

    /**
     * 证书状态
     */
    public static enum  CertificateStatus {
        VALID(0,"待生效"),
        NORMAL(1,"生效中"),
        EXPIRED(2,"已过期"),
        DELETED(3,"已作废");
        private Integer status;
        private String name;

        CertificateStatus(Integer status, String name) {
            this.status = status;
            this.name = name;
        }

        public Integer getStatus() {
            return status;
        }

        public void setStatus(Integer status) {
            this.status = status;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }

    /**
     * 是否推送
     */
    public static class PushFlag {
        public static final Integer NO = 0;
        public static final Integer YES = 1;
    }

    /**
     * 推送状态
     */
    public static class PushStatus {
        public static final Integer SUCCESS = 1;
        public static final Integer FAIL = 2;
    }

    /**
     * 推送方式
     */
    public static class PushModel {
        public static final Integer SCHEDULED_TASKS = 1;//自动
        public static final Integer MANUAL_OPERAT = 2; //手动
    }

    //1-确权，2-三调，3-高标准，4-轮廓  0-查全部
    public static final Map<Integer, String> GisType = Maps.newHashMap();
    static {
        GisType.put(1, "QUEQUAN");
        GisType.put(2, "SANDIAO");
        GisType.put(3, "GAOBIAOZHUN");
        GisType.put(4, "LUNKUO");
    }
}

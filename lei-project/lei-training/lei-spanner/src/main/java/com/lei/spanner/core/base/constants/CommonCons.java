package com.lei.spanner.core.base.constants;

import com.google.common.collect.Maps;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * 该类用户存放请求接口中的参数取值定义（即除了数据库字典外的常量取值，比如登录类型）
 */
public class CommonCons {

    //===========================用户模块start=================================================//


    /**
     * 管理后台：打开或关闭用户某一种菜单的授权操作：1-打开授权，2-关闭授权
     */
    public static class AdminRoleAuthOperType {

        public static int OPEN = 1;
        public static int CLOSE = 2;
    }

    //===========================用户模块end=================================================//

    //===========================客户模块=================================================//

    public static final int FIELD_LEAGTH = 1000000000; //字段长度

    public static final BigDecimal FIELD_LEAGTH_DECIMAL = new BigDecimal(1000000000); //字段长度

    /**
     * 商品销售状态:1代表未售完，2代表已售完
     */
    public static class GOODS_SALE_STATUS {

        public static int NO = 1;//未售完
        public static int YES = 2;//已售完
    }

    /**
     * 是否下单已截止:0代表未截止，1代表已截止
     */
    public static class ORDER_CLOSE_STATUS {

        public static int NO = 0;//未截止
        public static int YES = 1;//已截止
    }

    /**
     * 是否销售完:1代表未售完，2代表已售完
     */
    public static class ORDER_SALE_STATUS {

        public static int NO = 1;//未售完
        public static int YES = 2;//已售完
    }

    /**
     * 下单状态:0代表未下单，1代表已下单
     */
    public static class ORDER_STATUS {

        public static int NO = 0;//未下单
        public static int YES = 1;//已下单
    }

    /**
     * 宅配计划状态:1代表未开始，2代表可下单 3.已截止 4代表已结束
     */
    public static class PLAN_STATUS {

        public static int NOSTART = 1;//未开始
        public static int ORDER = 2;//可下单
        public static int CLOSE = 3;//已截止
        public static int END = 4;//已结束
    }

    /**
     * 是否转换单位:1代表转化单位，2代表不转化单位
     */
    public static class CHANGE_UNIT {

        public static int YES = 1;//转化单位
        public static int NO = 2;//不转化单位
    }

    /**
     * 是否已下单:0代表未下单，1代表已下单
     */
    public static class COMPUTE {

        public static int ADD = 1;//代表加运算
        public static int SUBSTRACT = 2;//代表减运算
    }


    /**
     * 登陆code：0代表正常，1代表客户没有套餐，2代表套餐过期或剩余次数已用完 3代表客户没有宅配计划可下单
     */
    public static class CONSUME_LOGIN_CODE {

        public static int NORMAL = 0;//正常
        public static int NOPACAKGE = 1;//客户没有套餐
        public static int PACKAGEEXPIRE = 2;//套餐过期或剩余次数已用完
        public static int NOPLAN = 3;//客户没有宅配计划可下单
    }

    /**
     * 登陆类型:0代表未下单，1代表已下单
     */
    public static class CONSUME_LOGIN_TYPE {

        public static int WEIXIN = 1;//微信端
        public static int APP = 2;//APP端
    }

    /**
     * 卡包状态：0代表正常,1代表过期，2代表已用完
     */
    public static class CONSUME_CUSTOMERPACKAGE_STATUS {

        public static int NORMAL = 0;//正常
        public static int EXPIRE = 1;//过期
        public static int END = 2;//已用完
    }

    //========================produce-server-start===========================

    /**
     * 快速创建溯源
     */
    public static class QuickCreateQrCode {

        // 默认地块类型 大田
        public static Long LAND_TYPE_ID_DA_TIAN_DEFAULT = 1L;
        // 默认地块类型 养殖区
        public static Long LAND_TYPE_ID_YANG_ZHI_DEFAULT = 6L;
        //默认地块类型 水塘
        public static Long LAND_TYPE_ID_SHUI_TANG_DEFAULT = 4L;
        // 地块默认名称
        public static final String LAND_NAME_DEFAULT = "我的地块";
        // 地块面积
        public static final BigDecimal LAND_AREA_DEFAULT = new BigDecimal(10);
        //出栏默认数量
        public static final int PICK_NUM_DEFAULT = 10;
        // 采收默认数量
        public static final BigDecimal LAND_OUT_PUT_DEFAULT = new BigDecimal(10);
        // 面积单位
        public static final int LAND_ACRE_UNIT_DEFAULT = 1;

        public static final String WEIGHT = "重量：";

        public static final String NUMBER = "数量：";

        public static final String KG = "公斤";

        public static final String ZHU_SHU = "株数：";

        public static final String PLANT = "株";

        public static final String START_PLANT = "开始养殖";

        /**
         * 农业
         */
        public static final String TRANSPLANT_DEFAULT = "移栽";
        public static final String PICK_DEFAULT = "采收";

        /**
         * 林业
         */
        public static final String COMEOUT_DEFAULT = "出栏";
        /**
         * 畜牧业
         */
        public static final String BREED_DEFAULT = "养殖";

        /**
         * 鱼业
         */
        public static final String FISHERY_DEFAULT = "捕捞";
        public static final String FTY_DEFAULT = "投苗";
    }

    /**
     * 通用数字判断
     */
    public static class CurrencyNum {

        public static int ZERO = 0;
        public static int DEFAULT_NUM_ONE = 1;
        public static int SORT_NUM = 1000000000;
        public static BigDecimal PICK_ZERO = new BigDecimal(0);
        public static BigDecimal PICK_SORT_NUM = new BigDecimal(1000000000);
        public static int MACHINING_STEP_SIZE = 5;
    }

    /**
     * 种植计划农林牧渔；采收；默认添加农事对应得农事类型默认名称
     */
    public static class DefaultMissionCategoryName {

        //农业、林业
        public static final String YUMIAO = "育苗";
        public static final String YIZAI = "移栽";
        public static final String BOZHONG = "播种";
        public static final String CAISHOU = "采收";
        public static final String XIAOSHOU = "销售";
        //畜牧
        public static final String KAISHIYANGZHI = "开始养殖";
        public static final String CHULAN = "出栏";

        //水产
        public static final String TOUMIAO = "投苗";
        public static final String BULAO = "捕捞";
    }

    /**
     * 农事类型code
     */
    public static class MissionCategoryCode {

        public static final String FANGENG = "fangeng";
        public static final String ZHENGQI = "zhengqi";
    }

    //========================produce-server-end===========================

    //========================frp_appconfig===========================
    /**
     * 短信发送状态1.成功；0.失败
     **/
    public static final Integer MSG_SEND_SUCCESS = 1;
    public static final Integer MSG_SEND_FAIL = 0;

    //========================农资出入库相关===========================
    //农事使用
    public static final Long AGRI_RES_OUT_MISSION_ID = 1L;
    //农事删除
    public static final Long AGRI_RES_IN_MISSION_ID = 6L;
    public static String USING_AGRI_RES_SKU_PERMISSION = "produce:mission:usingAgriResSku";

    /**
     * 出入库类型操作
     */
    public enum AgriCategoryEnum {
        AGRI_RES_OUT_RECEIVE_ID_12(12L, "领用出库"),
        AGRI_RES_OUT_RECEIVE_ID_13(13L, "农资退回"),
        AGRI_RES_OUT_RECEIVE_ID_14(14L, "领用记录被删除"),
        AGRI_RES_OUT_RECEIVE_ID_15(15L, "领用农资"),
        AGRI_RES_OUT_RECEIVE_ID_16(16L, "退回记录被删除"),
        AGRI_RES_OUT_RECEIVE_ID_17(17L, "已领用农资退回"),
        ;
        private Long code;
        private String value;

        public Long getCode() {
            return code;
        }

        public String getValue() {
            return value;
        }

        AgriCategoryEnum(Long code, String value) {
            this.code = code;
            this.value = value;
        }
    }

    /**
     * 农资出入库类型
     */
    public enum AgriResInOutCategory {
        AgriResInOutCategory_3(3L, "调拨出库"),
        AgriResInOutCategory_4(4L, "报废出库"),
        AgriResInOutCategory_7(7L, "采购入库"),
        AgriResInOutCategory_8(8L, "调拨入库"),
        AgriResInOutCategory_12(12L, "领用出库");
        private Long code;
        private String value;

        public Long getCode() {
            return code;
        }

        public String getValue() {
            return value;
        }

        AgriResInOutCategory(Long code, String value) {
            this.code = code;
            this.value = value;
        }
    }

    /*************************************专家端-start************************************************/
    public static String EXPERT_USER_AGREEMENT_NAME_ = "专家问答用户协议";
    public static String EXPERT_PRIVACY_POLICY_NAME = "专家问答隐私政策";

    public static String SNKOUDAI_USER_AGREEMENT_NAME_ = "神农口袋隐私政策";
    public static String SNKOUDAI_PRIVACY_POLICY_NAME = "神农口袋用户协议";

    public static Long LOGIN_COUNT = 5L;

    public static Map<Long, Long> ZF_SN_AREA_MAP = new HashMap<>();

    static {
        //根据神农口袋区域id，获取执法区域id
        ZF_SN_AREA_MAP.put(310000L, 164131L);//上海市
        ZF_SN_AREA_MAP.put(310100L, 164132L);//上海市辖区
        ZF_SN_AREA_MAP.put(310101L, 164133L);//黄浦区
        ZF_SN_AREA_MAP.put(310104L, 164327L);//徐汇区
        ZF_SN_AREA_MAP.put(310105L, 164648L);//长宁区
        ZF_SN_AREA_MAP.put(310106L, 164844L);//静安区
        ZF_SN_AREA_MAP.put(310107L, 165135L);//普陀区
        ZF_SN_AREA_MAP.put(310109L, 165410L);//虹口区
        ZF_SN_AREA_MAP.put(310110L, 165632L);//杨浦区
        ZF_SN_AREA_MAP.put(310112L, 165958L);//闵行区
        ZF_SN_AREA_MAP.put(310113L, 166536L);//宝山区
        ZF_SN_AREA_MAP.put(310114L, 167026L);//嘉定区
        ZF_SN_AREA_MAP.put(310115L, 167380L);//浦东新区
        ZF_SN_AREA_MAP.put(310116L, 168722L);//金山区
        ZF_SN_AREA_MAP.put(310117L, 168957L);//松江区
        ZF_SN_AREA_MAP.put(310118L, 169315L);//青浦区
        ZF_SN_AREA_MAP.put(310120L, 169630L);//奉贤区
        ZF_SN_AREA_MAP.put(310230L, 169937L);//崇明区

        //根据执法区域id，获取神农口袋区域id
        ZF_SN_AREA_MAP.put(164131L, 310000L);//上海市
        ZF_SN_AREA_MAP.put(164132L, 310100L);//上海市辖区
        ZF_SN_AREA_MAP.put(164133L, 310101L);//黄浦区
        ZF_SN_AREA_MAP.put(164327L, 310104L);//徐汇区
        ZF_SN_AREA_MAP.put(164648L, 310105L);//长宁区
        ZF_SN_AREA_MAP.put(164844L, 310106L);//静安区
        ZF_SN_AREA_MAP.put(165135L, 310107L);//普陀区
        ZF_SN_AREA_MAP.put(165410L, 310109L);//虹口区
        ZF_SN_AREA_MAP.put(165632L, 310110L);//杨浦区
        ZF_SN_AREA_MAP.put(165958L, 310112L);//闵行区
        ZF_SN_AREA_MAP.put(166536L, 310113L);//宝山区
        ZF_SN_AREA_MAP.put(167026L, 310114L);//嘉定区
        ZF_SN_AREA_MAP.put(167380L, 310115L);//浦东新区
        ZF_SN_AREA_MAP.put(168722L, 310116L);//金山区
        ZF_SN_AREA_MAP.put(168957L, 310117L);//松江区
        ZF_SN_AREA_MAP.put(169315L, 310118L);//青浦区
        ZF_SN_AREA_MAP.put(169630L, 310120L);//奉贤区
        ZF_SN_AREA_MAP.put(169937L, 310230L);//崇明区
    }

    public static final Map<String, String> rankTypeMap = Maps.newHashMap();

    static {
        rankTypeMap.put("0", "1=1");
        rankTypeMap.put("1", "a.dep_rank is not null ");
        rankTypeMap.put("2", "a.city_rank is not null ");
        rankTypeMap.put("3", "a.county_rank is not null ");
        rankTypeMap.put("1,2", "a.dep_rank is not null and a.city_rank is not null ");
        rankTypeMap.put("1,3", "a.dep_rank is not null and a.county_rank is not null ");
        rankTypeMap.put("2,3", "a.city_rank is not null and a.county_rank is not null ");
        rankTypeMap.put("1,2,3", "a.dep_rank is not null and a.city_rank is not null and a.county_rank is not null ");
    }

    /**
     * gis主体等级和状态map
     */
    public static final Map<Integer, String> rankMap = Maps.newHashMap();

    public static final Map<Integer, String> farmStatusMap = Maps.newHashMap();

    public static final Map<Integer, String> creditLevelMap = Maps.newHashMap();

    static {
        rankMap.put(1, "国家级");
        rankMap.put(2, "省级");
        rankMap.put(3, "市级");
        rankMap.put(4, "区级");
        rankMap.put(5, "非示范");

        farmStatusMap.put(0, "未知");
        farmStatusMap.put(1, "良好");
        farmStatusMap.put(2, "一般");
        farmStatusMap.put(3, "异常或停业");

        creditLevelMap.put(0, "未划分");
        creditLevelMap.put(1, "A等");
        creditLevelMap.put(2, "B等");
        creditLevelMap.put(3, "C等");
        creditLevelMap.put(4, "D等");
    }

    //===========================gisData模块start=================================================//
    /**
     * gisData 产权交易模块
     */
    public static final Map<Integer, String> tradingModeMap = Maps.newHashMap();
    public static final Map<Integer, String> tradingCategoryMap = Maps.newHashMap();

    static {
        tradingModeMap.put(1, "比选");
        tradingModeMap.put(2, "电子竞价");
        tradingModeMap.put(3, "挂牌成交");
        tradingModeMap.put(4, "竞争性磋商");
        tradingModeMap.put(5, "竞争性谈判");
        tradingModeMap.put(6, "密封式报价");
        tradingModeMap.put(7, "随机抽取");
        tradingModeMap.put(8, "协议成交");
        tradingModeMap.put(9, "询价");
        tradingModeMap.put(10, "网络竞价");

        tradingCategoryMap.put(1, "安置房");
        tradingCategoryMap.put(2, "农业产业招商");
        tradingCategoryMap.put(3, "非政府采购");
        tradingCategoryMap.put(4, "耕地占补");
        tradingCategoryMap.put(5, "国有资产");
        tradingCategoryMap.put(6, "集体经营资产");
        tradingCategoryMap.put(7, "农产品");
        tradingCategoryMap.put(8, "其他资产处置");
        tradingCategoryMap.put(9, "涉农项目");
        tradingCategoryMap.put(10, "土地经营权");
        tradingCategoryMap.put(11, "闲置农房");
        tradingCategoryMap.put(12, "工程招标");
        tradingCategoryMap.put(13, "政府采购");
        tradingCategoryMap.put(14, "养殖水面");
        tradingCategoryMap.put(15, "增减挂钩");
    }
    //===========================gisData模块end=================================================//


    /**
     * 库存出入库类型
     */
    public static class StockActionType {

        /**
         * 采收入库
         */
        public static Long IN_PICK = 1L;
        /**
         * 销售删除入库
         */
        public static Long IN_DEL_SELL = 2L;
        /**
         * 外采入库
         */
        public static Long OUTSOURCING = 3L;
        /**
         * 损耗删除入库
         */
        public static Long IN_DEL_SPOILAGE = 4L;
        /**
         * 采收删除出库
         */
        public static Long OUT_PICK = 10L;
        /**
         * 销售出库
         */
        public static Long OUT_SELL = 11L;
        /**
         * 损耗出库
         */
        public static Long OUT_SPOILAGE = 12L;
    }

    /**
     * 加减库存
     */
    public static class StockType {

        /**
         * 入库
         */
        public static Long IN_STOCK = 1L;
        /**
         * 出库
         */
        public static Long OUT_STOCK = 2L;
    }

    /**
     * 库存操作来源
     */
    public static class StockActionSource {

        /**
         * 销售
         */
        public static Long STOCK_SELL = 10L;
        /**
         * 采收
         */
        public static Long STOCK_PICK = 1L;
        /**
         * 损耗
         */
        public static Long STOCK_SPOILAGE = 2L;
        /**
         * 外采
         */
        public static Long STOCK_OUTSOURCING = 3L;
    }

    /**
     * 作物属性类型
     */
    public static class StockCropPropertyType {

        /**
         * 种植作物
         */
        public static Long STOCK_CROP_PRODUCE = 1L;
        /**
         * 外采作物
         */
        public static Long STOCK_OUTSOURCING = 2L;
    }

    //===========================landowner模块start=================================================//
    //与户主关系——戶主
    public static class Yhzgx {

        public static final String HZ = "02";
    }

    //是否共有人
    public static class Sfgyr {

        public static final String YES = "1";
        public static final String NO = "2";
    }

    //承包合同编码后缀
    public static final Map<String, String> CbhtbmMap = Maps.newHashMap();

    public static final Map<String, String> fzjgMap = Maps.newHashMap();

    static {
        CbhtbmMap.put("110", "J");
        CbhtbmMap.put("120", "Q");

        //每个区域的发证机关都不一样，根据区域id来配置
        fzjgMap.put("510603", "旌阳区人民政府");
    }

    //===========================landowner模块end=================================================//
    // ===========================landoccupy模块start=================================================//
    //    //用于异步更新耕地占用物gis服务
    //    public static class MQCons {
    //
    //        public static final String EXCHANGE_LAND_OCCUPY = "exchange.land.occupy";
    //        public static final String ROUTING_OCCUPY_ADD = "routing.occupy.add";
    //        public static final String ROUTING_OCCUPY_EDIT = "routing.occupy.edit";
    //        //队列
    //        public static final String QUEUE_OCCUPY_ADD = "queue.occupy.add";
    //        public static final String QUEUE_OCCUPY_EDIT = "queue.occupy.edit";
    //    }


    public static final Map<String, String> occupyCategory = Maps.newHashMap();

    static {
        occupyCategory.put("0", "其他");
        occupyCategory.put("1", "建筑物");
        occupyCategory.put("2", "水体");
        occupyCategory.put("3", "林地");
    }

    // ===========================landoccupy模块end=================================================//
    //是否关联政府主体
    public static class RelateFlag {

        public static final Integer YES = 1;
        public static final Integer NO = 0;
    }

    public static class AreaCode {

        /**
         * 上海直辖市
         */
        public static final Long SHANGHAI_PROVINCE_ID = 310000L;

        /**
         * 上海市辖区
         */
        public static final Long SHANGHAI_CITY_ID = 310100L;

        public static final String SICHUAN_DEYANG_CITY_ID = "510600";

        public static final String XINJIANG_AKESU_CITY_ID = "652900";

    }
}

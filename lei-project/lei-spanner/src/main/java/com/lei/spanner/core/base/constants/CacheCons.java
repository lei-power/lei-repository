package com.lei.spanner.core.base.constants;

public class CacheCons {

    public static final String CACHE_PRIFIX = "cache:";
    public static final String CACHE_SEPARATOR = "_";

    public static final String REQ_TOKEN_NAME = "accessToken";
    public static final String CACHE_TOKEN_PRE = "token_";//token格式：token_{userId}_{uuid}。例如用户id为1的token格式：tokne_1_jifajifjaijfiaj
    public static final int CACHE_ACCESSTOKEN_EXPIRE = 7200;

    public static final String CONSUME_CACHE_TOKEN_PRE = "consume_token_";//token格式：token_{userId}_{uuid}。例如用户id为1的token格式：tokne_1_jifajifjaijfiaj
    public static final int CONSUME_CACHE_ACCESSTOKEN_EXPIRE = 7200;

    public static final String CACHE_TOKEN_ADMIN_PRE = "ad_token_";//token格式：ad_token_{userId}_{uuid}。例如用户id为1的token格式：ad_token_1_jifajifjaijfiaj

    //TODO 上线改成2小时 2 * 60 * 60
    public static final int CACHE_ACCESSTOKEN_ADMIN_EXPIRE = 2 * 60 * 60;


    public static final String CACHE_TOKEN_GOV_PRE = "gov_token_";//token格式：ad_token_{userId}_{uuid}。例如用户id为1的token格式：ad_token_1_jifajifjaijfiaj
    //    public static final int CACHE_ACCESSTOKEN_GOV_EXPIRE=24*60*60;
    //todo 设置redis中token过期时间 单位：秒  正式上线设置 60 * 10
    public static final int CACHE_ACCESSTOKEN_GOV_EXPIRE = 60 * 10;


    public static final String CACHE_TOKEN_OPER_PRE = "oper_token_";//token格式：ad_token_{userId}_{uuid}。例如用户id为1的token格式：ad_token_1_jifajifjaijfiaj
    public static final int CACHE_ACCESSTOKEN_OPER_EXPIRE = 24 * 60 * 60 * 7;


    public static final int ACCESSTOKEN_EXPIRE_DAY_WEB = 15;//web端token有效期15天
    public static final int ACCESSTOKEN_EXPIRE_DAY_APP = 30;//app端token有效期30天
    public static final int CONSUME_ACCESSTOKEN_EXPIRE_DAY_GRANT = 30;//微信小程序授权登陆token有效期30天
    public static final int CONSUME_ACCESSTOKEN_EXPIRE_DAY_PHOENSMS = 30;//微信小程序用户名和验证码登陆token有效期30天


    public static final int GOV_ACCESSTOKEN_EXPIRE_DAY_WEB = 30;//web端token有效期15天
    //todo 设置数据库表token过期时间 单位：秒  正式上线设置为7200
    public static final int GOV_ACCESSTOKEN_EXPIRE_SECOND_WEB = 7200;//web端token有效期2小时

    public static final int GOV_ACCESSTOKEN_EXPIRE_DAY_APP = 30;//app端token有效期30天

    public static final int GOV_ACCESSTOKEN_EXPIRE_DAY_WXMINI = 180;//微信小程序端token有效期30天


    //农产品价格网，某一农作物某一个身份下，市场价格趋势缓存前缀
    public static final String CACHE_PRE_NC_MARKET_CROP_PRICE = "cache_nc_m_c_p_";


    //神农口袋经营主体统计缓存key
    public static final String cache_produce_land_getFarmBusinessEntityScaleDistributionByAreaTypeAndAreaId_prefix =
            CACHE_PRIFIX + "p_d:land_g_f_b_e_s_d_a_t_ai:";

    //种植业经营主体统计缓存key
    public static final String cache_nongwei_zzstaticbascompany_getCompanyCountByBetweenPlotArceSumAndArea_prefix =
            CACHE_PRIFIX + "n_w:land_g_f_b_e_s_d_a_t_ai:";

    //神农口袋查询农场缓存key
    public static final String cache_produce_stasticfarm_getListByFarmAreaTypeAndAreaId_prefix = CACHE_PRIFIX + "p_d:sf_g_l_b_f_a_t_a_ai:";

    //种植管理系统查询肥料缓存key
    public static final String cache_nongwei_zzstatsticsscfarmmonth_getByFarmAreaIdAndDateStrAndFtype_prefix = CACHE_PRIFIX + "n_w:zsfm_g_b_f_a_i_a_d_af:";


    //上海gis的Token缓存key
    public static final String CACHE_SH_GIS_TOKEN = "sh_gis_token";

    //左岸gis的Token缓存key
    public static final String CACHE_ZA_GIS_TOKEN = "za_gis_token";

    //上海理想数据治理2.0版本token缓存key
    public static final String CACHE_SH_SZNY_TOKEN = "sh_szny_token";


    //海宁智慧农业云平台 缓存key
    public static final String CACHE_HAI_NING_TOKEN = "hai_ning_token";

    //==============================大数据平台总览页 start======================

    //种植管理系统查询在田面积缓存key
    public static final String cache_nongwei_zzscfarm_getSumLandArceDisctinctOnPlantByFarmAreaTypeAndQu_prefix = CACHE_PRIFIX + "n_w:zsf_g_s_l_a_p_tq:";

    //种植管理系统查询可种植面积缓存key
    public static final String cache_nongwei_zzBasCompany_getSumLandArceByFarmAreaTypeAndQu_prefix = CACHE_PRIFIX + "n_w:zbc_g_s_l_a_tq:";

    //种植管理系统查询地块总面积缓存key
    public static final String cache_nongwei_lvseLandCertifi_getSumAreaByFarmAreaId_prefix = CACHE_PRIFIX + "n_w:llc_g_s_a_f_ai:";

    //种植管理系统查询认证地块数量缓存key
    public static final String cache_nongwei_lvseLandCertifi_getCountByFarmAreaId_prefix = CACHE_PRIFIX + "n_w:llc_g_c_f_ai:";

    //种植管理系统查询统证企业数量缓存key
    public static final String cache_nongwei_lvseCompany_getCountByFarmAreaId_prefix = CACHE_PRIFIX + "n_w:lc_g_c_f_ai:";

    //神农口袋查询农场数量缓存key
    public static final String cache_produce_farm_staticFarmCountByAreaTypeAndAreaId_prefix = CACHE_PRIFIX + "p_d:farm_s_f_c_a_t_ai:";

    //种植管理系统查询企业数量缓存key
    public static final String cache_nongwei_zzBasCompany_getCompanyCountByQu_prefix = CACHE_PRIFIX + "n_w:zbc_g_c_c_bq:";

    //种植管理系统查询流转面积缓存key
    public static final String cache_nongwei_zzBasCompany_getSumFarmArceByFarmAreaTypeAndQu_prefix = CACHE_PRIFIX + "n_w:zbc_g_s_f_a_tq:";

    //神农口袋土地流转面积缓存key
    public static final String cache_produce_stasticFarm_getSumFarmArceByFarmAreaTypeAndAreaId_prefix = CACHE_PRIFIX + "p_d:sf_g_s_f_a_ti:";

    //神农口袋可种植面积缓存key
    public static final String cache_produce_stasticFarm_getSumLandArceByFarmAreaTypeAndAreaId_prefix = CACHE_PRIFIX + "p_d:sf_g_s_l_a_ti:";

    //神农口袋在田面积缓存key
    public static final String cache_produce_stasticFarm_getSumLandArceDisctinctOnPlantByFarmAreaTypeAndAreaId_prefix =
            CACHE_PRIFIX + "p_d:sf_g_s_l_a_d_p_ti:";

    //农委查询查询地块信息，地块编号，地块最新种植的作物缓存key
    public static final String cache_nongwei_zzStaticBasCompany_listByCompanyCode_prefix = CACHE_PRIFIX + "n_w:zsbc_l_b_c_c:";

    //获取种植业农场名称，土地扭转面积，可种植面积缓存key
    public static final String cache_nongwei_zzStaticBasCompany_getNameAndAreas_prefix = CACHE_PRIFIX + "n_w:zsbc_g_n_a_a:";

    //种植管理系统农场农事缓存key
    public static final String cache_nongwei_zzStaticBasCompanyService_listByCompanyCode_prefix = CACHE_PRIFIX + "n_w:zsbcs_l_b_c_c:";

    //==============================大数据平台总览页 end=====================

    public static final String UAA_KEY = "uaa:";
}

package com.lei.spanner.core.base.constants;

public class LockCons {

    public static final String ADD_OUT_SOURCE_INFO = "add_out_source_info_";
    private static String LockBase="lock_";




    //========================user-server-start===========================
    public static String UserLoginPhonePre=LockBase+"login_phone_";
    public static String UserLoginWeixinTokenPre=LockBase+"login_weixin_";
    public static String UserLoginPhoneAndWeixinPre=LockBase+"login_phone_wexin_";
    //========================user-server-end===========================


    //========================produce-server-start===========================
    public static String machiningStepAgriAddPre = LockBase+"ma_st_agri_add_";
    public static String machiningStepAgriEditOrDelPre = LockBase+"ma_st_agri_ed_";

    public static String machiningStepAnimalAddPre = LockBase+"ma_st_animal_add_";
    public static String machiningStepAnimalEditOrDelPre = LockBase+"ma_st_animal_ed_";

    public static String machiningStepFisheryAddPre = LockBase+"ma_st_fishery_add_";
    public static String machiningStepFisheryEditOrDelPre = LockBase+"ma_st_fishery_ed_";

    public static String machiningStepForestryAddPre = LockBase+"ma_st_forestry_add_";
    public static String machiningStepForestryEditOrDelPre = LockBase+"ma_st_forestry_ed_";

    public static String machiningProcessEditOrDelPre = LockBase+"mac_pr_ed_";


    //========================produce-server-end===========================



    public static String gisFarmQueQuanLandRefAdd = LockBase+"gis_ql_ref_add_";

    public static String gisFarmQueQuanLandRefDel = LockBase+"gis_ql_ref_del_";

    public static String gisSyncLandToSn = LockBase+"gis_s_l_sn_";

    public static String gisSyncFarmToSn = LockBase+"gis_s_f_sn_";

    public static String gisOpenAndSyncFarmToSn = LockBase+"gis_o_a_s_f_sn_";

    //========================appconfig-server-start===========================

    //========================appconfig-server-end===========================






    //========================operate-server-start===========================

    //========================operate-server-end===========================




    //========================customer-server-start===========================
    public static String AddCustomer=LockBase+"customer_name_";
    public static String AddAddress=LockBase+"address_rephone_";
    public static String CustomerPackage=LockBase+"customerPackage_";
    public static String EditPackageCanNumber=LockBase+"package_cannumber_";
    public static String AddOrder=LockBase+"order_id_";
    public static String DelOrder=LockBase+"order_no_";
    //========================customer-server-end===========================




    //==============================专家系统 start======================
    //问题并发锁
    public static final String Question = LockBase+"question_id_";
    //==============================专家系统 end=====================

}

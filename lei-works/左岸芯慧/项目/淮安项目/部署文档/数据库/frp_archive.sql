SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_archive_agri_mechanisation_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_agri_mechanisation_statistics`;
CREATE TABLE `tbl_archive_agri_mechanisation_statistics`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT,
    `plant_plan_id`           bigint(20) NULL DEFAULT NULL COMMENT '种植计划id',
    `plant_start_date`        date NULL DEFAULT NULL COMMENT '种植时间',
    `close_date`              date NULL DEFAULT NULL COMMENT '种植结束时间',
    `status`                  int(11) NULL DEFAULT 0 COMMENT '1结束  0未结束',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id，租户标识，saas系统必备',
    `company_name`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '主体类型',
    `company_category_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`        int(11) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '村名称',
    `statistics_flag`         int(11) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `gis_land_type_id`        bigint(20) NULL DEFAULT NULL COMMENT '地块用途id',
    `gis_land_type_name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块用途名称',
    `land_type_id`            bigint(20) NULL DEFAULT NULL COMMENT '地块类型id',
    `land_type_name`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块类型名称',
    `land_group_id`           bigint(20) NULL DEFAULT NULL COMMENT '地块分组id',
    `land_group_name`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块分组名称',
    `land_id`                 bigint(20) NULL DEFAULT NULL COMMENT '地块id',
    `sh_gis_dkid`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应上海测绘院地块id(地块编码)',
    `land_name`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块名称',
    `land_acre`               decimal(30, 2) NULL DEFAULT NULL COMMENT '地块面积',
    `crop_category_id`        bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_id`                 bigint(20) NULL DEFAULT NULL COMMENT '作物种类id',
    `crop_name`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物种类名称',
    `sown_area`               decimal(30, 2) NULL DEFAULT NULL COMMENT '播种面积(亩)',
    `zhibo_area`              decimal(30, 2) NULL DEFAULT NULL COMMENT '直播-机械面积',
    `yizai_area`              decimal(30, 2) NULL DEFAULT NULL COMMENT '移栽-机械面积',
    `fangeng_area`            decimal(30, 2) NULL DEFAULT NULL COMMENT '翻耕-机械面积',
    `fangeng_mission_id`      bigint(20) NULL DEFAULT NULL COMMENT '翻耕农事id',
    `zhengqi_area`            decimal(30, 2) NULL DEFAULT NULL COMMENT '整畦-机械面积',
    `zhengqi_mission_id`      bigint(20) NULL DEFAULT NULL COMMENT '整畦农事id',
    `pick_area`               decimal(30, 2) NULL DEFAULT NULL COMMENT '采收-机械面积',
    `pick_record_id`          bigint(20) NULL DEFAULT NULL COMMENT '采收记录id',
    `create_time`             datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_plant_plan_id` (`plant_plan_id`) USING BTREE,
    INDEX                     `idx_farm_id` (`farm_id`) USING BTREE,
    INDEX                     `idx_plant_start_date` (`plant_start_date`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农业机械化统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_agri_res_use_area_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_agri_res_use_area_month`;
CREATE TABLE `tbl_archive_agri_res_use_area_month`
(
    `id`                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `record_key`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月份字符串，格式：yyyy-MM',
    `record_start_date`         date NULL DEFAULT NULL COMMENT '统计的起始日期',
    `record_end_date`           date NULL DEFAULT NULL COMMENT '统计的结束日期',
    `feiliao_use_value`         decimal(15, 2) NULL DEFAULT NULL COMMENT '肥料用量：单位 公斤，四舍五入保留2位小数',
    `nongyao_use_value`         decimal(15, 2) NULL DEFAULT NULL COMMENT '农药用量：单位 公斤，四舍五入保留2位小数',
    `yuyao_use_value`           decimal(15, 2) NULL DEFAULT NULL COMMENT '渔药用量：单位 公斤，四舍五入保留2位小数',
    `xumu_siliao_use_value`     decimal(15, 2) NULL DEFAULT NULL COMMENT '畜牧饲料用量：单位 公斤，四舍五入保留2位小数',
    `shuichan_siliao_use_value` decimal(15, 2) NULL DEFAULT NULL COMMENT '水产饲料用量：单位 公斤，四舍五入保留2位小数',
    `shouyao_use_value`         decimal(15, 2) NULL DEFAULT NULL COMMENT '兽药用量：单位 公斤，四舍五入保留2位小数',
    `zhongmiao_use_value`       decimal(15, 2) NULL DEFAULT NULL COMMENT '种苗用量：单位 公斤，四舍五入保留2位小数',
    `statistics_mode`           tinyint(2) NULL DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_recordKey` (`area_id`, `record_key`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农资使用统计-区域-按月份统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_arable_land_occupy_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_arable_land_occupy_day`;
CREATE TABLE `tbl_archive_arable_land_occupy_day`
(
    `id`                              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `arable_land_batch_record_id`     bigint(20) NOT NULL COMMENT '耕地占用批次信息id',
    `arable_land_batch_record_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耕地占用批次信息名称',
    `area_id`                         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `total_land_acre`                 decimal(16, 2) NULL DEFAULT NULL COMMENT '三调耕地总面积（汇总统计该区域所有三调耕地地块的面积之和) 单位：亩',
    `total_occupy_arable_land_acre`   decimal(16, 2) NULL DEFAULT NULL COMMENT '占用耕地面积（汇总统计该区域所有占用物占用耕地的面积之和) 单位：亩',
    `total_building_arable_land_acre` decimal(16, 2) NULL DEFAULT NULL COMMENT '建筑物占用耕地面积（汇总统计该区域所有建筑物占用物占用耕地的面积之和) 单位：亩',
    `total_ford_arable_land_acre`     decimal(16, 2) NULL DEFAULT NULL COMMENT '水体占用耕地面积（汇总统计该区域所有水体占用物占用耕地的面积之和) 单位：亩',
    `total_forest_arable_land_acre`   decimal(16, 2) NULL DEFAULT NULL COMMENT '林地占用耕地面积（汇总统计该区域所有林地占用物占用耕地的面积之和) 单位：亩',
    `total_other_arable_land_acre`    decimal(16, 2) NULL DEFAULT NULL COMMENT '其他占用耕地面积（汇总统计该区域所有其他占用物占用耕地的面积之和) 单位：亩',
    `land_occupy_count`               int(11) NULL DEFAULT 0 COMMENT '占用物数量',
    `create_time`                     datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`                     datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `batch_area_uk` (`arable_land_batch_record_id`, `area_id`) USING BTREE COMMENT '批次id和区域id联合主键'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '占用耕地按日归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_arable_land_occupy_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_arable_land_occupy_month`;
CREATE TABLE `tbl_archive_arable_land_occupy_month`
(
    `id`                            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_month_str`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按月统计时间:例如：2020-01',
    `arable_land_batch_record_id`   bigint(20) NOT NULL COMMENT '耕地占用批次信息id',
    `arable_land_batch_record_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耕地占用批次信息名称',
    `area_id`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `total_check_count`             int(11) NULL DEFAULT 0 COMMENT '统计该区域所有占用物筛查次数',
    `total_review_count`            int(11) NULL DEFAULT 0 COMMENT '统计该区域所有占用物复核次数',
    `total_audit_count`             int(11) NULL DEFAULT 0 COMMENT '统计该区域所有占用物审核次数',
    `create_time`                   datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`                   datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `batch_area_date_uk` (`arable_land_batch_record_id`, `area_id`, `archive_month_str`) USING BTREE COMMENT '批次和区域时间联合主键'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '占用耕地处理按月归档表（增量）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_arable_land_occupy_month_full
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_arable_land_occupy_month_full`;
CREATE TABLE `tbl_archive_arable_land_occupy_month_full`
(
    `id`                            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `arable_land_batch_record_id`   bigint(20) NOT NULL COMMENT '耕地占用批次信息id',
    `arable_land_batch_record_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耕地占用批次信息名称',
    `area_id`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `total_check_count`             int(11) NULL DEFAULT 0 COMMENT '统计该区域所有占用物筛查次数',
    `total_review_count`            int(11) NULL DEFAULT 0 COMMENT '统计该区域所有占用物复核次数',
    `total_audit_count`             int(11) NULL DEFAULT 0 COMMENT '统计该区域所有占用物审核次数',
    `create_time`                   datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`                   datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `batch_area_uk` (`arable_land_batch_record_id`, `area_id`) USING BTREE COMMENT '批次id,区域id联合主键'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '占用耕地处理按月归档表（全量）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_area_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_area_config`;
CREATE TABLE `tbl_archive_area_config`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `level`       tinyint(4) NULL DEFAULT NULL COMMENT '区域等级',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_area_farm_land_acre
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_area_farm_land_acre`;
CREATE TABLE `tbl_archive_area_farm_land_acre`
(
    `id`                  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`             int(11) NULL DEFAULT NULL COMMENT '区域id',
    `area_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `farm_count`          int(11) NULL DEFAULT NULL COMMENT '主体家数（对应区域下参与统计的经营主体数量合计）',
    `land_count`          int(11) NULL DEFAULT NULL COMMENT '地块总数',
    `land_area`           decimal(15, 2) NULL DEFAULT NULL COMMENT '地块面积之和(亩)',
    `liangtian_area`      decimal(15, 2) NULL DEFAULT NULL COMMENT '粮田面积（亩）',
    `jingzuo_area`        decimal(15, 2) NULL DEFAULT NULL COMMENT '经作田面积（亩）',
    `guoyuan_area`        decimal(15, 2) NULL DEFAULT NULL COMMENT '果园面积（亩）',
    `caitian_area`        decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田面积（亩）',
    `shuichan_breed_area` decimal(15, 2) NULL DEFAULT NULL COMMENT '水产养殖面积(池塘面积)（亩）',
    `xumu_breed_area`     decimal(15, 2) NULL DEFAULT NULL COMMENT '畜牧养殖面积(栏舍面积)（亩）',
    `create_time`         datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_area_id` (`area_id`) USING BTREE COMMENT '区域id唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '地块面积-按区域-按日归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_area_onland_crop_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_area_onland_crop_day`;
CREATE TABLE `tbl_archive_area_onland_crop_day`
(
    `id`                       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                  bigint(20) NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `crop_id`                  bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_img_url`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物图片',
    `crop_group_id`            bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_group_img_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物分组图片地址',
    `crop_category_id`         bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_category_logo_url`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物小类logo地址',
    `crop_category_identifier` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类唯一标识',
    `crop_subject_id`          bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_subject_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类名称',
    `crop_subject_logo_url`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物大类logo地址',
    `crop_subject_identifier`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类唯一标示',
    `lvyecai_flag`             tinyint(2) NULL DEFAULT NULL COMMENT '该作物是否为绿叶菜',
    `onland_count`             int(20) NULL DEFAULT NULL COMMENT '该区域，该作物的当前在田地块个数',
    `onland_area`              decimal(15, 2) NULL DEFAULT NULL COMMENT '该区域，该作物的当前在田面积之和（亩）',
    `onland_farm_count`        int(20) NULL DEFAULT NULL COMMENT '该区域，该作物的当前在田主体家数',
    `create_time`              datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`              datetime NULL DEFAULT NULL COMMENT '更新时间',
    `archive_date`             date NULL DEFAULT NULL COMMENT '归档日期',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uni_area_cop_date` (`area_id`, `crop_id`, `archive_date`) USING BTREE COMMENT '区域id+作物id+date唯一键'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = ' 在田面积按区域按作物按日统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_certificate
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_certificate`;
CREATE TABLE `tbl_archive_certificate`
(
    `id`                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `farm_id`                   bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`              varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`           tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_sort_num`             int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `farm_acre`                 decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `attr_key_zl_unit`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重量单位',
    `attr_key_zl_num`           decimal(15, 2) NULL DEFAULT NULL COMMENT '重量',
    `crop_id`                   int(11) NULL DEFAULT NULL COMMENT '作物Id',
    `crop_name`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名',
    `crop_group_id`             int(11) NULL DEFAULT NULL COMMENT '分组Id',
    `crop_group_name`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名',
    `crop_category_id`          int(11) NULL DEFAULT NULL COMMENT '小类Id',
    `crop_category_name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小类名',
    `crop_subject_id`           int(11) NULL DEFAULT NULL COMMENT '大类Id',
    `crop_subject_name`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大类名',
    `company_id`                int(11) NULL DEFAULT NULL COMMENT '企业Id',
    `create_time`               datetime NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`               datetime NULL DEFAULT CURRENT_TIMESTAMP,
    `year_month_day`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合格证生成时间',
    `certificate_scan_count`    int(10) NULL DEFAULT NULL COMMENT '合格证扫码次数',
    `certificate_count`         int(10) NULL DEFAULT NULL COMMENT '合格证次数',
    `company_name`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`       bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `legal_person`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`          tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `enterprise_credit_code`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `certificate_template_type` int(2) NULL DEFAULT NULL COMMENT '合格证模版类型',
    `company_category_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `business_category_ids`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营类目id',
    `business_category_names`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营类目名称字段',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '合格证归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_certificate_area
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_certificate_area`;
CREATE TABLE `tbl_archive_certificate_area`
(
    `id`                      bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `farm_id`                 bigint(11) NULL DEFAULT NULL COMMENT '农场id',
    `year_month`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间(月度)',
    `farm_name`               varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `business_category_ids`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `certificates_num`        bigint(11) NULL DEFAULT NULL COMMENT '合格证生成张数(张)',
    `opener_weight`           decimal(11, 2) NULL DEFAULT NULL COMMENT '合格证开具重量(公斤)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_certificate_farm_crop
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_certificate_farm_crop`;
CREATE TABLE `tbl_archive_certificate_farm_crop`
(
    `id`               bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `certificate_id`   bigint(11) NULL DEFAULT NULL COMMENT '合格证id',
    `farm_id`          bigint(11) NULL DEFAULT NULL COMMENT '农场id',
    `certificate_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合格证编码',
    `crop_id`          int(11) NULL DEFAULT NULL COMMENT '作物种类id',
    `crop_name`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物种类名称',
    `goods_name`       varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场品名称',
    `opener_time`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开具日期',
    `opener_month`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开具所属月份',
    `opener_weight`    decimal(11, 2) NULL DEFAULT NULL COMMENT '开具重量(公斤)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_certificate_green
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_certificate_green`;
CREATE TABLE `tbl_archive_certificate_green`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `year_month`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `green_id`                int(11) NULL DEFAULT NULL COMMENT '绿色证书ID',
    `certificate_count`       int(10) NULL DEFAULT NULL COMMENT '合格证生成张数（张）',
    `print_unit`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合格证打印重量单位',
    `print_weight`            decimal(15, 2) NULL DEFAULT NULL COMMENT '合格证打印重量',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_sort_num`           int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `farm_acre`               decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `crop_id`                 int(11) NULL DEFAULT NULL COMMENT '作物Id',
    `crop_name`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名',
    `crop_group_id`           int(11) NULL DEFAULT NULL COMMENT '分组Id',
    `crop_group_name`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名',
    `crop_category_id`        int(11) NULL DEFAULT NULL COMMENT '小类Id',
    `crop_category_name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小类名',
    `crop_subject_id`         int(11) NULL DEFAULT NULL COMMENT '大类Id',
    `crop_subject_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大类名',
    `company_id`              int(11) NULL DEFAULT NULL COMMENT '企业Id',
    `create_time`             datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `company_name`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `legal_person`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `enterprise_credit_code`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `company_category_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `business_category_ids`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营类目id',
    `business_category_names` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营类目名称字段',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = ' 合格证统计-按绿色证书按月归档'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_disease_reported
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_disease_reported`;
CREATE TABLE `tbl_archive_disease_reported`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_day_str`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受灾日期 yyyy-MM-dd',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `crop_id`                 bigint(20) NULL DEFAULT NULL COMMENT '作物种类id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `group_id`                bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `group_name`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组name',
    `category_id`             bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `category_name`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类name',
    `subject_id`              bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `subject_name`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类name',
    `loss_num`                decimal(15, 2) NULL DEFAULT NULL COMMENT '损失量（公斤）\n',
    `create_time`             datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archiveDay` (`farm_id`, `crop_id`, `archive_day_str`) USING BTREE COMMENT '农场id+作物id+受灾日期唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体受灾情况按品种按日统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm`;
CREATE TABLE `tbl_archive_farm`
(
    `id`                                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                           bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`                  bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`                varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`                         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`                     tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                              bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                         varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`                      tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_sort_num`                        int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `farm_acre`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `business_category_ids`                varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`              varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `land_count`                           int(20) NULL DEFAULT NULL COMMENT '地块数量',
    `land_sum_area`                        decimal(15, 2) NULL DEFAULT NULL COMMENT '地块面积之和(亩)',
    `gis_land_area`                        decimal(15, 2) NULL DEFAULT NULL COMMENT '入网地块面积(亩)',
    `gis_land_count`                       int(20) NULL DEFAULT NULL COMMENT '入网地块数量',
    `onland_area`                          decimal(15, 2) NULL DEFAULT NULL COMMENT '在田面积(亩)',
    `onland_count`                         int(20) NULL DEFAULT NULL COMMENT '在田地块数量',
    `onland_area_shucai`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜在田面积(亩)',
    `onland_count_shucai`                  int(20) NULL DEFAULT NULL COMMENT '蔬菜在田数量',
    `onland_area_lvyecai`                  decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜在田面积(亩)',
    `onland_count_lvyecai`                 int(20) NULL DEFAULT NULL COMMENT '绿叶菜在田数量',
    `onland_area_lvfei`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '绿肥在田面积(亩)',
    `onland_count_lvfei`                   int(20) NULL DEFAULT NULL COMMENT '绿肥在田数量',
    `freeland_area`                        decimal(15, 2) NULL DEFAULT NULL COMMENT '空闲地块面积(亩)',
    `freeland_count`                       int(20) NULL DEFAULT NULL COMMENT '空闲地块数量',
    `lvse_land_count`                      int(20) NULL DEFAULT NULL COMMENT '绿色认证地块数',
    `lvse_land_area`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '绿色认证地块面积(亩)',
    `patrol_record_total_count`            int(20) NULL DEFAULT NULL COMMENT '累计执法监管次数',
    `patrol_record_qualified_total_count`  int(20) NULL DEFAULT NULL COMMENT '累计执法监管合格次数',
    `onmarket_amount_shucai`               decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜待上市量(公斤)',
    `onmarket_amount_lvyecai`              decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜待上市量(公斤)',
    `create_time`                          datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`                          datetime NULL DEFAULT NULL COMMENT '更新时间',
    `liangtian_area`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '粮田面积（亩）',
    `caitian_area`                         decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田面积（亩）',
    `guoyuan_area`                         decimal(15, 2) NULL DEFAULT NULL COMMENT '果园面积（亩）',
    `jingzuo_area`                         decimal(15, 2) NULL DEFAULT NULL COMMENT '经作田面积（亩）',
    `xumu_breed_area`                      decimal(15, 2) NULL DEFAULT NULL COMMENT '畜牧养殖面积（亩）',
    `shuichan_breed_area`                  decimal(15, 2) NULL DEFAULT NULL COMMENT '水产养殖面积（亩）',
    `caitian_greenhouse_area`              decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜大棚面积（亩）',
    `caitian_open_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜露地面积（亩）',
    `liangtian_free_area`                  decimal(15, 2) NULL DEFAULT NULL COMMENT '粮田空闲面积（亩）',
    `caitian_free_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田空闲面积（亩）',
    `guoyuan_free_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '果园空闲面积（亩）',
    `jingzuo_free_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '经作田空闲面积（亩）',
    `xumu_breed_free_area`                 decimal(15, 2) NULL DEFAULT NULL COMMENT '畜牧养殖空闲面积（亩）',
    `shuichan_breed_free_area`             decimal(15, 2) NULL DEFAULT NULL COMMENT '水产养殖空闲面积（亩）',
    `onmarket_amount_month_shucai`         decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜本月待上市量（公斤）',
    `onmarket_amount_month_lvyecai`        decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜本月待上市量（公斤）',
    `onland_acre_ls`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '粮食在田面积',
    `onland_count_ls`                      int(20) NULL DEFAULT NULL COMMENT '粮食在田地块数',
    `onland_acre_jz`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '经作在田面积',
    `onland_count_jz`                      int(20) NULL DEFAULT NULL COMMENT '经作在田地块数',
    `onland_acre_sg`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '水果在田面积',
    `onland_count_sg`                      int(20) NULL DEFAULT NULL COMMENT '水果在田地块数',
    `shuichan_breed_area_fish`             decimal(15, 2) NULL DEFAULT 0.00 COMMENT '鱼类养殖面积',
    `shuichan_breed_area_shrimp`           decimal(15, 2) NULL DEFAULT 0.00 COMMENT '虾类养殖面积',
    `shuichan_breed_area_crab`             decimal(15, 2) NULL DEFAULT 0.00 COMMENT '蟹类养殖面积',
    `shuichan_breed_area_other`            decimal(15, 2) NULL DEFAULT 0.00 COMMENT '其他水产养殖面积',
    `shuichan_breed_count_fish`            int(10) NULL DEFAULT 0 COMMENT '鱼类养殖地块数量',
    `shuichan_breed_count_shrimp`          int(10) NULL DEFAULT 0 COMMENT '虾类养殖地块数量',
    `shuichan_breed_count_crab`            int(10) NULL DEFAULT 0 COMMENT '蟹类养殖地块数量',
    `shuichan_breed_count_other`           int(10) NULL DEFAULT 0 COMMENT '其他水产养殖地块数量',
    `sv_onland_area`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田蔬菜在田面积（亩）',
    `sv_onland_count`                      int(20) NULL DEFAULT NULL COMMENT '季节性菜田蔬菜在田地块数（个）',
    `svg_onland_area`                      decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜在田面积（亩）',
    `svg_onland_count`                     int(20) NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜在田地块数（个）',
    `cn_ct_shucai_onland_area`             decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田蔬菜在田面积（亩）',
    `cn_ct_shucai_onland_count`            int(11) NULL DEFAULT NULL COMMENT '常年菜田蔬菜在田地块数（个）',
    `cn_ct_lvyecai_onland_area`            decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田绿叶菜在田面积（亩）',
    `cn_ct_lvyecai_onland_count`           int(11) NULL DEFAULT NULL COMMENT '常年菜田绿叶菜在田地块数（个）',
    `onland_strawberry_area`               decimal(10, 2) NULL DEFAULT NULL COMMENT '草莓在田面积（亩）',
    `onland_strawberry_count`              int(11) NULL DEFAULT NULL COMMENT '草莓在田地块数（个）',
    `vegetable_quality_dep_rank_status`    int(11) NULL DEFAULT NULL COMMENT '蔬菜标准园部级 0 不是 1是',
    `vegetable_quality_city_rank_status`   int(11) NULL DEFAULT NULL COMMENT '蔬菜标准园市级 0 不是 1是',
    `vegetable_quality_county_rank_status` int(11) NULL DEFAULT NULL COMMENT '蔬菜标准园区级 0 不是 1是',
    `green_leafy_vegetable_quality_status` int(11) NULL DEFAULT NULL COMMENT '绿叶菜核心基地 0 不是 1是',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId` (`farm_id`) USING BTREE COMMENT '农场id唯一索引',
    INDEX                                  `index_statistics_flag` (`statistics_flag`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场统计归档表（经营主体汇总统计表）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_agri_res_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_agri_res_month`;
CREATE TABLE `tbl_archive_farm_agri_res_month`
(
    `id`                        bigint(20) NOT NULL AUTO_INCREMENT,
    `company_id`                bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`       bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`          tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                   bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`              varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `business_category_ids`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `statistics_flag`           tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `archive_month_str`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按月统计时间:例如：2020-01',
    `first_agri_category_id`    bigint(20) NULL DEFAULT NULL COMMENT '农资一级分类id',
    `first_agri_category_name`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农资一级分类名称',
    `second_agri_category_id`   bigint(20) NULL DEFAULT NULL COMMENT '农资二级分类id',
    `second_agri_category_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农资二级分类名称',
    `in_value`                  decimal(30, 2) NULL DEFAULT 0.00 COMMENT '入库量（公斤）',
    `out_value`                 decimal(30, 2) NULL DEFAULT 0.00 COMMENT '出库量（公斤）',
    `mission_used_value`        decimal(30, 2) NULL DEFAULT 0.00 COMMENT '农资使用日期在该月的农资重量（公斤）',
    `sow_acre`                  decimal(30, 2) NULL DEFAULT NULL COMMENT '施用面积（亩）',
    `used_avg`                  decimal(30, 2) NULL DEFAULT NULL COMMENT '亩均用量（公斤/亩）',
    `used_n`                    decimal(30, 2) NULL DEFAULT NULL COMMENT '使用量(公斤)-氮',
    `used_p`                    decimal(30, 2) NULL DEFAULT NULL COMMENT '使用量(公斤)-磷',
    `used_k`                    decimal(30, 2) NULL DEFAULT NULL COMMENT '使用量(公斤)-钾',
    `used_effective`            decimal(30, 2) NULL DEFAULT NULL COMMENT '使用量(公斤)-有效成分总含量',
    `pure_n`                    decimal(30, 2) NULL DEFAULT NULL COMMENT '折纯量（公斤/亩）-氮',
    `pure_p`                    decimal(30, 2) NULL DEFAULT NULL COMMENT '折纯量（公斤/亩）-磷',
    `pure_k`                    decimal(30, 2) NULL DEFAULT NULL COMMENT '折纯量（公斤/亩）-钾',
    `effective_total_pertage`   decimal(30, 2) NULL DEFAULT NULL COMMENT '折纯量（公斤/亩）-有效成分总含量',
    `sow_acre_n`                decimal(30, 2) NULL DEFAULT NULL COMMENT '施用面积(亩次) -氮',
    `sow_acre_p`                decimal(30, 2) NULL DEFAULT NULL COMMENT '施用面积(亩次) -磷',
    `sow_acre_k`                decimal(30, 2) NULL DEFAULT NULL COMMENT '施用面积(亩次) -钾',
    `create_time`               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_archiveMonthStr_firstAgriCategoryId_secondAgriCategoryId` (`farm_id`, `archive_month_str`, `first_agri_category_id`, `second_agri_category_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体农资使用按月归档表（经营主体农资使用按月统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_agri_res_stock_and_to_be_used_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_agri_res_stock_and_to_be_used_day`;
CREATE TABLE `tbl_archive_farm_agri_res_stock_and_to_be_used_day`
(
    `id`                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`       bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`          tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                   bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `statistics_flag`           tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `agri_res_id`               bigint(20) NOT NULL COMMENT '农资id',
    `agri_res_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农资名称',
    `productor`                 varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '生产厂家',
    `first_agri_category_id`    bigint(20) NULL DEFAULT NULL COMMENT '一级农资分类id',
    `first_agri_category_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一级农资分类名称',
    `second_agri_category_id`   bigint(20) NULL DEFAULT 0 COMMENT '二级农资分类id',
    `second_agri_category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级农资分类名称',
    `stock_value`               decimal(30, 3) NULL DEFAULT 0.000 COMMENT '库存量(按计量单位统计并转换公斤)',
    `stock_value_to_be_used`    decimal(30, 3) NULL DEFAULT 0.000 COMMENT '待使用库存量(按计量单位统计并转换公斤)',
    `create_time`               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_agriResId` (`farm_id`, `agri_res_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农资库存和农资待使用量归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_barcode_area_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_barcode_area_day`;
CREATE TABLE `tbl_archive_farm_barcode_area_day`
(
    `id`                  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `archive_month`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间（月度），例如：202111 代表2021年11月',
    `total_barcode`       int(20) NULL DEFAULT NULL COMMENT '合格证张数',
    `total_access_record` int(20) NULL DEFAULT NULL COMMENT '访问次数',
    `total_farm`          int(20) NULL DEFAULT NULL COMMENT '经营主体数量',
    `create_time`         datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`         datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '合格证-经营主体-区域表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_barcode_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_barcode_day`;
CREATE TABLE `tbl_archive_farm_barcode_day`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_month`           varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间（月度），例如：202111 代表2021年11月',
    `total_barcode`           int(20) NULL DEFAULT NULL COMMENT '合格证张数',
    `total_access_record`     int(20) NULL DEFAULT NULL COMMENT '访问次数',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业 ID',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场 ID',
    `legal_person`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_acre`               decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `business_category_ids`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `farm_sort_num`           int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `create_time`             datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '合格证-经营主体表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_compare
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_compare`;
CREATE TABLE `tbl_archive_farm_compare`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `farm_id`               bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `land_code_miss_count`  int(11) NULL DEFAULT NULL COMMENT '地块编码未找到数量',
    `land_not_belong_count` int(11) NULL DEFAULT NULL COMMENT '不属于农场数量',
    `land_diff_count`       int(11) NULL DEFAULT NULL COMMENT '地块信息不一致数量',
    `land_miss_count`       int(11) NULL DEFAULT NULL COMMENT '缺少地块数量',
    `sn_land_count`         int(11) NULL DEFAULT NULL COMMENT '神农口袋地块数量',
    `gis_farm_count`        int(11) NULL DEFAULT NULL COMMENT '测绘院关联主体数量',
    `gis_land_count`        int(11) NULL DEFAULT NULL COMMENT '测绘院主体地块数量',
    `status`                tinyint(2) NOT NULL DEFAULT 0 COMMENT ' 0-待处理 1-处理中 2-已处理',
    `compare_date`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对比日期（对比开始时间）',
    `remark`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `un_farmid_cpdate` (`farm_id`, `compare_date`) USING BTREE COMMENT '神农口袋农场id+对比日期'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '主体映射结果表，周任务，与gis服务地块对比差异结果表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_crop
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_crop`;
CREATE TABLE `tbl_archive_farm_crop`
(
    `id`                             bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                     bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`            bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`               tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                        bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`                tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`          varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`        varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `crop_id`                        bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`                      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_img_url`                   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物图片',
    `crop_group_id`                  bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_group_img_url`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物分组图片地址',
    `crop_category_id`               bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_category_logo_url`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物小类logo地址',
    `crop_category_identifier`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类唯一标识',
    `crop_subject_id`                bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_subject_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类名称',
    `crop_subject_logo_url`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物大类logo地址',
    `crop_subject_identifier`        varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类唯一标示',
    `lvyecai_flag`                   tinyint(2) NULL DEFAULT NULL COMMENT '该作物是否为绿叶菜',
    `onland_count`                   int(20) NULL DEFAULT NULL COMMENT '该作物在田地块数',
    `onland_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '该作物在田面积(亩)',
    `onmarket_amount`                decimal(15, 2) NULL DEFAULT NULL COMMENT '待上市量',
    `onmarket_amount_curmonth`       decimal(15, 2) NULL DEFAULT NULL COMMENT '本月待上市量',
    `onmarket_amount_curmonth_next1` decimal(15, 2) NULL DEFAULT NULL COMMENT '本月+1月待上市量',
    `onmarket_amount_curmonth_next2` decimal(15, 2) NULL DEFAULT NULL COMMENT '本月+2月待上市量',
    `onmarket_amount_curmonth_next3` decimal(15, 2) NULL DEFAULT NULL COMMENT '本月+3月待上市量',
    `onmarket_amount_curmonth_next4` decimal(15, 2) NULL DEFAULT NULL COMMENT '本月+4月待上市量',
    `onmarket_amount_curmonth_next5` decimal(15, 2) NULL DEFAULT NULL COMMENT '本月+5月待上市量',
    `crop_unit`                      varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
    `create_time`                    datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`                    datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_cropId` (`farm_id`, `crop_id`) USING BTREE COMMENT '农场id+作物id组合唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场作物统计归档表（经营主体在田数据统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_crop_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_crop_day`;
CREATE TABLE `tbl_archive_farm_crop_day`
(
    `id`                       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`               bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`      bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`         tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                  bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`          tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_sort_num`            int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `farm_acre`                decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `business_category_ids`    varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `archive_day_str`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计日期 yyyy-MM-dd',
    `sown_area_shucai`         decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜播种面积(亩)',
    `pick_area_shucai`         decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜采收面积(亩)',
    `pick_amount_shucai`       decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜采收量(公斤)',
    `sown_area_lvyecai`        decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜播种面积(亩)',
    `pick_area_lvyecai`        decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜采收面积(亩)',
    `pick_amount_lvyecai`      decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜采收量(公斤)',
    `sown_area_liangshi`       decimal(15, 2) NULL DEFAULT NULL COMMENT '粮食播种面积(亩)',
    `pick_area_liangshi`       decimal(15, 2) NULL DEFAULT NULL COMMENT '粮食采收面积(亩)',
    `pick_amount_liangshi`     decimal(15, 2) NULL DEFAULT NULL COMMENT '粮食采收量(公斤)',
    `sown_area_shuiguo`        decimal(15, 2) NULL DEFAULT NULL COMMENT '水果播种面积(亩)',
    `pick_area_shuiguo`        decimal(15, 2) NULL DEFAULT NULL COMMENT '水果采收面积(亩)',
    `pick_amount_shuiguo`      decimal(15, 2) NULL DEFAULT NULL COMMENT '水果采收量(公斤)',
    `sown_area_doulei`         decimal(15, 2) NULL DEFAULT NULL COMMENT '豆类播种面积(亩)',
    `pick_area_doulei`         decimal(15, 2) NULL DEFAULT NULL COMMENT '豆类采收面积(亩)',
    `pick_amount_doulei`       decimal(15, 2) NULL DEFAULT NULL COMMENT '豆类采收量(公斤)',
    `sown_area_youliao`        decimal(15, 2) NULL DEFAULT NULL COMMENT '油料播种面积(亩)',
    `pick_area_youliao`        decimal(15, 2) NULL DEFAULT NULL COMMENT '油料采收面积(亩)',
    `pick_amount_youliao`      decimal(15, 2) NULL DEFAULT NULL COMMENT '油料采收量(公斤)',
    `sown_area_chaye`          decimal(15, 2) NULL DEFAULT NULL COMMENT '茶叶播种面积(亩)',
    `pick_area_chaye`          decimal(15, 2) NULL DEFAULT NULL COMMENT '茶叶采收面积(亩)',
    `pick_amount_chaye`        decimal(15, 2) NULL DEFAULT NULL COMMENT '茶叶采收量(公斤)',
    `sown_area_zhongyaocai`    decimal(15, 2) NULL DEFAULT NULL COMMENT '中药材播种面积(亩)',
    `pick_area_zhongyaocai`    decimal(15, 2) NULL DEFAULT NULL COMMENT '中药材采收面积(亩)',
    `pick_amount_zhongyaocai`  decimal(15, 2) NULL DEFAULT NULL COMMENT '中药材采收量(公斤)',
    `sown_area_xianwei`        decimal(15, 2) NULL DEFAULT NULL COMMENT '纤维播种面积(亩)',
    `pick_area_xianwei`        decimal(15, 2) NULL DEFAULT NULL COMMENT '纤维采收面积(亩)',
    `pick_amount_xianwei`      decimal(15, 2) NULL DEFAULT NULL COMMENT '纤维采收量(公斤)',
    `jz_sow_acre`              decimal(15, 2) NULL DEFAULT NULL COMMENT '经作播种面积',
    `jz_pick_acre`             decimal(15, 2) NULL DEFAULT NULL COMMENT '经作采收面积',
    `jz_pick_quantity`         decimal(15, 2) NULL DEFAULT NULL COMMENT '经作采收量',
    `zzy_sow_acre`             decimal(15, 2) NULL DEFAULT NULL COMMENT '种植业播种面积',
    `zzy_pick_acre`            decimal(15, 2) NULL DEFAULT NULL COMMENT '种植业采收面积',
    `zzy_pick_quantity`        decimal(15, 2) NULL DEFAULT NULL COMMENT '种植业采收量',
    `create_time`              datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`              datetime NULL DEFAULT NULL COMMENT '修改时间',
    `sown_area_strawberry`     decimal(15, 2) NULL DEFAULT NULL COMMENT '草莓播种面积（亩次）',
    `pick_area_strawberry`     decimal(15, 2) NULL DEFAULT NULL COMMENT '草莓采收面积（亩次）',
    `pick_amount_strawberry`   varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '草莓采收量（公斤）',
    `sown_area_shucai_year`    decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田蔬菜播种面积（亩次）',
    `sown_area_shucai_season`  decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田蔬菜播种面积（亩次）',
    `sown_area_lvyecai_year`   decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田绿叶菜播种面积（亩次）',
    `sown_area_lvyecai_season` decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜播种面积（亩次）',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archiveDay` (`farm_id`, `archive_day_str`) USING BTREE COMMENT '农场id+归档日期唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场作物按日统计归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_crop_day_output
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_crop_day_output`;
CREATE TABLE `tbl_archive_farm_crop_day_output`
(
    `id`                       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`               bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`      bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`         tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                  bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`          tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`    varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `crop_unit`                varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
    `crop_id`                  bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_img_url`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物图片',
    `crop_group_id`            bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_group_img_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物分组图片地址',
    `crop_category_id`         bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_category_logo_url`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物小类logo地址',
    `crop_category_identifier` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类唯一标识',
    `crop_subject_id`          bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_subject_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类名称',
    `crop_subject_logo_url`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物大类logo地址',
    `crop_subject_identifier`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类唯一标示',
    `lvyecai_flag`             tinyint(2) NULL DEFAULT NULL COMMENT '该作物是否为绿叶菜',
    `sown_area`                decimal(15, 2) NULL DEFAULT NULL COMMENT '播种面积(亩)',
    `output`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '产量',
    `archive_day_str`          varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归档年月日 yyyy-MM-dd',
    `create_time`              datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`              datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_day_farm_crop` (`farm_id`, `crop_id`, `archive_day_str`) USING BTREE COMMENT '日+农场+作物唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场作物按日统计归档表（经营主体播种面积按日统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_crop_group_prediction_yield_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_crop_group_prediction_yield_day`;
CREATE TABLE `tbl_archive_farm_crop_group_prediction_yield_day`
(
    `id`                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `farm_id`                   bigint(20) NOT NULL,
    `farm_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `crop_group_id`             bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_category_identifier`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类标识',
    `onland_area`               decimal(15, 2) NULL DEFAULT 0.00 COMMENT '在田面积',
    `statistics_flag`           tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `province_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `w1`                        int(11) NULL DEFAULT NULL COMMENT '第1周',
    `w1_date`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第1周-时间',
    `w1_prediction_pick_area`   decimal(15, 2) NULL DEFAULT NULL COMMENT '第1周-预计采收面积',
    `w1_prediction_pick_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '第1周-预计采收量',
    `w2`                        int(11) NULL DEFAULT NULL COMMENT '第2周',
    `w2_date`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第2周-时间',
    `w2_prediction_pick_area`   decimal(15, 2) NULL DEFAULT NULL COMMENT '第2周-预计采收面积',
    `w2_prediction_pick_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '第2周-预计采收量',
    `w3`                        int(11) NULL DEFAULT NULL COMMENT '第3周',
    `w3_date`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第3周-时间',
    `w3_prediction_pick_area`   decimal(15, 2) NULL DEFAULT NULL COMMENT '第3周-预计采收面积',
    `w3_prediction_pick_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '第3周-预计采收量',
    `w4`                        int(11) NULL DEFAULT NULL COMMENT '第4周',
    `w4_date`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第4周-时间',
    `w4_prediction_pick_area`   decimal(15, 2) NULL DEFAULT NULL COMMENT '第4周-预计采收面积',
    `w4_prediction_pick_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '第4周-预计采收量',
    `w5`                        int(11) NULL DEFAULT NULL COMMENT '第5周',
    `w5_date`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第5周-时间',
    `w5_prediction_pick_area`   decimal(15, 2) NULL DEFAULT NULL COMMENT '第5周-预计采收面积',
    `w5_prediction_pick_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '第5周-预计采收量',
    `w6`                        int(11) NULL DEFAULT NULL COMMENT '第6周',
    `w6_date`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第6周-时间',
    `w6_prediction_pick_area`   decimal(15, 2) NULL DEFAULT NULL COMMENT '第6周-预计采收面积',
    `w6_prediction_pick_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '第6周-预计采收量',
    `w7`                        int(11) NULL DEFAULT NULL COMMENT '第7周',
    `w7_date`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第7周-时间',
    `w7_prediction_pick_area`   decimal(15, 2) NULL DEFAULT NULL COMMENT '第7周-预计采收面积',
    `w7_prediction_pick_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '第7周-预计采收量',
    `w8`                        int(11) NULL DEFAULT NULL COMMENT '第8周',
    `w8_date`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第8周-时间',
    `w8_prediction_pick_area`   decimal(15, 2) NULL DEFAULT NULL COMMENT '第8周-预计采收面积',
    `w8_prediction_pick_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '第8周-预计采收量',
    `create_time`               datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '预测产量按经营主体按作物分组按日归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_crop_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_crop_month`;
CREATE TABLE `tbl_archive_farm_crop_month`
(
    `id`                       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`               bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`      bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`         tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                  bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`          tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`    varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `crop_unit`                varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
    `crop_id`                  bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_img_url`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物图片',
    `crop_group_id`            bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_group_img_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物分组图片地址',
    `crop_category_id`         bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_category_logo_url`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物小类logo地址',
    `crop_category_identifier` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类唯一标识',
    `crop_subject_id`          bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_subject_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类名称',
    `crop_subject_logo_url`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物大类logo地址',
    `crop_subject_identifier`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类唯一标示',
    `lvyecai_flag`             tinyint(2) NULL DEFAULT NULL COMMENT '该作物是否为绿叶菜',
    `sown_area`                decimal(15, 2) NULL DEFAULT NULL COMMENT '播种面积(亩)',
    `output`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '产量',
    `archive_month_str`        varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归档年月 yyyy-MM',
    `create_time`              datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`              datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_month_farm_crop` (`farm_id`, `crop_id`, `archive_month_str`) USING BTREE COMMENT '月份+农场+作物唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场作物按月统计归档表（经营主体播种面积按月统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_crop_overdue_area_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_crop_overdue_area_day`;
CREATE TABLE `tbl_archive_farm_crop_overdue_area_day`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `enterprise_credit_code`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `crop_id`                 bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_group_id`           bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_category_id`        bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_subject_id`         bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_subject_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类名称',
    `overdue_plant_area`      decimal(15, 2) NULL DEFAULT NULL COMMENT '超期种植面积(亩)',
    `overdue_plant_plan`      int(11) NULL DEFAULT NULL COMMENT '超期种植计划个数',
    `create_time`             datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = ' 经营主体超期种植面积按作物按日归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_crop_pick_certificat_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_crop_pick_certificat_day`;
CREATE TABLE `tbl_archive_farm_crop_pick_certificat_day`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `crop_id`                 bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_group_name`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_group_id`           bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_category_name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_category_id`        bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_subject_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类名称',
    `crop_subject_id`         bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `archive_day_str`         varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归档年月日 yyyy-MM-dd',
    `certificate_print_num`   decimal(15, 2) NULL DEFAULT NULL COMMENT '合格证打印重量',
    `certificat_print_unit`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合格证打印重量单位',
    `pick_num`                decimal(15, 2) NULL DEFAULT NULL COMMENT '采收量',
    `pick_unit`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采收单位',
    `create_time`             datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_day_farm` (`farm_id`, `archive_day_str`, `crop_id`) USING BTREE COMMENT '日+农场+作物分组id唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体采收开证按作物按日统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_crop_prediction_yield_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_crop_prediction_yield_day`;
CREATE TABLE `tbl_archive_farm_crop_prediction_yield_day`
(
    `id`                            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `farm_id`                       bigint(20) NOT NULL,
    `farm_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `crop_id`                       bigint(20) NOT NULL COMMENT '作物id',
    `crop_name`                     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_group_id`                 bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `predict_pick_date`             date NOT NULL COMMENT ' 预计采收日期',
    `prediction_weeks`              decimal(15, 2) NULL DEFAULT NULL COMMENT '预测周数',
    `prediction_pick_amount_offset` decimal(15, 2) NULL DEFAULT NULL COMMENT '预计可采收量（公斤）',
    `pick_amount`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '已采收量（公斤）',
    `prediction_pick_amount`        decimal(15, 2) NULL DEFAULT NULL COMMENT '预计采收量（公斤）',
    `prediction_pick_area`          decimal(15, 2) NULL DEFAULT NULL COMMENT '预计采收面积（亩）',
    `crop_category_id`              bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '种养小类名称',
    `crop_category_identifier`      varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类标识',
    `crop_subject_id`               bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_subject_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '种养大类名称',
    `statistics_flag`               tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`         varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`       varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `company_id`                    bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `enterprise_credit_code`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `company_category_id`           bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`              tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `province_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `create_time`                   datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '预测产量按经营主体按作物按日归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_day`;
CREATE TABLE `tbl_archive_farm_day`
(
    `id`                                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                           bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`                  bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`                varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`                         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`                     tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                              bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                         varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`                      tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_sort_num`                        int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `farm_acre`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `business_category_ids`                varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`              varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `land_count`                           int(20) NULL DEFAULT NULL COMMENT '地块数量',
    `land_sum_area`                        decimal(15, 2) NULL DEFAULT NULL COMMENT '地块面积之和(亩)',
    `gis_land_area`                        decimal(15, 2) NULL DEFAULT NULL COMMENT '入网地块面积(亩)',
    `gis_land_count`                       int(20) NULL DEFAULT NULL COMMENT '入网地块数量',
    `onland_area`                          decimal(15, 2) NULL DEFAULT NULL COMMENT '在田面积(亩)',
    `onland_count`                         int(20) NULL DEFAULT NULL COMMENT '在田地块数量',
    `onland_area_shucai`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜在田面积(亩)',
    `onland_count_shucai`                  int(20) NULL DEFAULT NULL COMMENT '蔬菜在田数量',
    `onland_area_lvyecai`                  decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜在田面积(亩)',
    `onland_count_lvyecai`                 int(20) NULL DEFAULT NULL COMMENT '绿叶菜在田数量',
    `onland_area_lvfei`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '绿肥在田面积(亩)',
    `onland_count_lvfei`                   int(20) NULL DEFAULT NULL COMMENT '绿肥在田数量',
    `freeland_area`                        decimal(15, 2) NULL DEFAULT NULL COMMENT '空闲地块面积(亩)',
    `freeland_count`                       int(20) NULL DEFAULT NULL COMMENT '空闲地块数量',
    `lvse_land_count`                      int(20) NULL DEFAULT NULL COMMENT '绿色认证地块数',
    `lvse_land_area`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '绿色认证地块面积(亩)',
    `patrol_record_total_count`            int(20) NULL DEFAULT NULL COMMENT '累计执法监管次数',
    `patrol_record_qualified_total_count`  int(20) NULL DEFAULT NULL COMMENT '累计执法监管合格次数',
    `create_time`                          datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`                          datetime NULL DEFAULT NULL COMMENT '更新时间',
    `liangtian_area`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '粮田面积（亩）',
    `caitian_area`                         decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田面积（亩）',
    `guoyuan_area`                         decimal(15, 2) NULL DEFAULT NULL COMMENT '果园面积（亩）',
    `jingzuo_area`                         decimal(15, 2) NULL DEFAULT NULL COMMENT '经作田面积（亩）',
    `xumu_breed_area`                      decimal(15, 2) NULL DEFAULT NULL COMMENT '畜牧养殖面积（亩）',
    `shuichan_breed_area`                  decimal(15, 2) NULL DEFAULT NULL COMMENT '水产养殖面积（亩）',
    `caitian_greenhouse_area`              decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜大棚面积（亩）',
    `caitian_open_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜露地面积（亩）',
    `liangtian_free_area`                  decimal(15, 2) NULL DEFAULT NULL COMMENT '粮田空闲面积（亩）',
    `caitian_free_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田空闲面积（亩）',
    `guoyuan_free_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '果园空闲面积（亩）',
    `jingzuo_free_area`                    decimal(15, 2) NULL DEFAULT NULL COMMENT '经作田空闲面积（亩）',
    `xumu_breed_free_area`                 decimal(15, 2) NULL DEFAULT NULL COMMENT '畜牧养殖空闲面积（亩）',
    `shuichan_breed_free_area`             decimal(15, 2) NULL DEFAULT NULL COMMENT '水产养殖空闲面积（亩）',
    `onland_acre_ls`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '粮食在田面积',
    `onland_count_ls`                      int(20) NULL DEFAULT NULL COMMENT '粮食在田地块数',
    `onland_acre_jz`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '经作在田面积',
    `onland_count_jz`                      int(20) NULL DEFAULT NULL COMMENT '经作在田地块数',
    `onland_acre_sg`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '水果在田面积',
    `onland_count_sg`                      int(20) NULL DEFAULT NULL COMMENT '水果在田地块数',
    `shuichan_breed_area_fish`             decimal(15, 2) NULL DEFAULT 0.00 COMMENT '鱼类养殖面积',
    `shuichan_breed_area_shrimp`           decimal(15, 2) NULL DEFAULT 0.00 COMMENT '虾类养殖面积',
    `shuichan_breed_area_crab`             decimal(15, 2) NULL DEFAULT 0.00 COMMENT '蟹类养殖面积',
    `shuichan_breed_area_other`            decimal(15, 2) NULL DEFAULT 0.00 COMMENT '其他水产养殖面积',
    `shuichan_breed_count_fish`            int(10) NULL DEFAULT 0 COMMENT '鱼类养殖地块数量',
    `shuichan_breed_count_shrimp`          int(10) NULL DEFAULT 0 COMMENT '虾类养殖地块数量',
    `shuichan_breed_count_crab`            int(10) NULL DEFAULT 0 COMMENT '蟹类养殖地块数量',
    `shuichan_breed_count_other`           int(10) NULL DEFAULT 0 COMMENT '其他水产养殖地块数量',
    `sv_onland_area`                       decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田蔬菜在田面积（亩）',
    `sv_onland_count`                      int(20) NULL DEFAULT NULL COMMENT '季节性菜田蔬菜在田地块数（个）',
    `svg_onland_area`                      decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜在田面积（亩）',
    `svg_onland_count`                     int(20) NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜在田地块数（个）',
    `cn_ct_shucai_onland_area`             decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田蔬菜在田面积（亩）',
    `cn_ct_shucai_onland_count`            int(11) NULL DEFAULT NULL COMMENT '常年菜田蔬菜在田地块数（个）',
    `cn_ct_lvyecai_onland_area`            decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田绿叶菜在田面积（亩）',
    `cn_ct_lvyecai_onland_count`           int(11) NULL DEFAULT NULL COMMENT '常年菜田绿叶菜在田地块数（个）',
    `vegetable_quality_dep_rank_status`    int(11) NULL DEFAULT NULL COMMENT '蔬菜标准园部级 0 不是 1是',
    `vegetable_quality_city_rank_status`   int(11) NULL DEFAULT NULL COMMENT '蔬菜标准园市级 0 不是 1是',
    `vegetable_quality_county_rank_status` int(11) NULL DEFAULT NULL COMMENT '蔬菜标准园区级 0 不是 1是',
    `green_leafy_vegetable_quality_status` int(11) NULL DEFAULT NULL COMMENT '绿叶菜核心基地 0 不是 1是',
    `archive_date`                         date NULL DEFAULT NULL COMMENT '归档日期',
    `caitian_conservation_area`            decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田保育地块面积（亩）',
    `caitian_conservation_count`           int(11) NULL DEFAULT NULL COMMENT '菜田保育地块数（个）',
    `caitian_onland_area`                  decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田在田面积（亩）',
    `caitian_onland_count`                 int(11) NULL DEFAULT NULL COMMENT '菜田在田地块数（个）',
    `caitian_leisure_area`                 decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田空闲面积（亩）',
    `caitian_leisure_count`                int(11) NULL DEFAULT NULL COMMENT '菜田空闲地块数（个）',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uni_farm_date` (`farm_id`, `archive_date`) USING BTREE COMMENT '农场id与归档时间唯一键',
    INDEX                                  `idx_date` (`archive_date`) USING BTREE COMMENT '归档时间'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场统计归档表按日归档（经营主体汇总统计表按日归档）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_info_report_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_info_report_day`;
CREATE TABLE `tbl_archive_farm_info_report_day`
(
    `id`                                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`                     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`                   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`                        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `business_category_ids`                   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`                 varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `statistics_flag`                         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `archive_day_str`                         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按日统计时间:例如：2020-01-01',
    `plant_plan_count_agri`                   bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案添加次数',
    `plant_plan_overdue_count_agri`           bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案逾期次数',
    `plant_plan_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案添加次数',
    `plant_plan_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案逾期次数',
    `plant_plan_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案添加次数',
    `plant_plan_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案逾期次数',
    `plant_plan_count_forestry`               bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案添加次数',
    `plant_plan_overdue_count_forestry`       bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案逾期次数',
    `fertilizer_count`                        bigint(20) NULL DEFAULT NULL COMMENT '施肥次数',
    `fertilizer_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '施肥逾期次数',
    `feeding_count`                           bigint(20) NULL DEFAULT NULL COMMENT '喂料次数',
    `feeding_overdue_count`                   bigint(20) NULL DEFAULT NULL COMMENT '喂料逾期次数',
    `charging_count`                          bigint(20) NULL DEFAULT NULL COMMENT '投料次数',
    `charging_overdue_count`                  bigint(20) NULL DEFAULT NULL COMMENT '投料逾期次数',
    `medication_count`                        bigint(20) NULL DEFAULT NULL COMMENT '用药次数',
    `medication_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '用药逾期次数',
    `medication_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '用兽药次数',
    `medication_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '用瘦药逾期次数',
    `medication_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '用渔药次数',
    `medication_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '用渔药逾期次数',
    `mission_category_count_other`            bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作次数（其他）',
    `mission_category_overdue_count_other`    bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作逾期次数（其他）',
    `pick_record_count_agri`                  bigint(20) NULL DEFAULT NULL COMMENT '农业采收次数',
    `pick_record_overdue_count_agri`          bigint(20) NULL DEFAULT NULL COMMENT '农业采收逾期次数',
    `pick_record_count_forestry`              bigint(20) NULL DEFAULT NULL COMMENT '林业采收次数',
    `pick_record_overdue_count_forestry`      bigint(20) NULL DEFAULT NULL COMMENT '林业采收逾期次数',
    `pick_record_count_fishery`               bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞次数',
    `pick_record_overdue_count_fishery`       bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞逾期次数',
    `pick_record_count_animal`                bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞次数',
    `pick_record_overdue_count_animal`        bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞逾期次数',
    `pick_record_sale_count_agri`             bigint(20) NULL DEFAULT NULL COMMENT '农业销售次数',
    `pick_record_sale_overdue_count_agri`     bigint(20) NULL DEFAULT NULL COMMENT '农业销售逾期次数',
    `pick_record_sale_count_forestry`         bigint(20) NULL DEFAULT NULL COMMENT '林业销售次数',
    `pick_record_sale_overdue_count_forestry` bigint(20) NULL DEFAULT NULL COMMENT '林业销售逾期次数',
    `pick_record_sale_count_fishery`          bigint(20) NULL DEFAULT NULL COMMENT '渔业销售次数',
    `pick_record_sale_overdue_count_fishery`  bigint(20) NULL DEFAULT NULL COMMENT '渔业销售逾期次数',
    `pick_record_sale_count_animal`           bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售次数',
    `pick_record_sale_overdue_count_animal`   bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售逾期次数',
    `total_mission_count`                     bigint(20) NULL DEFAULT NULL COMMENT '填报总数',
    `mission_rate`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '填报及时率',
    `total_overdue_count`                     bigint(20) NULL DEFAULT NULL COMMENT '逾期总数',
    `create_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archiveDayStr` (`farm_id`, `archive_day_str`) USING BTREE,
    INDEX                                     `idx_company_category_id` (`company_category_id`) USING BTREE,
    INDEX                                     `idx_statistics_flag` (`statistics_flag`) USING BTREE,
    INDEX                                     `idx_region` (`company_id`, `province_id`, `city_id`, `town_id`, `village_id`) USING BTREE,
    INDEX                                     `idx_test` (`city_id`, `total_mission_count`, `archive_day_str`, `farm_id`) USING BTREE,
    INDEX                                     `idx_farm_id` (`farm_id`, `farm_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息直报按日归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_land_patrolled_record_pharmacy_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_land_patrolled_record_pharmacy_day`;
CREATE TABLE `tbl_archive_farm_land_patrolled_record_pharmacy_day`
(
    `id`                         bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
    `farm_id`                    bigint(20) NOT NULL COMMENT '农场id',
    `land_id`                    bigint(20) NOT NULL COMMENT '地块id',
    `land_pharmacy_time`         datetime NULL DEFAULT NULL COMMENT '地块用药时间',
    `one_week_during_status`     tinyint(2) NULL DEFAULT NULL COMMENT '一周内是否用药 0、否 1、是',
    `create_time`                datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `three_day_land_id`          bigint(20) NULL DEFAULT NULL COMMENT '3内用药的地块id',
    `three_day_during_status`    tinyint(2) NULL DEFAULT 0 COMMENT '3天内是否用药 0、否 1、是 用药任意为兽药、渔药、农药 ',
    `three_day_land_during_time` datetime NULL DEFAULT NULL COMMENT '地块3天内用药时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_lnadId` (`land_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场地块用药按天归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_not_reported
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_not_reported`;
CREATE TABLE `tbl_archive_farm_not_reported`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_day_str`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计日期 yyyy-MM-dd',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `last_filling_date`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后填报日期 yyyy-MM-dd',
    `days_not_filled`         int(20) NULL DEFAULT NULL COMMENT '未填报天数',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archiveDay` (`farm_id`, `archive_day_str`) USING BTREE COMMENT '农场id+归档日期唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '30天未上报经营主体统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_onland_crop_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_onland_crop_day`;
CREATE TABLE `tbl_archive_farm_onland_crop_day`
(
    `id`                       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`               bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`      bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`         tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                  bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`          tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`    varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `crop_id`                  bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_img_url`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物图片',
    `crop_group_id`            bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_group_img_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物分组图片地址',
    `crop_category_id`         bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_category_logo_url`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物小类logo地址',
    `crop_category_identifier` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类唯一标识',
    `crop_subject_id`          bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_subject_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类名称',
    `crop_subject_logo_url`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物大类logo地址',
    `crop_subject_identifier`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类唯一标示',
    `lvyecai_flag`             tinyint(2) NULL DEFAULT NULL COMMENT '该作物是否为绿叶菜',
    `onland_count`             int(20) NULL DEFAULT NULL COMMENT '该作物在田地块数',
    `onland_area`              decimal(15, 2) NULL DEFAULT NULL COMMENT '该作物在田面积(亩)',
    `create_time`              datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`              datetime NULL DEFAULT NULL COMMENT '更新时间',
    `archive_date`             date NULL DEFAULT NULL COMMENT '归档日期',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uni_farm_cop_date` (`farm_id`, `crop_id`, `archive_date`) USING BTREE COMMENT '农场id+作物id+date唯一键',
    INDEX                      `idx_date` (`archive_date`) USING BTREE COMMENT '归档日期'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场在田面积按作物按日统计（经营主体在田面积按作物按日统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_patrolled_record_during_tag
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_patrolled_record_during_tag`;
CREATE TABLE `tbl_archive_farm_patrolled_record_during_tag`
(
    `id`                                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `farm_id`                                   bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                              varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `farm_center_lat`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '农场中心点维度值',
    `farm_center_lng`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '农场中心点经度值',
    `land_id`                                   bigint(20) NULL DEFAULT NULL COMMENT '最后一次用药的地块id',
    `land_during_time`                          datetime NULL DEFAULT NULL COMMENT '地块用药时间 ，任意一个地块最后用药为该农场的最后一次用药时间',
    `statistics_flag`                           tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `patrolled_record_finally_qualified_status` tinyint(2) NULL DEFAULT 0 COMMENT '执法记录最后一次检查是否合格  0、否 1、是',
    `patrolled_record_finally_qualified_time`   datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '执法记录最后一次检查时间',
    `patrolled_record_id`                       bigint(20) NULL DEFAULT NULL COMMENT '最后一次检查记录id',
    `business_category_ids`                     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`                   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `onland_area`                               decimal(15, 2) NULL DEFAULT NULL COMMENT '在田面积(亩)',
    `farm_vegetable_quality_status`             tinyint(2) NULL DEFAULT 0 COMMENT '蔬菜标准园标识 0、否 1、是',
    `farm_green_leafy_vegetable_quality_status` tinyint(2) NULL DEFAULT 0 COMMENT '绿叶核心基地标识 0、否 1、是',
    `farm_green_breeding_status`                tinyint(2) NULL DEFAULT 0 COMMENT '水产养殖绿色生产方式标识 0、否 1、是',
    `farm_healthy_breeding_status`              tinyint(2) NULL DEFAULT 0 COMMENT '水产健康养殖示范农场标识 0、否 1、是',
    `create_time`                               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId` (`farm_id`) USING BTREE COMMENT '农场id唯一索引',
    INDEX                                       `index_statistics_flag` (`statistics_flag`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场&用药时间&检查情况&农场标签(绿叶标准、蔬菜标准、水产健康、水产养殖标准)、在田面积、归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_patrolled_record_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_patrolled_record_month`;
CREATE TABLE `tbl_archive_farm_patrolled_record_month`
(
    `id`                          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_month_str`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按月统计时间:例如：2020-01',
    `farm_id`                     bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`             tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`       varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `patrolled_count`             int(11) NULL DEFAULT 0 COMMENT '农场被执法次数',
    `patrolled_regular_count`     int(11) NULL DEFAULT 0 COMMENT '农场被执法合格次数',
    `patrolled_not_regular_count` int(11) NULL DEFAULT 0 COMMENT '农场被执法不合格次数',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archive_month_str` (`farm_id`, `archive_month_str`) USING BTREE COMMENT '农场id与月份唯一索引',
    INDEX                         `index_statistics_flag` (`statistics_flag`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场被执法按月归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_pick_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_pick_month`;
CREATE TABLE `tbl_archive_farm_pick_month`
(
    `id`                       bigint(20) NOT NULL AUTO_INCREMENT,
    `company_id`               bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`      bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`         tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                  bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`             varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `business_category_ids`    varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `statistics_flag`          tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `archive_month_str`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按月统计时间:例如：2020-01',
    `crop_id`                  bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `crop_img_url`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物图片',
    `crop_group_id`            bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_group_img_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物分组图片地址',
    `crop_category_id`         bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `crop_category_logo_url`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物小类logo地址',
    `crop_category_identifier` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类唯一标识',
    `crop_subject_id`          bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_subject_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类名称',
    `crop_subject_logo_url`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物大类logo地址',
    `crop_subject_identifier`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物大类唯一标示',
    `lvyecai_flag`             tinyint(2) NULL DEFAULT NULL COMMENT '绿叶菜标识：0：不是；1：是',
    `pick_value`               decimal(30, 2) NULL DEFAULT 0.00 COMMENT '采收/捕捞/出栏数量',
    `crop_unit`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采收单位名称:公斤/头/尾',
    `pick_type`                tinyint(4) NULL DEFAULT NULL COMMENT '入库或销售类型：1-放入仓库 ，2-田头销售 ，3-赠送 ，4-扔掉 ，5-其他 ，6-死亡 ，7-更换养殖区 ，8-超市 ，9-企业事业单位 ，10-菜场 ，11-批发市场 ，12-配送中心 ，13- 粮管所',
    `create_time`              datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`              datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archiveMonthStr_cropId_pickType` (`farm_id`, `archive_month_str`, `crop_id`, `pick_type`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体采收按日归档表（经营主体采收按月统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_scale_area_acre
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_scale_area_acre`;
CREATE TABLE `tbl_archive_farm_scale_area_acre`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `acre_level`      tinyint(4) NULL DEFAULT NULL COMMENT '面积等级 1：<10  2：10-50 3：50-1004：100-5005：>=500',
    `farm_count`      bigint(20) NULL DEFAULT NULL COMMENT '经营主体数量(家)',
    `farm_acre`       decimal(15, 2) NULL DEFAULT NULL COMMENT '主体面积（亩）',
    `show_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面展示名称，填写 <10亩、10-50亩、50-100亩、100-500亩、>=500亩',
    `statistics_mode` tinyint(2) NULL DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`     datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_acreLevel` (`area_id`, `acre_level`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体规模-区域-按面积范围统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_scale_area_business_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_scale_area_business_category`;
CREATE TABLE `tbl_archive_farm_scale_area_business_category`
(
    `id`                     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `business_category_id`   bigint(20) NULL DEFAULT NULL COMMENT '经营类目id，自定义id = 0统计经营主体总数，id=其他，统计各自数据',
    `business_category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营类目名称',
    `farm_count`             bigint(20) NULL DEFAULT NULL COMMENT '经营主体数量(家)',
    `farm_acre`              decimal(15, 2) NULL DEFAULT NULL COMMENT '主体面积（亩）',
    `statistics_mode`        tinyint(2) NULL DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`            datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`            datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_businessCategoryId` (`area_id`, `business_category_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体规模-区域-按经营类目统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_scale_area_company_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_scale_area_company_category`;
CREATE TABLE `tbl_archive_farm_scale_area_company_category`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `company_category_id`   bigint(20) NULL DEFAULT NULL COMMENT '企业类型id,1：农业企业  2：合作社 3：家庭农场  4：大户  5：农户  6：村组集体  7 其他',
    `company_category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `farm_count`            bigint(20) NULL DEFAULT NULL COMMENT '经营主体数量(家)',
    `farm_acre`             decimal(15, 2) NULL DEFAULT NULL COMMENT '主体面积（亩）',
    `statistics_mode`       tinyint(2) NULL DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`           datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`           datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_companyCategoryId` (`area_id`, `company_category_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体规模-区域-按企业类型统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_farm_subsidy_year
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_farm_subsidy_year`;
CREATE TABLE `tbl_archive_farm_subsidy_year`
(
    `id`                               bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                       bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`                 tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                          bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`                  tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_sort_num`                    int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `farm_acre`                        decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `business_category_ids`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`          varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `archive_year`                     int(11) NULL DEFAULT NULL COMMENT '统计日期：年 2021',
    `caitian_acre`                     decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田面积（亩）',
    `subsidy_acre_lvyecai`             decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜补贴面积（亩）',
    `subsidy_acre_not_lvyecai`         decimal(15, 2) NULL DEFAULT NULL COMMENT '非绿叶菜补贴面积（亩）',
    `subsidy_acre_total`               decimal(15, 2) NULL DEFAULT NULL COMMENT '总补贴面积（亩）',
    `subsidy_acre_caitian_lvyecai`     decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田绿叶菜补贴面积（亩）',
    `subsidy_acre_caitian_not_lvyecai` decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田非绿叶菜补贴面积（亩）',
    `subsidy_acre_caitian_total`       decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田总补贴面积（亩）',
    `create_time`                      datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                      datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_landId_archive_year` (`farm_id`, `archive_year`) USING BTREE COMMENT '农场id+统计年份'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场按年补贴归档表（经营主体补贴面积测算归档表）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_gis_farm_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_gis_farm_relation`;
CREATE TABLE `tbl_archive_gis_farm_relation`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `farm_id`       bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `gis_farm_id`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测绘院主体编号/ZHUTIID',
    `gis_farm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测绘院主体名称',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farm_id_gis_farm_id` (`farm_id`, `gis_farm_id`) USING BTREE COMMENT '神农口袋farmId & gis_zhuti_info 唯一主键'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '测绘院主体关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_info_report_area_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_info_report_area_day`;
CREATE TABLE `tbl_archive_info_report_area_day`
(
    `id`                                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `archive_day_str`                         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按天统计 格式：2021-11-11 表示第11月11号',
    `plant_plan_count_agri`                   bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案添加次数',
    `plant_plan_overdue_count_agri`           bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案逾期次数',
    `plant_plan_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案添加次数',
    `plant_plan_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案逾期次数',
    `plant_plan_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案添加次数',
    `plant_plan_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案逾期次数',
    `plant_plan_count_forestry`               bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案添加次数',
    `plant_plan_overdue_count_forestry`       bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案逾期次数',
    `fertilizer_count`                        bigint(20) NULL DEFAULT NULL COMMENT '施肥次数',
    `fertilizer_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '施肥逾期次数',
    `feeding_count`                           bigint(20) NULL DEFAULT NULL COMMENT '喂料次数',
    `feeding_overdue_count`                   bigint(20) NULL DEFAULT NULL COMMENT '喂料逾期次数',
    `charging_count`                          bigint(20) NULL DEFAULT NULL COMMENT '投料次数',
    `charging_overdue_count`                  bigint(20) NULL DEFAULT NULL COMMENT '投料逾期次数',
    `medication_count`                        bigint(20) NULL DEFAULT NULL COMMENT '用药次数',
    `medication_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '用药逾期次数',
    `medication_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '用兽药次数',
    `medication_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '用瘦药逾期次数',
    `medication_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '用渔药次数',
    `medication_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '用渔药逾期次数',
    `mission_category_count_other`            bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作次数（其他）',
    `mission_category_overdue_count_other`    bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作逾期次数（其他）',
    `pick_record_count_agri`                  bigint(20) NULL DEFAULT NULL COMMENT '农业采收次数',
    `pick_record_overdue_count_agri`          bigint(20) NULL DEFAULT NULL COMMENT '农业采收逾期次数',
    `pick_record_count_forestry`              bigint(20) NULL DEFAULT NULL COMMENT '林业采收次数',
    `pick_record_overdue_count_forestry`      bigint(20) NULL DEFAULT NULL COMMENT '林业采收逾期次数',
    `pick_record_count_fishery`               bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞次数',
    `pick_record_overdue_count_fishery`       bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞逾期次数',
    `pick_record_count_animal`                bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞次数',
    `pick_record_overdue_count_animal`        bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞逾期次数',
    `pick_record_sale_count_agri`             bigint(20) NULL DEFAULT NULL COMMENT '农业销售次数',
    `pick_record_sale_overdue_count_agri`     bigint(20) NULL DEFAULT NULL COMMENT '农业销售逾期次数',
    `pick_record_sale_count_forestry`         bigint(20) NULL DEFAULT NULL COMMENT '林业销售次数',
    `pick_record_sale_overdue_count_forestry` bigint(20) NULL DEFAULT NULL COMMENT '林业销售逾期次数',
    `pick_record_sale_count_fishery`          bigint(20) NULL DEFAULT NULL COMMENT '渔业销售次数',
    `pick_record_sale_overdue_count_fishery`  bigint(20) NULL DEFAULT NULL COMMENT '渔业销售逾期次数',
    `pick_record_sale_count_animal`           bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售次数',
    `pick_record_sale_overdue_count_animal`   bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售逾期次数',
    `total_farm_count`                        bigint(20) NULL DEFAULT NULL COMMENT '主体总数（家）',
    `total_mission_farm_count`                bigint(20) NULL DEFAULT NULL COMMENT '填报主体总数（家）',
    `total_not_mission_farm_count`            bigint(20) NULL DEFAULT NULL COMMENT '未填报主体总数（家）',
    `total_mission_count`                     bigint(20) NULL DEFAULT NULL COMMENT '填报总数',
    `total_overdue_count`                     bigint(20) NULL DEFAULT NULL COMMENT '逾期总数',
    `not_mission_farm_rate`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '未填报主体占比',
    `mission_rate`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '填报及时率',
    `create_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_archiveDayStr` (`area_id`, `archive_day_str`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息直报区域按天归档表（经营主体信息直报区域按天统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_info_report_area_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_info_report_area_month`;
CREATE TABLE `tbl_archive_info_report_area_month`
(
    `id`                                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `archive_month_str`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按月统计 格式：2021-09 表示第9月',
    `plant_plan_count_agri`                   bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案添加次数',
    `plant_plan_overdue_count_agri`           bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案逾期次数',
    `plant_plan_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案添加次数',
    `plant_plan_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案逾期次数',
    `plant_plan_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案添加次数',
    `plant_plan_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案逾期次数',
    `plant_plan_count_forestry`               bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案添加次数',
    `plant_plan_overdue_count_forestry`       bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案逾期次数',
    `fertilizer_count`                        bigint(20) NULL DEFAULT NULL COMMENT '施肥次数',
    `fertilizer_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '施肥逾期次数',
    `feeding_count`                           bigint(20) NULL DEFAULT NULL COMMENT '喂料次数',
    `feeding_overdue_count`                   bigint(20) NULL DEFAULT NULL COMMENT '喂料逾期次数',
    `charging_count`                          bigint(20) NULL DEFAULT NULL COMMENT '投料次数',
    `charging_overdue_count`                  bigint(20) NULL DEFAULT NULL COMMENT '投料逾期次数',
    `medication_count`                        bigint(20) NULL DEFAULT NULL COMMENT '用药次数',
    `medication_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '用药逾期次数',
    `medication_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '用兽药次数',
    `medication_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '用瘦药逾期次数',
    `medication_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '用渔药次数',
    `medication_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '用渔药逾期次数',
    `mission_category_count_other`            bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作次数（其他）',
    `mission_category_overdue_count_other`    bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作逾期次数（其他）',
    `pick_record_count_agri`                  bigint(20) NULL DEFAULT NULL COMMENT '农业采收次数',
    `pick_record_overdue_count_agri`          bigint(20) NULL DEFAULT NULL COMMENT '农业采收逾期次数',
    `pick_record_count_forestry`              bigint(20) NULL DEFAULT NULL COMMENT '林业采收次数',
    `pick_record_overdue_count_forestry`      bigint(20) NULL DEFAULT NULL COMMENT '林业采收逾期次数',
    `pick_record_count_fishery`               bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞次数',
    `pick_record_overdue_count_fishery`       bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞逾期次数',
    `pick_record_count_animal`                bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞次数',
    `pick_record_overdue_count_animal`        bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞逾期次数',
    `pick_record_sale_count_agri`             bigint(20) NULL DEFAULT NULL COMMENT '农业销售次数',
    `pick_record_sale_overdue_count_agri`     bigint(20) NULL DEFAULT NULL COMMENT '农业销售逾期次数',
    `pick_record_sale_count_forestry`         bigint(20) NULL DEFAULT NULL COMMENT '林业销售次数',
    `pick_record_sale_overdue_count_forestry` bigint(20) NULL DEFAULT NULL COMMENT '林业销售逾期次数',
    `pick_record_sale_count_fishery`          bigint(20) NULL DEFAULT NULL COMMENT '渔业销售次数',
    `pick_record_sale_overdue_count_fishery`  bigint(20) NULL DEFAULT NULL COMMENT '渔业销售逾期次数',
    `pick_record_sale_count_animal`           bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售次数',
    `pick_record_sale_overdue_count_animal`   bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售逾期次数',
    `total_farm_count`                        bigint(20) NULL DEFAULT NULL COMMENT '主体总数（家）',
    `total_mission_farm_count`                bigint(20) NULL DEFAULT NULL COMMENT '填报主体总数（家）',
    `total_not_mission_farm_count`            bigint(20) NULL DEFAULT NULL COMMENT '未填报主体总数（家）',
    `total_mission_count`                     bigint(20) NULL DEFAULT NULL COMMENT '填报总数',
    `total_overdue_count`                     bigint(20) NULL DEFAULT NULL COMMENT '逾期总数',
    `not_mission_farm_rate`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '未填报主体占比',
    `mission_rate`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '填报及时率',
    `record_start_day`                        date NULL DEFAULT NULL COMMENT '当前月开始日期 2021-01-01表示当前月第一天',
    `record_end_day`                          date NULL DEFAULT NULL COMMENT '当前月开始日期 2021-01-31表示当前月最后一天',
    `create_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_archiveMonthStr` (`area_id`, `archive_month_str`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息直报区域按月归档表（经营主体信息直报区域按月统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_info_report_area_week
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_info_report_area_week`;
CREATE TABLE `tbl_archive_info_report_area_week`
(
    `id`                                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `archive_week_str`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按周统计 格式：2021-11 表示第11周',
    `plant_plan_count_agri`                   bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案添加次数',
    `plant_plan_overdue_count_agri`           bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案逾期次数',
    `plant_plan_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案添加次数',
    `plant_plan_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案逾期次数',
    `plant_plan_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案添加次数',
    `plant_plan_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案逾期次数',
    `plant_plan_count_forestry`               bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案添加次数',
    `plant_plan_overdue_count_forestry`       bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案逾期次数',
    `fertilizer_count`                        bigint(20) NULL DEFAULT NULL COMMENT '施肥次数',
    `fertilizer_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '施肥逾期次数',
    `feeding_count`                           bigint(20) NULL DEFAULT NULL COMMENT '喂料次数',
    `feeding_overdue_count`                   bigint(20) NULL DEFAULT NULL COMMENT '喂料逾期次数',
    `charging_count`                          bigint(20) NULL DEFAULT NULL COMMENT '投料次数',
    `charging_overdue_count`                  bigint(20) NULL DEFAULT NULL COMMENT '投料逾期次数',
    `medication_count`                        bigint(20) NULL DEFAULT NULL COMMENT '用药次数',
    `medication_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '用药逾期次数',
    `medication_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '用兽药次数',
    `medication_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '用瘦药逾期次数',
    `medication_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '用渔药次数',
    `medication_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '用渔药逾期次数',
    `mission_category_count_other`            bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作次数（其他）',
    `mission_category_overdue_count_other`    bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作逾期次数（其他）',
    `pick_record_count_agri`                  bigint(20) NULL DEFAULT NULL COMMENT '农业采收次数',
    `pick_record_overdue_count_agri`          bigint(20) NULL DEFAULT NULL COMMENT '农业采收逾期次数',
    `pick_record_count_forestry`              bigint(20) NULL DEFAULT NULL COMMENT '林业采收次数',
    `pick_record_overdue_count_forestry`      bigint(20) NULL DEFAULT NULL COMMENT '林业采收逾期次数',
    `pick_record_count_fishery`               bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞次数',
    `pick_record_overdue_count_fishery`       bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞逾期次数',
    `pick_record_count_animal`                bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞次数',
    `pick_record_overdue_count_animal`        bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞逾期次数',
    `pick_record_sale_count_agri`             bigint(20) NULL DEFAULT NULL COMMENT '农业销售次数',
    `pick_record_sale_overdue_count_agri`     bigint(20) NULL DEFAULT NULL COMMENT '农业销售逾期次数',
    `pick_record_sale_count_forestry`         bigint(20) NULL DEFAULT NULL COMMENT '林业销售次数',
    `pick_record_sale_overdue_count_forestry` bigint(20) NULL DEFAULT NULL COMMENT '林业销售逾期次数',
    `pick_record_sale_count_fishery`          bigint(20) NULL DEFAULT NULL COMMENT '渔业销售次数',
    `pick_record_sale_overdue_count_fishery`  bigint(20) NULL DEFAULT NULL COMMENT '渔业销售逾期次数',
    `pick_record_sale_count_animal`           bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售次数',
    `pick_record_sale_overdue_count_animal`   bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售逾期次数',
    `total_farm_count`                        bigint(20) NULL DEFAULT NULL COMMENT '主体总数（家）',
    `total_mission_farm_count`                bigint(20) NULL DEFAULT NULL COMMENT '填报主体总数（家）',
    `total_not_mission_farm_count`            bigint(20) NULL DEFAULT NULL COMMENT '未填报主体总数（家）',
    `total_mission_count`                     bigint(20) NULL DEFAULT NULL COMMENT '填报总数',
    `total_overdue_count`                     bigint(20) NULL DEFAULT NULL COMMENT '逾期总数',
    `not_mission_farm_rate`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '未填报主体占比',
    `mission_rate`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '填报及时率',
    `record_start_day`                        date NULL DEFAULT NULL COMMENT '当前周开始日期 2021-01-01表示当前周第一天',
    `record_end_day`                          date NULL DEFAULT NULL COMMENT '当前周开始日期 2021-01-07表示当前周最后一天',
    `create_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_archiveWeekStr` (`area_id`, `archive_week_str`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息直报区域按周归档表（经营主体信息直报区域按周统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_info_report_area_year
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_info_report_area_year`;
CREATE TABLE `tbl_archive_info_report_area_year`
(
    `id`                                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `archive_year_str`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按月统计 格式：2021 表示第2020年',
    `plant_plan_count_agri`                   bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案添加次数',
    `plant_plan_overdue_count_agri`           bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案逾期次数',
    `plant_plan_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案添加次数',
    `plant_plan_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案逾期次数',
    `plant_plan_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案添加次数',
    `plant_plan_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案逾期次数',
    `plant_plan_count_forestry`               bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案添加次数',
    `plant_plan_overdue_count_forestry`       bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案逾期次数',
    `fertilizer_count`                        bigint(20) NULL DEFAULT NULL COMMENT '施肥次数',
    `fertilizer_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '施肥逾期次数',
    `feeding_count`                           bigint(20) NULL DEFAULT NULL COMMENT '喂料次数',
    `feeding_overdue_count`                   bigint(20) NULL DEFAULT NULL COMMENT '喂料逾期次数',
    `charging_count`                          bigint(20) NULL DEFAULT NULL COMMENT '投料次数',
    `charging_overdue_count`                  bigint(20) NULL DEFAULT NULL COMMENT '投料逾期次数',
    `medication_count`                        bigint(20) NULL DEFAULT NULL COMMENT '用药次数',
    `medication_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '用药逾期次数',
    `medication_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '用兽药次数',
    `medication_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '用瘦药逾期次数',
    `medication_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '用渔药次数',
    `medication_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '用渔药逾期次数',
    `mission_category_count_other`            bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作次数（其他）',
    `mission_category_overdue_count_other`    bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作逾期次数（其他）',
    `pick_record_count_agri`                  bigint(20) NULL DEFAULT NULL COMMENT '农业采收次数',
    `pick_record_overdue_count_agri`          bigint(20) NULL DEFAULT NULL COMMENT '农业采收逾期次数',
    `pick_record_count_forestry`              bigint(20) NULL DEFAULT NULL COMMENT '林业采收次数',
    `pick_record_overdue_count_forestry`      bigint(20) NULL DEFAULT NULL COMMENT '林业采收逾期次数',
    `pick_record_count_fishery`               bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞次数',
    `pick_record_overdue_count_fishery`       bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞逾期次数',
    `pick_record_count_animal`                bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞次数',
    `pick_record_overdue_count_animal`        bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞逾期次数',
    `pick_record_sale_count_agri`             bigint(20) NULL DEFAULT NULL COMMENT '农业销售次数',
    `pick_record_sale_overdue_count_agri`     bigint(20) NULL DEFAULT NULL COMMENT '农业销售逾期次数',
    `pick_record_sale_count_forestry`         bigint(20) NULL DEFAULT NULL COMMENT '林业销售次数',
    `pick_record_sale_overdue_count_forestry` bigint(20) NULL DEFAULT NULL COMMENT '林业销售逾期次数',
    `pick_record_sale_count_fishery`          bigint(20) NULL DEFAULT NULL COMMENT '渔业销售次数',
    `pick_record_sale_overdue_count_fishery`  bigint(20) NULL DEFAULT NULL COMMENT '渔业销售逾期次数',
    `pick_record_sale_count_animal`           bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售次数',
    `pick_record_sale_overdue_count_animal`   bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售逾期次数',
    `total_farm_count`                        bigint(20) NULL DEFAULT NULL COMMENT '主体总数（家）',
    `total_mission_farm_count`                bigint(20) NULL DEFAULT NULL COMMENT '填报主体总数（家）',
    `total_not_mission_farm_count`            bigint(20) NULL DEFAULT NULL COMMENT '未填报主体总数（家）',
    `total_mission_count`                     bigint(20) NULL DEFAULT NULL COMMENT '填报总数',
    `total_overdue_count`                     bigint(20) NULL DEFAULT NULL COMMENT '逾期总数',
    `not_mission_farm_rate`                   decimal(15, 2) NULL DEFAULT NULL COMMENT '未填报主体占比',
    `mission_rate`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '填报及时率',
    `create_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_archiveYearStr` (`area_id`, `archive_year_str`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息直报区域按年归档表（经营主体信息直报区域按年统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_info_report_farm_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_info_report_farm_month`;
CREATE TABLE `tbl_archive_info_report_farm_month`
(
    `id`                                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`                     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`                   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`                        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `business_category_ids`                   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`                 varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `statistics_flag`                         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `archive_month_str`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按月统计 格式：2021-01 表示第1月',
    `plant_plan_count_agri`                   bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案添加次数',
    `plant_plan_overdue_count_agri`           bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案逾期次数',
    `plant_plan_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案添加次数',
    `plant_plan_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案逾期次数',
    `plant_plan_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案添加次数',
    `plant_plan_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案逾期次数',
    `plant_plan_count_forestry`               bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案添加次数',
    `plant_plan_overdue_count_forestry`       bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案逾期次数',
    `fertilizer_count`                        bigint(20) NULL DEFAULT NULL COMMENT '施肥次数',
    `fertilizer_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '施肥逾期次数',
    `feeding_count`                           bigint(20) NULL DEFAULT NULL COMMENT '喂料次数',
    `feeding_overdue_count`                   bigint(20) NULL DEFAULT NULL COMMENT '喂料逾期次数',
    `charging_count`                          bigint(20) NULL DEFAULT NULL COMMENT '投料次数',
    `charging_overdue_count`                  bigint(20) NULL DEFAULT NULL COMMENT '投料逾期次数',
    `medication_count`                        bigint(20) NULL DEFAULT NULL COMMENT '用药次数',
    `medication_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '用药逾期次数',
    `medication_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '用兽药次数',
    `medication_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '用瘦药逾期次数',
    `medication_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '用渔药次数',
    `medication_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '用渔药逾期次数',
    `mission_category_count_other`            bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作次数（其他）',
    `mission_category_overdue_count_other`    bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作逾期次数（其他）',
    `pick_record_count_agri`                  bigint(20) NULL DEFAULT NULL COMMENT '农业采收次数',
    `pick_record_overdue_count_agri`          bigint(20) NULL DEFAULT NULL COMMENT '农业采收逾期次数',
    `pick_record_count_forestry`              bigint(20) NULL DEFAULT NULL COMMENT '林业采收次数',
    `pick_record_overdue_count_forestry`      bigint(20) NULL DEFAULT NULL COMMENT '林业采收逾期次数',
    `pick_record_count_fishery`               bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞次数',
    `pick_record_overdue_count_fishery`       bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞逾期次数',
    `pick_record_count_animal`                bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞次数',
    `pick_record_overdue_count_animal`        bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞逾期次数',
    `pick_record_sale_count_agri`             bigint(20) NULL DEFAULT NULL COMMENT '农业销售次数',
    `pick_record_sale_overdue_count_agri`     bigint(20) NULL DEFAULT NULL COMMENT '农业销售逾期次数',
    `pick_record_sale_count_forestry`         bigint(20) NULL DEFAULT NULL COMMENT '林业销售次数',
    `pick_record_sale_overdue_count_forestry` bigint(20) NULL DEFAULT NULL COMMENT '林业销售逾期次数',
    `pick_record_sale_count_fishery`          bigint(20) NULL DEFAULT NULL COMMENT '渔业销售次数',
    `pick_record_sale_overdue_count_fishery`  bigint(20) NULL DEFAULT NULL COMMENT '渔业销售逾期次数',
    `pick_record_sale_count_animal`           bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售次数',
    `pick_record_sale_overdue_count_animal`   bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售逾期次数',
    `total_mission_count`                     bigint(20) NULL DEFAULT NULL COMMENT '填报总数',
    `total_overdue_count`                     bigint(20) NULL DEFAULT NULL COMMENT '逾期总数',
    `mission_rate`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '填报及时率',
    `record_start_day`                        date NULL DEFAULT NULL COMMENT '当前月开始日期 2021-01-01表示当前月第一天',
    `record_end_day`                          date NULL DEFAULT NULL COMMENT '当前月开始日期 2021-01-31表示当前月最后一天',
    `create_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archiveMonthStr` (`farm_id`, `archive_month_str`) USING BTREE,
    INDEX                                     `idx_archive_month_str` (`archive_month_str`) USING BTREE,
    INDEX                                     `idx_cityid_statisticsflag_archiveMonthStr` (`city_id`, `statistics_flag`, `archive_month_str`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息直报主体-按月归档表（经营主体信息直报按月统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_info_report_farm_week
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_info_report_farm_week`;
CREATE TABLE `tbl_archive_info_report_farm_week`
(
    `id`                                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`                     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`                   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`                        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `business_category_ids`                   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`                 varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `statistics_flag`                         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `archive_week_str`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按周统计 格式：2021-11 表示第11周',
    `plant_plan_count_agri`                   bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案添加次数',
    `plant_plan_overdue_count_agri`           bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案逾期次数',
    `plant_plan_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案添加次数',
    `plant_plan_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案逾期次数',
    `plant_plan_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案添加次数',
    `plant_plan_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案逾期次数',
    `plant_plan_count_forestry`               bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案添加次数',
    `plant_plan_overdue_count_forestry`       bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案逾期次数',
    `fertilizer_count`                        bigint(20) NULL DEFAULT NULL COMMENT '施肥次数',
    `fertilizer_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '施肥逾期次数',
    `feeding_count`                           bigint(20) NULL DEFAULT NULL COMMENT '喂料次数',
    `feeding_overdue_count`                   bigint(20) NULL DEFAULT NULL COMMENT '喂料逾期次数',
    `charging_count`                          bigint(20) NULL DEFAULT NULL COMMENT '投料次数',
    `charging_overdue_count`                  bigint(20) NULL DEFAULT NULL COMMENT '投料逾期次数',
    `medication_count`                        bigint(20) NULL DEFAULT NULL COMMENT '用药次数',
    `medication_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '用药逾期次数',
    `medication_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '用兽药次数',
    `medication_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '用瘦药逾期次数',
    `medication_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '用渔药次数',
    `medication_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '用渔药逾期次数',
    `mission_category_count_other`            bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作次数（其他）',
    `mission_category_overdue_count_other`    bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作逾期次数（其他）',
    `pick_record_count_agri`                  bigint(20) NULL DEFAULT NULL COMMENT '农业采收次数',
    `pick_record_overdue_count_agri`          bigint(20) NULL DEFAULT NULL COMMENT '农业采收逾期次数',
    `pick_record_count_forestry`              bigint(20) NULL DEFAULT NULL COMMENT '林业采收次数',
    `pick_record_overdue_count_forestry`      bigint(20) NULL DEFAULT NULL COMMENT '林业采收逾期次数',
    `pick_record_count_fishery`               bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞次数',
    `pick_record_overdue_count_fishery`       bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞逾期次数',
    `pick_record_count_animal`                bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞次数',
    `pick_record_overdue_count_animal`        bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞逾期次数',
    `pick_record_sale_count_agri`             bigint(20) NULL DEFAULT NULL COMMENT '农业销售次数',
    `pick_record_sale_overdue_count_agri`     bigint(20) NULL DEFAULT NULL COMMENT '农业销售逾期次数',
    `pick_record_sale_count_forestry`         bigint(20) NULL DEFAULT NULL COMMENT '林业销售次数',
    `pick_record_sale_overdue_count_forestry` bigint(20) NULL DEFAULT NULL COMMENT '林业销售逾期次数',
    `pick_record_sale_count_fishery`          bigint(20) NULL DEFAULT NULL COMMENT '渔业销售次数',
    `pick_record_sale_overdue_count_fishery`  bigint(20) NULL DEFAULT NULL COMMENT '渔业销售逾期次数',
    `pick_record_sale_count_animal`           bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售次数',
    `pick_record_sale_overdue_count_animal`   bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售逾期次数',
    `total_mission_count`                     bigint(20) NULL DEFAULT NULL COMMENT '填报总数',
    `total_overdue_count`                     bigint(20) NULL DEFAULT NULL COMMENT '逾期总数',
    `mission_rate`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '填报及时率',
    `record_start_day`                        date NULL DEFAULT NULL COMMENT '当前周开始日期 2021-01-01表示当前周第一天',
    `record_end_day`                          date NULL DEFAULT NULL COMMENT '当前周开始日期 2021-01-07表示当前周最后一天',
    `create_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archiveWeekStr` (`farm_id`, `archive_week_str`) USING BTREE,
    INDEX                                     `idx_archive_week_str` (`archive_week_str`) USING BTREE,
    INDEX                                     `idx_cityid_statisticsflag_archiveWeekStr` (`city_id`, `statistics_flag`, `archive_week_str`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息直报主体-按周归档表（经营主体信息直报按周统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_info_report_farm_year
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_info_report_farm_year`;
CREATE TABLE `tbl_archive_info_report_farm_year`
(
    `id`                                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`                     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`                   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`                        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `business_category_ids`                   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`                 varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `statistics_flag`                         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `archive_year_str`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按年统计 格式：2021  表示2021年',
    `plant_plan_count_agri`                   bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案添加次数',
    `plant_plan_overdue_count_agri`           bigint(20) NULL DEFAULT NULL COMMENT '农业种植档案逾期次数',
    `plant_plan_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案添加次数',
    `plant_plan_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '畜牧业养殖档案逾期次数',
    `plant_plan_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案添加次数',
    `plant_plan_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '渔业养殖档案逾期次数',
    `plant_plan_count_forestry`               bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案添加次数',
    `plant_plan_overdue_count_forestry`       bigint(20) NULL DEFAULT NULL COMMENT '林业种植档案逾期次数',
    `fertilizer_count`                        bigint(20) NULL DEFAULT NULL COMMENT '施肥次数',
    `fertilizer_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '施肥逾期次数',
    `feeding_count`                           bigint(20) NULL DEFAULT NULL COMMENT '喂料次数',
    `feeding_overdue_count`                   bigint(20) NULL DEFAULT NULL COMMENT '喂料逾期次数',
    `charging_count`                          bigint(20) NULL DEFAULT NULL COMMENT '投料次数',
    `charging_overdue_count`                  bigint(20) NULL DEFAULT NULL COMMENT '投料逾期次数',
    `medication_count`                        bigint(20) NULL DEFAULT NULL COMMENT '用药次数',
    `medication_overdue_count`                bigint(20) NULL DEFAULT NULL COMMENT '用药逾期次数',
    `medication_count_animal`                 bigint(20) NULL DEFAULT NULL COMMENT '用兽药次数',
    `medication_overdue_count_animal`         bigint(20) NULL DEFAULT NULL COMMENT '用瘦药逾期次数',
    `medication_count_fishery`                bigint(20) NULL DEFAULT NULL COMMENT '用渔药次数',
    `medication_overdue_count_fishery`        bigint(20) NULL DEFAULT NULL COMMENT '用渔药逾期次数',
    `mission_category_count_other`            bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作次数（其他）',
    `mission_category_overdue_count_other`    bigint(20) NULL DEFAULT NULL COMMENT '低频农事类型操作逾期次数（其他）',
    `pick_record_count_agri`                  bigint(20) NULL DEFAULT NULL COMMENT '农业采收次数',
    `pick_record_overdue_count_agri`          bigint(20) NULL DEFAULT NULL COMMENT '农业采收逾期次数',
    `pick_record_count_forestry`              bigint(20) NULL DEFAULT NULL COMMENT '林业采收次数',
    `pick_record_overdue_count_forestry`      bigint(20) NULL DEFAULT NULL COMMENT '林业采收逾期次数',
    `pick_record_count_fishery`               bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞次数',
    `pick_record_overdue_count_fishery`       bigint(20) NULL DEFAULT NULL COMMENT '渔业捕捞逾期次数',
    `pick_record_count_animal`                bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞次数',
    `pick_record_overdue_count_animal`        bigint(20) NULL DEFAULT NULL COMMENT '畜牧业捕捞逾期次数',
    `pick_record_sale_count_agri`             bigint(20) NULL DEFAULT NULL COMMENT '农业销售次数',
    `pick_record_sale_overdue_count_agri`     bigint(20) NULL DEFAULT NULL COMMENT '农业销售逾期次数',
    `pick_record_sale_count_forestry`         bigint(20) NULL DEFAULT NULL COMMENT '林业销售次数',
    `pick_record_sale_overdue_count_forestry` bigint(20) NULL DEFAULT NULL COMMENT '林业销售逾期次数',
    `pick_record_sale_count_fishery`          bigint(20) NULL DEFAULT NULL COMMENT '渔业销售次数',
    `pick_record_sale_overdue_count_fishery`  bigint(20) NULL DEFAULT NULL COMMENT '渔业销售逾期次数',
    `pick_record_sale_count_animal`           bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售次数',
    `pick_record_sale_overdue_count_animal`   bigint(20) NULL DEFAULT NULL COMMENT '畜牧业销售逾期次数',
    `total_mission_count`                     bigint(20) NULL DEFAULT NULL COMMENT '填报总数',
    `total_overdue_count`                     bigint(20) NULL DEFAULT NULL COMMENT '逾期总数',
    `mission_rate`                            decimal(15, 2) NULL DEFAULT NULL COMMENT '填报及时率',
    `create_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_archiveYearStr` (`farm_id`, `archive_year_str`) USING BTREE,
    INDEX                                     `idx_archive_year_str` (`archive_year_str`) USING BTREE,
    INDEX                                     `idx_cityid_statisticsflag_archiveYearStr` (`city_id`, `statistics_flag`, `archive_year_str`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息直报主体-按年归档表（经营主体信息直报按年统计）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_insurable_situation_farm_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_insurable_situation_farm_day`;
CREATE TABLE `tbl_archive_insurable_situation_farm_day`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_day_str`         varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归档年月 yyyy-MM-dd,按日归档',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `onland_acre`             decimal(15, 2) NULL DEFAULT NULL COMMENT '在田面积（亩）',
    `insurable_area`          decimal(15, 2) NULL DEFAULT NULL COMMENT '可投保面积（亩）',
    `uninsured_area`          decimal(15, 2) NULL DEFAULT NULL COMMENT '未投保面积（亩）',
    `ensure_area`             decimal(15, 2) NULL DEFAULT NULL COMMENT '保障中面积（亩）',
    `insure_rate`             decimal(15, 2) NULL DEFAULT NULL COMMENT '投保比例',
    `create_time`             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId` (`farm_id`) USING BTREE COMMENT '农场id唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '绿叶菜价格险今日可投情况-按农场查看'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_insured_situation_area_crop_group_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_insured_situation_area_crop_group_month`;
CREATE TABLE `tbl_archive_insured_situation_area_crop_group_month`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_month_str`    varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归档年月 yyyy-MM，按月归档',
    `crop_group_id`        bigint(20) NULL DEFAULT NULL COMMENT '作物种类id',
    `crop_group_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分类名称',
    `area_id`              int(11) NULL DEFAULT NULL COMMENT '区域id',
    `area_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `insured_land_area`    decimal(15, 2) NULL DEFAULT NULL COMMENT '已投保面积',
    `insured_self_premium` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '已投保自缴保费',
    `total_loss_number`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出险面积(亩)',
    `total_sum_claim`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '赔付金额（元）',
    `create_time`          datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_archiveMonthStr_cropGroupId` (`area_id`, `archive_month_str`, `crop_group_id`) USING BTREE COMMENT '区域月份作物分类唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '绿叶菜价格险投保情况-按区域-按月-按作物查看'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_insured_situation_area_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_insured_situation_area_month`;
CREATE TABLE `tbl_archive_insured_situation_area_month`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_month_str`    varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归档年月 yyyy-MM，按月归档',
    `area_id`              int(11) NULL DEFAULT NULL COMMENT '区域id',
    `area_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `insured_land_area`    decimal(15, 2) NULL DEFAULT NULL COMMENT '已投保面积',
    `insured_farm_count`   int(11) NULL DEFAULT NULL COMMENT '已投保主体数',
    `insured_policy_count` int(11) NULL DEFAULT NULL COMMENT '已投保保单数',
    `insured_sum_premium`  decimal(14, 2) NULL DEFAULT 0.00 COMMENT '已投保保费',
    `insured_self_premium` decimal(14, 2) NULL DEFAULT 0.00 COMMENT '已投保自缴保费',
    `total_loss_number`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出险面积（亩）',
    `total_sum_claim`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '赔付金额（元）',
    `create_time`          datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_archiveMonthStr` (`area_id`, `archive_month_str`) USING BTREE COMMENT '区域月份唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '绿叶菜价格险投保情况-按区域-按月查看'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_land_leisure_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_land_leisure_day`;
CREATE TABLE `tbl_archive_land_leisure_day`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '所属农场id',
    `gis_land_type_id`        bigint(20) NULL DEFAULT NULL COMMENT '上海gis地块类型表id 1：粮田  2：菜田  3：经作田  4： 零星用地（其他）5：零星用地（已征地）6：零星用地（自留地/集体地）7：果园 8：林地  9：养殖（畜牧）10：养殖（水产）',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_sort_num`           int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `farm_acre`               decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `land_count`              int(20) NULL DEFAULT NULL COMMENT '空闲地块数量',
    `land_sum_area`           decimal(15, 2) NULL DEFAULT NULL COMMENT '空闲地块面积之和(亩)',
    `create_time`             datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '空闲地块归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_land_subsidy_year
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_land_subsidy_year`;
CREATE TABLE `tbl_archive_land_subsidy_year`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `enterprise_credit_code`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `legal_person`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `farm_sort_num`           int(11) NULL DEFAULT NULL COMMENT '农场排序字段',
    `farm_acre`               decimal(15, 2) NULL DEFAULT NULL COMMENT '农场面积/亩',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `archive_year`            int(11) NULL DEFAULT NULL COMMENT '统计日期：年 2021',
    `land_id`                 bigint(20) NULL DEFAULT NULL COMMENT '地块id',
    `land_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块名称',
    `gis_land_type_id`        bigint(20) NULL DEFAULT NULL COMMENT '地块用途id',
    `gis_land_type_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块用途名称',
    `land_type_id`            bigint(20) NULL DEFAULT NULL COMMENT '地块类型id',
    `land_type_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块类型名称',
    `sh_gis_dkid`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应上海测绘院地块id',
    `land_acre`               decimal(15, 2) NULL DEFAULT NULL COMMENT '地块面积/亩',
    `x1`                      int(20) NULL DEFAULT NULL COMMENT '(1月1日-3月31日)冬淡绿叶菜茬口数',
    `y1`                      int(20) NULL DEFAULT NULL COMMENT '(1月1日-3月31日)冬淡非绿叶菜茬口数',
    `x2`                      int(20) NULL DEFAULT NULL COMMENT '(4月1日-5月31日)绿叶菜茬口数',
    `y2`                      int(20) NULL DEFAULT NULL COMMENT '(4月1日-5月31日)非绿叶菜茬口数',
    `x3`                      int(20) NULL DEFAULT NULL COMMENT '(6月1日-9月30日)夏淡绿叶菜茬口数',
    `y3`                      int(20) NULL DEFAULT NULL COMMENT '(6月1日-9月30日)夏淡非绿叶菜茬口数',
    `x4`                      int(20) NULL DEFAULT NULL COMMENT '(10月1日-11月30日)绿叶菜茬口数',
    `y4`                      int(20) NULL DEFAULT NULL COMMENT '(10月1日-11月30日)非绿叶菜茬口数',
    `x5`                      int(20) NULL DEFAULT NULL COMMENT '(12月1日-12月31日)冬淡绿叶菜茬口数',
    `y5`                      int(20) NULL DEFAULT NULL COMMENT '(12月1日-12月31日)冬淡非绿叶菜茬口数',
    `z1`                      int(20) NULL DEFAULT NULL COMMENT '夏淡绿叶菜补贴茬口数',
    `z2`                      int(20) NULL DEFAULT NULL COMMENT '冬淡绿叶菜补贴茬口数',
    `z3`                      int(20) NULL DEFAULT NULL COMMENT '夏淡和冬淡非绿叶菜茬口数',
    `x`                       int(20) NULL DEFAULT NULL COMMENT '绿叶菜茬口数',
    `y`                       int(20) NULL DEFAULT NULL COMMENT '非绿叶菜茬口数',
    `create_time`             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `plant_plan_id`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '种植计划id集合，用逗号分开',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_landId_archive_year` (`land_id`, `archive_year`) USING BTREE COMMENT '地块id+统计年份',
    INDEX                     `idx_farm_id` (`farm_id`) USING BTREE,
    INDEX                     `idx_province_id` (`province_id`) USING BTREE,
    INDEX                     `idx_city_id` (`city_id`) USING BTREE,
    INDEX                     `idx_county_id` (`county_id`) USING BTREE,
    INDEX                     `idx_town_id` (`town_id`) USING BTREE,
    INDEX                     `idx_village_id` (`village_id`) USING BTREE,
    INDEX                     `idx_company_category_id` (`company_category_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '地块统计按年归档表（地块茬口数明细归档表）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_onland_area
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_onland_area`;
CREATE TABLE `tbl_archive_onland_area`
(
    `id`                       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `onland_acre`              decimal(15, 2) NULL DEFAULT NULL COMMENT '在田面积（亩）',
    `all_land_acre`            decimal(15, 2) NULL DEFAULT NULL COMMENT '可种植面积（亩）',
    `move_acre`                decimal(15, 2) NULL DEFAULT NULL COMMENT '土地流转面积（亩）',
    `agri_onland_acre`         decimal(15, 2) NULL DEFAULT NULL COMMENT '种植业在田面积（亩）',
    `agri_onland_acre_rate`    decimal(15, 2) NULL DEFAULT NULL COMMENT '种植业在田面积占比',
    `shucai_onland_acre`       decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜在田面积（亩）',
    `shucai_onland_acre_rate`  decimal(15, 2) NULL DEFAULT NULL COMMENT '蔬菜在田面积占比',
    `fishery_onland_acre`      decimal(15, 2) NULL DEFAULT NULL COMMENT '渔业在田面积（亩）',
    `fishery_onland_acre_rate` decimal(15, 2) NULL DEFAULT NULL COMMENT '渔业在田面积占比',
    `statistics_mode`          tinyint(2) NULL DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`              datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`              datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId` (`area_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '在田地块-按区域统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_onland_area_crop_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_onland_area_crop_category`;
CREATE TABLE `tbl_archive_onland_area_crop_category`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `crop_category_id`   bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `img_url`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物小类图片地址',
    `onland_acre`        decimal(15, 2) NULL DEFAULT NULL COMMENT '在田面积（亩）',
    `onland_count`       bigint(20) NULL DEFAULT NULL COMMENT '在田地块数量（个）',
    `statistics_mode`    tinyint(2) NULL DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`        datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`        datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_cropCategoryId` (`area_id`, `crop_category_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '在田面积-区域-按作物小类统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_onland_area_crop_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_onland_area_crop_group`;
CREATE TABLE `tbl_archive_onland_area_crop_group`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域id',
    `area_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `crop_group_id`      bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `crop_category_id`   bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物小类名称',
    `img_url`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作物分组图片地址',
    `onland_acre`        decimal(15, 2) NULL DEFAULT NULL COMMENT '在田面积（亩）',
    `onland_count`       bigint(20) NULL DEFAULT NULL COMMENT '在田地块数量（个）',
    `statistics_mode`    tinyint(2) NULL DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`        datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`        datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_areaId_cropGroupId` (`area_id`, `crop_group_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '在田面积-区域-按作物分组统计'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_sell_group_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_sell_group_day`;
CREATE TABLE `tbl_archive_sell_group_day`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `sell_type`               tinyint(4) NULL DEFAULT NULL COMMENT '销售类型',
    `sell_type_id`            bigint(20) NULL DEFAULT NULL COMMENT '销售去向',
    `crop_id`                 bigint(20) NULL DEFAULT NULL COMMENT '作物id',
    `crop_name`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物名称',
    `sell_date`               date NULL DEFAULT NULL COMMENT '销售时间',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `enterprise_credit_code`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `crop_subject_id`         bigint(20) NULL DEFAULT NULL COMMENT '作物大类id',
    `crop_category_id`        bigint(20) NULL DEFAULT NULL COMMENT '作物小类id',
    `crop_group_id`           bigint(20) NULL DEFAULT NULL COMMENT '作物分组id',
    `crop_group_name`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作物分组名称',
    `total_sales`             decimal(15, 2) NULL DEFAULT NULL COMMENT '总销量',
    `crop_category_unit`      varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
    `create_time`             datetime NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farm_sellType_sellDate` (`farm_id`, `sell_type`, `sell_type_id`, `crop_id`, `sell_date`) USING BTREE COMMENT '农场，销售类型，销售去向，作物种类id，销售日期唯一主键'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '销售上市统计区域归档表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_subsidy_farm_acre_year
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_subsidy_farm_acre_year`;
CREATE TABLE `tbl_archive_subsidy_farm_acre_year`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_year`            int(11) NULL DEFAULT NULL COMMENT '统计日期：年 2021',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `cn_ct_acre`              decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田面积（亩）',
    `land_acre`               decimal(15, 2) NULL DEFAULT NULL COMMENT '地块总面积',
    `x_land_acre`             decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田常规补贴绿叶菜补贴面积',
    `y_land_acre`             decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田常规补贴非绿叶菜补贴面积',
    `total_land_acre`         decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田常规补贴总补贴面积',
    `x_add_land_acre`         decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田增项补贴绿叶菜补贴面积',
    `y_add_land_acre`         decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田增项补贴非绿叶菜补贴面积',
    `total_add_land_acre`     decimal(15, 2) NULL DEFAULT NULL COMMENT '常年菜田增项补贴总补贴面积',
    `sv_x_land_acre`          decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜补贴面积',
    `sv_y_land_acre`          decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田非绿叶菜补贴面积',
    `sv_subsidy_land_acre`    decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田总补贴面积',
    `total_x_land_acre`       decimal(15, 2) NULL DEFAULT NULL COMMENT '总计绿叶菜补贴面积',
    `total_y_land_acre`       decimal(15, 2) NULL DEFAULT NULL COMMENT '总计非绿叶菜补贴面积',
    `all_land_acre`           decimal(15, 2) NULL DEFAULT NULL COMMENT '总计总补贴面积',
    `create_time`             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_landId_archive_year` (`archive_year`, `farm_id`) USING BTREE COMMENT '农场id+统计年份'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '按年-经营主体补贴面积测算（按年归档，每月一次）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_subsidy_farm_land_year
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_subsidy_farm_land_year`;
CREATE TABLE `tbl_archive_subsidy_farm_land_year`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_year`            int(11) NULL DEFAULT NULL COMMENT '统计日期：年 2021',
    `x`                       int(20) NULL DEFAULT NULL COMMENT '绿叶菜茬口数',
    `x_plant_plan_id`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绿叶菜补贴茬口的种植计划ID列表XX',
    `x_month`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绿叶菜补贴茬口的补贴月份列表',
    `x_land_acre`             decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜补贴面积',
    `y`                       int(20) NULL DEFAULT NULL COMMENT '非绿叶菜茬口数',
    `y_plant_plan_id`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非绿叶菜补贴茬口的种植计划ID列表YY',
    `y_month`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非绿叶菜补贴茬口的补贴月份列表',
    `y_land_acre`             decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜补贴面积',
    `subsidy_land_acre`       decimal(15, 2) NULL DEFAULT NULL COMMENT '地块补贴总面积',
    `land_acre`               decimal(15, 2) NULL DEFAULT NULL COMMENT '地块面积',
    `company_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`     bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`        tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                 bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`         tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `land_id`                 bigint(20) NULL DEFAULT NULL COMMENT '地块id',
    `land_name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块名称',
    `gis_land_type_id`        bigint(20) NULL DEFAULT NULL COMMENT '地块用途id',
    `gis_land_type_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块用途名称',
    `land_type_id`            bigint(20) NULL DEFAULT NULL COMMENT '地块类型id',
    `shelf_status`            tinyint(4) NULL DEFAULT NULL COMMENT '地块状态:0-上架 1-下架',
    `sh_gis_dkid`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应上海测绘院地块id',
    `land_type_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地块类型名称',
    `create_time`             datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`             datetime NULL DEFAULT NULL,
    `sv_x`                    int(20) NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜补贴茬口数',
    `sv_x_plant_plan_id`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜补贴茬口的种植计划ID列表',
    `sv_x_month`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜补贴茬口的补贴月份列表',
    `sv_x_land_acre`          decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田绿叶菜补贴面积',
    `sv_y`                    int(20) NULL DEFAULT NULL COMMENT '季节性菜田非绿叶菜补贴茬口数',
    `sv_y_plant_plan_id`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '季节性菜田非绿叶菜补贴茬口的种植计划ID列表',
    `sv_y_month`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '季节性菜田非绿叶菜补贴茬口的补贴月份列表',
    `sv_y_land_acre`          decimal(15, 2) NULL DEFAULT NULL COMMENT '季节性菜田非绿叶菜补贴面积',
    `sv_subsidy_land_acre`    decimal(15, 2) NULL DEFAULT NULL COMMENT '地块补贴总面积',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_landId_archive_year` (`land_id`, `archive_year`) USING BTREE COMMENT '地块id+统计年份',
    INDEX                     `idx_farm_id` (`farm_id`) USING BTREE,
    INDEX                     `idx_province_id` (`province_id`) USING BTREE,
    INDEX                     `idx_city_id` (`city_id`) USING BTREE,
    INDEX                     `idx_county_id` (`county_id`) USING BTREE,
    INDEX                     `idx_town_id` (`town_id`) USING BTREE,
    INDEX                     `idx_village_id` (`village_id`) USING BTREE,
    INDEX                     `idx_company_category_id` (`company_category_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '地块茬口数明细归档表（按年归档，每月一次）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_subsidy_farm_year
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_subsidy_farm_year`;
CREATE TABLE `tbl_archive_subsidy_farm_year`
(
    `id`                               bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `company_id`                       bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_category_id`              bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_category_name`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业类型名称',
    `supervision_flag`                 tinyint(4) NULL DEFAULT NULL COMMENT '是否被监管开关 0：否（默认）  1：是',
    `farm_id`                          bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `statistics_flag`                  tinyint(2) NULL DEFAULT NULL COMMENT '统计标识，1参与，0不参与统计',
    `business_category_ids`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目id \', \
    '号分割',
    `business_category_names`          varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场经营类目名称 \', \
    '号分割',
    `archive_year`                     int(11) NULL DEFAULT NULL COMMENT '统计日期：年 2021',
    `caitian_acre`                     decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田面积（亩）',
    `subsidy_acre_lvyecai`             decimal(15, 2) NULL DEFAULT NULL COMMENT '绿叶菜补贴面积（亩）',
    `subsidy_acre_not_lvyecai`         decimal(15, 2) NULL DEFAULT NULL COMMENT '非绿叶菜补贴面积（亩）',
    `subsidy_acre_total`               decimal(15, 2) NULL DEFAULT NULL COMMENT '总补贴面积（亩）',
    `subsidy_acre_caitian_lvyecai`     decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田绿叶菜补贴面积（亩）',
    `subsidy_acre_caitian_not_lvyecai` decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田非绿叶菜补贴面积（亩）',
    `subsidy_acre_caitian_total`       decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田总补贴面积（亩）',
    `create_time`                      datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                      datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_landId_archive_year` (`farm_id`, `archive_year`) USING BTREE COMMENT '农场id+统计年份'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体补贴面积按月测算归档表（每月计算一次）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_subsidy_farm_year_acre
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_subsidy_farm_year_acre`;
CREATE TABLE `tbl_archive_subsidy_farm_year_acre`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `farm_id`      bigint(20) NULL DEFAULT NULL,
    `archive_year` int(11) NULL DEFAULT NULL COMMENT '归档年',
    `x1`           decimal(15, 2) NULL DEFAULT NULL COMMENT '1月补贴面积—绿叶菜',
    `x2`           decimal(15, 2) NULL DEFAULT NULL COMMENT '2月补贴面积—绿叶菜',
    `x3`           decimal(15, 2) NULL DEFAULT NULL COMMENT '3月补贴面积—绿叶菜',
    `x4`           decimal(15, 2) NULL DEFAULT NULL COMMENT '4月补贴面积—绿叶菜',
    `x5`           decimal(15, 2) NULL DEFAULT NULL COMMENT '5月补贴面积—绿叶菜',
    `x6`           decimal(15, 2) NULL DEFAULT NULL COMMENT '6月补贴面积—绿叶菜',
    `x7`           decimal(15, 2) NULL DEFAULT NULL COMMENT '7月补贴面积—绿叶菜',
    `x8`           decimal(15, 2) NULL DEFAULT NULL COMMENT '8月补贴面积—绿叶菜',
    `x9`           decimal(15, 2) NULL DEFAULT NULL COMMENT '9月补贴面积—绿叶菜',
    `x10`          decimal(15, 2) NULL DEFAULT NULL COMMENT '10月补贴面积—绿叶菜',
    `x11`          decimal(15, 2) NULL DEFAULT NULL COMMENT '11月补贴面积—绿叶菜',
    `x12`          decimal(15, 2) NULL DEFAULT NULL COMMENT '12月补贴面积—绿叶菜',
    `y1`           decimal(15, 2) NULL DEFAULT NULL COMMENT '1月补贴面积—非叶菜',
    `y2`           decimal(15, 2) NULL DEFAULT NULL COMMENT '2月补贴面积—非叶菜',
    `y3`           decimal(15, 2) NULL DEFAULT NULL COMMENT '3月补贴面积—非叶菜',
    `y4`           decimal(15, 2) NULL DEFAULT NULL COMMENT '4月补贴面积—非叶菜',
    `y5`           decimal(15, 2) NULL DEFAULT NULL COMMENT '5月补贴面积—非叶菜',
    `y6`           decimal(15, 2) NULL DEFAULT NULL COMMENT '6月补贴面积—非叶菜',
    `y7`           decimal(15, 2) NULL DEFAULT NULL COMMENT '7月补贴面积—非叶菜',
    `y8`           decimal(15, 2) NULL DEFAULT NULL COMMENT '8月补贴面积—非叶菜',
    `y9`           decimal(15, 2) NULL DEFAULT NULL COMMENT '9月补贴面积—非叶菜',
    `y10`          decimal(15, 2) NULL DEFAULT NULL COMMENT '10月补贴面积—非叶菜',
    `y11`          decimal(15, 2) NULL DEFAULT NULL COMMENT '11月补贴面积—非叶菜',
    `y12`          decimal(15, 2) NULL DEFAULT NULL COMMENT '12月补贴面积—非叶菜',
    `update_time`  datetime NULL DEFAULT NULL,
    `create_time`  datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_landId_archive_year` (`farm_id`, `archive_year`) USING BTREE COMMENT '农场id+统计年份'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体补贴面积按月测算归档表-- 补贴面积明细'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_subsidy_farm_year_acre_caitian
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_subsidy_farm_year_acre_caitian`;
CREATE TABLE `tbl_archive_subsidy_farm_year_acre_caitian`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `farm_id`      bigint(20) NULL DEFAULT NULL,
    `archive_year` int(11) NULL DEFAULT NULL COMMENT '归档年',
    `x1`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-1月补贴面积—绿叶菜',
    `x2`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-2月补贴面积—绿叶菜',
    `x3`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-3月补贴面积—绿叶菜',
    `x4`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-4月补贴面积—绿叶菜',
    `x5`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-5月补贴面积—绿叶菜',
    `x6`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-6月补贴面积—绿叶菜',
    `x7`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-7月补贴面积—绿叶菜',
    `x8`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-8月补贴面积—绿叶菜',
    `x9`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-9月补贴面积—绿叶菜',
    `x10`          decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-10月补贴面积—绿叶菜',
    `x11`          decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-11月补贴面积—绿叶菜',
    `x12`          decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-12月补贴面积—绿叶菜',
    `y1`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-1月补贴面积—非叶菜',
    `y2`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-2月补贴面积—非叶菜',
    `y3`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-3月补贴面积—非叶菜',
    `y4`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-4月补贴面积—非叶菜',
    `y5`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-5月补贴面积—非叶菜',
    `y6`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-6月补贴面积—非叶菜',
    `y7`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-7月补贴面积—非叶菜',
    `y8`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-8月补贴面积—非叶菜',
    `y9`           decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-9月补贴面积—非叶菜',
    `y10`          decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-10月补贴面积—非叶菜',
    `y11`          decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-11月补贴面积—非叶菜',
    `y12`          decimal(15, 2) NULL DEFAULT NULL COMMENT '菜田-12月补贴面积—非叶菜',
    `update_time`  datetime NULL DEFAULT NULL,
    `create_time`  datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_landId_archive_year` (`farm_id`, `archive_year`) USING BTREE COMMENT '农场id+统计年份'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '经营主体补贴面积按月测算归档表-- 菜田补贴面积明细'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_archive_vegetable_declare
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_vegetable_declare`;
CREATE TABLE `tbl_archive_vegetable_declare`
(
    `id`                  bigint(11) NOT NULL AUTO_INCREMENT,
    `archive_month`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `city_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `sc_zt_acre_net`      decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜在田总面积（亩）-入网面积',
    `sc_zt_acre_declare`  decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜在田总面积（亩）-行业检测数据',
    `sc_zt_acre_total`    decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜在田总面积（亩）-合计',
    `lyc_zt_acre_net`     decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜在田面积（亩）-入网面积',
    `lyc_zt_acre_declare` decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜在田面积（亩）-行业检测数据',
    `lyc_zt_acre_total`   decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜在田面积（亩）-合计',
    `sc_bz_acre_net`      decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜播种总面积（亩）-入网面积',
    `sc_bz_acre_declare`  decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜播种总面积（亩）-行业检测数据',
    `sc_bz_acre_total`    decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜播种总面积（亩）-合计',
    `lyc_bz_acre_net`     decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜播种总面积（亩）-入网面积',
    `lyc_bz_acre_declare` decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜播种总面积（亩）-行业检测数据',
    `lyc_bz_acre_total`   decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜播种总面积（亩）-合计',
    `sc_output_net`       decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜总产量（吨）-入网面积',
    `sc_output_declare`   decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜总产量（吨）-行业检测数据',
    `sc_output_total`     decimal(30, 2) NULL DEFAULT NULL COMMENT '蔬菜总产量（吨）-合计',
    `lyc_output_net`      decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜产量（吨）-入网面积',
    `lyc_output_declare`  decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜产量（吨）-行业检测数据',
    `lyc_output_total`    decimal(30, 2) NULL DEFAULT NULL COMMENT '绿叶菜产量（吨）-合计',
    `status`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '申报/审核状态  0待申报 1申报中/审核中 2申报成功/审核通过 3申报失败/审核拒绝',
    `declare_end_time`    datetime NULL DEFAULT NULL COMMENT '申报截至日期',
    `declare_time`        datetime NULL DEFAULT NULL COMMENT '申报时间',
    `declare_user_id`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申报人id',
    `declare_user_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申报人姓名',
    `check_time`          datetime NULL DEFAULT NULL COMMENT '审核时间',
    `check_user_id`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人id',
    `check_user_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人姓名',
    `message`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核信息',
    `create_time`         datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`         datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_townId_archiveMonth` (`town_id`, `archive_month`) USING BTREE COMMENT '每月每个街镇一条'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '蔬菜行业管理申报表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_guarantee_spply_farm
-- ----------------------------
DROP TABLE IF EXISTS `tbl_guarantee_spply_farm`;
CREATE TABLE `tbl_guarantee_spply_farm`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `farm_name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保供主体名称/未匹配神农口袋主体使用',
    `business_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请运输范围及内容',
    `farm_region`      varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保供主体区域/未匹配神农口袋主体使用',
    `farm_id`          bigint(20) NULL DEFAULT NULL COMMENT '神农口袋主体id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '保供主体表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_patrol_record_plan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_patrol_record_plan`;
CREATE TABLE `tbl_patrol_record_plan`
(
    `id`                                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `farm_id`                                   bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `farm_name`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农场名称',
    `province_id`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份id',
    `province_name`                             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份名称',
    `city_id`                                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市id',
    `city_name`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市名称',
    `county_id`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县id',
    `county_name`                               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县名称',
    `town_id`                                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇id',
    `town_name`                                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_id`                                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村id',
    `village_name`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `farm_address`                              varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `user_id`                                   bigint(20) NULL DEFAULT NULL COMMENT '添加检查任务用户',
    `farm_center_lat`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '农场中心点维度值',
    `farm_center_lng`                           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '农场中心点经度值',
    `land_during_time`                          datetime NULL DEFAULT NULL COMMENT '地块用药时间 ，任意一个地块最后用药为该农场的最后一次用药时间',
    `patrolled_record_thirty_day_status`        tinyint(2) NULL DEFAULT 0 COMMENT '执法记录30天内是否检查 ，0、否 1、是',
    `patrolled_record_finally_qualified_status` tinyint(2) NULL DEFAULT 0 COMMENT '执法记录最后一次检查是否合格  0、否 1、是',
    `patrol_record_id`                          bigint(20) NULL DEFAULT NULL COMMENT '检查记录主键id',
    `plan_status`                               tinyint(2) NULL DEFAULT 0 COMMENT '检查状态 0、为完成 、1 已完成 ',
    `create_by`                                 bigint(20) NULL DEFAULT NULL COMMENT '创建人',
    `create_time`                               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`                                 bigint(20) NULL DEFAULT NULL COMMENT '修改人',
    `update_time`                               datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '执法记录检查计划表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_subsidy_farm_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subsidy_farm_blacklist`;
CREATE TABLE `tbl_subsidy_farm_blacklist`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `farm_id`      bigint(20) NULL DEFAULT NULL COMMENT '经营主体id',
    `year`         int(11) NULL DEFAULT NULL COMMENT '年份',
    `remark`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`  datetime NULL DEFAULT NULL COMMENT '添加时间',
    `operate_by`   bigint(20) NULL DEFAULT NULL COMMENT '操作人',
    `operate_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_farmId_year` (`farm_id`, `year`) USING BTREE COMMENT '经营主体id+年份唯一'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '蔬菜直报补贴黑名单'
  ROW_FORMAT = DYNAMIC;

SET
FOREIGN_KEY_CHECKS = 1;

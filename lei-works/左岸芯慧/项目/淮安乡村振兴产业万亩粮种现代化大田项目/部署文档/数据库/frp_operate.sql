

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_active_company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active_company`;
CREATE TABLE `tbl_active_company`
(
    `id`                 bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `active_date_str`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活跃日期字符串，格式：yyyy-MM-dd',
    `company_id`         bigint(20)                                                   NULL DEFAULT NULL COMMENT '企业id',
    `operate_subject_id` bigint(20)                                                   NULL DEFAULT NULL COMMENT '运营商id',
    `active_time`        datetime                                                     NULL DEFAULT NULL COMMENT '活跃时间',
    `create_time`        datetime                                                     NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date_company_id` (`active_date_str`, `company_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '活跃企业表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_active_farm
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active_farm`;
CREATE TABLE `tbl_active_farm`
(
    `id`                 bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `active_date_str`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活跃日期字符串，格式：yyyy-MM-dd',
    `farm_id`            bigint(20)                                                   NULL DEFAULT NULL COMMENT '企业id',
    `operate_subject_id` bigint(20)                                                   NULL DEFAULT NULL COMMENT '运营商id',
    `active_time`        datetime                                                     NULL DEFAULT NULL COMMENT '活跃时间',
    `create_time`        datetime                                                     NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date_company_id` (`active_date_str`, `farm_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '活跃农场表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_active_farm_copy
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active_farm_copy`;
CREATE TABLE `tbl_active_farm_copy`
(
    `id`                 bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `active_date_str`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活跃日期字符串，格式：yyyy-MM-dd',
    `farm_id`            bigint(20)                                                   NULL DEFAULT NULL COMMENT '企业id',
    `operate_subject_id` bigint(20)                                                   NULL DEFAULT NULL COMMENT '运营商id',
    `active_time`        datetime                                                     NULL DEFAULT NULL COMMENT '活跃时间',
    `create_time`        datetime                                                     NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date_company_id` (`active_date_str`, `farm_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '活跃农场表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_active_stastics_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active_stastics_day`;
CREATE TABLE `tbl_active_stastics_day`
(
    `id`                 bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `record_key`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计日期字符串，格式：yyyy-MM-dd',
    `active_company_num` bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '活跃企业数',
    `active_farm_num`    bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '活跃农场数',
    `active_user_num`    bigint(20)                                                   NULL     DEFAULT 0 COMMENT '活跃用户数',
    `record_start_date`  date                                                         NULL     DEFAULT NULL COMMENT '统计其实日期',
    `record_end_date`    date                                                         NULL     DEFAULT NULL COMMENT '统计结束日期,和record_start_date取值相同。',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date` (`record_key`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '活跃信息统计表-日'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_active_stastics_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active_stastics_month`;
CREATE TABLE `tbl_active_stastics_month`
(
    `id`                 bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `record_key`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计月份字符串，格式：yyyy-MM',
    `active_company_num` bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '活跃企业数',
    `active_farm_num`    bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '活跃农场数',
    `active_user_num`    bigint(20)                                                   NULL     DEFAULT 0 COMMENT '活跃用户数',
    `record_start_date`  date                                                         NULL     DEFAULT NULL COMMENT '统计的其实日期',
    `record_end_date`    date                                                         NULL     DEFAULT NULL COMMENT '统计的结束日期',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date` (`record_key`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '活跃信息统计表-月'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_active_stastics_week
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active_stastics_week`;
CREATE TABLE `tbl_active_stastics_week`
(
    `id`                 bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `record_key`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计周数字符串，格式：yyyy-week。例如2018年第2周，格式为“2018-02”',
    `active_company_num` bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '活跃企业数',
    `active_farm_num`    bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '活跃农场数',
    `active_user_num`    bigint(20)                                                   NULL     DEFAULT 0 COMMENT '活跃用户数',
    `record_start_date`  date                                                         NULL     DEFAULT NULL COMMENT '统计其实日期',
    `record_end_date`    date                                                         NULL     DEFAULT NULL COMMENT '统计结束日期',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date` (`record_key`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '活跃信息统计表-周'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_active_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active_user`;
CREATE TABLE `tbl_active_user`
(
    `id`              bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `active_date_str` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活跃日期字符串，格式：yyyy-MM-dd',
    `user_id`         bigint(20)                                                   NULL DEFAULT NULL COMMENT '用户id',
    `active_time`     datetime                                                     NULL DEFAULT NULL COMMENT '活跃时间',
    `create_time`     datetime                                                     NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date_company_id` (`active_date_str`, `user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '活跃用户表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_active_user_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active_user_copy1`;
CREATE TABLE `tbl_active_user_copy1`
(
    `id`              bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `active_date_str` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活跃日期字符串，格式：yyyy-MM-dd',
    `user_id`         bigint(20)                                                   NULL DEFAULT NULL COMMENT '用户id',
    `active_time`     datetime                                                     NULL DEFAULT NULL COMMENT '活跃时间',
    `create_time`     datetime                                                     NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date_company_id` (`active_date_str`, `user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '活跃用户表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_crop_price_statistic
-- ----------------------------
DROP TABLE IF EXISTS `tbl_crop_price_statistic`;
CREATE TABLE `tbl_crop_price_statistic`
(
    `id`                     bigint(20)                                                   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `province_id`            int(10)                                                      NULL     DEFAULT NULL COMMENT '省份ID',
    `province_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '省份名称',
    `crop_from`              tinyint(4)                                                   NULL     DEFAULT 1 COMMENT '作物来源：1田头价作物、2神农口袋作物、3农产品作物',
    `crop_id`                bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '农作物ID，根据crop_from的不同，关联不同的表。例如田头价作物关联tbl_ttj_crop，农产品作物关联frp_produce.sys_crop',
    `crop_name`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '农作物名称，冗余存储',
    `business_category_id`   bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '农产品类目id',
    `business_category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '' COMMENT '农产品类目名称，冗余存储',
    `price_type`             tinyint(4)                                                   NULL     DEFAULT 1 COMMENT '价格类型：1田头价、2批发价、3电商价、4零售价',
    `unit`                   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '元/公斤' COMMENT '单位：如元/公斤',
    `statistic_type`         tinyint(4)                                                   NULL     DEFAULT 3 COMMENT '统计类型：1日、2周、3月、4年',
    `statistic_date`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '' COMMENT '统计日期，日统计日期示例：2020年11月13日，周统计日期示例：2020年11月13日，月统计日期示例：2020年11月，年统计日期示例：2020年',
    `average_price`          decimal(10, 2)                                               NULL     DEFAULT 0.00 COMMENT '均价，单位￥,例如：1.20',
    `m2m_rate`               decimal(5, 2)                                                NULL     DEFAULT 0.00 COMMENT '环比,单位%，例如14.02%,存储值为14.2',
    `y2y_rate`               decimal(5, 2)                                                NULL     DEFAULT 0.00 COMMENT '同比,单位%，例如14.02%,存储值为14.2',
    `update_time`            datetime                                                     NULL     DEFAULT NULL COMMENT '更新时间',
    `create_time`            datetime                                                     NULL     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `crop_id` (`crop_id`) USING BTREE,
    INDEX `statistic_type` (`statistic_type`) USING BTREE,
    INDEX `statistic_date` (`statistic_date`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农作物价格统计表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_focus_company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_focus_company`;
CREATE TABLE `tbl_focus_company`
(
    `admin_user_id` bigint(20) NOT NULL COMMENT '管理后台用户id',
    `company_id`    bigint(20) NOT NULL COMMENT '企业id',
    `follow_time`   datetime   NULL DEFAULT NULL COMMENT '关注时间'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_focus_farm
-- ----------------------------
DROP TABLE IF EXISTS `tbl_focus_farm`;
CREATE TABLE `tbl_focus_farm`
(
    `admin_user_id` bigint(20) NOT NULL COMMENT '管理后台用户id',
    `company_id`    bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `farm_id`       bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `follow_time`   datetime   NULL DEFAULT NULL COMMENT '关注时间'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_nc_area
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nc_area`;
CREATE TABLE `tbl_nc_area`
(
    `id`           bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `nc_area_id`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `nc_area_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `sys_area_id`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '神农口袋区域id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_nc_crop
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nc_crop`;
CREATE TABLE `tbl_nc_crop`
(
    `id`                  bigint(20)                                                    NOT NULL AUTO_INCREMENT,
    `nc_crop_name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL,
    `nc_crop_category_id` bigint(20)                                                    NULL     DEFAULT NULL,
    `craft_index`         bigint(20)                                                    NULL     DEFAULT NULL,
    `sort_num`            int(11)                                                       NOT NULL DEFAULT 255 COMMENT '排序号，越小越靠前',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_nc_crop_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nc_crop_category`;
CREATE TABLE `tbl_nc_crop_category`
(
    `id`                 bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `crop_category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `crop_category_id`   bigint(20)                                                   NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_nc_crop_price
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nc_crop_price`;
CREATE TABLE `tbl_nc_crop_price`
(
    `id`                    bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `nc_crop_category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `nc_crop_category_id`   bigint(20)                                                   NULL DEFAULT NULL,
    `nc_crop_name`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `nc_crop_id`            bigint(20)                                                   NULL DEFAULT NULL,
    `price`                 decimal(15, 2)                                               NULL DEFAULT NULL,
    `cur_price_date`        datetime                                                     NULL DEFAULT NULL,
    `create_time`           datetime                                                     NULL DEFAULT NULL,
    `price_unit`            varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '价格单位，例如元',
    `spec_unit`             varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '包装单位， 例如公斤， 斤等',
    `nc_area_id`            varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `nc_area_name`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_crop_id_cate_id_price_date_area_id` (`nc_crop_category_id`, `nc_crop_id`, `cur_price_date`, `nc_area_id`) USING BTREE,
    INDEX `idx_nc_crop_id` (`nc_crop_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_nc_market
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nc_market`;
CREATE TABLE `tbl_nc_market`
(
    `id`           varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `market_name`  varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '批发市场名称',
    `nc_area_id`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '关联tbl_nc_area表的nc_area_id字段',
    `default_flag` tinyint(4)                                                    NOT NULL DEFAULT 0 COMMENT '是否默认标识：1-是，0-否',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农产品价格网-批发市场表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_nc_market_price_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nc_market_price_month`;
CREATE TABLE `tbl_nc_market_price_month`
(
    `id`                  bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `nc_market_id`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批发市场id',
    `nc_crop_craft_index` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '农产品id',
    `year`                varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '年份字符串：yyyy，如2019',
    `price1`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '一月份价格',
    `price2`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '2月份平均价格',
    `price3`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '3月份平均价格',
    `price4`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '4月份平均价格',
    `price5`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '5月份平均价格',
    `price6`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '6月份平均价格',
    `price7`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '7月份平均价格',
    `price8`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '8月份平均价格',
    `price9`              decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '9月份平均价格',
    `price10`             decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '10月份平均价格',
    `price11`             decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '11月份平均价格',
    `price12`             decimal(15, 2)                                               NULL DEFAULT NULL COMMENT '12月份平均价格',
    `create_time`         datetime                                                     NULL DEFAULT NULL,
    `update_time`         datetime                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_market_id_craft_index_year` (`nc_market_id`, `nc_crop_craft_index`, `year`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农产品价格网-批发市场作物年度价格统计表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_spider_err_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_spider_err_log`;
CREATE TABLE `tbl_spider_err_log`
(
    `id`          bigint(20)                                                    NOT NULL AUTO_INCREMENT,
    `start_time`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '开始时间索引码',
    `end_time`    varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '结束时间索引码',
    `index_url`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '索引url',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '修改时间',
    `err_msg`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
    `status_flag` int(11)                                                       NULL DEFAULT NULL COMMENT '状态，0未完成， 1完成',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_total_stastics_day
-- ----------------------------
DROP TABLE IF EXISTS `tbl_total_stastics_day`;
CREATE TABLE `tbl_total_stastics_day`
(
    `id`                bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `record_key`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计日期字符串，格式：yyyy-MM-dd',
    `total_company_num` bigint(20)                                                   NULL DEFAULT NULL COMMENT '企业数量',
    `total_farm_num`    bigint(20)                                                   NULL DEFAULT NULL COMMENT '农场数量',
    `total_user_num`    bigint(20)                                                   NULL DEFAULT NULL COMMENT '用户数量',
    `record_start_date` date                                                         NULL DEFAULT NULL COMMENT '统计开始时间',
    `record_end_date`   date                                                         NULL DEFAULT NULL COMMENT '统计结束时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息统计表-日'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_total_stastics_month
-- ----------------------------
DROP TABLE IF EXISTS `tbl_total_stastics_month`;
CREATE TABLE `tbl_total_stastics_month`
(
    `id`                bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `record_key`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计月份字符串，格式：yyyy-MM',
    `total_company_num` bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '企业数',
    `total_farm_num`    bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '农场数',
    `total_user_num`    bigint(20)                                                   NULL     DEFAULT 0 COMMENT '用户数',
    `record_start_date` date                                                         NULL     DEFAULT NULL COMMENT '统计的其实日期',
    `record_end_date`   date                                                         NULL     DEFAULT NULL COMMENT '统计的结束日期',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date` (`record_key`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息统计表-月'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_total_stastics_week
-- ----------------------------
DROP TABLE IF EXISTS `tbl_total_stastics_week`;
CREATE TABLE `tbl_total_stastics_week`
(
    `id`                bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `record_key`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计周数字符串，格式：yyyy-week。例如2018年第2周，格式为“2018-02”',
    `total_company_num` bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '企业数',
    `total_farm_num`    bigint(20)                                                   NOT NULL DEFAULT 0 COMMENT '农场数',
    `total_user_num`    bigint(20)                                                   NULL     DEFAULT 0 COMMENT '用户数',
    `record_start_date` date                                                         NULL     DEFAULT NULL COMMENT '统计其实日期',
    `record_end_date`   date                                                         NULL     DEFAULT NULL COMMENT '统计结束日期',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_active_date` (`record_key`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '信息统计表-周'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_ttj_crop
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ttj_crop`;
CREATE TABLE `tbl_ttj_crop`
(
    `id`        bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `crop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '作物名称',
    `sort_num`  int(11)                                                       NOT NULL DEFAULT 255 COMMENT '排序号，越小越靠前',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '田头价作物'
  ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;

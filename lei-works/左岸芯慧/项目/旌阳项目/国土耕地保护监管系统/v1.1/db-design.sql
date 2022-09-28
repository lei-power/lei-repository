-- 占用耕地统计表按日归档
CREATE TABLE `tbl_archive_arable_land_occupy_day`
(
    `id`                              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `arable_land_batch_record_id`     bigint(20) NOT NULL COMMENT '耕地占用批次信息id',
    `arable_land_batch_record_name`   varchar(64)    DEFAULT NULL COMMENT '耕地占用批次信息名称',
    `area_id`                         varchar(64)    DEFAULT NULL COMMENT '区域id',
    `area_name`                       varchar(64)    DEFAULT NULL COMMENT '区域名称',
    `total_land_acre`                 decimal(16, 2) DEFAULT NULL COMMENT '三调耕地总面积（汇总统计该区域所有三调耕地地块的面积之和) 单位：亩',
    `total_occupy_arable_land_acre`   decimal(16, 2) DEFAULT NULL COMMENT '占用耕地面积（汇总统计该区域所有占用物占用耕地的面积之和) 单位：亩',
    `total_building_arable_land_acre` decimal(16, 2) DEFAULT NULL COMMENT '建筑物占用耕地面积（汇总统计该区域所有建筑物占用物占用耕地的面积之和) 单位：亩',
    `total_ford_arable_land_acre`     decimal(16, 2) DEFAULT NULL COMMENT '水体占用耕地面积（汇总统计该区域所有水体占用物占用耕地的面积之和) 单位：亩',
    `total_forest_arable_land_acre`   decimal(16, 2) DEFAULT NULL COMMENT '林地占用耕地面积（汇总统计该区域所有林地占用物占用耕地的面积之和) 单位：亩',
    `total_other_arable_land_acre`    decimal(16, 2) DEFAULT NULL COMMENT '其他占用耕地面积（汇总统计该区域所有其他占用物占用耕地的面积之和) 单位：亩',
    `land_occupy_count`               int(11)        DEFAULT '0' COMMENT '占用物数量',
    `create_time`                     datetime COMMENT '创建时间',
    `update_time`                     datetime COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY (`arable_land_batch_record_id`, `area_id`) USING BTREE COMMENT '批次id和区域id唯一索引',
    KEY `total_occupy_arable_land_acre_idx` (`total_occupy_arable_land_acre`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='占用耕地按日归档表';

-- 占用耕地处理统计表按月归档
CREATE TABLE `tbl_archive_arable_land_occupy_month`
(
    `id`                            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `archive_month_str`             varchar(64) DEFAULT NULL COMMENT '按月统计时间:例如：2020-01',
    `arable_land_batch_record_id`   bigint(20) NOT NULL COMMENT '耕地占用批次信息id',
    `arable_land_batch_record_name` varchar(64) DEFAULT NULL COMMENT '耕地占用批次信息名称',
    `area_id`                       varchar(64) DEFAULT NULL COMMENT '区域id',
    `area_name`                     varchar(64) DEFAULT NULL COMMENT '区域名称',
    `total_check_count`             int(11)     DEFAULT '0' COMMENT '统计该区域所有占用物筛查次数',
    `total_review_count`            int(11)     DEFAULT '0' COMMENT '统计该区域所有占用物复核次数',
    `total_audit_count`             int(11)     DEFAULT '0' COMMENT '统计该区域所有占用物审核次数',
    `create_time`                   datetime COMMENT '创建时间',
    `update_time`                   datetime COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY (`archive_month_str`, `arable_land_batch_record_id`, `area_id`) USING BTREE COMMENT '批次id,区域id,统计时间唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='占用耕地处理按月归档表（增量）';
-- 占用耕地处理统计表按月归档
CREATE TABLE `tbl_archive_arable_land_occupy_month_full`
(
    `id`                            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `arable_land_batch_record_id`   bigint(20) NOT NULL COMMENT '耕地占用批次信息id',
    `arable_land_batch_record_name` varchar(64) DEFAULT NULL COMMENT '耕地占用批次信息名称',
    `area_id`                       varchar(64) DEFAULT NULL COMMENT '区域id',
    `area_name`                     varchar(64) DEFAULT NULL COMMENT '区域名称',
    `total_check_count`             int(11)     DEFAULT '0' COMMENT '统计该区域所有占用物筛查次数',
    `total_review_count`            int(11)     DEFAULT '0' COMMENT '统计该区域所有占用物复核次数',
    `total_audit_count`             int(11)     DEFAULT '0' COMMENT '统计该区域所有占用物审核次数',
    `create_time`                   datetime COMMENT '创建时间',
    `update_time`                   datetime COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY (`arable_land_batch_record_id`, `area_id`) USING BTREE COMMENT '批次id,区域id'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='占用耕地处理按月归档表（全量）';


1.批次表里新增批次结束时间
ALTER TABLE `tbl_arable_land_batch_record`
    ADD COLUMN `end_date` date DEFAULT NULL COMMENT '批次结束日期' AFTER `analysis_date`;

2.日志表
ALTER TABLE `tbl_arable_land_occupy_log`
    ADD COLUMN `arable_land_batch_record_id` bigint(20) NOT NULL COMMENT '耕地占用批次信息id';

接口：
1.中台统计 和数字大屏左侧三个同一个接口
入参：
批次id,
县级区域id，
镇级区域列表

2.大屏右上直查日志表 （联查占用物表，固定查询区一级数据）
入参：
批次id

3.占用物处理情况镇级列表
入参：
批次id，
区域id列表

4.占用物处理趋势
入参：
批次id,
区域id

5.占用物编辑接口
入参：
占用物编码，
占用物面积(一个异常占用物轮廓面积) 单位：亩，
占用耕地面积（一个异常占用物再三调里占用的总面积) 单位：亩，
轮廓，
镇id，
村id
讲address改成对应传入镇村信息

6.占用耕地统计表按日归档接口

7.占用物处理趋势按月归档接口



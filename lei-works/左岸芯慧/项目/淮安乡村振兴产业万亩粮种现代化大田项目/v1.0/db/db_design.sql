DROP TABLE IF EXISTS `tbl_agri_machinery_subject`;
CREATE TABLE `tbl_agri_machinery_subject`
(
    `id`                          bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `agri_machinery_subject_name` varchar(64)          DEFAULT NULL COMMENT '农机大类名称',
    `agri_machinery_subject_code` varchar(64) NOT NULL COMMENT '农机大类唯一标识',
    `sort_num`                    int(11)              DEFAULT NULL COMMENT '排序号',
    `shelf_status`                tinyint(1)  NOT NULL DEFAULT '0' COMMENT '状态，0-已上架 1-已下架',

    `del_flag`                    tinyint(1)  NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                   bigint(20)           DEFAULT NULL COMMENT '创建人',
    `update_by`                   bigint(20)           DEFAULT NULL COMMENT '更新人',
    `create_time`                 datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time`                 datetime             DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_agri_machinery_subject_code` (`agri_machinery_subject_code`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='农机大类表';

DROP TABLE IF EXISTS `tbl_agri_machinery_category`;
CREATE TABLE `tbl_agri_machinery_category`
(
    `id`                           bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `agri_machinery_subject_id`    bigint(20)           DEFAULT NULL COMMENT '农机大类id',
    `agri_machinery_category_name` varchar(64)          DEFAULT NULL COMMENT '农机小类名称',
    `agri_machinery_category_code` varchar(64) NOT NULL COMMENT '农机小类唯一标识',

    `sort_num`                     int(11)              DEFAULT NULL COMMENT '排序号',
    `shelf_status`                 tinyint(1)  NOT NULL DEFAULT '0' COMMENT '状态，0-已上架 1-已下架',
    `del_flag`                     tinyint(1)  NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                    bigint(20)           DEFAULT NULL COMMENT '创建人',
    `update_by`                    bigint(20)           DEFAULT NULL COMMENT '更新人',
    `create_time`                  datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time`                  datetime             DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_agri_machinery_subject_id` (`agri_machinery_subject_id`) USING BTREE,
    KEY `idx_agri_machinery_category_code` (`agri_machinery_category_code`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='农机小类表';


DROP TABLE IF EXISTS `tbl_agri_machinery_type`;
CREATE TABLE `tbl_agri_machinery_type`
(
    `id`                         bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `agri_machinery_subject_id`  bigint(20)           DEFAULT NULL COMMENT '农机大类id',
    `agri_machinery_category_id` bigint(20)           DEFAULT NULL COMMENT '农机小类id',
    `agri_machinery_type_name`   varchar(64)          DEFAULT NULL COMMENT '农机种类名称',
    `agri_machinery_type_code`   varchar(64) NOT NULL COMMENT '农机种类唯一标识',

    `sort_num`                   int(11)              DEFAULT NULL COMMENT '排序号',
    `shelf_status`               tinyint(1)  NOT NULL DEFAULT '0' COMMENT '状态，0-已上架 1-已下架',
    `del_flag`                   tinyint(1)  NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                  bigint(20)           DEFAULT NULL COMMENT '创建人',
    `update_by`                  bigint(20)           DEFAULT NULL COMMENT '更新人',
    `create_time`                datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time`                datetime             DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_agri_machinery_subject_id` (`agri_machinery_subject_id`) USING BTREE,
    KEY `idx_agri_machinery_category_id` (`agri_machinery_category_id`) USING BTREE,
    KEY `idx_agri_machinery_type_code` (`agri_machinery_type_code`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='农机种类表';


DROP TABLE IF EXISTS `tbl_agri_machinery`;
CREATE TABLE `tbl_agri_machinery`
(
    `id`                         bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `company_id`                 bigint(20)  NOT NULL COMMENT '企业id',
    `farm_id`                    bigint(20)  NOT NULL COMMENT '农场id',

    `agri_machinery_category_id` bigint(20)           DEFAULT NULL COMMENT '农机小类id',
    `agri_machinery_type_id`     bigint(20)           DEFAULT NULL COMMENT '农机种类id',
    `agri_machinery_type_name`   varchar(64)          DEFAULT NULL COMMENT '农机种类名称',
    `out_num`                    varchar(64) NOT NULL COMMENT '出厂编码',

    `plate_num`                  varchar(64)          DEFAULT NULL COMMENT '车牌号',
    `buy_time`                   datetime             DEFAULT NULL COMMENT '购置时间',
    `owner_name`                 varchar(64)          DEFAULT NULL COMMENT '农机所有人(非自有农机时有值)',
    `ownership_type`             tinyint(1)  NOT NULL DEFAULT '0' COMMENT '自有农机，0-自有农机 1-外借农机',
    `health_status`              tinyint(1)  NOT NULL DEFAULT '0' COMMENT '状态，0-正常 1-异常',
    `active_status`              tinyint(1)  NOT NULL DEFAULT '1' COMMENT '农机使用状态，0-未借用 1-已借用',
    `create_mode`                tinyint(2)           DEFAULT '1' COMMENT '创建方式。1：web,2:app',
    `del_flag`                   tinyint(1)  NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                  bigint(20)           DEFAULT NULL COMMENT '创建人',
    `update_by`                  bigint(20)           DEFAULT NULL COMMENT '更新人',
    `create_time`                datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time`                datetime             DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_agri_machinery_category_id` (`agri_machinery_category_id`) USING BTREE,
    KEY `idx_agri_machinery_type_id` (`agri_machinery_type_id`) USING BTREE,
    KEY `idx_farm_id` (`farm_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='农机表';

DROP TABLE IF EXISTS `tbl_agri_machinery_in_out_record`;
CREATE TABLE `tbl_agri_machinery_in_out_record`
(
    `id`                               bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `agri_machinery_id`                bigint(20) NOT NULL COMMENT '农机id',
    `assignment_agri_machinery_out_id` bigint(20)          DEFAULT NULL COMMENT '农机领用任务id',
    `in_out_flag`                      tinyint(1) NOT NULL COMMENT '出入方式，0-出 1-入',
    `farm_machine_out_type`            tinyint(1)          DEFAULT NULL COMMENT '农机出库类型，0-领用 1-借出',

    `lend_return_user_id`              bigint(20)          DEFAULT NULL COMMENT '借出人或归还人id',
    `lend_return_user_name`            varchar(64)         DEFAULT NULL COMMENT '借出人或归还人名称',
    `in_out_time`                      datetime            DEFAULT NULL COMMENT '借用或归还时间',

    `plan_return_time`                 datetime            DEFAULT NULL COMMENT '预计归还时间',
    `remark`                           varchar(255)        DEFAULT NULL COMMENT '备注',
    `del_flag`                         tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`                        bigint(20)          DEFAULT NULL COMMENT '创建人',
    `update_by`                        bigint(20)          DEFAULT NULL COMMENT '修改人',
    `create_time`                      datetime            DEFAULT NULL COMMENT '创建时间',
    `update_time`                      datetime            DEFAULT NULL COMMENT '修改时间',

    PRIMARY KEY (`id`),
    KEY `idx_agri_machinery_id` (`agri_machinery_id`) USING BTREE,
    KEY `idx_assignment_agri_machinery_out_id` (`assignment_agri_machinery_out_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='农机出入记录表';


DROP TABLE IF EXISTS `tbl_assignment`;
CREATE TABLE `tbl_assignment`
(
    `id`                     int(20)     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `company_id`             bigint(20)  NOT NULL COMMENT '企业id',
    `farm_id`                bigint(20)  NOT NULL COMMENT '农场id',
    `assignment_category_id` bigint(20)  NOT NULL COMMENT '任务类型id',
    `assignment_no`          varchar(64) NOT NULL COMMENT '任务编号',

    `crop_id`                bigint(20)           DEFAULT NULL COMMENT '作物id（生成种植计划）',
    `crop_breed`             varchar(64)          DEFAULT NULL COMMENT '作物品种（生成种植计划）',

    `plant_plan_ids`         text                 DEFAULT NULL COMMENT '种植计划id（生成采收计划,多个逗号分割（农林牧渔））',

    `operation_mode`         int(11)              DEFAULT NULL COMMENT '作业方式，0-人工 1-机械',
    `estimate_start_time`    datetime             DEFAULT NULL COMMENT '预计开始时间',
    `estimate_end_time`      datetime             DEFAULT NULL COMMENT '预计结束时间',
    `actual_start_time`      datetime             DEFAULT NULL COMMENT '实际开始时间',
    `actual_end_time`        datetime             DEFAULT NULL COMMENT '实际开始时间',

    `assignment_user_num`    int(11)              DEFAULT NULL COMMENT '农事劳作人员数量',
    `executor_user_id`       bigint(20)           DEFAULT NULL COMMENT '执行人用户id',
    `executor_user_name`     varchar(64)          DEFAULT NULL COMMENT '执行人用户名称',
    `create_user_id`         bigint(20)           DEFAULT NULL COMMENT '任务创建人id',
    `create_user_name`       varchar(64)          DEFAULT NULL COMMENT '任务创建人名称',

    `estimate_plant_num`     int(11)              DEFAULT NULL COMMENT '预计养殖数量（畜牧和渔业）,移栽株树/育苗株树/直播株树（农业和林业）',
    `actual_plant_num`       int(11)              DEFAULT NULL COMMENT '实际养殖数量（畜牧和渔业）,移栽株树/育苗株树/直播株树（农业和林业）',

    `pick_num`               int(11)              DEFAULT NULL COMMENT '采收数量（畜牧业和林业）',
    `pick_output`            decimal(16, 2)       DEFAULT NULL COMMENT '采收重量（农业和渔业）',
    `goods_id`               bigint(20)           DEFAULT NULL COMMENT '农产品id',
    `remark`                 varchar(255)         DEFAULT NULL COMMENT '备注',
    `img_urls`               text                 DEFAULT NULL COMMENT '现场作业图片地址，多个是要英文逗号分隔',

    `assignment_status`      varchar(20) NOT NULL COMMENT '任务状态 1.待接受、2.关闭、3.仓储处理中、4.待执行、5.执行完毕、6.完成',

    `create_mode`            tinyint(2)           DEFAULT '1' COMMENT '创建方式。1：web,2:app',
    `assignment_score`       tinyint(4)           DEFAULT NULL COMMENT '任务评分5星11级 0-5分，0、0.5、1、1.5、2、2.5、3、3.5、4、4.5、5',

    `evaluation_content`     varchar(255)         DEFAULT NULL COMMENT '评价内容',

    `del_flag`               tinyint(1)  NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`              bigint(20)           DEFAULT NULL COMMENT '创建人',
    `update_by`              bigint(20)           DEFAULT NULL COMMENT '修改人',
    `create_time`            datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time`            datetime             DEFAULT NULL COMMENT '修改时间',

    PRIMARY KEY (`id`),
    KEY `idx_assignment_category_id` (`assignment_category_id`) USING BTREE,
    KEY `idx_assignment_no` (`assignment_no`) USING BTREE,
    KEY `idx_farm_id` (`farm_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='农事任务表';


DROP TABLE IF EXISTS `tbl_assignment_agri_res_out`;
CREATE TABLE `tbl_assignment_agri_res_out`
(
    `id`                  bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `company_id`          bigint(20)  NOT NULL COMMENT '企业id',
    `farm_id`             bigint(20)  NOT NULL COMMENT '农场id',
    `assignment_id`       bigint(20)  NOT NULL COMMENT '农事任务id',
    `assignment_no`       varchar(64) NOT NULL COMMENT '任务编号',
    `executor_user_id`    bigint(20)           DEFAULT NULL COMMENT '执行人id',
    `executor_user_name`  varchar(64)          DEFAULT NULL COMMENT '执行人名称',
    `executor_time`       datetime             DEFAULT NULL COMMENT '执行时间',
    `agri_res_out_status` varchar(20) NOT NULL COMMENT '农资出库任务状态 1.待出库、2.已出库',

    `del_flag`            tinyint(1)  NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`           bigint(20)           DEFAULT NULL COMMENT '创建人',
    `update_by`           bigint(20)           DEFAULT NULL COMMENT '修改人',
    `create_time`         datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time`         datetime             DEFAULT NULL COMMENT '修改时间',

    PRIMARY KEY (`id`),
    KEY `idx_assignment_id` (`assignment_id`) USING BTREE,
    KEY `idx_assignment_no` (`assignment_no`) USING BTREE,
    KEY `idx_farm_id` (`farm_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='农资出库任务';


DROP TABLE IF EXISTS `tbl_assignment_agri_machinery_out`;
CREATE TABLE `tbl_assignment_agri_machinery_out`
(
    `id`                        bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `company_id`                bigint(20)  NOT NULL COMMENT '企业id',
    `farm_id`                   bigint(20)  NOT NULL COMMENT '农场id',
    `assignment_id`             bigint(20)  NOT NULL COMMENT '农事任务id',
    `assignment_no`             varchar(64) NOT NULL COMMENT '任务编号',
    `executor_user_id`          bigint(20)           DEFAULT NULL COMMENT '执行人id',
    `executor_user_name`        varchar(64)          DEFAULT NULL COMMENT '执行人名称',
    `executor_time`             datetime             DEFAULT NULL COMMENT '执行时间',
    `agri_machinery_out_status` varchar(20) NOT NULL COMMENT '农机领用任务状态 1.待处理、2.已处理',

    `del_flag`                  tinyint(1)  NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`                 bigint(20)           DEFAULT NULL COMMENT '创建人',
    `update_by`                 bigint(20)           DEFAULT NULL COMMENT '修改人',
    `create_time`               datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time`               datetime             DEFAULT NULL COMMENT '修改时间',

    PRIMARY KEY (`id`),
    KEY `idx_assignment_id` (`assignment_id`) USING BTREE,
    KEY `idx_assignment_no` (`assignment_no`) USING BTREE,
    KEY `idx_farm_id` (`farm_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='农机领用任务';


DROP TABLE IF EXISTS `tbl_assignment_change_record`;
CREATE TABLE `tbl_assignment_change_record`
(
    `id`                     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `assignment_id`          bigint(20) NOT NULL COMMENT '农事任务id',
    `assignment_action_type` varchar(4)          DEFAULT NULL COMMENT '农事任务行为类型  1.创建、2.修改、3.撤回、4.拒绝、5.删除、6.接受、7.出库完成、8、领用完成、9.提交任务信息、10.确认完成',
    `change_user_id`         bigint(20)          DEFAULT NULL COMMENT '变更人id',
    `change_user_name`       varchar(64)         DEFAULT NULL COMMENT '变更人名称',
    `change_time`            datetime            DEFAULT NULL COMMENT '变更时间',
    `remark`                 varchar(255)        DEFAULT NULL COMMENT '变更内容',

    `del_flag`               tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`              bigint(20)          DEFAULT NULL COMMENT '创建人',
    `update_by`              bigint(20)          DEFAULT NULL COMMENT '修改人',
    `create_time`            datetime            DEFAULT NULL COMMENT '创建时间',
    `update_time`            datetime            DEFAULT NULL COMMENT '修改时间',

    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_assignment_id` (`assignment_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='农事任务变更记录表';

DROP TABLE IF EXISTS `tbl_assignment_agri_res`;
CREATE TABLE `tbl_assignment_agri_res`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `assignment_id` bigint(20) NOT NULL COMMENT '农事任务id',
    `agri_res_id`   bigint(20) NOT NULL COMMENT '农资id',
    `out_value`     decimal(16, 2)      DEFAULT NULL COMMENT '农资出库量',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`     bigint(20)          DEFAULT NULL COMMENT '创建人',
    `update_by`     bigint(20)          DEFAULT NULL COMMENT '修改人',
    `create_time`   datetime            DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime            DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_assignment_id` (`assignment_id`) USING BTREE,
    KEY `idx_agri_res_id` (`agri_res_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='农事任务农资表';


DROP TABLE IF EXISTS `tbl_assignment_agri_machinery`;
CREATE TABLE `tbl_assignment_agri_machinery`
(
    `id`                     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `assignment_id`          bigint(20) NOT NULL COMMENT '农事任务id',
    `agri_machinery_type_id` bigint(20) NOT NULL COMMENT '农机种类id',
    `out_value`              bigint(20)          DEFAULT NULL COMMENT '农机出库数量',
    `del_flag`               tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`              bigint(20)          DEFAULT NULL COMMENT '创建人',
    `update_by`              bigint(20)          DEFAULT NULL COMMENT '修改人',
    `create_time`            datetime            DEFAULT NULL COMMENT '创建时间',
    `update_time`            datetime            DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_assignment_id` (`assignment_id`) USING BTREE,
    KEY `idx_agri_machinery_type_id` (`agri_machinery_type_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='农事任务农机表';

DROP TABLE IF EXISTS `tbl_assignment_land`;
CREATE TABLE `tbl_assignment_land`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `assignment_id`   bigint(20) NOT NULL COMMENT '农事任务id',
    `land_id`         bigint(20)          DEFAULT NULL COMMENT '地块id',
    `land_name`       varchar(256)        DEFAULT NULL COMMENT '地块名称',
    `land_acre` decimal(15,2) DEFAULT NULL COMMENT '地块面积',
    `path`            text                DEFAULT NULL COMMENT '农场所在区域位置描图',
    `land_center_lat` varchar(64)         DEFAULT NULL COMMENT '位置描图：地块中心点维度值',
    `land_center_lng` varchar(64)         DEFAULT NULL COMMENT '位置描图：地块中心点经度值',
    `fill_color`      varchar(64)         DEFAULT NULL COMMENT '位置描图：填充颜色',
    `fill_opacity`    varchar(64)         DEFAULT NULL COMMENT '位置描图：填充透明度',
    `land_zoom`       varchar(64)         DEFAULT NULL COMMENT '缩放比例',
    `del_flag`        tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`       bigint(20)          DEFAULT NULL COMMENT '创建人',
    `update_by`       bigint(20)          DEFAULT NULL COMMENT '修改人',
    `create_time`     datetime            DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime            DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_assignment_id` (`assignment_id`) USING BTREE,
    KEY `idx_land_id` (`land_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='农事任务地块表';


DROP TABLE IF EXISTS `tbl_assignment_category`;
CREATE TABLE `tbl_assignment_category`
(
    `id`                       bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `assignment_category_name` varchar(64)          DEFAULT NULL COMMENT '农事任务类型名称',
    `assignment_category_code` varchar(50) NOT NULL COMMENT '农事任务类型唯一标识',
    `mission_category_code`    varchar(50) NOT NULL COMMENT '关联农事类型唯一标识',
    `plant_flag`               tinyint(1)  NOT NULL COMMENT '是否创建种植计划，0-是 1-否',
    `pick_flag`                tinyint(1)  NOT NULL COMMENT '是否创建采收，0-是 1-否',
    `shelf_status`             tinyint(1)  NOT NULL DEFAULT '0' COMMENT '状态，0-已上架 1-已下架',
    `sort_num`                 int(11)              DEFAULT NULL COMMENT '排序号',

    `del_flag`                 tinyint(1)  NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`                bigint(20)           DEFAULT NULL COMMENT '创建人',
    `create_by_name`           varchar(64)          DEFAULT NULL COMMENT '创建人名称',
    `update_by`                bigint(20)           DEFAULT NULL COMMENT '修改人',
    `create_time`              datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time`              datetime             DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_assignment_category_code` (`assignment_category_code`) USING BTREE,
    KEY `idx_mission_category_code` (`mission_category_code`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='农事任务类型表';


DROP TABLE IF EXISTS `tbl_assignment_user`;
CREATE TABLE `tbl_assignment_user`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `company_id`            bigint(20) NOT NULL COMMENT '企业id',
    `farm_id`               bigint(20) NOT NULL COMMENT '农场id',
    `assignment_user_phone` varchar(20)         DEFAULT NULL COMMENT '手机号',
    `assignment_user_name`  varchar(64)         DEFAULT NULL COMMENT '姓名',
    `assignment_user_type`  tinyint(1) NOT NULL COMMENT '人员类型  0-自有员工 1-临时用工',
    `remark`                varchar(255)        DEFAULT NULL COMMENT '备注',
    `create_mode`           tinyint(2)          DEFAULT '1' COMMENT '创建方式。1：web,2:app',
    `del_flag`              tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`             bigint(20)          DEFAULT NULL COMMENT '创建人',
    `update_by`             bigint(20)          DEFAULT NULL COMMENT '修改人',
    `create_time`           datetime            DEFAULT NULL COMMENT '创建时间',
    `update_time`           datetime            DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_farm_id` (`farm_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='农事任务劳作人员表';


DROP TABLE IF EXISTS `tbl_assignment_user_work_hour`;
CREATE TABLE `tbl_assignment_user_work_hour`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `assignment_id`      bigint(20) NOT NULL COMMENT '农事任务id',
    `assignment_user_id` bigint(20) NOT NULL COMMENT '劳作人员id',
    `work_time`          datetime            DEFAULT NULL COMMENT '作业日期',
    `work_hour`          int(11)             DEFAULT NULL COMMENT '作业时长',

    `del_flag`           tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志 0：否 1:是',
    `create_by`          bigint(20)          DEFAULT NULL COMMENT '创建人',
    `update_by`          bigint(20)          DEFAULT NULL COMMENT '修改人',
    `create_time`        datetime            DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime            DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_assignment_id` (`assignment_id`) USING BTREE,
    KEY `idx_assignment_user_id` (`assignment_user_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='农事任务劳作人员工时表';
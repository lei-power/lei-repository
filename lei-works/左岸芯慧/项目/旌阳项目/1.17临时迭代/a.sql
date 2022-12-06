CREATE TABLE `tbl_archive_baoxian_area_insure`
(
    `id`                             bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `area_id`                        varchar(64)    DEFAULT NULL COMMENT '区域id',
    `area_name`                      varchar(64)    DEFAULT NULL COMMENT '区域名称',
    `insure_pig_count`               bigint(20) DEFAULT NULL COMMENT '投保生猪（头）',
    `electronic_ear_tag_count`       bigint(20) DEFAULT NULL COMMENT '电子耳标（个）',
    `insure_family_count`            bigint(20) DEFAULT NULL COMMENT '投保户数（户）',
    `insure_money`                   decimal(16, 3) DEFAULT '0.000' COMMENT '投保金额（元）',
    `insure_count`                   bigint(20) DEFAULT NULL COMMENT '投保头数',
    `compensate_count`               bigint(20) DEFAULT NULL COMMENT '出险头数',
    `insure_breeding_sow_count`      bigint(20) DEFAULT NULL COMMENT '能繁衍母猪投保头数（头）',
    `insure_breeding_sow_money`      decimal(16, 2) DEFAULT '0.00' COMMENT '能繁衍母猪保险费用（元）',
    `compensate_breeding_sow_count`  bigint(20) DEFAULT NULL COMMENT '能繁衍母猪出险头数（头）',
    `compensate_breeding_sow_money`  decimal(16, 2) DEFAULT '0.00' COMMENT '能繁衍母猪赔偿费用（元）',
    `compensate_breeding_sow_rate`   varchar(64)    DEFAULT NULL COMMENT '能繁衍母猪出险率',
    `insure_fattening_pig_count`     bigint(20) DEFAULT NULL COMMENT '育肥猪投保头数（头）',
    `insure_fattening_pig_money`     decimal(16, 2) DEFAULT '0.00' COMMENT '育肥猪保险费用（元）',
    `compensate_fattening_pig_count` bigint(20) DEFAULT NULL COMMENT '育肥猪出险头数（头）',
    `compensate_fattening_pig_money` decimal(16, 2) DEFAULT '0.00' COMMENT '育肥猪赔偿费用（元）',
    `compensate_fattening_pig_rate`  varchar(64)    DEFAULT NULL COMMENT '育肥猪出险率',
    `center_lat`                     varchar(64)    DEFAULT NULL COMMENT '中心点纬度值',
    `center_lng`                     varchar(64)    DEFAULT NULL COMMENT '中心点经度值',
    `create_time`                    datetime       DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                    datetime       DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 51
  DEFAULT CHARSET = utf8mb4 COMMENT ='保险投保基本信息表';
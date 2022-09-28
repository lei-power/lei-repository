CREATE TABLE `tbl_archive_gaobiaozhun_land_area_year`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`              varchar(64)    DEFAULT NULL COMMENT 'area_nameid，可以是省、市、区、镇、村等编码id',
    `year`                 int(11)        DEFAULT '0' COMMENT '成交年份（yyyy）',
    `total_acre`           decimal(16, 2) DEFAULT NULL COMMENT '总面积（亩）',
    `total_land_count`     int(11)        DEFAULT '0' COMMENT '总地块数',
    `total_original_count` int(11)        DEFAULT '0' COMMENT '总项目数',
    `statistics_mode`      tinyint(2)     DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`          datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`          datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='高标准按地块area_name年份统计--高标准农田概览模块';

CREATE TABLE `tbl_archive_gaobiaozhun_land_category_acre`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`         varchar(64)    DEFAULT NULL COMMENT 'area_nameid，可以是省、市、区、镇、村等编码id',
    `year`            int(11)        DEFAULT '0' COMMENT '成交年份（yyyy）',
    `shuitian_acre`   decimal(16, 2) DEFAULT NULL COMMENT '水田面积（亩）',
    `shuijiaodi_acre` decimal(16, 2) DEFAULT NULL COMMENT '水浇地面积（亩）',
    `handi_acre`      decimal(16, 2) DEFAULT NULL COMMENT '旱地面积（亩）',
    `other_acre`      decimal(16, 2) DEFAULT NULL COMMENT '其他面积',
    `statistics_mode` tinyint(2)     DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`     datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='高标准按地块分类统计面积--地类分布模块';


CREATE TABLE `tbl_archive_gaobiaozhun_land_rank_type_acre`
(
    `id`                bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`           varchar(64)    DEFAULT NULL COMMENT 'area_nameid，可以是省、市、区、镇、村等编码id',
    `year`              int(11)        DEFAULT '0' COMMENT '成交年份（yyyy）',
    `total_acre`        decimal(16, 2) DEFAULT NULL COMMENT '总面积（亩）',
    `fuhe_acre`         decimal(16, 2) DEFAULT NULL COMMENT '符合面积（亩）',
    `jiben_fuhe_acre`   decimal(16, 2) DEFAULT NULL COMMENT '基本符合面积（亩）',
    `tizhi_gaizao_acre` decimal(16, 2) DEFAULT NULL COMMENT '需要提质改造面积（亩）',
    `other_acre`        decimal(16, 2) DEFAULT NULL COMMENT '未知面积（亩）',
    `statistics_mode`   tinyint(2)     DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`       datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`       datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='高标准按地块等级类型统计面积--质量等级模块';


CREATE TABLE `tbl_archive_gaobiaozhun_land_level_acre`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`         varchar(64)    DEFAULT NULL COMMENT 'area_nameid，可以是省、市、区、镇、村等编码id',
    `year`            int(11)        DEFAULT '0' COMMENT '成交年份（yyyy）',
    `level_acre1`     decimal(16, 2) DEFAULT NULL COMMENT '面积1（亩），0<=面积<5',
    `level_acre2`     decimal(16, 2) DEFAULT NULL COMMENT '面积2（亩），5<=面积<10',
    `level_acre3`     decimal(16, 2) DEFAULT NULL COMMENT '面积3（亩），10<=面积<15',
    `level_acre4`     decimal(16, 2) DEFAULT NULL COMMENT '面积4（亩），15<=面积<20',
    `level_acre5`     decimal(16, 2) DEFAULT NULL COMMENT '面积5（亩），20<=面积<25',
    `level_acre6`     decimal(16, 2) DEFAULT NULL COMMENT '面积6（亩），25<=面积<30',
    `level_acre7`     decimal(16, 2) DEFAULT NULL COMMENT '面积7（亩），30<=面积<35',
    `level_acre8`     decimal(16, 2) DEFAULT NULL COMMENT '面积8（亩），35<=面积<40',
    `level_acre9`     decimal(16, 2) DEFAULT NULL COMMENT '面积9（亩），40<=面积<45',
    `level_acre10`    decimal(16, 2) DEFAULT NULL COMMENT '面积10（亩），45<=面积<50',
    `level_acre11`    decimal(16, 2) DEFAULT NULL COMMENT '面积11（亩），面积>=50',

    `level_count1`    int(11)        DEFAULT NULL COMMENT '面积1（亩），0<=面积<5',
    `level_count2`    int(11)        DEFAULT NULL COMMENT '面积2（亩），5<=面积<10',
    `level_count3`    int(11)        DEFAULT NULL COMMENT '面积3（亩），10<=面积<15',
    `level_count4`    int(11)        DEFAULT NULL COMMENT '面积4（亩），15<=面积<20',
    `level_count5`    int(11)        DEFAULT NULL COMMENT '面积5（亩），20<=面积<25',
    `level_count6`    int(11)        DEFAULT NULL COMMENT '面积6（亩），25<=面积<30',
    `level_count7`    int(11)        DEFAULT NULL COMMENT '面积7（亩），30<=面积<35',
    `level_count8`    int(11)        DEFAULT NULL COMMENT '面积8（亩），35<=面积<40',
    `level_count9`    int(11)        DEFAULT NULL COMMENT '面积9（亩），40<=面积<45',
    `level_count10`   int(11)        DEFAULT NULL COMMENT '面积10（亩），45<=面积<50',
    `level_count11`   int(11)        DEFAULT NULL COMMENT '面积11（亩），面积>=50',


    `statistics_mode` tinyint(2)     DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`     datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='高标准按地块等级统计面积--地块统计模块';


--
-- CREATE TABLE `tbl_archive_gaobiaozhun_area_year`
-- (
--     `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
--     `area_id`         varchar(64)    DEFAULT NULL COMMENT 'area_nameid，可以是省、市、区、镇、村等编码id',
--     `year`            int(11)        DEFAULT '0' COMMENT '成交年份（yyyy）',
--     `land_acre`       decimal(16, 2) DEFAULT NULL COMMENT '地块面积（亩）',
--     `land_count`      int(11)        DEFAULT NULL COMMENT '地块数量（块）',
--     `original_count`  int(11)        DEFAULT NULL COMMENT '项目数量（个）',
--     `statistics_mode` tinyint(2)     DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
--     `create_time`     datetime       DEFAULT NULL COMMENT '创建时间',
--     `update_time`     datetime       DEFAULT NULL COMMENT '更新时间',
--     PRIMARY KEY (`id`) USING BTREE
-- ) ENGINE = InnoDB
--   AUTO_INCREMENT = 1
--   DEFAULT CHARSET = utf8mb4 COMMENT ='高标准按area_name年份统计--建设趋势模块';


CREATE TABLE `tbl_archive_gaobiaozhun_land_area`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`         varchar(64)    DEFAULT NULL COMMENT 'area_nameid，可以是省、市、区、镇、村等编码id',
    `year`            int(11)        DEFAULT '0' COMMENT '成交年份（yyyy）',
    `land_acre`       decimal(16, 2) DEFAULT NULL COMMENT '地块面积（亩）',
    `land_count`      int(11)        DEFAULT NULL COMMENT '地块数量（块）',
    `original_count`  int(11)        DEFAULT NULL COMMENT '项目数量（个）',
    `statistics_mode` tinyint(2)     DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`     datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='高标准按地块area_name统计--项目分布模块';

CREATE TABLE `tbl_archive_gaobiaozhun_original_list`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`         varchar(64)    DEFAULT NULL COMMENT 'area_nameid，可以是省、市、区、镇、村等编码id',
    `year`            int(11)        DEFAULT '0' COMMENT '成交年份（yyyy）',
    `original_name`   decimal(16, 2) DEFAULT NULL COMMENT '项目名称',
    `original_num`    int(11)        DEFAULT NULL COMMENT '项目编号',
    `land_count`      int(11)        DEFAULT NULL COMMENT '地块数量（块）',
    `statistics_mode` tinyint(2)     DEFAULT NULL COMMENT '统计方式 0 手动 1 自动',
    `create_time`     datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='高标准按地块area_name统计--项目列表模块';



UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '79318',
    `electronic_ear_tag_count`       = '2337',
    `insure_family_count`            = '1205',
    `insure_money`                   = '32170068',
    `insure_breeding_sow_count`      = '8907',
    `insure_fattening_pig_count`     = '70401',
    `insure_breeding_sow_money`      = '1132506',
    `insure_fattening_pig_money`     = '3097644',
    `compensate_breeding_sow_count`  = '2256',
    `compensate_fattening_pig_count` = '7109',
    `compensate_breeding_sow_money`  = '4753120',
    `compensate_fattening_pig_money` = '3165840',
    `compensate_breeding_sow_rate`   = '0.253284',
    `compensate_fattening_pig_rate`  = '0.100979',
    `insure_count`                   = '79318',
    `compensate_count`               = '9365'
WHERE `area_name` = '旌阳区';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '2280',
    `electronic_ear_tag_count`       = '171',
    `insure_family_count`            = '72',
    `insure_money`                   = '235894',
    `insure_breeding_sow_count`      = '409',
    `insure_fattening_pig_count`     = '3965',
    `insure_breeding_sow_money`      = '61434',
    `insure_fattening_pig_money`     = '174460',
    `compensate_breeding_sow_count`  = '248',
    `compensate_fattening_pig_count` = '803',
    `compensate_breeding_sow_money`  = '516000',
    `compensate_fattening_pig_money` = '329040',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '2280',
    `compensate_count`               = '1051'
WHERE `area_name` = '柏隆镇';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '3572',
    `electronic_ear_tag_count`       = '296',
    `insure_family_count`            = '82',
    `insure_money`                   = '236224',
    `insure_breeding_sow_count`      = '792',
    `insure_fattening_pig_count`     = '2780',
    `insure_breeding_sow_money`      = '113904',
    `insure_fattening_pig_money`     = '122320',
    `compensate_breeding_sow_count`  = '514',
    `compensate_fattening_pig_count` = '915',
    `compensate_breeding_sow_money`  = '1135500',
    `compensate_fattening_pig_money` = '395880',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '3572',
    `compensate_count`               = '1429'
WHERE `area_name` = '德新镇';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '6143',
    `electronic_ear_tag_count`       = '249',
    `insure_family_count`            = '185',
    `insure_money`                   = '5318766',
    `insure_breeding_sow_count`      = '1028',
    `insure_fattening_pig_count`     = '5115',
    `insure_breeding_sow_money`      = '128376',
    `insure_fattening_pig_money`     = '225060',
    `compensate_breeding_sow_count`  = '80',
    `compensate_fattening_pig_count` = '694',
    `compensate_breeding_sow_money`  = '120000',
    `compensate_fattening_pig_money` = '327160',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '6143',
    `compensate_count`               = '836'
WHERE `area_name` = '和新镇';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '10531',
    `electronic_ear_tag_count`       = '820',
    `insure_family_count`            = '158',
    `insure_money`                   = '690176',
    `insure_breeding_sow_count`      = '1786',
    `insure_fattening_pig_count`     = '9349',
    `insure_breeding_sow_money`      = '278820',
    `insure_fattening_pig_money`     = '411356',
    `compensate_breeding_sow_count`  = '382',
    `compensate_fattening_pig_count` = '830',
    `compensate_breeding_sow_money`  = '831000',
    `compensate_fattening_pig_money` = '354340',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '10531',
    `compensate_count`               = '1218'
WHERE `area_name` = '黄许镇';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '15346',
    `electronic_ear_tag_count`       = '280',
    `insure_family_count`            = '221',
    `insure_money`                   = '774182',
    `insure_breeding_sow_count`      = '1225',
    `insure_fattening_pig_count`     = '14173',
    `insure_breeding_sow_money`      = '150570',
    `insure_fattening_pig_money`     = '623612',
    `compensate_breeding_sow_count`  = '246',
    `compensate_fattening_pig_count` = '945',
    `compensate_breeding_sow_money`  = '785650',
    `compensate_fattening_pig_money` = '385040',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '15346',
    `compensate_count`               = '1191'
WHERE `area_name` = '双东镇';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '1493',
    `electronic_ear_tag_count`       = '49',
    `insure_family_count`            = '92',
    `insure_money`                   = '86824',
    `insure_breeding_sow_count`      = '306',
    `insure_fattening_pig_count`     = '1187',
    `insure_breeding_sow_money`      = '34596',
    `insure_fattening_pig_money`     = '52228',
    `compensate_breeding_sow_count`  = '196',
    `compensate_fattening_pig_count` = '240',
    `compensate_breeding_sow_money`  = '348000',
    `compensate_fattening_pig_money` = '70360',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '1493',
    `compensate_count`               = '436'
WHERE `area_name` = '孝泉镇';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '3985',
    `electronic_ear_tag_count`       = '0',
    `insure_family_count`            = '105',
    `insure_money`                   = '3609400',
    `insure_breeding_sow_count`      = '602',
    `insure_fattening_pig_count`     = '3383',
    `insure_breeding_sow_money`      = '54180',
    `insure_fattening_pig_money`     = '148852',
    `compensate_breeding_sow_count`  = '38',
    `compensate_fattening_pig_count` = '40',
    `compensate_breeding_sow_money`  = '27000',
    `compensate_fattening_pig_money` = '24960',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '3985',
    `compensate_count`               = '58'
WHERE `area_name` = '新中镇';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '21963',
    `electronic_ear_tag_count`       = '82',
    `insure_family_count`            = '158',
    `insure_money`                   = '20740188',
    `insure_breeding_sow_count`      = '1832',
    `insure_fattening_pig_count`     = '22620',
    `insure_breeding_sow_money`      = '176688',
    `insure_fattening_pig_money`     = '995280',
    `compensate_breeding_sow_count`  = '166',
    `compensate_fattening_pig_count` = '1017',
    `compensate_breeding_sow_money`  = '273000',
    `compensate_fattening_pig_money` = '369580',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '21963',
    `compensate_count`               = '1183'
WHERE `area_name` = '东湖街道';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '6435',
    `electronic_ear_tag_count`       = '362',
    `insure_family_count`            = '104',
    `insure_money`                   = '367620',
    `insure_breeding_sow_count`      = '816',
    `insure_fattening_pig_count`     = '5619',
    `insure_breeding_sow_money`      = '120384',
    `insure_fattening_pig_money`     = '247236',
    `compensate_breeding_sow_count`  = '254',
    `compensate_fattening_pig_count` = '1308',
    `compensate_breeding_sow_money`  = '627000',
    `compensate_fattening_pig_money` = '678280',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '6435',
    `compensate_count`               = '1597'
WHERE `area_name` = '天元街道';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_pig_count`               = '2319',
    `electronic_ear_tag_count`       = '28',
    `insure_family_count`            = '28',
    `insure_money`                   = '110794',
    `insure_breeding_sow_count`      = '111',
    `insure_fattening_pig_count`     = '2210',
    `insure_breeding_sow_money`      = '13554',
    `insure_fattening_pig_money`     = '97240',
    `compensate_breeding_sow_count`  = '132',
    `compensate_fattening_pig_count` = '317',
    `compensate_breeding_sow_money`  = '89970',
    `compensate_fattening_pig_money` = '231200',
    `compensate_breeding_sow_rate`   = NULL,
    `compensate_fattening_pig_rate`  = NULL,
    `insure_count`                   = '2319',
    `compensate_count`               = '366'
WHERE `area_name` = '孝感街道';


UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '35',
    `insure_count`        = '995',
    `compensate_count`    = NULL
WHERE `area_name` = '隆兴桥村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '35',
    `insure_count`        = '1250',
    `compensate_count`    = NULL
WHERE `area_name` = '松柏村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '2',
    `insure_count`        = '35',
    `compensate_count`    = NULL
WHERE `area_name` = '南平村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '14',
    `insure_count`        = '182',
    `compensate_count`    = NULL
WHERE `area_name` = '胜利村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '12',
    `insure_count`        = '263',
    `compensate_count`    = NULL
WHERE `area_name` = '长江村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '17',
    `insure_count`        = '449',
    `compensate_count`    = NULL
WHERE `area_name` = '新玉村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '16',
    `insure_count`        = '2010',
    `compensate_count`    = NULL
WHERE `area_name` = '星光村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '11',
    `insure_count`        = '345',
    `compensate_count`    = NULL
WHERE `area_name` = '龙泉村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '19',
    `insure_count`        = '808',
    `compensate_count`    = NULL
WHERE `area_name` = '大地村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '29',
    `insure_count`        = '20343',
    `compensate_count`    = NULL
WHERE `area_name` = '马鞍村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '41',
    `insure_count`        = '598',
    `compensate_count`    = NULL
WHERE `area_name` = '新沟村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '21',
    `insure_count`        = '214',
    `compensate_count`    = NULL
WHERE `area_name` = '高槐村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '40',
    `insure_count`        = '326',
    `compensate_count`    = NULL
WHERE `area_name` = '福兴村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '20',
    `insure_count`        = '461',
    `compensate_count`    = NULL
WHERE `area_name` = '白蜡村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '37',
    `insure_count`        = '765',
    `compensate_count`    = NULL
WHERE `area_name` = '英雄岭村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '3',
    `insure_count`        = '13',
    `compensate_count`    = NULL
WHERE `area_name` = '长寿村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '58',
    `insure_count`        = '3063',
    `compensate_count`    = NULL
WHERE `area_name` = '永兴村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '27',
    `insure_count`        = '1515',
    `compensate_count`    = NULL
WHERE `area_name` = '高治村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '2',
    `insure_count`        = '1900',
    `compensate_count`    = NULL
WHERE `area_name` = '宏山村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '2',
    `insure_count`        = '47',
    `compensate_count`    = NULL
WHERE `area_name` = '广平村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '13',
    `insure_count`        = '174',
    `compensate_count`    = NULL
WHERE `area_name` = '泰康村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '11',
    `insure_count`        = '1013',
    `compensate_count`    = NULL
WHERE `area_name` = '红海村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '4',
    `insure_count`        = NULL,
    `compensate_count`    = NULL
WHERE `area_name` = '仙桥村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '5',
    `insure_count`        = '77',
    `compensate_count`    = NULL
WHERE `area_name` = '双原村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '7',
    `insure_count`        = '6661',
    `compensate_count`    = NULL
WHERE `area_name` = '三合村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '6',
    `insure_count`        = '1486',
    `compensate_count`    = NULL
WHERE `area_name` = '二百钱村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '98',
    `insure_count`        = '1561',
    `compensate_count`    = NULL
WHERE `area_name` = '东美村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '13',
    `insure_count`        = '6576',
    `compensate_count`    = NULL
WHERE `area_name` = '八佛村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '2',
    `insure_count`        = '240',
    `compensate_count`    = NULL
WHERE `area_name` = '凯江村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '1',
    `insure_count`        = '10',
    `compensate_count`    = NULL
WHERE `area_name` = '金锣桥村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '14',
    `insure_count`        = '281',
    `compensate_count`    = NULL
WHERE `area_name` = '新隆村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '29',
    `insure_count`        = '1025',
    `compensate_count`    = '1025'
WHERE `area_name` = '丰城村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '12',
    `insure_count`        = '20',
    `compensate_count`    = NULL
WHERE `area_name` = '白江村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '24',
    `insure_count`        = '2522',
    `compensate_count`    = NULL
WHERE `area_name` = '花景村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '20',
    `insure_count`        = '2052',
    `compensate_count`    = '1896'
WHERE `area_name` = '青花村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '28',
    `insure_count`        = '380',
    `compensate_count`    = NULL
WHERE `area_name` = '金马村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '59',
    `insure_count`        = '150',
    `compensate_count`    = NULL
WHERE `area_name` = '菖蒲村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '19',
    `insure_count`        = '271',
    `compensate_count`    = NULL
WHERE `area_name` = '高桥村';
UPDATE `tbl_archive_baoxian_area_insure`
SET `insure_family_count` = '14',
    `insure_count`        = '494',
    `compensate_count`    = NULL
WHERE `area_name` = '江河村';


INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000920, '红阳村', '6', '10', NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000915, '五星村', '6', '313', NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000902, '新华村', '20', NULL, NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000901, '刁桥村', '28', NULL, NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000892, '长平村', '33', '659', NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000885, '东泰村', '81', NULL, NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000851, '翻身村', '25', '260', NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000842, '清泉村', '76', '5213', NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000935, '扬嘉村', '5', '535', '535');
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000876, '杨柳村', NULL, '1939', NULL);
INSERT INTO `tbl_archive_baoxian_area_insure`(`area_id`, `area_name`, `insure_family_count`, `insure_count`,
                                              `compensate_count`)
VALUES (2000976, '黎郎村', NULL, '578', NULL);

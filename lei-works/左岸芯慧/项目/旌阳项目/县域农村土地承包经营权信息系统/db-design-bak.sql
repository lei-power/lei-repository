-- ############ 土地承包
-- 1.发包方表
CREATE TABLE `tbl_fbf`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `fbfbm`         varchar(14)  NOT NULL COMMENT '发包方代码',
    `fbfmc`         varchar(50)  NOT NULL COMMENT '发包方名称',
    `fbffzrxm`      varchar(50)  NOT NULL COMMENT '发包方负责人姓名',
    `fzrzjlx`       varchar(1)   NOT NULL COMMENT '负责人证件类型',
    `fzrzjhm`       varchar(30)  NOT NULL COMMENT '负责人证件号码',
    `lxdh`          varchar(15)  DEFAULT NULL COMMENT '联系电话',

    `province_id`   bigint(20) DEFAULT NULL COMMENT '省id',
    `city_id`       bigint(20) DEFAULT NULL COMMENT '市id',
    `county_id`     bigint(20) DEFAULT NULL COMMENT '区id',
    `town_id`       bigint(20) DEFAULT NULL COMMENT '镇id',
    `village_id`    bigint(20) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `fbfdz`         varchar(254) NOT NULL COMMENT '发包方地址',
    `yzbm`          varchar(6)   NOT NULL COMMENT '邮政编码',
    `fbfdcy`        varchar(254) NOT NULL COMMENT '发包方调查员',
    `fbfdcrq`       date         NOT NULL COMMENT '发包方调查日期',
    `fbfdcjs`       varchar(254) DEFAULT NULL COMMENT '发包方调查记事',
    `create_time`   datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='发包方表';

-- 2.承包方表
CREATE TABLE `tbl_cbf`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(18)  NOT NULL COMMENT '承包方代码',
    `cbflx`         varchar(1)   NOT NULL COMMENT '承包方类型',
    `cbfmc`         varchar(50)  NOT NULL COMMENT '承包方代表名称',
    `cbfzjlx`       varchar(1)   NOT NULL COMMENT '承包方证件类型',
    `cbfzjhm`       varchar(20)  NOT NULL COMMENT '承包方证件号码',

    `province_id`   bigint(20) DEFAULT NULL COMMENT '省id',
    `city_id`       bigint(20) DEFAULT NULL COMMENT '市id',
    `county_id`     bigint(20) DEFAULT NULL COMMENT '区id',
    `town_id`       bigint(20) DEFAULT NULL COMMENT '镇id',
    `village_id`    bigint(20) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `cbfdz`         varchar(100) NOT NULL COMMENT '承包方地址',
    `yzbm`          varchar(6)   NOT NULL COMMENT '邮政编码',
    `lxdh`          varchar(20)  DEFAULT NULL COMMENT '联系电话',
    `cbfcysl`       int(11) NOT NULL COMMENT '承包方成员数量',
    `cbfdcrq`       date         NOT NULL COMMENT '承包方调查日期',
    `cbfdcy`        varchar(50)  NOT NULL COMMENT '承包方调查员',
    `cbfdcjs`       varchar(254) DEFAULT NULL COMMENT '承包方调查记事',
    `gsjs`          varchar(254) DEFAULT NULL COMMENT '公示记事',
    `gsjsr`         varchar(50)  NOT NULL COMMENT '公示记事人',
    `gsshrq`        date         NOT NULL COMMENT '公示审核日期',
    `gsshr`         varchar(50)  NOT NULL COMMENT '公示审核人',
    `del_flag`      tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 1-是 0-否',
    `create_time`   datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包方表';

-- 3.家庭成员表
CREATE TABLE `tbl_cbf_jtcy`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`       varchar(18) NOT NULL COMMENT '承包方代码',
    `cyxm`        varchar(50) NOT NULL COMMENT '成员姓名',
    `cyxb`        varchar(1)  NOT NULL COMMENT '成员性别 1-男 2-女',
    `cyzjlx`      varchar(1)  NOT NULL COMMENT '成员证件类型',
    `cyzjhm`      varchar(20) NOT NULL COMMENT '成员证件号码',
    `yhzgx`       varchar(2)  NOT NULL COMMENT '成员与户主关系',
    `cybz`        varchar(1)   DEFAULT NULL COMMENT '成员备注',
    `sfgyr`       varchar(1)   DEFAULT NULL COMMENT '是否共有人 1-是 2-否',
    `cybzsm`      varchar(254) DEFAULT NULL COMMENT '成员备注说明',
    `del_flag`    tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 1-是 0-否',
    `create_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='家庭成员表';

-- 5.承包地块信息表
CREATE TABLE `tbl_cbdkxx`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `dkbm`          varchar(19)    NOT NULL COMMENT '地块代码',
    `fbfbm`         varchar(14)    NOT NULL COMMENT '发包方代码',
    `cbfbm`         varchar(18)    NOT NULL COMMENT '承包方代码',
    `cbjyqqdfs`     varchar(3)     NOT NULL COMMENT '承包经营权取得方式',
    `htmj`          decimal(16, 2) NOT NULL COMMENT '确权合同总面积，单位：m2',
    `cbhtbm`        varchar(19)    NOT NULL COMMENT '承包合同代码',
    `lzhtbm`        varchar(18)    DEFAULT NULL COMMENT '流转合同代码',
    `cbjyqzbm`      varchar(19)    DEFAULT NULL COMMENT '承包经营权证（登记簿）代码',
    `yhtmj`         decimal(16, 2) DEFAULT NULL COMMENT '原合同总面积，单位：m2',
    `htmjm`         decimal(16, 2) DEFAULT NULL COMMENT '确权合同总面积，单位：亩',
    `yhtmjm`        decimal(16, 2) DEFAULT NULL COMMENT '原合同总面积，单位：亩',
    `sfqqqg`        varchar(1)     DEFAULT NULL COMMENT '是否确权确股 1-是 2-否',
    `dklb`          varchar(2)     DEFAULT NULL COMMENT '地块类别',

    `province_id`   bigint(20) DEFAULT NULL COMMENT '省id',
    `city_id`       bigint(20) DEFAULT NULL COMMENT '市id',
    `county_id`     bigint(20) DEFAULT NULL COMMENT '区id',
    `town_id`       bigint(20) DEFAULT NULL COMMENT '镇id',
    `village_id`    bigint(20) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `del_flag`      tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 1-是 0-否',
    `create_time`   datetime       DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包地块信息表';
##############################################
v1.0
-- 4.地块表
CREATE TABLE `tbl_dk`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `bsm`                int(11) NOT NULL COMMENT '标识码',
    `ysdm`               varchar(6)  NOT NULL COMMENT '要素代码',
    `dkbm`               varchar(19) NOT NULL COMMENT '地块代码',
    `dkmc`               varchar(50) NOT NULL COMMENT '地块名称',
    `syqxz`              varchar(2)     DEFAULT NULL COMMENT '所有权性质',
    `dklb`               varchar(2)     DEFAULT NULL COMMENT '地块类别',
    `tdlylx`             varchar(3)     DEFAULT NULL COMMENT '土地利用类型',
    `dldj`               varchar(2)     DEFAULT NULL COMMENT '地力等级',
    `tdyt`               varchar(1)     DEFAULT NULL COMMENT '土地用途',
    `sfjbnt`             varchar(1)     DEFAULT NULL COMMENT '是否基本农田 1-是 2-否',
    `scmj`               decimal(15, 2) DEFAULT NULL COMMENT '实测面积',
    `dkdz`               varchar(50)    DEFAULT NULL COMMENT '地块东至',
    `dkxz`               varchar(50)    DEFAULT NULL COMMENT '地块西至',
    `dknz`               varchar(50)    DEFAULT NULL COMMENT '地块南至',
    `dkbz`               varchar(50)    DEFAULT NULL COMMENT '地块北至',
    `dkbzxx`             varchar(254)   DEFAULT NULL COMMENT '地块备注信息',
    `zjrxm`              varchar(100)   DEFAULT NULL COMMENT '指界人姓名',
    `kjzb`               varchar(254)   DEFAULT NULL COMMENT '空间坐标',
    `scmjm`              decimal(15, 2) DEFAULT NULL COMMENT '实测面积亩',
    `init_province_id`   bigint(20) DEFAULT NULL COMMENT '初始省id',
    `init_city_id`       bigint(20) DEFAULT NULL COMMENT '初始市id',
    `init_county_id`     bigint(20) DEFAULT NULL COMMENT '初始区id',
    `init_town_id`       bigint(20) DEFAULT NULL COMMENT '初始镇id',
    `init_village_id`    bigint(20) DEFAULT NULL COMMENT '初始村id',
    `init_group_id`      bigint(20) DEFAULT NULL COMMENT '初始组id',
    `init_province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始省名称',
    `init_city_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始市名称',
    `init_county_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始区名称',
    `init_town_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始镇名称',
    `init_village_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始村名称',
    `init_group_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始组名称',
    `province_id`        bigint(20) DEFAULT NULL COMMENT '省id',
    `city_id`            bigint(20) DEFAULT NULL COMMENT '市id',
    `county_id`          bigint(20) DEFAULT NULL COMMENT '区id',
    `town_id`            bigint(20) DEFAULT NULL COMMENT '镇id',
    `village_id`         bigint(20) DEFAULT NULL COMMENT '村id',
    `province_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称',
    `city_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
    `county_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称',
    `town_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',

    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 544717
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='地块表';

-- 6.承包合同表
CREATE TABLE `tbl_cbht`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbhtbm`             varchar(19)    NOT NULL COMMENT '承包合同代码',
    `ycbhtbm`            varchar(19)             DEFAULT NULL COMMENT '原承包合同代码',
    `fbfbm`              varchar(14)    NOT NULL COMMENT '发包方代码',
    `cbfbm`              varchar(18)    NOT NULL COMMENT '承包方代码',
    `cbfs`               varchar(3)     NOT NULL COMMENT '承包方式',
    `cbqxq`              date           NOT NULL COMMENT '承包期限起',
    `cbqxz`              date           NOT NULL COMMENT '承包期限止',
    `htzmj`              decimal(16, 2) NOT NULL COMMENT '确权合同总面积，单位：m2',
    `cbdkzs`             int(11) NOT NULL COMMENT '承包地块总数',
    `qdsj`               date           NOT NULL COMMENT '签订时间',
    `htzmjm`             decimal(16, 2)          DEFAULT NULL COMMENT '确权合同总面积，单位：亩',
    `yhtzmj`             decimal(16, 2)          DEFAULT NULL COMMENT '原合同总面积,单位：m2',
    `yhtzmjm`            decimal(16, 2)          DEFAULT NULL COMMENT '原合同总面积,单位：亩',

    `scdjb_flag`         varchar(1)     NOT NULL DEFAULT '2' COMMENT
        '是否生成登记簿 1-是 2-否',
    `active_flag`        varchar(1)     NOT NULL DEFAULT '1' COMMENT '是否生效 1-是 2-否',

    `init_province_id`   bigint(20) DEFAULT NULL COMMENT '初始省id',
    `init_city_id`       bigint(20) DEFAULT NULL COMMENT '初始市id',
    `init_county_id`     bigint(20) DEFAULT NULL COMMENT '初始区id',
    `init_town_id`       bigint(20) DEFAULT NULL COMMENT '初始镇id',
    `init_village_id`    bigint(20) DEFAULT NULL COMMENT '初始村id',
    `init_group_id`      bigint(20) DEFAULT NULL COMMENT '初始组id',
    `init_province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始省名称',
    `init_city_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始市名称',
    `init_county_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始区名称',
    `init_town_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始镇名称',
    `init_village_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始村名称',
    `init_group_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始组名称',
    `province_id`        bigint(20) DEFAULT NULL COMMENT '省id',
    `city_id`            bigint(20) DEFAULT NULL COMMENT '市id',
    `county_id`          bigint(20) DEFAULT NULL COMMENT '区id',
    `town_id`            bigint(20) DEFAULT NULL COMMENT '镇id',
    `village_id`         bigint(20) DEFAULT NULL COMMENT '村id',
    `province_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称',
    `city_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
    `county_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称',
    `town_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `create_time`        datetime                DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_cbhtbm` (`cbhtbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包合同表';

-- 7.承包经营权证登记簿
CREATE TABLE `tbl_cbjyqzdjb`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbjyqzbm`    varchar(19)  NOT NULL COMMENT '承包经营权证（登记簿）编码',
    `fbfbm`       varchar(14)  NOT NULL COMMENT '发包方代码',
    `cbfbm`       varchar(18)  NOT NULL COMMENT '承包方代码',
    `cbfs`        varchar(3)   NOT NULL COMMENT '承包方式',
    `cbqx`        varchar(30)  NOT NULL COMMENT '承包期限',
    `cbqxq`       date         NOT NULL COMMENT '承包期限起',
    `cbqxz`       date         NOT NULL COMMENT '承包期限止',
    `dksyt`       varchar(254)          DEFAULT NULL COMMENT '地块示意图',
    `cbjyqzlsh`   varchar(254) NOT NULL COMMENT '承包经营权证流水号',
    `djbfj`       varchar(254)          DEFAULT NULL COMMENT '登记簿附记',
    `ycbjyqzbh`   varchar(100)          DEFAULT NULL COMMENT '原承包经营权证编号',
    `dbr`         varchar(50)  NOT NULL COMMENT '登簿人',
    `djsj`        date         NOT NULL COMMENT '登记时间',
    `active_flag` varchar(1)   NOT NULL DEFAULT '1' COMMENT '是否生效 1-是 2-否',
    `create_time` datetime              DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime              DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_cbjyqzbm` (`cbjyqzbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包经营权证登记簿';

-- 8.承包经营权证表
CREATE TABLE `tbl_cbjyqz`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbjyqzbm`    varchar(19) NOT NULL COMMENT '承包经营权证（登记簿）代码',
    `fzjg`        varchar(50) NOT NULL COMMENT '发证机关',
    `fzrq`        date        NOT NULL COMMENT '发证日期',
    `qzsflq`      varchar(1)  NOT NULL COMMENT '权证是否领取 1-是 2-否',
    `qzlqrq`      date                 DEFAULT NULL COMMENT '权证领取日期',
    `qzlqrxm`     varchar(50)          DEFAULT NULL COMMENT '权证领取人姓名',
    `qzlqrzjlx`   varchar(1)           DEFAULT NULL COMMENT '权证领取人证件类型',
    `qzlqrzjhm`   varchar(20)          DEFAULT NULL COMMENT '权证领取人证件号码',
    `active_flag` varchar(1)  NOT NULL DEFAULT '1' COMMENT '是否生效 1-是 2-否',
    `create_time` datetime             DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime             DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_cbjyqzbm` (`cbjyqzbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包经营权证表';

-- 9.承包经营权证补发表
CREATE TABLE `tbl_cbjyqz_qzbf`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbjyqzbm`    varchar(19)  NOT NULL COMMENT '承包经营权证（登记簿）代码',
    `qzbfyy`      varchar(200) NOT NULL COMMENT '权证补发原因',
    `bfrq`        date         NOT NULL COMMENT '补发日期',
    `qzbflqrq`    date         NOT NULL COMMENT '权证补发领取日期',
    `qzbflqrxm`   varchar(50)  NOT NULL COMMENT '权证补发领取人姓名',
    `bflqrzjlx`   varchar(1)   NOT NULL COMMENT '权证补发领取人证件类型',
    `bflqrzjhm`   varchar(20)  NOT NULL COMMENT '权证补发领取人证件号码',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包经营权证补发表';

-- 10.承包经营权证换发表
CREATE TABLE `tbl_cbjyqz_qzhf`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbjyqzbm`    varchar(19)  NOT NULL COMMENT '承包经营权证（登记簿）代码',
    `qzhfyy`      varchar(200) NOT NULL COMMENT '权证换发原因',
    `hfrq`        date         NOT NULL COMMENT '换发日期',
    `qzhflqrq`    date         NOT NULL COMMENT '权证换发领取日期',
    `qzhflqrxm`   varchar(50)  NOT NULL COMMENT '权证换发领取人姓名',
    `hflqrzjlx`   varchar(1)   NOT NULL COMMENT '权证换发领取人证件类型',
    `hflqrzjhm`   varchar(20)  NOT NULL COMMENT '权证换发领取人证件号码',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包经营权证换发表';

-- 11.承包经营权证注销表
CREATE TABLE `tbl_cbjyqz_qzzx`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbjyqzbm`    varchar(19)  NOT NULL COMMENT '承包经营权证（登记簿）代码',
    `zxyy`        varchar(200) NOT NULL COMMENT '注销原因',
    `zxrq`        date         NOT NULL COMMENT '注销日期',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_cbjyqzbm` (`cbjyqzbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包经营权证注销表';

-- 12.权属来源资料附件表
CREATE TABLE `tbl_qslyzlfj`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbjyqzbm`    varchar(19)  NOT NULL COMMENT '承包经营权证（登记簿）代码',
    `zlfjbh`      varchar(20)  NOT NULL COMMENT '资料附件编号',
    `zlfjmc`      varchar(100) NOT NULL COMMENT '资料附件名称',
    `zlfjrq`      date         NOT NULL COMMENT '资料附件日期',
    `fj_url`      varchar(255) NOT NULL COMMENT '附件（影像文件）存url',
    `active_flag` varchar(1)   NOT NULL DEFAULT '1' COMMENT '是否生效 1-是 2-否',
    `create_time` datetime              DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime              DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_cbjyqzbm_zlfjbh` (`cbjyqzbm`, `zlfjbh`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='权属来源资料附件表';

-- 13. 初始区域表
CREATE TABLE `tbl_init_area`
(
    `id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '区域id',
    `area_name` varchar(64) DEFAULT NULL COMMENT '区域名称',
    `parent_id` bigint(20) DEFAULT NULL COMMENT '父级id,省级时为0',
    `level`     tinyint(1) DEFAULT NULL COMMENT '区域等级 1-省 2-市 3-区 4-镇 5-村 6-组',
    `sort_num`  int(11) DEFAULT NULL COMMENT '排序字段，数字越小越靠前',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='初始区域表';

-- 13.区域映射表
CREATE TABLE `tbl_orm_area`
(
    `id`                bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `init_town_id`      bigint(20) DEFAULT NULL COMMENT '初始镇id',
    `init_village_id`   bigint(20) DEFAULT NULL COMMENT '初始村id',
    `init_group_id`     bigint(20) DEFAULT NULL COMMENT '初始组id',
    `init_town_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始镇名称',
    `init_village_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始村名称',
    `init_group_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始组名称',
    `town_id`           bigint(20) DEFAULT NULL COMMENT '镇id',
    `village_id`        bigint(20) DEFAULT NULL COMMENT '村id',
    `town_name`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇名称',
    `village_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村名称',
    `create_time`       datetime DEFAULT NULL COMMENT '创建时间',
    `update_time`       datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY uk_area (`init_town_id`, `init_village_id`, `init_group_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='区域映射表';



-- ############# 登记业务

-- 1.登记申请表
CREATE TABLE `tbl_djsq`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `djno`        varchar(22) NOT NULL COMMENT '登记流水号(主参与方编码+4位顺序码)',
    `djlx`        varchar(1)  NOT NULL COMMENT '登记类型',
    `dqzt`        varchar(1)  NOT NULL COMMENT '当前状态 1-草稿 2-待审核 3-通过 4-驳回',
    `zcyf_flag`   varchar(1)  NOT NULL COMMENT '是否是主参与方（原户主、转让方、合户方...）1-是 2-否',
    `cyfbm`       varchar(18) NOT NULL COMMENT '参与方编码',
    `cyfmc`       varchar(50) NOT NULL COMMENT '参与方名称',
    `blr_id`      varchar(50) NOT NULL COMMENT '当前办理人编码',
    `blr_name`    varchar(50) NOT NULL COMMENT '当前办理人名称',
    `bgqdkbm`     text COMMENT '变更前地块编码，多个地块逗号分隔',
    `bghdkbm`     text COMMENT '变更后地块编码，多个地块逗号分隔',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='登记申请表';

-- 3.登记流程记录表
CREATE TABLE `tbl_djlcjl`
(
    `id`            bigint(20) NOT NULL COMMENT '主键',
    `djno`          varchar(22) NOT NULL COMMENT '登记流水号(主参与方编码+4位顺序码)',
    `djlx`          varchar(1)  NOT NULL COMMENT '登记类型',
    `dqzt`          varchar(1)  NOT NULL COMMENT '当前状态 1-草稿 2-待审核 3-通过 4-驳回',
    `blr_id`        varchar(64) NOT NULL COMMENT '办理人id',
    `blr_name`      varchar(64) NOT NULL COMMENT '办理人名称',
    `blr_role_id`   varchar(64) NOT NULL COMMENT '办理人角色id',
    `blr_role_name` varchar(64) NOT NULL COMMENT '办理人角色名称',
    `blryj`         varchar(255) DEFAULT NULL COMMENT '办理人意见',
    `create_time`   datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='登记流程记录表';


-- 2.登记资料附件表
CREATE TABLE `tbl_djzlfj`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `djno`        varchar(22)  NOT NULL COMMENT '登记流水号(主参与方编码+4位顺序码)',
    `djsq_id`     varchar(18)  NOT NULL COMMENT '登记申请id',

    `zlfjmc`      varchar(100) NOT NULL COMMENT '资料附件名称',
    `zlfjrq`      date         NOT NULL COMMENT '资料附件日期',
    `fj_url`      varchar(255) NOT NULL COMMENT '附件（影像文件)存url',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='登记资料附件表';


-- 3.登记流程家庭成员表
CREATE TABLE `tbl_djlc_jtcy`
(
    `id`          bigint(20) NOT NULL COMMENT '主键',
    `cyfbm`       varchar(18) NOT NULL COMMENT '参与方代码',
    `cyxm`        varchar(50) NOT NULL COMMENT '成员姓名',
    `cyxb`        varchar(1)  NOT NULL COMMENT '成员性别 1-男 2-女',
    `cyzjlx`      varchar(1)  NOT NULL COMMENT '成员证件类型',
    `cyzjhm`      varchar(20) NOT NULL COMMENT '成员证件号码',
    `yhzgx`       varchar(2)  NOT NULL COMMENT '成员与户主关系',
    `cybz`        varchar(1)   DEFAULT NULL COMMENT '成员备注',
    `sfgyr`       varchar(1)   DEFAULT NULL COMMENT '是否共有人 1-是 2-否',
    `cybzsm`      varchar(254) DEFAULT NULL COMMENT '成员备注说明',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='登记流程家庭成员表';


-- ############# 字典&游标表
CREATE TABLE `tbl_dict`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `category_id` bigint(20) NOT NULL COMMENT '字典类型',
    `type_id`     bigint(20) NOT NULL COMMENT '类型代码',
    `type_name`   varchar(50) NOT NULL COMMENT '类型名称',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_dict_type_lxdm` (`category_id`, `type_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='字典表';

CREATE TABLE `tbl_dict_category`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `category_name` varchar(50) NOT NULL COMMENT '类型名称',
    `create_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='字典类型表';


# -- 1.证件类型表
#
CREATE TABLE `tbl_zjlx`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='证件类型表';
#
# -- 1.登记类型表
#
CREATE TABLE `tbl_djlx`
    #
(
    7
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='登记类型表';
#
# -- 2.承包方类型表
#
CREATE TABLE `tbl_cbflx`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='承包方类型表';
#
# -- 3.承包与流转方式类型表
#
CREATE TABLE `tbl_cblzfslx`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='承包与流转方式类型表';
#
# -- 4.土地用途类型表
#
CREATE TABLE `tbl_tdytlx`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='土地用途类型表';
#
# -- 4.土地利用类型表
#
CREATE TABLE `tbl_tdlylx`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='土地利用类型表';
#
# -- 4.地块类别表
#
CREATE TABLE `tbl_dklb`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='地块类别表';
#
# -- 5.与户主关系类型表
#
CREATE TABLE `tbl_yhzgxlx`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='与户主关系类型表';
#
# -- 6.家庭成员备注类型表
#
CREATE TABLE `tbl_cybzlx`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `lxdm` varchar
(
    20
) NOT NULL COMMENT '类型代码',
    # `lxmc` varchar
(
    50
) NOT NULL COMMENT '类型名称',
    # PRIMARY KEY
(
    `id`
) USING BTREE,
    # UNIQUE KEY `uk_lxdm`
(
    `lxdm`
)
  USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='家庭成员备注类型表';

-- 7.游标表
CREATE TABLE `tbl_cursor`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `category_id` bigint(20) NOT NULL COMMENT '游标类型表',
    `fbfbm`       varchar(14) NOT NULL COMMENT '发包方代码',
    `cursor`      varchar(20) NOT NULL COMMENT '游标（顺序码最大值）',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    UNIQUE KEY `uk_category_id_fbfbm_cursor` (`category_id`, `fbfbm`, `cursor`) USING BTREE,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='游标表';
CREATE TABLE `tbl_cursor_category`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `category_name` varchar(50) NOT NULL COMMENT '游标类型名称',
    `create_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='游标类型表';

# -- 7.承包地块游标信息表
#
CREATE TABLE `tbl_cbdkxx_cursor`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `fbfbm` varchar
(
    14
) NOT NULL COMMENT '发包方代码',
    # `cbdkxx_cursor` varchar
(
    5
) NOT NULL COMMENT '承包地块信息游标（5位系列顺序码）',
    # `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    # `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    # PRIMARY KEY
(
    `id`
) USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='承包地块游标信息表';

-- 8.承包方游标信息表
#
CREATE TABLE `tbl_cbf_cursor`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `fbfbm` varchar
(
    14
) NOT NULL COMMENT '发包方代码',
    # `cbf_cursor` varchar
(
    4
) NOT NULL COMMENT '承包方游标(4位系列顺序码)',
    # `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    # `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    # PRIMARY KEY
(
    `id`
) USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='承包方游标信息表';

-- 8.流转合同游标信息表
#
CREATE TABLE `tbl_lzht_cursor`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `fbfbm` varchar
(
    14
) NOT NULL COMMENT '发包方代码',
    # `lzht_cursor` varchar
(
    4
) NOT NULL COMMENT '流转合同游标(4位系列顺序码)',
    # `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    # `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    # PRIMARY KEY
(
    `id`
) USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='流转合同游标信息表';

-- 8.流转经营权证游标信息表
CREATE TABLE `tbl_lzjyqz_cursor`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `srfbm`         varchar(18) NOT NULL COMMENT '受让方代码',
    `lzjyqz_cursor` varchar(4)  NOT NULL COMMENT '流转经营权证游标(5位系列顺序码)',
    `create_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流转经营权证游标信息表';

# -- 8.受让方游标信息表        用经营主体
#
CREATE TABLE `tbl_srf_cursor`
    #
(
    # `id` bigint
(
    20
) NOT NULL AUTO_INCREMENT COMMENT '主键',
    # `fbfbm` varchar
(
    14
) NOT NULL COMMENT '发包方代码',
    # `srf_cursor` varchar
(
    4
) NOT NULL COMMENT '受让方游标(4位系列顺序码)',
    # `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    # `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    # PRIMARY KEY
(
    `id`
) USING BTREE
    # ) ENGINE = InnoDB
    # DEFAULT CHARSET = utf8mb4
    # ROW_FORMAT = DYNAMIC COMMENT ='受让方游标信息表';

-- 8.登记流水号游标信息表
CREATE TABLE `tbl_djno_cursor`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cyfbm`       varchar(18) NOT NULL COMMENT '主参与方代码',
    `djno_cursor` varchar(4)  NOT NULL COMMENT '登记流水号游标(4位系列顺序码)',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='登记流水号游标信息表';


-- ############# 土地流转

-- 1.流转合同表
CREATE TABLE `tbl_lzht`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbhtbm`      varchar(19)    NOT NULL COMMENT '承包合同代码',
    `lzhtbm`      varchar(18)    NOT NULL COMMENT '流转合同代码',
    `cbfbm`       varchar(18)    NOT NULL COMMENT '承包方代码',
    `srfbm`       varchar(18)    NOT NULL COMMENT '受让方代码',
    `lzfs`        varchar(3)     NOT NULL COMMENT '流转方式',
    `lzqx`        varchar(10)    NOT NULL COMMENT '流转期限',
    `lzqxksrq`    date           NOT NULL COMMENT '流转期限开始日期',
    `lzqxjsrq`    date           NOT NULL COMMENT '流转期限结束日期',
    `lzmj`        decimal(16, 2) NOT NULL COMMENT '流转面积：单位m2',
    `lzdks`       int(11) NOT NULL COMMENT '流转地块数',
    `lzqtdyt`     varchar(1)     DEFAULT NULL COMMENT '流转前土地用途',
    `lzhtdyt`     varchar(1)     DEFAULT NULL COMMENT '流转后土地用途',
    `lzjgsm`      varchar(100)   NOT NULL COMMENT '流转费用说明',
    `htqdrq`      date           NOT NULL COMMENT '合同签订日期',
    `lzmjm`       decimal(16, 2) DEFAULT NULL COMMENT '流转面积：单位亩',
    `create_time` datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_lzhtbm` (`lzhtbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流转合同表';

-- 2.流转经营权证登记簿
CREATE TABLE `tbl_lzjyqzdjb`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `lzjyqzdjbbm` varchar(19)  NOT NULL COMMENT '流转经营权证登记簿编码',
    `lzjyqz_id`   bigint(20) NOT NULL COMMENT '流转经营权证id',
    `cbfbm`       varchar(18)  NOT NULL COMMENT '承包方代码',
    `srfbm`       varchar(18)  NOT NULL COMMENT '受让方代码',
    `lzfs`        varchar(3)   NOT NULL COMMENT '流转方式',
    `lzqx`        varchar(30)  NOT NULL COMMENT '承包期限',
    `lzqxksrq`    date         NOT NULL COMMENT '承包期限起',
    `lzqxjsrq`    date         NOT NULL COMMENT '承包期限止',
    `dksyt`       varchar(254) DEFAULT NULL COMMENT '地块示意图',
    `cbjyqzlsh`   varchar(254) NOT NULL COMMENT '承包经营权证流水号',
    `djbfj`       varchar(254) DEFAULT NULL COMMENT '登记簿附记',
    `dbr`         varchar(50)  NOT NULL COMMENT '登簿人',
    `djsj`        date         NOT NULL COMMENT '登记时间',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_lzjyqzdjbbm` (`lzjyqzdjbbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流转经营权证登记簿';

-- 3.流转经营权证表
CREATE TABLE `tbl_lzjyqz`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `lzjyqzbm`    varchar(19) NOT NULL COMMENT '流转经营权证代码',
    `fzjg`        varchar(50) NOT NULL COMMENT '发证机关',
    `fzrq`        date        NOT NULL COMMENT '发证日期',
    `qzsflq`      varchar(1)  NOT NULL COMMENT '权证是否领取 1-是 2-否',
    `qzlqrq`      date        DEFAULT NULL COMMENT '权证领取日期',
    `qzlqrxm`     varchar(50) DEFAULT NULL COMMENT '权证领取人姓名',
    `qzlqrzjlx`   varchar(1)  DEFAULT NULL COMMENT '权证领取人证件类型',
    `qzlqrzjhm`   varchar(20) DEFAULT NULL COMMENT '权证领取人证件号码',
    `create_time` datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime    DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_lzjyqzbm` (`lzjyqzbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流转经营权证表';

-- 4.流转经营权证补发表
CREATE TABLE `tbl_lzjyqz_qzbf`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `lzjyqzbm`    varchar(19)  NOT NULL COMMENT '流转经营权代码',
    `qzbfyy`      varchar(200) NOT NULL COMMENT '权证补发原因',
    `bfrq`        date         NOT NULL COMMENT '补发日期',
    `qzbflqrq`    date         NOT NULL COMMENT '权证补发领取日期',
    `qzbflqrxm`   varchar(50)  NOT NULL COMMENT '权证补发领取人姓名',
    `bflqrzjlx`   varchar(1)   NOT NULL COMMENT '权证补发领取人证件类型',
    `bflqrzjhm`   varchar(20)  NOT NULL COMMENT '权证补发领取人证件号码',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流转经营权证补发表';

-- 5.流转经营权证换发表
CREATE TABLE `tbl_lzjyqz_qzhf`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `lzjyqzbm`    varchar(19)  NOT NULL COMMENT '流转经营权证代码',
    `qzhfyy`      varchar(200) NOT NULL COMMENT '权证换发原因',
    `hfrq`        date         NOT NULL COMMENT '换发日期',
    `qzhflqrq`    date         NOT NULL COMMENT '权证换发领取日期',
    `qzhflqrxm`   varchar(50)  NOT NULL COMMENT '权证换发领取人姓名',
    `hflqrzjlx`   varchar(1)   NOT NULL COMMENT '权证换发领取人证件类型',
    `hflqrzjhm`   varchar(20)  NOT NULL COMMENT '权证换发领取人证件号码',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流转经营权证换发表';

-- 6.流转经营权证注销表
CREATE TABLE `tbl_lzjyqz_qzzx`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `lzjyqzbm`    varchar(19)  NOT NULL COMMENT '流转经营权证代码',
    `zxyy`        varchar(200) NOT NULL COMMENT '注销原因',
    `zxrq`        date         NOT NULL COMMENT '注销日期',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_lzjyqzbm` (`lzjyqzbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流转经营权证注销表';


-- 7.受让方表
CREATE TABLE `tbl_srf`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `srfbm`       varchar(18) NOT NULL COMMENT '受让方代码',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_cbfbm` (`srfbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='受让方表';





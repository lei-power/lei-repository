-- v1.10
CREATE TABLE `tbl_cbf`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(18)  NOT NULL COMMENT '承包方代码',
    `cbflx`         varchar(1)   NOT NULL COMMENT '承包方类型',
    `cbfmc`         varchar(50)  NOT NULL COMMENT '承包方代表名称',
    `cbfzjlx`       varchar(1)   NOT NULL COMMENT '承包方证件类型',
    `cbfzjhm`       varchar(20)  NOT NULL COMMENT '承包方证件号码',
    `province_id`   varchar(64)  DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64)  DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64)  DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64)  DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64)  DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64)  DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64)  DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64)  DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64)  DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64)  DEFAULT NULL COMMENT '村名称',
    `cbfdz`         varchar(255) NOT NULL COMMENT '承包方地址',
    `yzbm`          varchar(6)   NOT NULL COMMENT '邮政编码',
    `lxdh`          varchar(20)  DEFAULT NULL COMMENT '联系电话',
    `cbfcysl`       int(11) NOT NULL DEFAULT '1' COMMENT '承包方成员数量',
    `cbfdcrq`       date         NOT NULL COMMENT '承包方调查日期',
    `cbfdcy`        varchar(50)  NOT NULL COMMENT '承包方调查员',
    `cbfdcjs`       varchar(254) DEFAULT NULL COMMENT '承包方调查记事',
    `gsjs`          varchar(254) DEFAULT NULL COMMENT '公示记事',
    `gsjsr`         varchar(50)  NOT NULL COMMENT '公示记事人',
    `gsshrq`        date         NOT NULL COMMENT '公示审核日期',
    `gsshr`         varchar(50)  NOT NULL COMMENT '公示审核人',
    `create_by`     varchar(64)  DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64)  DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64)  DEFAULT NULL COMMENT '删除人',
    `cancel_flag`   tinyint(1) NOT NULL DEFAULT '0' COMMENT '承包状态 1-已注销 0-正常',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_time`   datetime     DEFAULT null COMMENT '创建时间',
    `update_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime     DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 158761
  DEFAULT CHARSET = utf8mb4 COMMENT ='承包方表';


CREATE TABLE `tbl_fbf`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `fbfbm`         varchar(14)  NOT NULL COMMENT '发包方代码',
    `fbfmc`         varchar(50)  NOT NULL COMMENT '发包方名称',
    `fbffzrxm`      varchar(50)  NOT NULL COMMENT '发包方负责人姓名',
    `fzrzjlx`       varchar(1)   NOT NULL COMMENT '负责人证件类型',
    `fzrzjhm`       varchar(30)  NOT NULL COMMENT '负责人证件号码',
    `lxdh`          varchar(15)  DEFAULT NULL COMMENT '联系电话',
    `province_id`   varchar(64)  DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64)  DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64)  DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64)  DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64)  DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64)  DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64)  DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64)  DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64)  DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64)  DEFAULT NULL COMMENT '村名称',
    `fbfdz`         varchar(254) NOT NULL COMMENT '发包方地址',
    `yzbm`          varchar(6)   NOT NULL COMMENT '邮政编码',
    `fbfdcy`        varchar(254) NOT NULL COMMENT '发包方调查员',
    `fbfdcrq`       date         NOT NULL COMMENT '发包方调查日期',
    `fbfdcjs`       varchar(254) DEFAULT NULL COMMENT '发包方调查记事',
    `create_by`     varchar(64)  DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64)  DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64)  DEFAULT NULL COMMENT '删除人',
    `delete_time`   datetime     DEFAULT NULL COMMENT '删除时间',
    `create_time`   datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2537
  DEFAULT CHARSET = utf8mb4 COMMENT ='发包方表';


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
    `province_id`   varchar(64)    DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64)    DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64)    DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64)    DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64)    DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64)    DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64)    DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64)    DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64)    DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64)    DEFAULT NULL COMMENT '村名称',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64)    DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64)    DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64)    DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime       DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime       DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY             `idx_dkbm` (`dkbm`) USING BTREE,
    KEY             `idx_cbfbm` (`cbfbm`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1019099
  DEFAULT CHARSET = utf8mb4 COMMENT ='承包地块信息表';


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
    `del_flag`    tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`   varchar(64)  DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64)  DEFAULT NULL COMMENT '更新人',
    `delete_by`   varchar(64)  DEFAULT NULL COMMENT '删除人',
    `create_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    `delete_time` datetime     DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_cyzj` (`cyzjlx`, `cyzjhm`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 223795
  DEFAULT CHARSET = utf8mb4 COMMENT ='家庭成员表';



-- v1.11


-- 文件访问表
CREATE TABLE `tbl_file_access`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `file_name`          varchar(255) NOT NULL COMMENT '文件名称--自动生成的名称，不带后缀',
    `file_original_name` varchar(255) NOT NULL COMMENT '文件名称--原始名称，不带后缀',
    `internet_url`       text         NOT NULL COMMENT '文件地址-域名 + 路径 + 名称 + 后缀',
    `file_size`          varchar(64) DEFAULT NULL COMMENT '文件大小',
    `file_type`          tinyint(1) NOT NULL COMMENT '文件类型 1：图片  2：视频  3：音频  4 ：文档  0：其他',
    `suffix`             varchar(64) DEFAULT NULL COMMENT '后缀名-名称后缀 比如：jpg、mp4',
    `create_mode`        tinyint(1) NOT NULL COMMENT '创建方式 1：web,2:app',
    `upload_environment` tinyint(1) NOT NULL COMMENT '上传环境  0：上传本地服务器  1：上传阿里云',
    `del_flag`           tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`          varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`          varchar(64) DEFAULT NULL COMMENT '更新人',
    `create_time`        datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime    DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='文件访问表';



-- 登记业务

-- 承包合同表
CREATE TABLE `tbl_cbht`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbhtbm`        varchar(19)    NOT NULL COMMENT '承包合同代码',
    `ycbhtbm`       varchar(19)    DEFAULT NULL COMMENT '原承包合同代码',
    `fbfbm`         varchar(14)    NOT NULL COMMENT '发包方代码',
    `cbfbm`         varchar(18)    NOT NULL COMMENT '承包方代码',
    `cbfs`          varchar(3)     NOT NULL COMMENT '承包方式',
    `cbqxq`         date           NOT NULL COMMENT '承包期限起',
    `cbqxz`         date           NOT NULL COMMENT '承包期限止',
    `htzmj`         decimal(16, 2) NOT NULL COMMENT '确权合同总面积，单位：m2',
    `cbdkzs`        int(11) NOT NULL COMMENT '承包地块总数',
    `qdsj`          date           NOT NULL COMMENT '签订时间',
    `htzmjm`        decimal(16, 2) DEFAULT NULL COMMENT '确权合同总面积，单位：亩',
    `yhtzmj`        decimal(16, 2) DEFAULT NULL COMMENT '原合同总面积,单位：m2',
    `yhtzmjm`       decimal(16, 2) DEFAULT NULL COMMENT '原合同总面积,单位：亩',

    `img_ids`       text           default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text           default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `register_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否生成登记簿 0 否  1是',

    `province_id`   varchar(64)    DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64)    DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64)    DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64)    DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64)    DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64)    DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64)    DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64)    DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64)    DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64)    DEFAULT NULL COMMENT '村名称',
    `cancel_flag`   tinyint(1) NOT NULL DEFAULT '0' COMMENT '承包状态 1-已注销 0-正常',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64)    DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64)    DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64)    DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime       DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime       DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY             `idx_cbhtbm` (`cbhtbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包合同表';


-- 流程表
CREATE TABLE `tbl_apply_flow`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `relation_register_id` bigint(20) NOT NULL COMMENT '关联登记表id（对应登记表id）',
    `relation_type`        varchar(2) NOT NULL COMMENT '关联类型 1：初始登记 2：互换登记  3：转让登记  4：征战用登记  5：分户登记  6：合户登记  7：变更户主登记  8：其他方式登记  9：注销登记',
    `cbfbm`                text       NOT NULL COMMENT '承包方编码，多个使用英文逗号分隔；转让、互换登记存储两个承包方编码，其他登记存储一个承包方编码',

    `process_status`       varchar(1) NOT NULL COMMENT '审核流程状态 1：草稿  2：待审核 3:已通过 4：被驳回 当前表记录只存储最新记录',

    `apply_user_id`        bigint(20) NOT NULL COMMENT '申请人id（登陆人id）',
    `apply_user_full_name` varchar(64)  default NULL COMMENT '申请人姓名',

    `audit_user_id`        bigint(20) NOT NULL COMMENT '审核人id（登陆人id）--系统审核id为0',
    `audit_user_full_name` varchar(64)  default NULL COMMENT '审核员姓名--系统审核名称为：系统',
    `audit_remark`         varchar(255) default NULL COMMENT '审核人意见',

    `apply_time`           datetime     DEFAULT NULL COMMENT '申请时间（申请人提交时间）',
    `audit_time`           datetime     DEFAULT NULL COMMENT '审核时间',

    `province_id`          varchar(64)  DEFAULT NULL COMMENT '省id',
    `city_id`              varchar(64)  DEFAULT NULL COMMENT '市id',
    `county_id`            varchar(64)  DEFAULT NULL COMMENT '区id',
    `town_id`              varchar(64)  DEFAULT NULL COMMENT '镇id',
    `village_id`           varchar(64)  DEFAULT NULL COMMENT '村id',
    `province_name`        varchar(64)  DEFAULT NULL COMMENT '省名称',
    `city_name`            varchar(64)  DEFAULT NULL COMMENT '市名称',
    `county_name`          varchar(64)  DEFAULT NULL COMMENT '区名称',
    `town_name`            varchar(64)  DEFAULT NULL COMMENT '镇名称',
    `village_name`         varchar(64)  DEFAULT NULL COMMENT '村名称',
    `del_flag`             tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`            varchar(64)  DEFAULT NULL COMMENT '创建人',
    `update_by`            varchar(64)  DEFAULT NULL COMMENT '更新人',
    `delete_by`            varchar(64)  DEFAULT NULL COMMENT '删除人',
    `create_time`          datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`          datetime     DEFAULT NULL COMMENT '更新时间',
    `delete_time`          datetime     DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流程表，只记录不同登记的最新一条记录';

-- 权属流程日志记录表
CREATE TABLE `tbl_apply_flow_operator_log`
(
    `id`                      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `apply_flow_id`           bigint(20) NOT NULL COMMENT '权属流程id',
    `relation_register_id`    bigint(20) NOT NULL COMMENT '关联登记表id（对应登记表id）',
    `relation_type`           varchar(2) NOT NULL COMMENT '关联类型 1：初始登记 2：互换登记  3：转让登记  4：征战用登记  5：分户登记  6：合户登记  7：变更户主登记  8：其他方式登记  9：注销登记',


    `process_action_type`     varchar(1) NOT NULL COMMENT '流程行为历史类型-办理历史的过程动作 1：保存草稿  2：提交申请  3：撤回 4：通过  5：驳回',


    `operator_user_id`        bigint(20) NOT NULL COMMENT '操作人id（登陆人id）',
    `operator_full_user_name` varchar(64) default NULL COMMENT '操作员姓名',
    `operator_time`           datetime    DEFAULT NULL COMMENT '操作时间',

    `del_flag`                tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`               varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`               varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`               varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`             datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`             datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`             datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='流程日志操作记录表--每个操作生成一条记录';


-- 承包方锁表-每次登记时，将承包方编码存储进来
CREATE TABLE `tbl_apply_cbfbm_lock_record`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `relation_type` varchar(2)  NOT NULL COMMENT '关联类型 1：初始登记 2：互换登记  3：转让登记  4：征战用登记  5：分户登记  6：合户登记  7：变更户主登记  8：其他方式登记  9：注销登记',
    `cbfbm`         varchar(18) NOT NULL COMMENT '承包方编码',
    `create_time`   datetime DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包方编码锁表-每次登记时，将承包方编码存储进来';

-- 7.承包经营权证登记簿
CREATE TABLE `tbl_cbjyqzdjb`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbjyqzbm`      varchar(19)  NOT NULL COMMENT '承包经营权证（登记簿）编码',
    `fbfbm`         varchar(14)  NOT NULL COMMENT '发包方代码',
    `cbfbm`         varchar(18)  NOT NULL COMMENT '承包方代码',
    `cbfs`          varchar(3)   NOT NULL COMMENT '承包方式',
    `cbqx`          varchar(30)  NOT NULL COMMENT '承包期限',
    `cbqxq`         date         NOT NULL COMMENT '承包期限起',
    `cbqxz`         date         NOT NULL COMMENT '承包期限止',
    `dksyt`         text         DEFAULT NULL COMMENT '地块示意图',
    `cbjyqzlsh`     varchar(254) NOT NULL COMMENT '承包经营权证流水号',
    `djbfj`         varchar(254) DEFAULT NULL COMMENT '登记簿附记',
    `ycbjyqzbh`     varchar(100) DEFAULT NULL COMMENT '原承包经营权证编号',
    `dbr`           varchar(50)  NOT NULL COMMENT '登簿人',
    `djsj`          date         NOT NULL COMMENT '登记日期',

    `province_id`   varchar(64)  DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64)  DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64)  DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64)  DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64)  DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64)  DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64)  DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64)  DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64)  DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64)  DEFAULT NULL COMMENT '村名称',
    `cancel_flag`   tinyint(1) NOT NULL DEFAULT '0' COMMENT '承包状态 1-已注销 0-正常',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64)  DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64)  DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64)  DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime     DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY             `idx_cbjyqzbm` (`cbjyqzbm`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包经营权证登记簿';


-- -- 7.土地承包游标表
CREATE TABLE `tbl_cursor`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cursor_type`  varchar(10) DEFAULT NULL COMMENT '游标类型',
    `prefix_num`   varchar(64) DEFAULT NULL COMMENT '前缀编码，省市区镇村组编码按需拼接',
    `cursor_value` varchar(64) DEFAULT NULL COMMENT '当前游标值',


    `del_flag`     tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`    varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`    varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`    varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`  datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`  datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`  datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='土地承包游标表';

-- 8.承包经营权证表
CREATE TABLE `tbl_cbjyqz`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbjyqzbm`      varchar(19) NOT NULL COMMENT '承包经营权证（登记簿）代码',
    `fzjg`          varchar(50) NOT NULL COMMENT '发证机关',
    `fzrq`          date        NOT NULL COMMENT '发证日期',
    `qzsflq`        varchar(1)  NOT NULL COMMENT '权证是否领取 1-是 2-否',
    `qzlqrq`        date        DEFAULT NULL COMMENT '权证领取日期',
    `qzlqrxm`       varchar(50) DEFAULT NULL COMMENT '权证领取人姓名',
    `qzlqrzjlx`     varchar(1)  DEFAULT NULL COMMENT '权证领取人证件类型',
    `qzlqrzjhm`     varchar(20) DEFAULT NULL COMMENT '权证领取人证件号码',

    `img_ids`       text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',


    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',
    `cancel_flag`   tinyint(1) NOT NULL DEFAULT '0' COMMENT '承包状态 1-已注销 0-正常',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',

    PRIMARY KEY (`id`) USING BTREE,
    KEY             `idx_cbjyqzbm` (`cbjyqzbm`) USING BTREE
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
    `img_ids`     text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`    text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `del_flag`    tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`   varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`   varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time` datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time` datetime    DEFAULT NULL COMMENT '删除时间',
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
    `img_ids`     text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`    text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `del_flag`    tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`   varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`   varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time` datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time` datetime    DEFAULT NULL COMMENT '删除时间',
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
    `del_flag`    tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`   varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`   varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time` datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time` datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY           `idx_cbjyqzbm` (`cbjyqzbm`) USING BTREE
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
    `fj`          varchar(255) NOT NULL COMMENT '附件',
    `img_ids`     text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`    text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `del_flag`    tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`   varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`   varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time` datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time` datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='权属来源资料附件表--写入登记簿和权证登记簿的时候插入附件';



-- 10 张登记表
--  初始登记表
CREATE TABLE `tbl_apply_initial`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(18) NOT NULL COMMENT '承包方代码',
    `img_ids`       text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date` date        DEFAULT NULL COMMENT '登记日期',

    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',

    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='初始登记表';

--  其他登记表
CREATE TABLE `tbl_apply_other`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(18) NOT NULL COMMENT '承包方代码',
    `img_ids`       text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date` date        DEFAULT NULL COMMENT '登记日期',

    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',

    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='其他登记表';

--  互换登记表
CREATE TABLE `tbl_apply_exchange`
(
    `id`                         bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `first_cbfbm`                varchar(19)    NOT NULL COMMENT '甲方承包方编码',
    `first_all_dkbm`             text           NOT NULL COMMENT '甲方总地块编码，多个逗号分隔',
    `first_exchange_dkbm`        text           NOT NULL COMMENT '甲方互换地块编码，多个逗号分隔',
    `first_exchange_land_count`  int(11) NOT NULL COMMENT '甲方互换地块数',
    `first_exchange_land_acre`   decimal(16, 2) NOT NULL COMMENT '甲方互换地块面积和 单位：亩',

    `first_img_ids`              text        default NULL COMMENT '甲方图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `first_file_ids`             text        default NULL COMMENT '甲方附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `second_cbfbm`               varchar(19)    NOT NULL COMMENT '乙方承包方编码',
    `second_all_dkbm`            text           NOT NULL COMMENT '乙方总地块编码，多个逗号分隔',
    `second_exchange_dkbm`       int(11) NOT NULL COMMENT '乙方互换地块编码，多个逗号分隔',
    `second_exchange_land_count` text           NOT NULL COMMENT '乙方互换地块数',
    `second_exchange_land_acre`  decimal(16, 2) NOT NULL COMMENT '乙方互换地块面积和 单位：亩',
    `second_img_ids`             text        default NULL COMMENT '乙方图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `second_file_ids`            text        default NULL COMMENT '乙方附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `register_date`              date        DEFAULT NULL COMMENT '登记日期',

    `province_id`                varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`                    varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`                  varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`                    varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`                 varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name`              varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`                  varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`                varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`                  varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`               varchar(64) DEFAULT NULL COMMENT '村名称',

    `del_flag`                   tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                  varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`                  varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`                  varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`                datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`                datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`                datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='互换登记表';

--  转让登记表
CREATE TABLE `tbl_apply_transfer`
(
    `id`                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `first_cbfbm`               varchar(19)    NOT NULL COMMENT '甲方承包方编码',
    `first_all_dkbm`            text           NOT NULL COMMENT '甲方总地块编码，多个逗号分隔',
    `first_transfer_dkbm`       text           NOT NULL COMMENT '甲方转让地块编码，多个逗号分隔',
    `first_transfer_land_count` int(11) NOT NULL COMMENT '甲方转让地块数',
    `first_transfer_land_acre`  decimal(16, 2) NOT NULL COMMENT '甲方转让地块面积和 单位：亩',
    `first_img_ids`             text        default NULL COMMENT '甲方图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `first_file_ids`            text        default NULL COMMENT '甲方附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `second_cbfbm`              varchar(19)    NOT NULL COMMENT '乙方承包方编码',
    `second_all_dkbm`           text           NOT NULL COMMENT '乙方总地块编码，多个逗号分隔',
    `second_receive_dkbm`       int(11) NOT NULL COMMENT '乙方接收地块编码，多个逗号分隔',
    `second_receive_land_count` text           NOT NULL COMMENT '乙方接收地块数',
    `second_receive_land_acre`  decimal(16, 2) NOT NULL COMMENT '乙方接收地块面积和 单位：亩',
    `second_img_ids`            text        default NULL COMMENT '乙方图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `second_file_ids`           text        default NULL COMMENT '乙方附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date`             date        DEFAULT NULL COMMENT '登记日期',

    `province_id`               varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`                   varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`                 varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`                   varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`                varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name`             varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`                 varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`               varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`                 varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`              varchar(64) DEFAULT NULL COMMENT '村名称',

    `del_flag`                  tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                 varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`                 varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`                 varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`               datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`               datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`               datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='转让登记表';

--  征占用登记表
CREATE TABLE `tbl_apply_requisition`
(
    `id`                     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`                  varchar(19)    NOT NULL COMMENT '承包方编码',
    `all_dkbm`               text           NOT NULL COMMENT '总地块编码，多个逗号分隔',
    `requisition_dkbm`       text           NOT NULL COMMENT '征用地块编码，多个逗号分隔',
    `requisition_land_count` int(11) NOT NULL COMMENT '征用地块数',
    `requisition_land_acre`  decimal(16, 2) NOT NULL COMMENT '征用地块面积和 单位：亩',

    `img_ids`                text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`               text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `register_date`          date        DEFAULT NULL COMMENT '登记日期',

    `province_id`            varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`                varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`              varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`                varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`             varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name`          varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`              varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`            varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`              varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`           varchar(64) DEFAULT NULL COMMENT '村名称',

    `del_flag`               tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`              varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`              varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`              varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`            datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`            datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`            datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='征占用登记表';

--  注销登记表
CREATE TABLE `tbl_apply_cancel`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(19)  NOT NULL COMMENT '承包方编码',
    `cancel_type`   varchar(10)  NOT NULL COMMENT '注销类别（登记情形）',
    `cbjyqzbm`      varchar(19)  NOT NULL COMMENT '承包经营权证（登记簿）代码',
    `cbdkzs`        int(11) NOT NULL COMMENT '承包地块总数',
    `htzmjm`        decimal(16, 2) DEFAULT NULL COMMENT '确权合同总面积，单位：亩',
    `img_ids`       text           default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text           default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `cbfdz`         varchar(255) NOT NULL COMMENT '承包方地址',
    `remark`        varchar(255)   default NULL COMMENT '备注（注销原因）',
    `register_date` date           DEFAULT NULL COMMENT '登记日期',

    `province_id`   varchar(64)    DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64)    DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64)    DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64)    DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64)    DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64)    DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64)    DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64)    DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64)    DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64)    DEFAULT NULL COMMENT '村名称',

    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64)    DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64)    DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64)    DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime       DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime       DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='注销登记表';

--  变更户主登记表
CREATE TABLE `tbl_apply_change_householder`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(19) NOT NULL COMMENT '承包方编码',
    `img_ids`       text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `register_date` date        DEFAULT NULL COMMENT '登记日期',

    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',

    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='变更户主登记表';

CREATE TABLE `tbl_apply_change_householder_detal`
(
    `id`                          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `apply_change_householder_id` bigint(20) NOT NULL COMMENT '变更户主表id',
    `cbf_jtcy_id`                 bigint(20) NOT NULL COMMENT '承包方家庭成员表id',
    `cyxm`                        varchar(50) NOT NULL COMMENT '成员姓名',
    `cyxb`                        varchar(1)  NOT NULL COMMENT '成员性别 1-男 2-女',
    `cyzjlx`                      varchar(1)  NOT NULL COMMENT '成员证件类型',
    `cyzjhm`                      varchar(20) NOT NULL COMMENT '成员证件号码',
    `yhzgx`                       varchar(2)  NOT NULL COMMENT '成员与户主关系',
    `cybz`                        varchar(1)   DEFAULT NULL COMMENT '成员备注',
    `sfgyr`                       varchar(1)   DEFAULT NULL COMMENT '是否共有人 1-是 2-否',
    `cybzsm`                      varchar(254) DEFAULT NULL COMMENT '成员备注说明',
    `del_flag`                    tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                   varchar(64)  DEFAULT NULL COMMENT '创建人',
    `update_by`                   varchar(64)  DEFAULT NULL COMMENT '更新人',
    `delete_by`                   varchar(64)  DEFAULT NULL COMMENT '删除人',
    `create_time`                 datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`                 datetime     DEFAULT NULL COMMENT '更新时间',
    `delete_time`                 datetime     DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='变更户主家庭成员记录表';

-- 分户登记相关表
CREATE TABLE `tbl_apply_separation`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`                 varchar(19)    NOT NULL COMMENT '被分户承包方编码',
    `all_dkbm`              text           NOT NULL COMMENT '被分户总地块编码，多个逗号分隔',
    `separation_dkbm`       text           NOT NULL COMMENT '记录拆分的所有地块编码，多个逗号分隔',
    `separation_land_count` int(11) NOT NULL COMMENT '记录拆分的所有地块数量',
    `separation_land_acre`  decimal(16, 2) NOT NULL COMMENT '记录拆分的所有地块面积和 单位：亩',
    `img_ids`               text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`              text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',


    `register_date`         date        DEFAULT NULL COMMENT '登记日期',

    `province_id`           varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`               varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`             varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`               varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`            varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name`         varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`             varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`           varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`             varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`          varchar(64) DEFAULT NULL COMMENT '村名称',

    `del_flag`              tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`             varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`             varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`             varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`           datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`           datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`           datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='分户登记表';

CREATE TABLE `tbl_apply_separation_detail`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `apply_separation_id`   bigint(20) NOT NULL COMMENT '分户登记表id',
    `cbfmc`                 varchar(64)    NOT NULL COMMENT '承包方名称--分户后的名称',
    `separation_dkbm`       text           NOT NULL COMMENT '分户后地块编码，多个逗号分隔',
    `separation_land_count` int(11) NOT NULL COMMENT '分户后地块数量',
    `separation_land_acre`  decimal(16, 2) NOT NULL COMMENT '分户后地块面积 单位 亩',
    `img_ids`               text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`              text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `cbdkzs`                int(11) NOT NULL COMMENT '承包地块总数--可编辑修改',

    `htzmjm`                varchar(19)    NOT NULL COMMENT '确权合同总面积，单位：亩',
    `cbfdz`                 varchar(100)   NOT NULL COMMENT '承包方地址',
    `lxdh`                  varchar(20) DEFAULT NULL COMMENT '联系电话',

    `del_flag`              tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`             varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`             varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`             varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`           datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`           datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`           datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='分户登记详情表';

CREATE TABLE `tbl_apply_separation_family_record`
(
    `id`                             bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tbl_apply_separation_detail_id` bigint(20) NOT NULL COMMENT '分户登记详情id',
    `cbf_jtcy_id`                    bigint(20) NOT NULL COMMENT '承包方家庭成员表id',
    `cyxm`                           varchar(50) NOT NULL COMMENT '成员姓名',
    `cyxb`                           varchar(1)  NOT NULL COMMENT '成员性别 1-男 2-女',
    `cyzjlx`                         varchar(1)  NOT NULL COMMENT '成员证件类型',
    `cyzjhm`                         varchar(20) NOT NULL COMMENT '成员证件号码',
    `yhzgx`                          varchar(2)  NOT NULL COMMENT '成员与户主关系',
    `cybz`                           varchar(1)   DEFAULT NULL COMMENT '成员备注',
    `sfgyr`                          varchar(1)   DEFAULT NULL COMMENT '是否共有人 1-是 2-否',
    `cybzsm`                         varchar(254) DEFAULT NULL COMMENT '成员备注说明',
    `del_flag`                       tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                      varchar(64)  DEFAULT NULL COMMENT '创建人',
    `update_by`                      varchar(64)  DEFAULT NULL COMMENT '更新人',
    `delete_by`                      varchar(64)  DEFAULT NULL COMMENT '删除人',
    `create_time`                    datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`                    datetime     DEFAULT NULL COMMENT '更新时间',
    `delete_time`                    datetime     DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='分户登记家庭成员记录表';

-- 合户登记相关表

CREATE TABLE `tbl_apply_merge`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(19) NOT NULL COMMENT '承包方代码--发起合户的承包',

    `register_date` date        DEFAULT NULL COMMENT '登记日期',

    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',

    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`     varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='合户登记';

CREATE TABLE `tbl_apply_merge_detail`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `apply_merge_id` bigint(20) NOT NULL COMMENT '合户id',
    `cbfbm`          varchar(19) NOT NULL COMMENT '承包方代码',

    `img_ids`        text        default NULL COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`       text        default NULL COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',

    `merge_type`     varchar(1)  not null COMMENT '合并类型 0 ：发起方  1： 被合户方',

    `del_flag`       tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`      varchar(64) DEFAULT NULL COMMENT '创建人',
    `update_by`      varchar(64) DEFAULT NULL COMMENT '更新人',
    `delete_by`      varchar(64) DEFAULT NULL COMMENT '删除人',
    `create_time`    datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`    datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='合户详情表';


CREATE TABLE `tbl_apply_merge_family_record`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `apply_merge_detail_id` bigint(20) NOT NULL COMMENT '合户登记详情id',
    `cbf_jtcy_id`           bigint(20) NOT NULL COMMENT '承包方家庭成员表id',
    `cyxm`                  varchar(50) NOT NULL COMMENT '成员姓名',
    `cyxb`                  varchar(1)  NOT NULL COMMENT '成员性别 1-男 2-女',
    `cyzjlx`                varchar(1)  NOT NULL COMMENT '成员证件类型',
    `cyzjhm`                varchar(20) NOT NULL COMMENT '成员证件号码',
    `yhzgx`                 varchar(2)  NOT NULL COMMENT '成员与户主关系',
    `cybz`                  varchar(1)   DEFAULT NULL COMMENT '成员备注',
    `sfgyr`                 varchar(1)   DEFAULT NULL COMMENT '是否共有人 1-是 2-否',
    `cybzsm`                varchar(254) DEFAULT NULL COMMENT '成员备注说明',
    `del_flag`              tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`             varchar(64)  DEFAULT NULL COMMENT '创建人',
    `update_by`             varchar(64)  DEFAULT NULL COMMENT '更新人',
    `delete_by`             varchar(64)  DEFAULT NULL COMMENT '删除人',
    `create_time`           datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`           datetime     DEFAULT NULL COMMENT '更新时间',
    `delete_time`           datetime     DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='合户登记家庭成员记录表';



-- 6、30新增多种登记

-- 承包方信息更新登记表
CREATE TABLE `tbl_apply_contractor_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(20) NOT NULL COMMENT '承包方代码-快照字段',
    `cbfmc`         varchar(64) DEFAULT NULL COMMENT '承包方代表名称--快照字段',
    `cbfzjhm`       varchar(32) DEFAULT NULL COMMENT '承包方证件号码--快照字段',
    `new_cbfmc`     varchar(20) COMMENT '新承包方代表名称--变更后的名称',
    `new_cbfzjlx`   varchar(20) DEFAULT NULL COMMENT '新承包方证件类型--变更后的证件类型',
    `new_cbfzjhm`   varchar(32) DEFAULT NULL COMMENT '新承包方证件号码--变更后的证件号码',
    `cbflx`         varchar(20) NOT NULL COMMENT '承包方类型',
    `new_cbfdz`     varchar(100) COMMENT '承包方地址--变更后地址',
    `new_lxdh`      varchar(20) DEFAULT NULL COMMENT '联系电话--变更后的电话',
    `img_ids`       text COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date` date        DEFAULT NULL COMMENT '登记日期',
    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`     bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`     bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包方信息更新登记表';

-- 家庭成员更新登记相关表
CREATE TABLE `tbl_apply_contractor_family_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(19) NOT NULL COMMENT '承包方编码--快照字段',
    `cbfmc`         varchar(64) DEFAULT NULL COMMENT '承包方名称--快照字段',
    `cbfzjhm`       varchar(32) DEFAULT NULL COMMENT '承包方证件号码--快照字段',
    `img_ids`       text COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date` date        DEFAULT NULL COMMENT '登记日期',
    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`     bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`     bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包方家庭成员信息更新登记（家庭承包）';

CREATE TABLE `tbl_apply_contractor_family_info_record`
(
    `id`                              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `apply_contractor_family_info_id` bigint(20) NOT NULL COMMENT '承包方家庭成员信息更新登记表id',
    `cbf_jtcy_id`                     bigint(20) NOT NULL COMMENT '承包方家庭成员表id',
    `cyxm`                            varchar(50) NOT NULL COMMENT '成员姓名',
    `cyxb`                            varchar(1)  NOT NULL COMMENT '成员性别 1-男 2-女',
    `cyzjlx`                          varchar(1)  NOT NULL COMMENT '成员证件类型',
    `cyzjhm`                          varchar(20) NOT NULL COMMENT '成员证件号码',
    `yhzgx`                           varchar(2)  NOT NULL COMMENT '成员与户主关系',
    `cybz`                            varchar(1)   DEFAULT NULL COMMENT '成员备注',
    `sfgyr`                           varchar(1)   DEFAULT NULL COMMENT '是否共有人 1-是 2-否',
    `cybzsm`                          varchar(254) DEFAULT NULL COMMENT '成员备注说明',
    `action_status`                   varchar(20)  DEFAULT NULL COMMENT '操作状态：1：新增  2：编辑  3：删除',
    `del_flag`                        tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`                       bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`                       bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`                       bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`                     datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`                     datetime     DEFAULT NULL COMMENT '更新时间',
    `delete_time`                     datetime     DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='承包方家庭成员更新记录表（家庭承包）';


-- 新增地块登记相关表
CREATE TABLE `tbl_apply_add_land`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(19) NOT NULL COMMENT '承包方代码-快照字段',
    `cbfmc`         varchar(64)    DEFAULT NULL COMMENT '承包方代表名称--快照字段',
    `cbfzjhm`       varchar(32)    DEFAULT NULL COMMENT '承包方证件号码--快照字段',
    `dkbm`          varchar(32)    DEFAULT NULL COMMENT '地块编码，在通过审核后将地块编码快照进去',
    `dkmc`          varchar(64)    DEFAULT NULL COMMENT '地块名称',
    `tdlylx`        varchar(1)  NOT NULL COMMENT '土地利用类型',
    `dklb`          varchar(1)  NOT NULL COMMENT '地块类别',
    `tdyt`          varchar(1)  NOT NULL COMMENT '土地用途',
    `dldj`          varchar(1)  NOT NULL COMMENT '地力等级',
    `sfjbnt`        varchar(1)  NOT NULL COMMENT '是否基本农田',
    `zjrxm`         varchar(32)    DEFAULT NULL COMMENT '指界人姓名',
    `scmj`          decimal(16, 2) DEFAULT NULL COMMENT '实测面积（平方米）',
    `scmjm`         decimal(16, 2) DEFAULT NULL COMMENT '实测面积（亩）',
    `dkdz`          varchar(64)    DEFAULT NULL COMMENT '地块东至',
    `dkxz`          varchar(64)    DEFAULT NULL COMMENT '地块西至',
    `dknz`          varchar(64)    DEFAULT NULL COMMENT '地块南至',
    `dkbz`          varchar(64)    DEFAULT NULL COMMENT '地块北至',
    `dkbzxx`        varchar(100)   DEFAULT NULL COMMENT '地块备注信息',
    `kjzb`          text COMMENT '空间坐标--审核通过后，代码自动赋值',
    `path`          text COMMENT '地块轮廓（wgs84坐标系）',
    `img_ids`       text COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date` date           DEFAULT NULL COMMENT '登记日期',
    `province_id`   varchar(64)    DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64)    DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64)    DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64)    DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64)    DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64)    DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64)    DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64)    DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64)    DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64)    DEFAULT NULL COMMENT '村名称',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`     bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`     bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime       DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime       DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='新增地块登记表';

-- 补录地块登记表
CREATE TABLE `tbl_apply_supplement_land`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(19) NOT NULL COMMENT '承包方代码-快照字段',
    `cbfmc`         varchar(64) DEFAULT NULL COMMENT '承包方代表名称--快照字段',
    `cbfzjhm`       varchar(64) DEFAULT NULL COMMENT '承包方证件号码--快照字段',
    `img_ids`       text COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `dkbm`          text        DEFAULT NULL COMMENT '补录的地块编码，多个英文逗号分隔',
    `register_date` date        DEFAULT NULL COMMENT '登记日期',
    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`     bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`     bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='补录地块登记表';


-- 分割地块登记相关表
CREATE TABLE `tbl_apply_split_land`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(19) NOT NULL COMMENT '承包方代码-快照字段',
    `cbfmc`         varchar(64) DEFAULT NULL COMMENT '承包方代表名称--快照字段',
    `cbfzjhm`       varchar(64) DEFAULT NULL COMMENT '承包方证件号码--快照字段',

    `dkbm`          varchar(64) DEFAULT NULL COMMENT '被分割的地块编码-快照',
    `path`          text        DEFAULT NULL COMMENT '被分割地块轮廓---快照',

    `img_ids`       text COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date` date        DEFAULT NULL COMMENT '登记日期',
    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`     bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`     bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='分割地块登记表';

CREATE TABLE `tbl_apply_split_land_detail`
(
    `id`                  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `apply_split_land_id` bigint(20) NOT NULL COMMENT '分割地块登记表id',
    #                     `dkbm` varchar(64) DEFAULT NULL COMMENT '分割地块编码，审核通过后，将地块编码快照进来',
    `dkmc`                varchar(64)    DEFAULT NULL COMMENT '地块名称',
    `path`                text           DEFAULT NULL COMMENT '分割的地块轮廓（wgs84坐标系）',
    `tdlylx`              varchar(1) NOT NULL COMMENT '土地利用类型',
    `dklb`                varchar(1) NOT NULL COMMENT '地块类别',
    `tdyt`                varchar(1) NOT NULL COMMENT '土地用途',
    `dldj`                varchar(1) NOT NULL COMMENT '地力等级',
    `sfjbnt`              varchar(1) NOT NULL COMMENT '是否基本农田',
    `zjrxm`               varchar(32)    DEFAULT NULL COMMENT '指界人姓名',
    `scmj`                decimal(16, 2) DEFAULT NULL COMMENT '实测面积（平方米）',
    `scmjm`               decimal(16, 2) DEFAULT NULL COMMENT '实测面积（亩）',
    `dkdz`                varchar(32)    DEFAULT NULL COMMENT '地块东至',
    `dkxz`                varchar(32)    DEFAULT NULL COMMENT '地块西至',
    `dknz`                varchar(32)    DEFAULT NULL COMMENT '地块南至',
    `dkbz`                varchar(32)    DEFAULT NULL COMMENT '地块北至',
    `dkbzxx`              varchar(32)    DEFAULT NULL COMMENT '地块备注信息',
    `kjzb`                text COMMENT '空间坐标--审核通过后，代码自动赋值',
    `del_flag`            tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`           bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`           bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`           bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`         datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`         datetime       DEFAULT NULL COMMENT '更新时间',
    `delete_time`         datetime       DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='分割地块详情表';

-- 更新地块轮廓登记相关表
CREATE TABLE `tbl_apply_land_path`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`         varchar(19) NOT NULL COMMENT '承包方代码-快照字段',
    `cbfmc`         varchar(64) DEFAULT NULL COMMENT '承包方代表名称--快照字段',
    `cbfzjhm`       varchar(64) DEFAULT NULL COMMENT '承包方证件号码--快照字段',

    `dkbm`          varchar(64) DEFAULT NULL COMMENT '被更新的地块编码--快照',
    `path`          text        DEFAULT NULL COMMENT '被更新地块轮廓---快照',

    `img_ids`       text COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`      text COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date` date        DEFAULT NULL COMMENT '登记日期',

    `province_id`   varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`       varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`     varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`       varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`    varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`     varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`   varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`     varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`  varchar(64) DEFAULT NULL COMMENT '村名称',
    `del_flag`      tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`     bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`     bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`     bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`   datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='更新地块轮廓登记表';


-- 更新地块轮廓登记详情表
CREATE TABLE `tbl_apply_land_path_detail`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `apply_land_path_id` bigint(20) NOT NULL COMMENT '更新地块轮廓登记表id',
    #                    `dkbm` varchar(64) DEFAULT NULL COMMENT '更新地块编码，审核通过后，将地块编码快照进来',
    `path`               text           DEFAULT NULL COMMENT '更新的地块轮廓（wgs84坐标系）',
    `dkmc`               varchar(64)    DEFAULT NULL COMMENT '地块名称',
    `tdlylx`             varchar(1) NOT NULL COMMENT '土地利用类型',
    `dklb`               varchar(1) NOT NULL COMMENT '地块类别',
    `tdyt`               varchar(1) NOT NULL COMMENT '土地用途',
    `dldj`               varchar(1) NOT NULL COMMENT '地力等级',
    `sfjbnt`             varchar(1) NOT NULL COMMENT '是否基本农田',
    `zjrxm`              varchar(32)    DEFAULT NULL COMMENT '指界人姓名',
    `scmj`               decimal(16, 2) DEFAULT NULL COMMENT '实测面积（平方米）',
    `scmjm`              decimal(16, 2) DEFAULT NULL COMMENT '实测面积（亩）',
    `dkdz`               varchar(32)    DEFAULT NULL COMMENT '地块东至',
    `dkxz`               varchar(32)    DEFAULT NULL COMMENT '地块西至',
    `dknz`               varchar(32)    DEFAULT NULL COMMENT '地块南至',
    `dkbz`               varchar(32)    DEFAULT NULL COMMENT '地块北至',
    `dkbzxx`             varchar(32)    DEFAULT NULL COMMENT '地块备注信息',
    `kjzb`               text COMMENT '空间坐标--审核通过后，代码自动赋值',
    `del_flag`           tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`          bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`          bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`          bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`        datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime       DEFAULT NULL COMMENT '更新时间',
    `delete_time`        datetime       DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='更新地块轮廓登记详情表';


-- 征占用登记相关表
CREATE TABLE `tbl_apply_requisition`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cbfbm`            varchar(19) NOT NULL COMMENT '承包方代码-快照字段',
    `cbfmc`            varchar(64) DEFAULT NULL COMMENT '承包方代表名称--快照字段',
    `cbfzjhm`          varchar(64) DEFAULT NULL COMMENT '承包方证件号码--快照字段',
    #                  `requisition_land_count` int(11) NOT NULL DEFAULT '0' COMMENT '征用地块数',
    #                  `requisition_land_acre` decimal(16, 2) NOT NULL DEFAULT '0' COMMENT '征用地块面积和 单位：亩',
    `requisition_dkbm` text        DEFAULT NULL COMMENT '征占的地块编码，多个逗号分隔',
    `img_ids`          text COMMENT '图片地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `file_ids`         text COMMENT '附件地址--存储tbl_file_access表id，多个是要英文逗号分隔',
    `register_date`    date        DEFAULT NULL COMMENT '登记日期',
    `province_id`      varchar(64) DEFAULT NULL COMMENT '省id',
    `city_id`          varchar(64) DEFAULT NULL COMMENT '市id',
    `county_id`        varchar(64) DEFAULT NULL COMMENT '区id',
    `town_id`          varchar(64) DEFAULT NULL COMMENT '镇id',
    `village_id`       varchar(64) DEFAULT NULL COMMENT '村id',
    `province_name`    varchar(64) DEFAULT NULL COMMENT '省名称',
    `city_name`        varchar(64) DEFAULT NULL COMMENT '市名称',
    `county_name`      varchar(64) DEFAULT NULL COMMENT '区名称',
    `town_name`        varchar(64) DEFAULT NULL COMMENT '镇名称',
    `village_name`     varchar(64) DEFAULT NULL COMMENT '村名称',
    `del_flag`         tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1-是 0-否',
    `create_by`        bigint(20) DEFAULT NULL COMMENT '创建人',
    `update_by`        bigint(20) DEFAULT NULL COMMENT '更新人',
    `delete_by`        bigint(20) DEFAULT NULL COMMENT '删除人',
    `create_time`      datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime    DEFAULT NULL COMMENT '更新时间',
    `delete_time`      datetime    DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='征占用登记表';

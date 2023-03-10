SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`
(
    `client_id`               varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `resource_ids`            varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `client_secret`           varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `scope`                   varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `authorized_grant_types`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `authorities`             varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `access_token_validity`   int(11) NULL DEFAULT NULL,
    `refresh_token_validity`  int(11) NULL DEFAULT NULL,
    `additional_information`  varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `autoapprove`             varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_agreement
-- ----------------------------
DROP TABLE IF EXISTS `sys_agreement`;
CREATE TABLE `sys_agreement`
(
    `id`          bigint(20) NOT NULL,
    `type_flag`   tinyint(4) NULL DEFAULT NULL COMMENT '类型。1:服务条款,2隐私条款',
    `title`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `content`     mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    `create_by`   bigint(20) NULL DEFAULT NULL,
    `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `update_by`   bigint(20) NULL DEFAULT NULL,
    `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_typeflag` (`type_flag`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`
(
    `id`         int(10) NOT NULL COMMENT 'ID',
    `area_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目名',
    `parent_id`  int(10) NOT NULL COMMENT '父栏目',
    `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `area_code`  int(6) NULL DEFAULT NULL,
    `zip_code`   int(10) NULL DEFAULT NULL,
    `pinyin`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `lng`        decimal(10, 6) NULL DEFAULT NULL,
    `lat`        decimal(10, 6) NULL DEFAULT NULL,
    `level`      tinyint(1) NOT NULL,
    `position`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL,
    `sort_num`   int(10) UNSIGNED NULL DEFAULT 50 COMMENT '排序',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX        `index_parent_id` (`parent_id`) USING BTREE,
    INDEX        `index_sort_num` (`sort_num`) USING BTREE,
    INDEX        `index_pinyin` (`pinyin`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '省市行政区域表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_banner
-- ----------------------------
DROP TABLE IF EXISTS `sys_banner`;
CREATE TABLE `sys_banner`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT,
    `banner_img_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'banner图片url',
    `banner_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'banner名称',
    `banner_status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态;1-可用，0-不可用',
    `sort_num`       int(11) NULL DEFAULT NULL COMMENT '排序号,越小越靠前',
    `create_time`    datetime NULL DEFAULT NULL,
    `update_time`    datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '系统banner表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `dict_type`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
    `dict_label`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典标签',
    `dict_value`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典键值',
    `sort_num`    int(20) NULL DEFAULT 0 COMMENT '排序字段',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '字典数据表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `dict_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名称',
    `dict_type`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_dict_type` (`dict_type`) USING BTREE COMMENT '字典类型唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '字典类型表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_idgen
-- ----------------------------
DROP TABLE IF EXISTS `sys_idgen`;
CREATE TABLE `sys_idgen`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `table_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
    `start_value` bigint(20) NULL DEFAULT NULL COMMENT 'id值',
    `end_value`   bigint(20) NULL DEFAULT NULL,
    `step_num`    int(11) NOT NULL DEFAULT 10 COMMENT '步长',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_table_name` (`table_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'id生成表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_area_local
-- ----------------------------
DROP TABLE IF EXISTS `tbl_area_local`;
CREATE TABLE `tbl_area_local`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '镇id，自增',
    `parent_id`          bigint(20) NULL DEFAULT NULL COMMENT '父级id,level为4，对应的是区域id；level为5，对应的是镇id',
    `name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '镇/村名称',
    `sort_num`           int(11) NULL DEFAULT NULL COMMENT '排序字段，数字越小越靠前',
    `level`              int(11) NULL DEFAULT NULL COMMENT '等级 4：镇  5：村',
    `create_time`        datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime NULL DEFAULT NULL COMMENT '更新时间',
    `county_center_lat`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域中心点维度值',
    `county_center_lng`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域中心点经度值',
    `sh_town_center_lat` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上海镇中心点维度值',
    `sh_town_center_lng` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上海镇中心点经度值',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '地方区域表（镇村）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_area_local_copy
-- ----------------------------
DROP TABLE IF EXISTS `tbl_area_local_copy`;
CREATE TABLE `tbl_area_local_copy`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '镇id，自增',
    `parent_id`          bigint(20) NULL DEFAULT NULL COMMENT '父级id,level为4，对应的是区域id；level为5，对应的是镇id',
    `name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镇/村名称',
    `sort_num`           int(11) NULL DEFAULT NULL COMMENT '排序字段，数字越小越靠前',
    `level`              int(11) NULL DEFAULT NULL COMMENT '等级 4：镇  5：村',
    `create_time`        datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime NULL DEFAULT NULL COMMENT '更新时间',
    `county_center_lat`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域中心点维度值',
    `county_center_lng`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域中心点经度值',
    `sh_town_center_lat` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上海镇中心点维度值',
    `sh_town_center_lng` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上海镇中心点经度值',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '地方区域表（镇村）'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE `tbl_company`
(
    `id`                                  int(20) NOT NULL COMMENT '企业id，使用idgen生成',
    `operate_subject_id`                  bigint(20) NULL DEFAULT 0 COMMENT '运营商主体id默认0',
    `company_category_id`                 bigint(20) NULL DEFAULT NULL COMMENT '企业类型id',
    `company_name`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业名称',
    `company_icon`                        varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业图标url',
    `auth_type`                           tinyint(4) NULL DEFAULT 0 COMMENT '认证类型：1：自然人；法人',
    `legal_person`                        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业法人',
    `legal_person_phone`                  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业法人联系方式',
    `contact_tel`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业客服电话',
    `create_time`                         timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                         timestamp NULL DEFAULT NULL COMMENT '修改时间',
    `create_by`                           bigint(20) NULL DEFAULT NULL COMMENT '创建人',
    `update_by`                           bigint(20) NULL DEFAULT NULL COMMENT '修改人id',
    `subscription_name`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号名称',
    `subscription_qrcode`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公众号二维码图片',
    `create_mode`                         tinyint(4) NULL DEFAULT 1 COMMENT '创建方式1:web, 2:app',
    `company_category`                    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业类型，用于大数据平台经营主体展示',
    `business_category`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经营类目，用于大数据平台的经营主体展示',
    `qualification_business_img_url`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '营业执照url',
    `qualification_business_flag`         tinyint(4) NULL DEFAULT NULL COMMENT '营业执照审核标识：0-未审核，1-审核通过，2-审核不通过',
    `qualification_operate_img_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '经营许可证',
    `qualification_operate_flag`          tinyint(4) NULL DEFAULT NULL COMMENT '经营执照审核标识：0-未审核，1-审核通过，2-审核不通过',
    `qualification_product_img_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '生产许可证',
    `qualification_product_flag`          tinyint(4) NULL DEFAULT NULL COMMENT '生产执照审核标识：0-未审核，1-审核通过，2-审核不通过',
    `qualification_business_add_time`     datetime NULL DEFAULT NULL COMMENT '营业执照添加时间',
    `qualification_business_check_time`   datetime NULL DEFAULT NULL COMMENT '资质审核时间',
    `qualification_business_check_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核说明',
    `qualification_operate_add_time`      datetime NULL DEFAULT NULL COMMENT '经营许可证添加时间',
    `qualification_operate_check_time`    datetime NULL DEFAULT NULL COMMENT '经营许可证审核时间',
    `qualification_operate_check_reason`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营许可证审核说明',
    `qualification_product_add_time`      datetime NULL DEFAULT NULL COMMENT '生产许可证添加时间',
    `qualification_product_check_time`    datetime NULL DEFAULT NULL COMMENT '生产许可证审核时间',
    `qualification_product_check_reason`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营许可证审核说明',
    `supervision_flag`                    tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否被监管开关 0：否（默认）  1：是',
    `enterprise_credit_code`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业信用代码',
    `rank_type`                           tinyint(4) NULL DEFAULT 0 COMMENT '等级类型 0：普通用户  1：专业版 2：旗舰版',
    `expire_date`                         date NULL DEFAULT NULL COMMENT '过期时间',
    `company_logo_url1`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '彩色logo地址',
    `company_logo_url2`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '白色logo地址',
    `qrcode_logo_open_flag`               tinyint(4) NULL DEFAULT 1 COMMENT '溯源logo开关 0 :关  1: 开（默认1）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '企业表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_company_rank_change_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_company_rank_change_record`;
CREATE TABLE `tbl_company_rank_change_record`
(
    `id`                           bigint(20) NOT NULL COMMENT 'id主键',
    `company_id`                   bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `operate_type`                 tinyint(4) NULL DEFAULT NULL COMMENT '操作类型  0：运营平台  1：运营商   2：企业',
    `before_rank_type`             tinyint(4) NULL DEFAULT NULL COMMENT '记录上一次等级类型',
    `before_expire_date`           date NULL DEFAULT NULL COMMENT '记录上一次过期时间',
    `before_company_logo_url1`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '记录上一次白色logo地址',
    `before_company_logo_url2`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '记录上一次彩色logo地址',
    `before_qrcode_logo_open_flag` tinyint(4) NULL DEFAULT NULL COMMENT '记录上一次溯源logo开关 ',
    `after_rank_type`              tinyint(255) NULL DEFAULT NULL COMMENT '记录现在等级类型',
    `after_expire_date`            date NULL DEFAULT NULL COMMENT '记录下现在过期时间',
    `after_company_logo_url1`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '记录现在白色logo地址',
    `after_company_logo_url2`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '记录现在彩色logo地址',
    `after_qrcode_logo_open_flag`  tinyint(4) NULL DEFAULT NULL COMMENT '记录现在溯源logo开关 ',
    `operate_user_id`              bigint(20) NULL DEFAULT NULL COMMENT '操作人员id',
    `operate_user_name`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员名称',
    `create_time`                  datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '企业等级变更记录表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_company_show_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_company_show_config`;
CREATE TABLE `tbl_company_show_config`
(
    `company_id`          bigint(20) NOT NULL COMMENT '企业id',
    `company_logo_name`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业logo名称',
    `company_logo_url`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '企业logo地址',
    `company_logo_url2`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'logo图片2',
    `company_favicon_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面图标地址',
    `login_url`           varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录页地址',
    `home_url`            varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '官网路径',
    `create_time`         datetime NULL DEFAULT NULL,
    `update_time`         datetime NULL DEFAULT NULL,
    `hidden_menu_type`    int(11) NOT NULL DEFAULT 0 COMMENT '隐藏菜单值，位运算，取值为以下取值的和：1-客户，2-宅配，4-订单，8-农场秀，16-库存，32-统计，64-物联网，128-教程，256-统计概览',
    `show_menu_type`      int(11) NOT NULL DEFAULT 0 COMMENT '显示菜单值，位运算，取值为以下取值的和：1-大宗供销管理，2-遥感，'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '企业页面显示配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_file_access
-- ----------------------------
DROP TABLE IF EXISTS `tbl_file_access`;
CREATE TABLE `tbl_file_access`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `file_name`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称--自动生成的名称，带后缀',
    `file_original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称--原始名称，带后缀',
    `internet_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件地址-域名 + 路径 + 名称 + 后缀',
    `file_size`          bigint(20) NULL DEFAULT NULL COMMENT '文件大小 单位：字节',
    `file_type`          tinyint(1) NOT NULL COMMENT '文件类型 1：图片  2：视频  3：音频  4 ：文档  0：其他',
    `suffix`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后缀名-名称后缀 比如：jpg、mp4',
    `create_mode`        tinyint(1) NOT NULL COMMENT '创建方式 1：web,2:app',
    `upload_environment` tinyint(1) NOT NULL COMMENT '上传环境  0：上传本地服务器  1：上传阿里云',
    `del_flag`           tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 1-是 0-否',
    `create_time`        datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '文件访问表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_invite
-- ----------------------------
DROP TABLE IF EXISTS `tbl_invite`;
CREATE TABLE `tbl_invite`
(
    `id`             bigint(20) NOT NULL COMMENT 'id',
    `invite_no`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'uuid，随机生成串码，作为唯一标识',
    `company_id`     bigint(20) NULL DEFAULT NULL COMMENT '所属企业id',
    `invite_user_id` bigint(20) NULL DEFAULT NULL COMMENT '邀请人id',
    `expiry_time`    datetime NULL DEFAULT NULL COMMENT '过期时间',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户邀请记录表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_invite_farm_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_invite_farm_ref`;
CREATE TABLE `tbl_invite_farm_ref`
(
    `invite_id` bigint(20) NULL DEFAULT NULL COMMENT '邀请id，关联表tbl_invite表主键id',
    `farm_id`   bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户邀请与农场关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_invite_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_invite_role_ref`;
CREATE TABLE `tbl_invite_role_ref`
(
    `invite_id` bigint(20) NULL DEFAULT NULL COMMENT '邀请id，管理表tbl_invite表主键id',
    `role_id`   bigint(20) NULL DEFAULT NULL COMMENT '角色id，关联表tbl_role的主键id'
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户邀请与角色关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message`
(
    `id`                   bigint(20) NOT NULL DEFAULT 0 COMMENT '消息表主键',
    `category`             tinyint(4) NULL DEFAULT 0 COMMENT '消息分类：1：专家问答【提问端】；2：专家问答【专家端】；3 系统公告；4政府端公告；5神农资讯；6农事通知；',
    `send_user_id`         bigint(20) NULL DEFAULT 0 COMMENT '消息发送人id',
    `send_time`            datetime NULL DEFAULT NULL COMMENT '消息发送时间',
    `receive_user_id`      bigint(20) NOT NULL COMMENT '消息接收人id',
    `receive_time`         datetime NULL DEFAULT NULL COMMENT '消息接收时间',
    `summary`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '消息摘要',
    `title`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '消息标题，冗余存储',
    `img_url`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '消息图片链接URL，冗余存储',
    `read_flag`            tinyint(4) NULL DEFAULT 0 COMMENT '消息已读状态 0 未读 1 已读',
    `read_time`            datetime NULL DEFAULT NULL COMMENT '消息阅读时间',
    `ext_json`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '一种category对应一种json格式',
    `data_type`            tinyint(4) NULL DEFAULT 0 COMMENT '消息类型：1 新问题，2新回复:每种dataType对应得主键id:政府公告-notice_id...',
    `data_id`              bigint(20) NOT NULL DEFAULT 0 COMMENT '每种dataType对应得主键id:政府公告-notice_id...',
    `ji_guang_push_flag`   tinyint(4) NULL DEFAULT 0 COMMENT '是否极光推送标识位：0：不需要；1：需要',
    `ji_guang_push_status` tinyint(4) NULL DEFAULT 1 COMMENT '极光推送状态：1:成功；2：失败',
    `create_time`          datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`          datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '消息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_msg_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_msg_log`;
CREATE TABLE `tbl_msg_log`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT,
    `operate_subject_id` bigint(20) NULL DEFAULT NULL COMMENT '运营商id',
    `recive_phone`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收人手机号',
    `msg_send_time`      datetime NULL DEFAULT NULL COMMENT '短信发送时间',
    `msg_send_status`    int(11) NULL DEFAULT NULL COMMENT '1，成功，0失败',
    `msg_send_fail_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败描述',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '短信发送日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_resource
-- ----------------------------
DROP TABLE IF EXISTS `tbl_resource`;
CREATE TABLE `tbl_resource`
(
    `id`         int(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
    `name`       varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '资源名称',
    `permission` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
    `type`       int(2) NULL DEFAULT NULL COMMENT '资源类型   1:菜单    2：按钮',
    `parent_id`  int(20) NULL DEFAULT NULL COMMENT '父资源id',
    `sort_num`   int(20) NULL DEFAULT NULL COMMENT '排序',
    `level`      int(1) NULL DEFAULT NULL COMMENT '层级',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '资源表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `role_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
    `role_desc`        varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色描述',
    `role_detail`      varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色详细描述',
    `muti_choose_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否可多选：1-多选，0-单选',
    `admin_flag`       tinyint(4) NOT NULL DEFAULT 0 COMMENT '系统数据:1-系统数据，0-非系统数据',
    `sort_num`         int(11) NULL DEFAULT NULL COMMENT '排序字段，越小越靠前',
    `farm_flag`        tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否管理所有农场;1-是，0-不是',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '角色表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_role_resource_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_resource_ref`;
CREATE TABLE `tbl_role_resource_ref`
(
    `role_id`     bigint(20) NULL DEFAULT NULL COMMENT '角色id',
    `resource_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '角色资源关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_sms_vcode
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sms_vcode`;
CREATE TABLE `tbl_sms_vcode`
(
    `sms_vcode_id` bigint(20) NOT NULL AUTO_INCREMENT,
    `vcode`        varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
    `phone`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
    `send_time`    datetime                                                     NOT NULL COMMENT '验证码生成时间',
    `send_status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '验证码发送状态，0 推送成功，其他异常',
    `valid_time`   datetime NULL DEFAULT NULL COMMENT '验证时间',
    `valid_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '验证码是否被使用过：0未被使用，1已使用',
    `type`         tinyint(4) NOT NULL DEFAULT 1 COMMENT '验证码类型：1找回密码验证码 2登陆验证码',
    `create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`sms_vcode_id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '短信验证码表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`
(
    `id`                 bigint(20) NOT NULL DEFAULT 0 COMMENT '主键，采用idgen生成',
    `phone`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
    `password`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码，md5加密后的字符串',
    `enable`             tinyint(4) NULL DEFAULT 1 COMMENT '是否启用：1启用，0冻结',
    `register_time`      datetime NULL DEFAULT NULL COMMENT '注册时间',
    `weixin_token`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信tokenid,有值则表示绑定微信',
    `weixin_nickname`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信昵称',
    `nick_name`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
    `head_url`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像url',
    `demo_flag`          tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否演示账号：1-是演示账号，0-不是演示账号',
    `id_card`            varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证号',
    `create_time`        datetime NULL DEFAULT NULL,
    `update_time`        datetime NULL DEFAULT NULL,
    `edit_password_flag` tinyint(2) NULL DEFAULT 0 COMMENT '该账号是否已强制修改密码 true 是 false 否',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uqi_phone` (`phone`) USING BTREE,
    UNIQUE INDEX `uqi_weixin` (`weixin_token`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_user_company_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_company_ref`;
CREATE TABLE `tbl_user_company_ref`
(
    `user_id`           bigint(20) NULL DEFAULT NULL COMMENT '用户表',
    `company_id`        bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `company_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户在该企业中的名字',
    `active_flag`       tinyint(4) NULL DEFAULT 1 COMMENT '激活状态：1激活，0未激活',
    `own_flag`          tinyint(4) NULL DEFAULT 0 COMMENT '该企业是否是该用户所拥有（即超级管理员）：1是，0否',
    `active_time`       datetime NULL DEFAULT NULL COMMENT '激活时间',
    `create_time`       datetime NULL DEFAULT NULL,
    `update_time`       datetime NULL DEFAULT NULL,
    `choose_flag`       tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户是否选中标识：1-选中，0-未选中。',
    UNIQUE INDEX `unq_company_id_user_id` (`user_id`, `company_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户和企业关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_user_request_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_request_log`;
CREATE TABLE `tbl_user_request_log`
(
    `request_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
    `server_name`    varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `server_url`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `user_info`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `header_param`   varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `inputs`         varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `outputs`        mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
    `method`         varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `request_time`   int(11) NULL DEFAULT NULL,
    `ip_address`     varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `client`         varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `os`             varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `create_time`    datetime NULL DEFAULT NULL,
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `start_time`     datetime NULL DEFAULT NULL,
    PRIMARY KEY (`request_log_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_user_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_role_ref`;
CREATE TABLE `tbl_user_role_ref`
(
    `company_id` bigint(20) NULL DEFAULT NULL COMMENT '所属企业id',
    `user_id`    bigint(20) NULL DEFAULT NULL COMMENT '用户id',
    `role_id`    bigint(20) NULL DEFAULT NULL COMMENT '角色id',
    UNIQUE INDEX `unq_company_id_user_id_role_id` (`company_id`, `user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户角色关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_user_salt
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_salt`;
CREATE TABLE `tbl_user_salt`
(
    `user_id` bigint(20) NOT NULL,
    `salt`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_token`;
CREATE TABLE `tbl_user_token`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id`          bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
    `access_token`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问的accessToken',
    `client_type`      tinyint(4) NULL DEFAULT 1 COMMENT '客户端类型：1-webH5，2-安卓端，3-ios端',
    `token_status`     tinyint(4) NULL DEFAULT 1 COMMENT '状态;1-可用，0-不可用',
    `expire_time`      datetime NULL DEFAULT NULL COMMENT '失效时间，过期后不可使用',
    `refresh_date_str` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '刷新token日期字符串，格式：yyyy-MM-dd，如果当前刷新过了，则无需重复刷新',
    `create_time`      datetime NULL DEFAULT NULL,
    `update_time`      datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uqi_access_token` (`access_token`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20694
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '企业用户token表'
  ROW_FORMAT = DYNAMIC;

SET
FOREIGN_KEY_CHECKS = 1;


INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (1, 'tbl_user', 1, 10, 1000);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (2, 'demo', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (3, 'tbl_company', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (4, 'tbl_farm', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (5, 'tbl_inspect_report', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (6, 'tbl_invite', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (7, 'tbl_land', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (8, 'tbl_plant_plan', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (9, 'tbl_crop', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (10, 'sys_land_type', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (11, 'tbl_output_forecast', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (12, 'tbl_pick_record', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (13, 'tbl_mission', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (14, 'tbl_mission_involve', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (15, 'tbl_mission_input', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (16, 'tbl_customer', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (17, 'tbl_customer_address', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (18, 'tbl_package', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (19, 'tbl_package_group', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (20, 'tbl_customer_card', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (21, 'tbl_customer_card_record', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (22, 'tbl_delivery_plan', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (23, 'tbl_delivery_plan_goods', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (24, 'tbl_order', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (25, 'tbl_order_goods', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (26, 'tbl_farm_image', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (27, 'tbl_inspect_report_image', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (28, 'tbl_customer_package', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (30, 'tbl_agri_res', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (34, 'tbl_delivery_plan_menu', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (35, 'tbl_plant_plan_inspect_report', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (36, 'tbl_plant_plan_inspect_report_img', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (37, 'tbl_qr_code_mission', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (38, 'tbl_qr_code_module', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (39, 'tbl_qr_code', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (40, 'tbl_goods_day_num', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (41, 'tbl_order_time_set', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (42, 'tbl_consumer_amount_record', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (43, 'tbl_customer_operate_log', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (44, 'tbl_farm_income_statics', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (45, 'sys_plant_standard', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (46, 'sys_unit', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (47, 'sys_crop', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (48, 'sys_agri_category', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (49, 'sys_agreement', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (50, 'tbl_resource', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (51, 'sys_apk_address', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (52, 'sys_farmer_comment', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (53, 'sys_login_banner', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (54, 'sys_qrcode_example', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (55, 'sys_website_banner', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (56, 'tbl_goods', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (57, 'sys_demo_farm', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (58, 'sys_demo_land', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (59, 'tbl_farmshow_model_page', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (60, 'tbl_farmshow_model', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (61, 'tbl_farmshow', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (62, 'tbl_farmshow_agri', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (63, 'tbl_farmshow_goods', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (67, 'sys_crop_feedback', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (68, 'tbl_iot_farm_config', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (69, 'tbl_barcode_group', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (70, 'tbl_barcode', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (71, 'tbl_barcode_group_attr', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (72, 'tbl_farmshow_page', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (73, 'sys_crop_category', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (74, 'sys_crop_subject', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (75, 'tbl_plant_plan_agri', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (76, 'tbl_plant_plan_forestry', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (77, 'tbl_plant_plan_animal', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (78, 'tbl_plant_plan_fishery', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (79, 'tbl_plant_plan_inspect_report_agri', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (80, 'tbl_plant_plan_inspect_report_forestry', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (81, 'tbl_plant_plan_inspect_report_animal', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (82, 'tbl_plant_plan_inspect_report_fishery', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (83, 'tbl_pick_record_agri', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (84, 'tbl_pick_record_forestry', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (85, 'tbl_pick_record_animal', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (86, 'tbl_pick_record_fishery', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (87, 'tbl_qr_code_agri', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (88, 'tbl_qr_code_forestry', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (89, 'tbl_qr_code_animal', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (90, 'tbl_qr_code_fishery', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (91, 'tbl_crop_disease_pest', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (92, 'tbl_machining_process', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (93, 'tbl_machining_step_agri', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (94, 'tbl_machining_step_animal', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (95, 'tbl_machining_step_fishery', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (96, 'tbl_machining_step_forestry', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (97, 'tbl_company_rank_change_record', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (98, 'tbl_operate_rank_change_record', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (99, 'tbl_land_group', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (100, 'tbl_export_record', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (101, 'tbl_agri_res_effective', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (102, 'sys_agri_res_feedback', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (103, 'tbl_growing_storage_fishery', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (104, 'tbl_agri_res_sku', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (105, 'tbl_agri_res_sku_in_out', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (111, 'tbl_expert_type', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (112, 'tbl_question', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (113, 'tbl_question_reply', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (114, 'tbl_message', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (115, 'tbl_company_brand', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (116, 'tbl_disease_pest_report_record', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (118, 'tbl_stock', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (119, 'tbl_sell_group', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (120, 'tbl_sell_record_agri', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (121, 'tbl_sell_record_animal', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (122, 'tbl_sell_record_fishery', 1, 10, 10);
INSERT INTO `frp_user`.`sys_idgen` (`id`, `table_name`, `start_value`, `end_value`, `step_num`)
VALUES (123, 'tbl_sell_record_forestry', 1, 10, 10);


/*
 Navicat Premium Data Transfer

 Source Server         : 神农口袋—测试服F 47.97.120.110
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : 47.97.120.110:3306
 Source Schema         : frp_user

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 18/10/2022 13:40:54
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_agreement
-- ----------------------------
DROP TABLE IF EXISTS `sys_agreement`;
CREATE TABLE `sys_agreement`
(
    `id`          bigint(20) NOT NULL,
    `type_flag`   tinyint(4) NULL DEFAULT NULL COMMENT '类型。1:服务条款,2隐私条款',
    `title`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `content`     mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    `create_by`   bigint(20) NULL DEFAULT NULL,
    `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `update_by`   bigint(20) NULL DEFAULT NULL,
    `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_typeflag`(`type_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_agreement
-- ----------------------------
INSERT INTO `sys_agreement`
VALUES (1, 1, '服务条款',
        '<p style=\"white-space: normal; line-height: 1.5em;\">用户务必审慎阅读、充分理解本合约各条款内容，特别是免除或者限制责任的条款、争议解决和法律适用条款。用户承诺接受并遵守本合约的约定，且不应以未阅读本合约的内容或者未获得神农口袋对用户问询的解答等理由，主张本合约无效，或要求撤销本合约。<br/></p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>一、合约定义</strong></span></p><p style=\"white-space: normal;\">1. 本网站（本合约中指包括但不限于 snkoudai.com 等网站和相关应用）由安徽左岸芯慧信息科技有限公司（以下简称“左岸芯慧”）所有和运作。</p><p style=\"white-space: normal;\">2. 本合约是网站用户(包括个人、企业及其他组织)与网站运营企业左岸芯慧之间的法律契约。用户访问、浏览和注册本网站即代表接受本合约条款的约束，用户对本网站的访问和使用应以接受并遵守本合约所载明的条款和条件为前提。</p><p style=\"white-space: normal; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>二、知识产权申明</strong></span></p><p style=\"white-space: normal;\">1. 本网站的包括但不限于应用程序、源代码、商标、标示图案(LOGO)、界面设计、应用程序编程接口(API)等所关联的所有知识产权均属左岸芯慧所有。用户不得复制、修改、传播或在非本网站所属的服务器上做镜像或者以其它方式进行非法使用。</p><p style=\"white-space: normal;\">2. 用户在本网站平台所创建的独创性数据归属该用户所有，该用户有权对前述数据进行任何形式的处置，包括从平台中复制，导出和删除。</p><p style=\"white-space: normal;\">3. 用户应当确保其公开或存储（方式包括但不限于：上传、保存、公布、发布等）于本网站及相关服务器的内容不存在任何侵犯其他第三方知识产权的情形。若存在本条所述情形，左岸芯慧有权根据具体情节针对上述内容，采取包括但不限于限制、屏蔽、删除、修改等手段，由此给网站用户造成的损失由网站用户自行承担；若左岸芯慧因网站用户存在本条所述行为而向其他第三方承担法律责任的，左岸芯慧有权向网站用户追偿全部损失。</p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"font-size: 18px;\">三、网站使用规则</span></strong></p><p style=\"white-space: normal;\">1.用户在使用本网站服务过程中，必须遵循以下规则：</p><ul class=\" list-paddingleft-2\"><li><p dir=\"ltr\">遵守中国有关的法律法规；</p></li><li><p>不得对本网站服务进行任何形式的对其他第三方的再授权使用、销售或转让；</p></li><li><p>不得为设计开发竞争产品对本网站进行任何形式的反向工程、反向编译、反汇编，或在竞争产品抄袭模仿本网站的设计；</p></li><li><p>不得滥用本网站的通信功能发送垃圾邮件和短信；</p></li><li><p>不得对本网站的连续服务和商誉构成损害的其他行为，包括对网站服务器的攻击；</p></li><li><p>遵守本协议中的全部约定。</p></li></ul><p style=\"white-space: normal;\">2. 如用户在使用本网站服务时违反任何上述规定，左岸芯慧有权要求用户改正或直接采取一切必要的措施（包括但不限于暂停或终止用户使用本网站服务的权利并追讨因此带来的损失）以减轻用户不当行为造成的影响。</p><p style=\"white-space: normal;\">3. 用户所拥有的互联网域名所对应的电子邮件地址作为用户权证的唯一识别信息。当用户不再拥有或完全控制在本网站登记的域名时，左岸芯慧有权随时删除所有的用户数据。在高级模式下，系统支持多个域名电子邮件地址，当最早登记的主域名权属发生改变时，左岸芯慧有权随时删除主域名及其关联域名所有的用户数据。</p><p style=\"white-space: normal;\">4. 用户须对在神农口袋的注册信息的真实性、合法性、有效性承担全部责任，用户不得冒充他人；不得利用他人的名义发布任何信息；不得恶意使用注册帐户导致其他用户误认；否则神农口袋有权立即停止提供服务，收回其帐号并由用户独自承担由此而产生的一切法律责任。</p><p style=\"white-space: normal;\">5. 用户直接或通过各类方式（如 RSS 源和站外 API 引用等）间接使用神农口袋服务和数据的行为，都将被视作已无条件接受本协议全部内容；若用户对本协议的任何条款存在异议，请停止使用神农口袋所提供的全部服务。</p><p style=\"white-space: normal;\">6. 用户承诺不得以任何方式利用神农口袋直接或间接从事违反中国法律、以及社会公德的行为，神农口袋有权对违反上述承诺的内容予以删除。</p><p style=\"white-space: normal;\">7. 用户不得利用神农口袋服务制作、上载、复制、发布、传播或者转载如下内容：</p><ul class=\" list-paddingleft-2\" style=\"width: 1395.55px; white-space: normal;\"><li><p>危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</p></li><li><p>损害国家荣誉和利益的；</p></li><li><p>煽动民族仇恨、民族歧视，破坏民族团结的；</p></li><li><p>破坏国家宗教政策，宣扬邪教和封建迷信的；</p></li><li><p>散布谣言，扰乱社会秩序，破坏社会稳定的；</p></li><li><p>散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</p></li><li><p>侮辱或者诽谤他人，侵害他人合法权益的；</p></li><li><p>含有法律、行政法规禁止的其他内容的信息。</p></li></ul><p style=\"white-space: normal;\">8. 神农口袋有权对用户使用神农口袋的情况进行审查和监督，如用户在使用神农口袋时违反任何上述规定，神农口袋或其授权的人有权要求用户改正或直接采取一切必要的措施（包括但不限于更改或删除用户张贴的内容、暂停或终止用户使用神农口袋的权利）以减轻用户不当行为造成的影响。</p><p style=\"white-space: normal;\">9. 神农口袋有权但无义务对用户发布的内容进行审核，有权根据相关证据结合《侵权责任法》、《信息网络传播权保护条例》等法律法规及神农口袋社区指导原则对侵权信息进行处理。</p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"font-size: 18px;\">四、用户信息保护</span></strong></p><p style=\"white-space: normal;\">本网站将尽可能采取一切措施保护用户数据及个人信息资料安全，只根据用户在网站上的行为指示来分发用户的信息，不会向任何第三方公开或共享用户的具体数据，除非有下列情况：</p><ul class=\" list-paddingleft-2\" style=\"width: 1395.55px; white-space: normal;\"><li><p>有关法律、法规规定；</p></li><li><p>在紧急情况下，为维护用户及公众的权益；</p></li><li><p>为维护神农口袋的商标权、专利权及其他任何合法权益；</p></li><li><p>其他依法需要公开、编辑或透露个人信息的情况。</p></li></ul><p style=\"white-space: normal;\">2. 本网站保留使用汇总统计性信息的权利，在不透露单个用户隐私资料的前提下，本网站有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。</p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"font-size: 18px;\">五、免责申明</span></strong></p><p style=\"white-space: normal;\">1. 本网站将尽最大努力保障软件平台的连续可靠运行，但鉴于网络服务的特殊性，本网站对可能发生的网络服务的中断或终止所可能导致的一切损失，不承担任何法律责任及经济赔偿。</p><p style=\"white-space: normal;\">2. 本网站将尽最大努力保障客户数据的安全备份，但无法承诺100%的数据恢复，对因数据丢失带来的任何直接或间接损失不承担任何责任。</p><p style=\"white-space: normal;\">3. 在发生需要从备份文件中恢复数据的情形时，本网站通常需要4小时，最长48小时完成，在此时间范围内的数据恢复视作服务是连续的。</p><p style=\"white-space: normal;\">4. 对于因不可抗力或本网站不能控制的原因造成的网络服务中断和长时间终止，本网站不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</p><p style=\"white-space: normal;\">5. 本网站将尽可能采取一切措施保护用户数据及个人信息资料安全。但用户通过使用或安装第三方应用打开神农口袋中的文件，该文件会在第三方应用中打开，由于第三方应用而造成的损失，本网站不承担任何法律责任及经济赔偿。</p><p style=\"white-space: normal;\">6. 鉴于互联网体制及环境的特殊性，客户在服务中分享的信息及个人资料有可能会被他人复制、转载、擅改或做其它非法用途，本网站对此不承担任何责任。</p><p style=\"white-space: normal;\">7. 客户在使用服务过程中可能存在来自任何他人的包括威胁性的、诽谤性的、令人反感的或非法的内容或行为或对他人权利的侵犯（包括知识产权）及匿名或冒名的信息的风险本网站对此不承担任何责任。</p><p style=\"white-space: normal;\">8. 与特定网络安全事故相关免责事由。例如，在法律允许的范围内，本网站对于因受到计算机病毒、木马或其他恶意程序、黑客攻击的破坏而导致的服务中断及信息泄露不承担责任。</p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"font-size: 18px;\">六、合约变更</span></strong></p><p style=\"white-space: normal;\">1. 本网站有权随时对本合约的条款进行修订，一旦本合约的内容发生变更，本网站将会在修订生效日前一个工作日更新。</p><p style=\"white-space: normal;\">2. 如用户继续使用网络服务，则视为用户接受本网站对合约相关条款所做的修订。</p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"font-size: 18px;\">七、违约责任</span></strong></p><p style=\"white-space: normal;\">由于用户通过服务上载、传送或分享之信息、使用本服务其他功能、违反本合约、或侵害他人任何权利因而衍生或导致任何第三人向本网站及其关联公司提出任何索赔或请求，或本网站及其关联公司因此而发生任何损失，用户同意将足额进行赔偿（包括但不限于合理的律师费）。</p><p style=\"white-space: normal; line-height: 2em;\"><strong><span style=\"font-size: 18px;\">八、法律适用</span></strong></p><p style=\"white-space: normal;\">1. 本合约的订立、执行和解释以及争议的解决均应适用中华人民共和国法律并受中国法院管辖。</p><p style=\"white-space: normal;\">2. 协议双方就本合约内容或其执行发生任何争议，应首先力争友好协商解决；协商不成时，任何一方均可向左岸芯慧注册地所在的人民法院提起诉讼。</p><p><br/></p>',
        1, '2019-02-01 17:35:09', 1, '2019-02-01 18:24:41');
INSERT INTO `sys_agreement`
VALUES (2, 2, '隐私条款',
        '<p style=\"margin-top: 20px; white-space: normal;\"><strong style=\"font-size: 18px;\">一、隐私条款的覆盖范围</strong><br/></p><p style=\"margin-top: 10px; white-space: normal;\">您的隐私安全对于我们十分重要，我们也非常乐意告知您我们是如何收集、使用您的相关信息。</p><p style=\"margin-top: 15px; white-space: normal;\">本文旨在帮助您了解如下内容：</p><ul class=\" list-paddingleft-2\" style=\"width: 1395.55px; white-space: normal;\"><li><p>我们收集哪些信息；</p></li><li><p>我们将如何使用收集到的信息；</p></li><li><p>我们如何存储收集到的信息并如何保障其安全性；</p></li><li><p>有害信息的过滤和删除；</p></li><li><p>您的权利；</p></li><li><p>业务转让；</p></li><li><p>其他重要的隐私策略；</p></li><li><p>联系我们；</p></li><li><p>隐私政策的变更。</p></li></ul><p style=\"margin-top: 15px; white-space: normal;\">本隐私协议在您使用神农口袋产品、相关系列产品和服务或者在您以其他方式调用神农口袋时全程有效（除其他单独的隐私协议注释外）。此政策还阐述了您有权决定是否允许我们收集您的行为数据。如果您不同意此政策，请勿访问或使用我们的产品或服务或者与我们业务的任何其他方面进行互动。当本政策中提及“神农口袋”或“我们”时，指的是安徽左岸芯慧信息科技有限公司（Anhui Zuoanxinhui Information Technology Co., Ltd.），神农口袋在您使用服务时收集的信息由其进行控制。神农口袋以包括网站、桌面产品、移动产品在内的产品为您提供了农场管理工具，帮助您进行农场管理和与人沟通。我们还拥有并运营着多个其他网站并提供相关服务。本政策中的“服务”指的是上述所有产品及服务。</p><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>二、我们收集哪些信息</strong></span></p><p style=\"margin-top: 15px; white-space: normal;\">我们将收集您提供给我们的信息，包括您在使用我们的产品或服务时产生的信息以及其他信息来源向我们提供的信息，具体类别如下所述：</p><p style=\"margin-top: 15px; white-space: normal;\"><strong>您提供给我们的信息</strong></p><p style=\"margin-top: 15px; white-space: normal;\">我们将收集您在我们网站或服务中直接输入或提交的数据。</p><p style=\"margin-top: 15px; white-space: normal;\">1. 账户信息和个人资料信息：我们将在您注册账户、创建或修改个人资料、设置偏好、登入、通过我们的服务进行购买或为购买而进行登记时收集您的有关信息，例如：您在注册服务时提供的联系信息以及某些情况下的帐单信息将会被我们收集。您还可以选择将个人照片及其他详细信息添加到您的个人资料中，以显示于我们的服务系统之上。在您选择或修改个人偏好时，我们也将持续获取和追踪您的偏好信息。</p><p style=\"margin-top: 15px; white-space: normal;\">2. 您通过我们的产品所提供的内容：我们将通过您使用的神农口袋网页和移动产品来收集和存储您发布、发送、接收和分享的内容，此内容包括您的任何信息或者您选择包含的信息，还包括您上传到服务系统中的文件和链接。我们收集和存储的内容包括：企业信息、员工、农场信息、地块、种植计划、生产任务、采收、客户、宅配计划和订单等。</p><p style=\"margin-top: 15px; white-space: normal;\">3. 支付信息：当您注册某些付费服务时，我们会收集某些付款和账单信息。例如：在您为我们的产品付费时，我们要求您提交的姓名和联系信息等；您也可能会提供付款账号信息，如银行卡卡号等。</p><p style=\"margin-top: 15px; white-space: normal;\"><strong>您使用服务时自动收集的信息</strong></p><p style=\"margin-top: 15px; white-space: normal;\">当您浏览和使用我们的服务时（如浏览网站或者在网页中进行相应的操作），我们将自动收集您的一些相关信息。</p><p style=\"margin-top: 15px; white-space: normal;\">1. 您在我们的产品中的使用行为：当您访问我们的任何服务并与之互动时，我们会跟踪您的某些信息。这些信息包括您正在使用的功能，如：点击任务、选择地块或者点击其他链接；同时包括了您上传到服务中的附件及其类型、大小和文件名称；也包括您所经常使用的搜索词以及您在产品中是如何与他人互动的等等。我们还收集了您的企业和人员的信息以及您与他们的互动方式，例如与您最频繁合作和沟通的人员。</p><p style=\"margin-top: 15px; white-space: normal;\">2. 设备与连接信息：在您使用我们的服务时，我们收集了有关您的计算机、手机、平板电脑或您用于访问服务的其他设备的信息。此设备信息包括您在安装、访问、更新或使用我们的服务时的连接类型和设置。我们还通过您的设备收集关于您的操作系统、浏览器类型、IP地址、分享/退出页面的URL、设备标识符以及应用于软件崩溃相关数据的信息。我们也将使用您的IP地址、国家或地区偏好来估算您的位置，以提供更好的服务体验。我们所收集的信息数量取决于您用于访问服务的设备类型和设置。</p><p style=\"margin-top: 15px; white-space: normal;\">3. Cookies和其他跟踪技术：神农口袋及我们的第三方合作伙伴（如我们的分析合作伙伴）可能会使用Cookie和其他跟踪技术（如网页打点等）来识别您的身份。Cookie是仅限文本的信息字符串，网站会将这些字符串传输到计算机硬盘的浏览器 Cookie 文件中，以便网站能够记住您的身份信息以及其他详细信息。Cookie可能由网站设置或来源自第三方，如广告商。Cookie本身不用于或意图用于从用户计算机读取任何信息（Cookie本身的内容除外）。Cookie只是网站所使用的最初将其放置在您硬盘上的标识符。同一台服务器可以检索到 Cookie 信息的实际内容，从而标识计算机，并进而根据主服务器上存储的信息来自定义、跟踪或控制站点的使用情况。我们会通过这些追踪手段来帮助您更好地使用神农口袋，也帮助我们更好地改善对应功能。您可以通过修改浏览器设置来选择接受或者拒绝Cookie。但是如果您禁用了Cookie，您将不能使用神农口袋的各项交互功能。</p><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>三、我们将如何使用收集到的信息</strong></span></p><p style=\"margin-top: 15px; white-space: normal;\">我们如何使用收集到的信息部分取决于您所使用的服务、如何使用它们以及您所设置的偏好。以下是我们使用所收集的、关于您的信息的具体目的：</p><p style=\"margin-top: 15px; white-space: normal;\">1. 为您提供更好的服务与个性化体验：我们使用关于您的信息向您提供服务，包括识别您在什么地点登陆、应该提供什么样的用户支持以及如何运营和维护整体服务。例如：我们使用您在账户中提供的名称和图片（如头像）来向其他服务用户标识您。我们的服务还包括个性化您的体验与定制功能，提高您使用神农口袋的效率，并通过自动化的分析与计算，提高他人与您沟通协作的能力与效率，更好地帮助您和您的企业构建稳固与准确的关联关系。</p><p style=\"margin-top: 15px; white-space: normal;\">2. 用于研究与开发迭代：我们一直在寻找方法使我们的服务以更智能、更快速、更安全、更综合、更有效的方式来帮助您获得更好的使用体验。我们通过集体学习，了解人们如何使用我们的服务，并不断收集用户直接向我们提供的反馈，以帮助我们排查问题并确定产品趋势、用法、活动模式以及服务整合和改进的方式。例如：我们在每次迭代与更新时，会记录新功能的使用量以及用户的使用链路，从而设计更好、更人性化的功能。在某些情况下，我们会将这部分的调查数据与研究数据提供给对应的研究机构以进行更深层的产品研究与学术研究。</p><p style=\"margin-top: 15px; white-space: normal;\">3. 用于改善与用户的沟通交流：我们将使用您的联系信息，通过发送短信，包括确认您的购买、提醒您订阅到期、回应您的意见问题与需求、提供客户支持以及向您发送更新、通知、警告等。</p><p style=\"margin-top: 15px; white-space: normal;\">4. 用于技术服务：我们使用您的信息来解决您遇到的技术问题、响应您的协助请求、分析崩溃信息并进行修复和改进服务。如果您允许我们这样做，我们会与神农口袋的技术专家分享您的信息，以回应与支持相关请求。</p><p style=\"margin-top: 15px; white-space: normal;\">5. 用于加强安全保护与鉴权：我们使用有关您和您的服务使用情况信息来验证账户和活动、监控可疑或欺诈活动并确定上述行为是否违反服务政策。</p><p style=\"margin-top: 15px; white-space: normal;\">6. 用于保护我们合法的商业利益和其他合法权益：在法律要求或我们认为有必要保护我们的合法权利、利益和他人利益的情况下，我们会使用有关您的信息来处理法律诉讼、合规、监管和审计相关事务，以及与收购、合并或出售业务相关的信息披露。</p><p style=\"margin-top: 15px; white-space: normal;\">如果您已经同意我们出于特定目的使用您的信息，您也拥有随时改变主意的权利，但这不会影响任何已经发生了的处理。当我们或第三方（如您的雇主）合法使用您的信息时，您有权反对。但是在某些情况下，这可能意味着您不再使用服务。</p><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>四、我们如何存储收集到的信息并如何保障其安全性</strong></span></p><p style=\"margin-top: 15px; white-space: normal;\">信息的存储和安全：我们使用阿里云提供的云服务托管我们收集的信息，并使用技术措施来保护您的数据。尽管我们极尽可能地保护您的信息安全，但由于互联网的固有特性，没有任何系统是绝对安全的，我们无法保证数据在通过互联网传输过程中和存储在我们系统时的绝对安全。我们会尽一切可能防止安全入侵事件的发生。但如果发生该类事件，我们将在合理期限内第一时间告知您。</p><p style=\"margin-top: 15px; white-space: normal;\"><strong>信息将被存储多久</strong></p><p style=\"margin-top: 15px; white-space: normal;\">信息将被存储多久是由该信息的种类所决定的，我们在下文中将详细描述。当信息达到一定存储期限后，我们会删除您的信息或做匿名处理。但当删除操作无法进行的时候（如信息已存储在备份存档中），我们将安全地存储您的信息，并将其隔离，直至删除成为可能。</p><p style=\"margin-top: 15px; white-space: normal;\">1. 账号信息：我们将保留您的账户信息，直到您删除您的账户。我们还将保留一些必要的信息，以履行法律义务、解决争议、履行协议、支持业务运营并继续开发和改进我们的服务。如果我们将要保留这些信息以用于服务改进和产品迭代，我们会将数据脱敏，并且我们只会利用这些信息进行集体性分析而不会针对您的个人数据做专门分析。</p><p style=\"margin-top: 15px; white-space: normal;\">2. 您在我们服务中所分享的信息：如果您的账户已停用或被停用，您的部分信息和您提供的内容将被保留，以便您的团队成员或其他用户充分使用服务。例如：我们会继续显示您提供给企业或任务中的内容。</p><p style=\"margin-top: 15px; white-space: normal;\">3. 市场偏好信息：如果您选择接收我们的营销电子邮件，我们会保留有关您的营销偏好信息，除非您明确要求我们删除此类信息。我们将保留自创建日期起的合理时间段内从 Cookie 和其他跟踪技术中所获得的信息。</p><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>五、有害信息的过滤和删除</strong></span></p><p style=\"margin-top: 15px; white-space: normal;\">根据相关法律的规定，神农口袋禁止用户创建和储存一切有害信息，包括：</p><p style=\"white-space: normal;\">（1）违反中国宪法确定的基本原则的；</p><p style=\"white-space: normal;\">（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</p><p style=\"white-space: normal;\">（3）宣扬恐怖主义、极端主义、民族仇恨、民族歧视的；</p><p style=\"white-space: normal;\">（4）破坏国家、地区间友好关系的；</p><p style=\"white-space: normal;\">（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</p><p style=\"white-space: normal;\">（6）散布谣言或不实消息，扰乱社会秩序，破坏社会稳定的；</p><p style=\"white-space: normal;\">（7）煽动、组织、教唆恐怖活动、非法集会、结社、游行、示威、聚众扰乱社会秩序的；</p><p style=\"white-space: normal;\">（8）散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；</p><p style=\"white-space: normal;\">（9）侵犯他人名誉、隐私、著作权、信息网络传播权等合法权益的；</p><p style=\"white-space: normal;\">（10）含有法律、行政法规禁止的其他内容的。</p><p style=\"margin-top: 15px; white-space: normal;\">神农口袋将针对以上信息制定过滤和屏蔽机制。如用户创建项目或储存文件时不能履行和遵守本政策中的规定，神农口袋有权对违反本政策的用户做出关闭账户的处理，同时保留依法追究当事人法律责任的权利。此外，神农口袋在采取移除等相应措施后，不为此向原发布人承担违约责任或其他法律责任。</p><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>六、您的权利</strong></span></p><p style=\"margin-top: 15px; white-space: normal;\">1. 您可以在使用我们服务的过程中，访问、修改、撤回和删除您提供的注册信息和其他个人信息，也可按照通知指引与我们联系。您访问、修改和删除个人信息的范围和方式将取决于您使用的具体服务。</p><p style=\"margin-top: 15px; white-space: normal;\">2. 每个业务功能可能需要某些基本的个人信息才能得以完成。对于额外收集的个人信息的收集和使用，您可以随时给予或撤回您的授权同意。当您撤回同意后，我们将不再处理相应的个人信息。但您撤回同意的决定，不会影响此前基于您的授权而开展的个人信息处理。</p><p style=\"margin-top: 15px; white-space: normal;\">3. 您有权获取您的个人信息副本。在技术可行的前提下，例如数据接口匹配，我们还可按您的要求，直接将您的个人信息副本传输给您指定的第三方。我们将以弹窗方式单独告知接收个人信息的第三方身份或类型、向第三方分享数据的目的及数据的范围并征得您的同意。</p><p style=\"margin-top: 15px; white-space: normal;\">4. 在某些业务功能中，我们可能仅依据信息系统、算法等非人工自动决策机制对您的个人信息做出处理。如果这些决定将显著影响您的合法权益，您有权要求我们做出解释，我们也将对此提供适当的救济方式。</p><p style=\"margin-top: 15px; white-space: normal;\">5. 您有权要求限制对您个人数据的处理。在下列情形中，您有权限制我们处理数据：当您对个人数据的准确性有争议，并允许我们在一定的期限内核实其准确性时；当数据处理是非法的，且您反对删除个人数据而是要求限制使用该个人数据时；当我们不再需要个人数据以实现处理目的，但您为了提起、行使或抗辩法律诉求而需要该个人数据时；当您基于反对权需要核实我们的法律依据是否优先于您的法律依据时。</p><p style=\"margin-top: 15px; white-space: normal;\">6. 您有权选择退出促销。您可以选择不接收我们的促销信息，为此目的，您可以直接联系我们从促销邮件列表或注册数据库中中删除您的联系信息。</p><p style=\"margin-top: 15px; white-space: normal;\">7. 为保障安全，您可能需要以提供书面材料或其他方式证明您的身份。我们可能会先要求您验证自己的身份，然后再处理您的请求。对于您的合理请求，我们原则上不收取费用，但对多次重复、超出合理限度的请求，我们将视情况收取一定的成本费用。对于那些无端重复、需要过多技术手段（例如：需要开发新系统或从根本上改变现行惯例）、给他人合法权益带来风险或者非常不切实际（例如：涉及备份磁带上存放的信息）的请求，我们可能会予以拒绝。</p><p style=\"margin-top: 15px; white-space: normal;\">在以下情形中，按照法律法规要求，我们将无法响应您的请求：</p><ul class=\" list-paddingleft-2\" style=\"width: 1395.55px; white-space: normal;\"><li><p>与国家安全、国防安全直接相关的；</p></li><li><p>与公共安全、公共卫生、重大公共利益直接相关的；</p></li><li><p>与犯罪侦查、起诉、审判和判决执行等直接相关的；</p></li><li><p>有充分证据表明您存在主观恶意或滥用权利的；</p></li><li><p>响应您的请求将导致您或其他个人、组织的合法权益受到严重损害的；</p></li><li><p>涉及商业秘密的。</p></li></ul><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>七、业务转让</strong></span></p><p style=\"margin-top: 15px; white-space: normal;\">神农口袋收集的信息将被视作一项资产，如果存在下列情况之一，此类信息可能成为被转让的资产之一：神农口袋、任何关联公司或部门与其他企业或部门进行合并、被收购，或者进行破产、解散、重组，或者出售部分或全部神农口袋的资产或股票，或者进行融资、公开发行证券，或者被收购全部或部分业务，或者进入其他类似交易或程序，或者为此类活动进行的其他程序和步骤（例如尽职调查）。</p><p style=\"margin-top: 15px; white-space: normal;\">当上述交易完成后，若存在转让神农口袋收集的信息的情况，我们会以邮件和/或其他方式通知您。收购方或者其他与收购方具有类似地位的权利义务承继者，只能按照此隐私策略（或者向您收集信息时任何有效的后续策略）来使用您的信息。请注意，转让后提交或收集的信息可能根据收购方的要求在法律允许的范围内进行修改，隐私政策也将据此进行更新。</p><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>八、其他重要的隐私策略</strong></span></p><p style=\"margin-top: 15px; white-space: normal;\">我们的产品适用于个人使用和组织使用，在通过组织（例如您的雇主）向您提供服务的情况下，该组织是服务的管理员，并且对其拥有控制权的最终用户和服务站点负责。如果是此种情况，请将您的数据隐私需求提交给管理员，因为您对服务的使用受制于该组织的政策。我们不对管理员组织的隐私或安全做法负责，这些做法可能与本政策有所出入。即使服务目前没有由组织管理，如果您是由组织管理的团队的成员，那么该团队的管理员（例如您的雇主）可能会对您的账户进行管理、控制，并在这之后使用我们的服务。如果发生此类情况，您会收到通知。农场管理员、企业管理员能够限制您对任务、农场、企业的访问与权限。</p><p style=\"margin-top: 15px; white-space: normal;\">如果您不希望管理员能够控制您的账户或使用服务，您可以退出企业、农场。</p><p style=\"margin-top: 15px; white-space: normal;\">请联系您的组织或您的管理员，以获取组织政策和了解更多信息。</p><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>九、联系我们</strong></span></p><p style=\"margin-top: 15px; white-space: normal;\">如果您对本隐私政策有任何疑问、意见或建议，请通过以下方式与我们联系：</p><p style=\"white-space: normal;\">邮箱：hi@freetek.cc</p><p style=\"white-space: normal;\">地址：安徽省合肥市蜀山区龙图路666号置地广场C座1605</p><p style=\"white-space: normal;\">客服电话：0551-65565531</p><p style=\"white-space: normal;\">一般情况下，我们将在十天内回复。</p><p style=\"margin-top: 20px; white-space: normal;\"><span style=\"font-size: 18px;\"><strong>十、隐私政策的变更</strong></span></p><p style=\"margin-top: 15px; margin-bottom: 20px; white-space: normal;\">我们可能会不时更改此隐私政策。隐私政策的任何更改都会在此页面上发布。如果更改的内容十分重要，我们将通过在服务主页或登录屏幕上添加通知或者向您发送电子邮件的方式通知您。我们也会将此隐私政策的先前版本保留在档案中供您查看。我们鼓励您在使用服务时了解我们的隐私政策，随时了解我们的信息能够帮助您更好地保护隐私。如果您不同意本隐私政策的任何更改，您需要停止使用服务并停用您的账户。</p><p><br/></p>',
        1, '2019-02-01 17:35:33', 1, '2019-03-14 19:57:10');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`
(
    `id`         int(10) NOT NULL COMMENT 'ID',
    `area_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目名',
    `parent_id`  int(10) NOT NULL COMMENT '父栏目',
    `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `area_code`  int(6) NULL DEFAULT NULL,
    `zip_code`   int(10) NULL DEFAULT NULL,
    `pinyin`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `lng`        decimal(10, 6) NULL DEFAULT NULL,
    `lat`        decimal(10, 6) NULL DEFAULT NULL,
    `level`      tinyint(1) NOT NULL,
    `position`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL,
    `sort_num`   int(10) UNSIGNED NULL DEFAULT 50 COMMENT '排序',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX        `index_parent_id`(`parent_id`) USING BTREE,
    INDEX        `index_sort_num`(`sort_num`) USING BTREE,
    INDEX        `index_pinyin`(`pinyin`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '省市行政区域表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area`
VALUES (110000, '北京', 0, '北京', NULL, NULL, 'B', 116.405289, 39.904987, 1, 'tr_0', 1);
INSERT INTO `sys_area`
VALUES (110100, '北京市', 110000, '北京', NULL, NULL, 'B', 116.405289, 39.904987, 2, 'tr_0 tr_110000', 1);
INSERT INTO `sys_area`
VALUES (110101, '东城区', 110100, '东城', NULL, NULL, 'D', 116.418755, 39.917545, 3, 'tr_0 tr_110000 tr_110100', 3);
INSERT INTO `sys_area`
VALUES (110102, '西城区', 110100, '西城', NULL, NULL, 'X', 116.366791, 39.915310, 3, 'tr_0 tr_110000 tr_110100', 15);
INSERT INTO `sys_area`
VALUES (110105, '朝阳区', 110100, '朝阳', NULL, NULL, 'C', 116.486412, 39.921490, 3, 'tr_0 tr_110000 tr_110100', 2);
INSERT INTO `sys_area`
VALUES (110106, '丰台区', 110100, '丰台', NULL, NULL, 'F', 116.286964, 39.863644, 3, 'tr_0 tr_110000 tr_110100', 6);
INSERT INTO `sys_area`
VALUES (110107, '石景山区', 110100, '石景山', NULL, NULL, 'S', 116.195442, 39.914600, 3, 'tr_0 tr_110000 tr_110100', 12);
INSERT INTO `sys_area`
VALUES (110108, '海淀区', 110100, '海淀', NULL, NULL, 'H', 116.310318, 39.956074, 3, 'tr_0 tr_110000 tr_110100', 7);
INSERT INTO `sys_area`
VALUES (110109, '门头沟区', 110100, '门头沟', NULL, NULL, 'M', 116.105377, 39.937183, 3, 'tr_0 tr_110000 tr_110100', 9);
INSERT INTO `sys_area`
VALUES (110111, '房山区', 110100, '房山', NULL, NULL, 'F', 116.139160, 39.735535, 3, 'tr_0 tr_110000 tr_110100', 5);
INSERT INTO `sys_area`
VALUES (110112, '通州区', 110100, '通州', NULL, NULL, 'T', 116.658600, 39.902485, 3, 'tr_0 tr_110000 tr_110100', 14);
INSERT INTO `sys_area`
VALUES (110113, '顺义区', 110100, '顺义', NULL, NULL, 'S', 116.653526, 40.128937, 3, 'tr_0 tr_110000 tr_110100', 13);
INSERT INTO `sys_area`
VALUES (110114, '昌平区', 110100, '昌平', NULL, NULL, 'C', 116.235909, 40.218086, 3, 'tr_0 tr_110000 tr_110100', 1);
INSERT INTO `sys_area`
VALUES (110115, '大兴区', 110100, '大兴', NULL, NULL, 'D', 116.338036, 39.728909, 3, 'tr_0 tr_110000 tr_110100', 4);
INSERT INTO `sys_area`
VALUES (110116, '怀柔区', 110100, '怀柔', NULL, NULL, 'H', 116.637123, 40.324272, 3, 'tr_0 tr_110000 tr_110100', 8);
INSERT INTO `sys_area`
VALUES (110117, '平谷区', 110100, '平谷', NULL, NULL, 'P', 117.112335, 40.144783, 3, 'tr_0 tr_110000 tr_110100', 11);
INSERT INTO `sys_area`
VALUES (110228, '密云县', 110100, '密云', NULL, NULL, 'M', 116.843353, 40.377361, 3, 'tr_0 tr_110000 tr_110100', 10);
INSERT INTO `sys_area`
VALUES (110229, '延庆县', 110100, '延庆', NULL, NULL, 'Y', 115.985008, 40.465324, 3, 'tr_0 tr_110000 tr_110100', 16);
INSERT INTO `sys_area`
VALUES (120000, '天津', 0, '天津', NULL, NULL, 'T', 117.190186, 39.125595, 1, 'tr_0', 2);
INSERT INTO `sys_area`
VALUES (120100, '天津市', 120000, '天津', NULL, NULL, 'T', 117.190186, 39.125595, 2, 'tr_0 tr_120000', 1);
INSERT INTO `sys_area`
VALUES (120101, '和平区', 120100, '和平', NULL, NULL, 'H', 117.195908, 39.118328, 3, 'tr_0 tr_120000 tr_120100', 7);
INSERT INTO `sys_area`
VALUES (120102, '河东区', 120100, '河东', NULL, NULL, 'H', 117.226570, 39.122124, 3, 'tr_0 tr_120000 tr_120100', 6);
INSERT INTO `sys_area`
VALUES (120103, '河西区', 120100, '河西', NULL, NULL, 'H', 117.217537, 39.101898, 3, 'tr_0 tr_120000 tr_120100', 8);
INSERT INTO `sys_area`
VALUES (120104, '南开区', 120100, '南开', NULL, NULL, 'N', 117.164146, 39.120476, 3, 'tr_0 tr_120000 tr_120100', 13);
INSERT INTO `sys_area`
VALUES (120105, '河北区', 120100, '河北', NULL, NULL, 'H', 117.201569, 39.156631, 3, 'tr_0 tr_120000 tr_120100', 5);
INSERT INTO `sys_area`
VALUES (120106, '红桥区', 120100, '红桥', NULL, NULL, 'H', 117.163300, 39.175068, 3, 'tr_0 tr_120000 tr_120100', 9);
INSERT INTO `sys_area`
VALUES (120110, '东丽区', 120100, '东丽', NULL, NULL, 'D', 117.313965, 39.087765, 3, 'tr_0 tr_120000 tr_120100', 4);
INSERT INTO `sys_area`
VALUES (120111, '西青区', 120100, '西青', NULL, NULL, 'X', 117.012245, 39.139446, 3, 'tr_0 tr_120000 tr_120100', 16);
INSERT INTO `sys_area`
VALUES (120112, '津南区', 120100, '津南', NULL, NULL, 'J', 117.382545, 38.989578, 3, 'tr_0 tr_120000 tr_120100', 11);
INSERT INTO `sys_area`
VALUES (120113, '北辰区', 120100, '北辰', NULL, NULL, 'B', 117.134819, 39.225555, 3, 'tr_0 tr_120000 tr_120100', 2);
INSERT INTO `sys_area`
VALUES (120114, '武清区', 120100, '武清', NULL, NULL, 'W', 117.057961, 39.376926, 3, 'tr_0 tr_120000 tr_120100', 15);
INSERT INTO `sys_area`
VALUES (120115, '宝坻区', 120100, '宝坻', NULL, NULL, 'B', 117.308090, 39.716965, 3, 'tr_0 tr_120000 tr_120100', 1);
INSERT INTO `sys_area`
VALUES (120116, '滨海新区', 120100, '滨海', NULL, NULL, 'B', 117.654175, 39.032845, 3, 'tr_0 tr_120000 tr_120100', 3);
INSERT INTO `sys_area`
VALUES (120221, '宁河县', 120100, '宁河', NULL, NULL, 'N', 117.828278, 39.328884, 3, 'tr_0 tr_120000 tr_120100', 14);
INSERT INTO `sys_area`
VALUES (120223, '静海县', 120100, '静海', NULL, NULL, 'J', 116.925301, 38.935673, 3, 'tr_0 tr_120000 tr_120100', 10);
INSERT INTO `sys_area`
VALUES (120225, '蓟县', 120100, '蓟县', NULL, NULL, 'J', 117.407448, 40.045341, 3, 'tr_0 tr_120000 tr_120100', 12);
INSERT INTO `sys_area`
VALUES (130000, '河北省', 0, '河北', NULL, NULL, 'H', 114.502464, 38.045475, 1, 'tr_0', 3);
INSERT INTO `sys_area`
VALUES (130100, '石家庄市', 130000, '石家庄', NULL, NULL, 'S', 114.502464, 38.045475, 2, 'tr_0 tr_130000', 8);
INSERT INTO `sys_area`
VALUES (130102, '长安区', 130100, '长安', NULL, NULL, 'C', 114.548149, 38.047501, 3, 'tr_0 tr_130000 tr_130100', 1);
INSERT INTO `sys_area`
VALUES (130103, '桥东区', 130100, '桥东', NULL, NULL, 'Q', 114.502892, 38.040154, 3, 'tr_0 tr_130000 tr_130100', 11);
INSERT INTO `sys_area`
VALUES (130104, '桥西区', 130100, '桥西', NULL, NULL, 'Q', 114.462929, 38.028381, 3, 'tr_0 tr_130000 tr_130100', 12);
INSERT INTO `sys_area`
VALUES (130105, '新华区', 130100, '新华', NULL, NULL, 'X', 114.465973, 38.067142, 3, 'tr_0 tr_130000 tr_130100', 16);
INSERT INTO `sys_area`
VALUES (130107, '井陉矿区', 130100, '井陉矿', NULL, NULL, 'J', 114.058182, 38.069748, 3, 'tr_0 tr_130000 tr_130100', 4);
INSERT INTO `sys_area`
VALUES (130108, '裕华区', 130100, '裕华', NULL, NULL, 'Y', 114.533257, 38.027695, 3, 'tr_0 tr_130000 tr_130100', 20);
INSERT INTO `sys_area`
VALUES (130121, '井陉县', 130100, '井陉', NULL, NULL, 'J', 114.144485, 38.033615, 3, 'tr_0 tr_130000 tr_130100', 5);
INSERT INTO `sys_area`
VALUES (130123, '正定县', 130100, '正定', NULL, NULL, 'Z', 114.569885, 38.147835, 3, 'tr_0 tr_130000 tr_130100', 23);
INSERT INTO `sys_area`
VALUES (130124, '栾城县', 130100, '栾城', NULL, NULL, 'Z', 114.654282, 37.886909, 3, 'tr_0 tr_130000 tr_130100', 8);
INSERT INTO `sys_area`
VALUES (130125, '行唐县', 130100, '行唐', NULL, NULL, 'X', 114.552734, 38.437424, 3, 'tr_0 tr_130000 tr_130100', 15);
INSERT INTO `sys_area`
VALUES (130126, '灵寿县', 130100, '灵寿', NULL, NULL, 'L', 114.379463, 38.306545, 3, 'tr_0 tr_130000 tr_130100', 7);
INSERT INTO `sys_area`
VALUES (130127, '高邑县', 130100, '高邑', NULL, NULL, 'G', 114.610703, 37.605713, 3, 'tr_0 tr_130000 tr_130100', 3);
INSERT INTO `sys_area`
VALUES (130128, '深泽县', 130100, '深泽', NULL, NULL, 'S', 115.200211, 38.184540, 3, 'tr_0 tr_130000 tr_130100', 13);
INSERT INTO `sys_area`
VALUES (130129, '赞皇县', 130100, '赞皇', NULL, NULL, 'Z', 114.387756, 37.660198, 3, 'tr_0 tr_130000 tr_130100', 21);
INSERT INTO `sys_area`
VALUES (130130, '无极县', 130100, '无极', NULL, NULL, 'W', 114.977844, 38.176376, 3, 'tr_0 tr_130000 tr_130100', 14);
INSERT INTO `sys_area`
VALUES (130131, '平山县', 130100, '平山', NULL, NULL, 'P', 114.184143, 38.259312, 3, 'tr_0 tr_130000 tr_130100', 10);
INSERT INTO `sys_area`
VALUES (130132, '元氏县', 130100, '元氏', NULL, NULL, 'Y', 114.526176, 37.762512, 3, 'tr_0 tr_130000 tr_130100', 19);
INSERT INTO `sys_area`
VALUES (130133, '赵县', 130100, '赵县', NULL, NULL, 'Z', 114.775360, 37.754341, 3, 'tr_0 tr_130000 tr_130100', 22);
INSERT INTO `sys_area`
VALUES (130181, '辛集市', 130100, '辛集', NULL, NULL, 'X', 115.217453, 37.929039, 3, 'tr_0 tr_130000 tr_130100', 17);
INSERT INTO `sys_area`
VALUES (130182, '藁城市', 130100, '藁城', NULL, NULL, 'Z', 114.849648, 38.033768, 3, 'tr_0 tr_130000 tr_130100', 2);
INSERT INTO `sys_area`
VALUES (130183, '晋州市', 130100, '晋州', NULL, NULL, 'J', 115.044884, 38.027477, 3, 'tr_0 tr_130000 tr_130100', 6);
INSERT INTO `sys_area`
VALUES (130184, '新乐市', 130100, '新乐', NULL, NULL, 'X', 114.685783, 38.344769, 3, 'tr_0 tr_130000 tr_130100', 18);
INSERT INTO `sys_area`
VALUES (130185, '鹿泉市', 130100, '鹿泉', NULL, NULL, 'L', 114.321022, 38.093994, 3, 'tr_0 tr_130000 tr_130100', 9);
INSERT INTO `sys_area`
VALUES (130200, '唐山市', 130000, '唐山', NULL, NULL, 'T', 118.175392, 39.635113, 2, 'tr_0 tr_130000', 9);
INSERT INTO `sys_area`
VALUES (130202, '路南区', 130200, '路南', NULL, NULL, 'L', 118.210823, 39.615162, 3, 'tr_0 tr_130000 tr_130200', 10);
INSERT INTO `sys_area`
VALUES (130203, '路北区', 130200, '路北', NULL, NULL, 'L', 118.174736, 39.628536, 3, 'tr_0 tr_130000 tr_130200', 9);
INSERT INTO `sys_area`
VALUES (130204, '古冶区', 130200, '古冶', NULL, NULL, 'G', 118.454292, 39.715736, 3, 'tr_0 tr_130000 tr_130200', 4);
INSERT INTO `sys_area`
VALUES (130205, '开平区', 130200, '开平', NULL, NULL, 'K', 118.264427, 39.676170, 3, 'tr_0 tr_130000 tr_130200', 5);
INSERT INTO `sys_area`
VALUES (130207, '丰南区', 130200, '丰南', NULL, NULL, 'F', 118.110794, 39.563030, 3, 'tr_0 tr_130000 tr_130200', 2);
INSERT INTO `sys_area`
VALUES (130208, '丰润区', 130200, '丰润', NULL, NULL, 'F', 118.155777, 39.831364, 3, 'tr_0 tr_130000 tr_130200', 3);
INSERT INTO `sys_area`
VALUES (130223, '滦县', 130200, '滦县', NULL, NULL, 'L', 118.699547, 39.744850, 3, 'tr_0 tr_130000 tr_130200', 8);
INSERT INTO `sys_area`
VALUES (130224, '滦南县', 130200, '滦南', NULL, NULL, 'L', 118.681549, 39.506203, 3, 'tr_0 tr_130000 tr_130200', 7);
INSERT INTO `sys_area`
VALUES (130225, '乐亭县', 130200, '乐亭', NULL, NULL, 'L', 118.905342, 39.428131, 3, 'tr_0 tr_130000 tr_130200', 6);
INSERT INTO `sys_area`
VALUES (130227, '迁西县', 130200, '迁西', NULL, NULL, 'Q', 118.305138, 40.146236, 3, 'tr_0 tr_130000 tr_130200', 12);
INSERT INTO `sys_area`
VALUES (130229, '玉田县', 130200, '玉田', NULL, NULL, 'Y', 117.753662, 39.887321, 3, 'tr_0 tr_130000 tr_130200', 13);
INSERT INTO `sys_area`
VALUES (130230, '曹妃甸区', 130200, '曹妃甸', NULL, NULL, 'C', 118.446587, 39.278278, 3, 'tr_0 tr_130000 tr_130200', 1);
INSERT INTO `sys_area`
VALUES (130281, '遵化市', 130200, '遵化', NULL, NULL, 'Z', 117.965874, 40.188618, 3, 'tr_0 tr_130000 tr_130200', 14);
INSERT INTO `sys_area`
VALUES (130283, '迁安市', 130200, '迁安', NULL, NULL, 'Q', 118.701935, 40.012108, 3, 'tr_0 tr_130000 tr_130200', 11);
INSERT INTO `sys_area`
VALUES (130300, '秦皇岛市', 130000, '秦皇岛', NULL, NULL, 'Q', 119.586578, 39.942532, 2, 'tr_0 tr_130000', 7);
INSERT INTO `sys_area`
VALUES (130302, '海港区', 130300, '海港', NULL, NULL, 'H', 119.596222, 39.943459, 3, 'tr_0 tr_130000 tr_130300', 4);
INSERT INTO `sys_area`
VALUES (130303, '山海关区', 130300, '山海关', NULL, NULL, 'S', 119.753593, 39.998024, 3, 'tr_0 tr_130000 tr_130300', 7);
INSERT INTO `sys_area`
VALUES (130304, '北戴河区', 130300, '北戴河', NULL, NULL, 'B', 119.486282, 39.825123, 3, 'tr_0 tr_130000 tr_130300', 1);
INSERT INTO `sys_area`
VALUES (130321, '青龙满族自治县', 130300, '青龙', NULL, NULL, 'Q', 118.954552, 40.406021, 3, 'tr_0 tr_130000 tr_130300', 6);
INSERT INTO `sys_area`
VALUES (130322, '昌黎县', 130300, '昌黎', NULL, NULL, 'C', 119.164543, 39.709728, 3, 'tr_0 tr_130000 tr_130300', 2);
INSERT INTO `sys_area`
VALUES (130323, '抚宁县', 130300, '抚宁', NULL, NULL, 'F', 119.240654, 39.887054, 3, 'tr_0 tr_130000 tr_130300', 3);
INSERT INTO `sys_area`
VALUES (130324, '卢龙县', 130300, '卢龙', NULL, NULL, 'L', 118.881805, 39.891640, 3, 'tr_0 tr_130000 tr_130300', 5);
INSERT INTO `sys_area`
VALUES (130400, '邯郸市', 130000, '邯郸', NULL, NULL, 'H', 114.490685, 36.612274, 2, 'tr_0 tr_130000', 4);
INSERT INTO `sys_area`
VALUES (130402, '邯山区', 130400, '邯山', NULL, NULL, 'H', 114.484985, 36.603195, 3, 'tr_0 tr_130000 tr_130400', 11);
INSERT INTO `sys_area`
VALUES (130403, '丛台区', 130400, '丛台', NULL, NULL, 'C', 114.494705, 36.611080, 3, 'tr_0 tr_130000 tr_130400', 3);
INSERT INTO `sys_area`
VALUES (130404, '复兴区', 130400, '复兴', NULL, NULL, 'F', 114.458244, 36.615482, 3, 'tr_0 tr_130000 tr_130400', 7);
INSERT INTO `sys_area`
VALUES (130406, '峰峰矿区', 130400, '峰峰矿', NULL, NULL, 'F', 114.209938, 36.420486, 3, 'tr_0 tr_130000 tr_130400', 6);
INSERT INTO `sys_area`
VALUES (130421, '邯郸县', 130400, '邯郸', NULL, NULL, 'H', 114.531082, 36.593906, 3, 'tr_0 tr_130000 tr_130400', 10);
INSERT INTO `sys_area`
VALUES (130423, '临漳县', 130400, '临漳', NULL, NULL, 'L', 114.610703, 36.337605, 3, 'tr_0 tr_130000 tr_130400', 13);
INSERT INTO `sys_area`
VALUES (130424, '成安县', 130400, '成安', NULL, NULL, 'C', 114.680359, 36.443832, 3, 'tr_0 tr_130000 tr_130400', 1);
INSERT INTO `sys_area`
VALUES (130425, '大名县', 130400, '大名', NULL, NULL, 'D', 115.152588, 36.283318, 3, 'tr_0 tr_130000 tr_130400', 4);
INSERT INTO `sys_area`
VALUES (130426, '涉县', 130400, '涉县', NULL, NULL, 'S', 113.673294, 36.563145, 3, 'tr_0 tr_130000 tr_130400', 16);
INSERT INTO `sys_area`
VALUES (130427, '磁县', 130400, '磁县', NULL, NULL, 'C', 114.382080, 36.367672, 3, 'tr_0 tr_130000 tr_130400', 2);
INSERT INTO `sys_area`
VALUES (130428, '肥乡县', 130400, '肥乡', NULL, NULL, 'F', 114.805153, 36.555779, 3, 'tr_0 tr_130000 tr_130400', 5);
INSERT INTO `sys_area`
VALUES (130429, '永年县', 130400, '永年', NULL, NULL, 'Y', 114.496162, 36.776413, 3, 'tr_0 tr_130000 tr_130400', 19);
INSERT INTO `sys_area`
VALUES (130430, '邱县', 130400, '邱县', NULL, NULL, 'Q', 115.168587, 36.813251, 3, 'tr_0 tr_130000 tr_130400', 14);
INSERT INTO `sys_area`
VALUES (130431, '鸡泽县', 130400, '鸡泽', NULL, NULL, 'J', 114.878517, 36.914909, 3, 'tr_0 tr_130000 tr_130400', 12);
INSERT INTO `sys_area`
VALUES (130432, '广平县', 130400, '广平', NULL, NULL, 'G', 114.950859, 36.483604, 3, 'tr_0 tr_130000 tr_130400', 8);
INSERT INTO `sys_area`
VALUES (130433, '馆陶县', 130400, '馆陶', NULL, NULL, 'G', 115.289055, 36.539459, 3, 'tr_0 tr_130000 tr_130400', 9);
INSERT INTO `sys_area`
VALUES (130434, '魏县', 130400, '魏县', NULL, NULL, 'W', 114.934113, 36.354248, 3, 'tr_0 tr_130000 tr_130400', 17);
INSERT INTO `sys_area`
VALUES (130435, '曲周县', 130400, '曲周', NULL, NULL, 'Q', 114.957588, 36.773399, 3, 'tr_0 tr_130000 tr_130400', 15);
INSERT INTO `sys_area`
VALUES (130481, '武安市', 130400, '武安', NULL, NULL, 'W', 114.194580, 36.696114, 3, 'tr_0 tr_130000 tr_130400', 18);
INSERT INTO `sys_area`
VALUES (130500, '邢台市', 130000, '邢台', NULL, NULL, 'X', 114.508850, 37.068199, 2, 'tr_0 tr_130000', 10);
INSERT INTO `sys_area`
VALUES (130502, '桥东区', 130500, '桥东', NULL, NULL, 'Q', 114.507133, 37.064125, 3, 'tr_0 tr_130000 tr_130500', 12);
INSERT INTO `sys_area`
VALUES (130503, '桥西区', 130500, '桥西', NULL, NULL, 'Q', 114.473686, 37.068008, 3, 'tr_0 tr_130000 tr_130500', 13);
INSERT INTO `sys_area`
VALUES (130521, '邢台县', 130500, '邢台', NULL, NULL, 'X', 114.561134, 37.050732, 3, 'tr_0 tr_130000 tr_130500', 18);
INSERT INTO `sys_area`
VALUES (130522, '临城县', 130500, '临城', NULL, NULL, 'L', 114.506874, 37.444008, 3, 'tr_0 tr_130000 tr_130500', 4);
INSERT INTO `sys_area`
VALUES (130523, '内丘县', 130500, '内丘', NULL, NULL, 'N', 114.511520, 37.287663, 3, 'tr_0 tr_130000 tr_130500', 9);
INSERT INTO `sys_area`
VALUES (130524, '柏乡县', 130500, '柏乡', NULL, NULL, 'B', 114.693382, 37.483597, 3, 'tr_0 tr_130000 tr_130500', 1);
INSERT INTO `sys_area`
VALUES (130525, '隆尧县', 130500, '隆尧', NULL, NULL, 'L', 114.776344, 37.350925, 3, 'tr_0 tr_130000 tr_130500', 6);
INSERT INTO `sys_area`
VALUES (130526, '任县', 130500, '任县', NULL, NULL, 'R', 114.684471, 37.129951, 3, 'tr_0 tr_130000 tr_130500', 15);
INSERT INTO `sys_area`
VALUES (130527, '南和县', 130500, '南和', NULL, NULL, 'N', 114.691376, 37.003811, 3, 'tr_0 tr_130000 tr_130500', 8);
INSERT INTO `sys_area`
VALUES (130528, '宁晋县', 130500, '宁晋', NULL, NULL, 'N', 114.921028, 37.618958, 3, 'tr_0 tr_130000 tr_130500', 10);
INSERT INTO `sys_area`
VALUES (130529, '巨鹿县', 130500, '巨鹿', NULL, NULL, 'J', 115.038780, 37.217682, 3, 'tr_0 tr_130000 tr_130500', 3);
INSERT INTO `sys_area`
VALUES (130530, '新河县', 130500, '新河', NULL, NULL, 'X', 115.247536, 37.526215, 3, 'tr_0 tr_130000 tr_130500', 19);
INSERT INTO `sys_area`
VALUES (130531, '广宗县', 130500, '广宗', NULL, NULL, 'G', 115.142799, 37.075546, 3, 'tr_0 tr_130000 tr_130500', 2);
INSERT INTO `sys_area`
VALUES (130532, '平乡县', 130500, '平乡', NULL, NULL, 'P', 115.029221, 37.069405, 3, 'tr_0 tr_130000 tr_130500', 11);
INSERT INTO `sys_area`
VALUES (130533, '威县', 130500, '威县', NULL, NULL, 'W', 115.272751, 36.983273, 3, 'tr_0 tr_130000 tr_130500', 17);
INSERT INTO `sys_area`
VALUES (130534, '清河县', 130500, '清河', NULL, NULL, 'Q', 115.668999, 37.059990, 3, 'tr_0 tr_130000 tr_130500', 14);
INSERT INTO `sys_area`
VALUES (130535, '临西县', 130500, '临西', NULL, NULL, 'L', 115.498688, 36.864201, 3, 'tr_0 tr_130000 tr_130500', 5);
INSERT INTO `sys_area`
VALUES (130581, '南宫市', 130500, '南宫', NULL, NULL, 'N', 115.398102, 37.359669, 3, 'tr_0 tr_130000 tr_130500', 7);
INSERT INTO `sys_area`
VALUES (130582, '沙河市', 130500, '沙河', NULL, NULL, 'S', 114.504906, 36.861904, 3, 'tr_0 tr_130000 tr_130500', 16);
INSERT INTO `sys_area`
VALUES (130600, '保定市', 130000, '保定', NULL, NULL, 'B', 115.482330, 38.867657, 2, 'tr_0 tr_130000', 1);
INSERT INTO `sys_area`
VALUES (130602, '新市区', 130600, '新市', NULL, NULL, 'X', 115.470657, 38.886620, 3, 'tr_0 tr_130000 tr_130600', 21);
INSERT INTO `sys_area`
VALUES (130603, '北市区', 130600, '北市', NULL, NULL, 'B', 115.500931, 38.865005, 3, 'tr_0 tr_130000 tr_130600', 3);
INSERT INTO `sys_area`
VALUES (130604, '南市区', 130600, '南市', NULL, NULL, 'N', 115.498672, 38.856701, 3, 'tr_0 tr_130000 tr_130600', 14);
INSERT INTO `sys_area`
VALUES (130621, '满城县', 130600, '满城', NULL, NULL, 'M', 115.324417, 38.951382, 3, 'tr_0 tr_130000 tr_130600', 13);
INSERT INTO `sys_area`
VALUES (130622, '清苑县', 130600, '清苑', NULL, NULL, 'Q', 115.492218, 38.771011, 3, 'tr_0 tr_130000 tr_130600', 15);
INSERT INTO `sys_area`
VALUES (130623, '涞水县', 130600, '涞水', NULL, NULL, 'Z', 115.711983, 39.393147, 3, 'tr_0 tr_130000 tr_130600', 10);
INSERT INTO `sys_area`
VALUES (130624, '阜平县', 130600, '阜平', NULL, NULL, 'F', 114.198799, 38.847275, 3, 'tr_0 tr_130000 tr_130600', 7);
INSERT INTO `sys_area`
VALUES (130625, '徐水县', 130600, '徐水', NULL, NULL, 'X', 115.649406, 39.020393, 3, 'tr_0 tr_130000 tr_130600', 23);
INSERT INTO `sys_area`
VALUES (130626, '定兴县', 130600, '定兴', NULL, NULL, 'D', 115.796898, 39.266193, 3, 'tr_0 tr_130000 tr_130600', 5);
INSERT INTO `sys_area`
VALUES (130627, '唐县', 130600, '唐县', NULL, NULL, 'T', 114.981239, 38.748543, 3, 'tr_0 tr_130000 tr_130600', 19);
INSERT INTO `sys_area`
VALUES (130628, '高阳县', 130600, '高阳', NULL, NULL, 'G', 115.778877, 38.690090, 3, 'tr_0 tr_130000 tr_130600', 9);
INSERT INTO `sys_area`
VALUES (130629, '容城县', 130600, '容城', NULL, NULL, 'R', 115.866249, 39.052818, 3, 'tr_0 tr_130000 tr_130600', 17);
INSERT INTO `sys_area`
VALUES (130630, '涞源县', 130600, '涞源', NULL, NULL, 'Z', 114.692566, 39.357552, 3, 'tr_0 tr_130000 tr_130600', 11);
INSERT INTO `sys_area`
VALUES (130631, '望都县', 130600, '望都', NULL, NULL, 'W', 115.154007, 38.707447, 3, 'tr_0 tr_130000 tr_130600', 20);
INSERT INTO `sys_area`
VALUES (130632, '安新县', 130600, '安新', NULL, NULL, 'A', 115.931976, 38.929913, 3, 'tr_0 tr_130000 tr_130600', 2);
INSERT INTO `sys_area`
VALUES (130633, '易县', 130600, '易县', NULL, NULL, 'Y', 115.501144, 39.352970, 3, 'tr_0 tr_130000 tr_130600', 24);
INSERT INTO `sys_area`
VALUES (130634, '曲阳县', 130600, '曲阳', NULL, NULL, 'Q', 114.704056, 38.619991, 3, 'tr_0 tr_130000 tr_130600', 16);
INSERT INTO `sys_area`
VALUES (130635, '蠡县', 130600, '蠡县', NULL, NULL, 'Z', 115.583633, 38.496429, 3, 'tr_0 tr_130000 tr_130600', 12);
INSERT INTO `sys_area`
VALUES (130636, '顺平县', 130600, '顺平', NULL, NULL, 'S', 115.132751, 38.845127, 3, 'tr_0 tr_130000 tr_130600', 18);
INSERT INTO `sys_area`
VALUES (130637, '博野县', 130600, '博野', NULL, NULL, 'B', 115.461800, 38.458271, 3, 'tr_0 tr_130000 tr_130600', 4);
INSERT INTO `sys_area`
VALUES (130638, '雄县', 130600, '雄县', NULL, NULL, 'X', 116.107475, 38.990818, 3, 'tr_0 tr_130000 tr_130600', 22);
INSERT INTO `sys_area`
VALUES (130681, '涿州市', 130600, '涿州', NULL, NULL, 'Z', 115.973412, 39.485764, 3, 'tr_0 tr_130000 tr_130600', 25);
INSERT INTO `sys_area`
VALUES (130682, '定州市', 130600, '定州', NULL, NULL, 'D', 114.991386, 38.517601, 3, 'tr_0 tr_130000 tr_130600', 6);
INSERT INTO `sys_area`
VALUES (130683, '安国市', 130600, '安国', NULL, NULL, 'A', 115.331413, 38.421368, 3, 'tr_0 tr_130000 tr_130600', 1);
INSERT INTO `sys_area`
VALUES (130684, '高碑店市', 130600, '高碑店', NULL, NULL, 'G', 115.882706, 39.327690, 3, 'tr_0 tr_130000 tr_130600', 8);
INSERT INTO `sys_area`
VALUES (130700, '张家口市', 130000, '张家口', NULL, NULL, 'Z', 114.884094, 40.811901, 2, 'tr_0 tr_130000', 11);
INSERT INTO `sys_area`
VALUES (130702, '桥东区', 130700, '桥东', NULL, NULL, 'Q', 114.885658, 40.813873, 3, 'tr_0 tr_130000 tr_130700', 7);
INSERT INTO `sys_area`
VALUES (130703, '桥西区', 130700, '桥西', NULL, NULL, 'Q', 114.882126, 40.824387, 3, 'tr_0 tr_130000 tr_130700', 8);
INSERT INTO `sys_area`
VALUES (130705, '宣化区', 130700, '宣化区', NULL, NULL, 'X', 115.063202, 40.609367, 3, 'tr_0 tr_130000 tr_130700', 12);
INSERT INTO `sys_area`
VALUES (130706, '下花园区', 130700, '下花园', NULL, NULL, 'X', 115.280998, 40.488644, 3, 'tr_0 tr_130000 tr_130700', 11);
INSERT INTO `sys_area`
VALUES (130721, '宣化县', 130700, '宣化县', NULL, NULL, 'X', 115.033081, 40.562210, 3, 'tr_0 tr_130000 tr_130700', 13);
INSERT INTO `sys_area`
VALUES (130722, '张北县', 130700, '张北', NULL, NULL, 'Z', 114.715950, 41.151714, 3, 'tr_0 tr_130000 tr_130700', 16);
INSERT INTO `sys_area`
VALUES (130723, '康保县', 130700, '康保', NULL, NULL, 'K', 114.615807, 41.850044, 3, 'tr_0 tr_130000 tr_130700', 6);
INSERT INTO `sys_area`
VALUES (130724, '沽源县', 130700, '沽源', NULL, NULL, 'G', 115.684837, 41.667419, 3, 'tr_0 tr_130000 tr_130700', 3);
INSERT INTO `sys_area`
VALUES (130725, '尚义县', 130700, '尚义', NULL, NULL, 'S', 113.977715, 41.080090, 3, 'tr_0 tr_130000 tr_130700', 9);
INSERT INTO `sys_area`
VALUES (130726, '蔚县', 130700, '蔚县', NULL, NULL, 'W', 114.582695, 39.837181, 3, 'tr_0 tr_130000 tr_130700', 15);
INSERT INTO `sys_area`
VALUES (130727, '阳原县', 130700, '阳原', NULL, NULL, 'Y', 114.167343, 40.113419, 3, 'tr_0 tr_130000 tr_130700', 14);
INSERT INTO `sys_area`
VALUES (130728, '怀安县', 130700, '怀安', NULL, NULL, 'H', 114.422363, 40.671272, 3, 'tr_0 tr_130000 tr_130700', 4);
INSERT INTO `sys_area`
VALUES (130729, '万全县', 130700, '万全', NULL, NULL, 'W', 114.736130, 40.765137, 3, 'tr_0 tr_130000 tr_130700', 10);
INSERT INTO `sys_area`
VALUES (130730, '怀来县', 130700, '怀来', NULL, NULL, 'H', 115.520844, 40.405403, 3, 'tr_0 tr_130000 tr_130700', 5);
INSERT INTO `sys_area`
VALUES (130731, '涿鹿县', 130700, '涿鹿', NULL, NULL, 'Z', 115.219246, 40.378700, 3, 'tr_0 tr_130000 tr_130700', 17);
INSERT INTO `sys_area`
VALUES (130732, '赤城县', 130700, '赤城', NULL, NULL, 'C', 115.832710, 40.912083, 3, 'tr_0 tr_130000 tr_130700', 1);
INSERT INTO `sys_area`
VALUES (130733, '崇礼县', 130700, '崇礼', NULL, NULL, 'C', 115.281654, 40.971302, 3, 'tr_0 tr_130000 tr_130700', 2);
INSERT INTO `sys_area`
VALUES (130800, '承德市', 130000, '承德', NULL, NULL, 'C', 117.939156, 40.976204, 2, 'tr_0 tr_130000', 3);
INSERT INTO `sys_area`
VALUES (130802, '双桥区', 130800, '双桥', NULL, NULL, 'S', 117.939156, 40.976204, 3, 'tr_0 tr_130000 tr_130800', 8);
INSERT INTO `sys_area`
VALUES (130803, '双滦区', 130800, '双滦', NULL, NULL, 'S', 117.797485, 40.959755, 3, 'tr_0 tr_130000 tr_130800', 7);
INSERT INTO `sys_area`
VALUES (130804, '鹰手营子矿区', 130800, '鹰手营子矿', NULL, NULL, 'Y', 117.661156, 40.546955, 3, 'tr_0 tr_130000 tr_130800', 11);
INSERT INTO `sys_area`
VALUES (130821, '承德县', 130800, '承德', NULL, NULL, 'C', 118.172493, 40.768639, 3, 'tr_0 tr_130000 tr_130800', 1);
INSERT INTO `sys_area`
VALUES (130822, '兴隆县', 130800, '兴隆', NULL, NULL, 'X', 117.507095, 40.418526, 3, 'tr_0 tr_130000 tr_130800', 10);
INSERT INTO `sys_area`
VALUES (130823, '平泉县', 130800, '平泉', NULL, NULL, 'P', 118.690239, 41.005611, 3, 'tr_0 tr_130000 tr_130800', 6);
INSERT INTO `sys_area`
VALUES (130824, '滦平县', 130800, '滦平', NULL, NULL, 'L', 117.337128, 40.936646, 3, 'tr_0 tr_130000 tr_130800', 5);
INSERT INTO `sys_area`
VALUES (130825, '隆化县', 130800, '隆化', NULL, NULL, 'L', 117.736343, 41.316666, 3, 'tr_0 tr_130000 tr_130800', 4);
INSERT INTO `sys_area`
VALUES (130826, '丰宁满族自治县', 130800, '丰宁', NULL, NULL, 'F', 116.651207, 41.209904, 3, 'tr_0 tr_130000 tr_130800', 2);
INSERT INTO `sys_area`
VALUES (130827, '宽城满族自治县', 130800, '宽城', NULL, NULL, 'K', 118.488640, 40.607983, 3, 'tr_0 tr_130000 tr_130800', 3);
INSERT INTO `sys_area`
VALUES (130828, '围场满族蒙古族自治县', 130800, '围场', NULL, NULL, 'W', 117.764084, 41.949406, 3, 'tr_0 tr_130000 tr_130800', 9);
INSERT INTO `sys_area`
VALUES (130900, '沧州市', 130000, '沧州', NULL, NULL, 'C', 116.857460, 38.310581, 2, 'tr_0 tr_130000', 2);
INSERT INTO `sys_area`
VALUES (130902, '新华区', 130900, '新华', NULL, NULL, 'X', 116.873047, 38.308273, 3, 'tr_0 tr_130000 tr_130900', 14);
INSERT INTO `sys_area`
VALUES (130903, '运河区', 130900, '运河', NULL, NULL, 'Y', 116.840065, 38.307404, 3, 'tr_0 tr_130000 tr_130900', 16);
INSERT INTO `sys_area`
VALUES (130921, '沧县', 130900, '沧县', NULL, NULL, 'C', 117.007477, 38.219856, 3, 'tr_0 tr_130000 tr_130900', 2);
INSERT INTO `sys_area`
VALUES (130922, '青县', 130900, '青县', NULL, NULL, 'Q', 116.838387, 38.569645, 3, 'tr_0 tr_130000 tr_130900', 9);
INSERT INTO `sys_area`
VALUES (130923, '东光县', 130900, '东光', NULL, NULL, 'D', 116.542061, 37.886551, 3, 'tr_0 tr_130000 tr_130900', 3);
INSERT INTO `sys_area`
VALUES (130924, '海兴县', 130900, '海兴', NULL, NULL, 'H', 117.496605, 38.141582, 3, 'tr_0 tr_130000 tr_130900', 4);
INSERT INTO `sys_area`
VALUES (130925, '盐山县', 130900, '盐山', NULL, NULL, 'Y', 117.229813, 38.056141, 3, 'tr_0 tr_130000 tr_130900', 15);
INSERT INTO `sys_area`
VALUES (130926, '肃宁县', 130900, '肃宁', NULL, NULL, 'S', 115.835854, 38.427101, 3, 'tr_0 tr_130000 tr_130900', 11);
INSERT INTO `sys_area`
VALUES (130927, '南皮县', 130900, '南皮', NULL, NULL, 'N', 116.709167, 38.042439, 3, 'tr_0 tr_130000 tr_130900', 8);
INSERT INTO `sys_area`
VALUES (130928, '吴桥县', 130900, '吴桥', NULL, NULL, 'W', 116.391510, 37.628181, 3, 'tr_0 tr_130000 tr_130900', 12);
INSERT INTO `sys_area`
VALUES (130929, '献县', 130900, '献县', NULL, NULL, 'X', 116.123840, 38.189659, 3, 'tr_0 tr_130000 tr_130900', 13);
INSERT INTO `sys_area`
VALUES (130930, '孟村回族自治县', 130900, '孟村', NULL, NULL, 'M', 117.105103, 38.057953, 3, 'tr_0 tr_130000 tr_130900', 7);
INSERT INTO `sys_area`
VALUES (130981, '泊头市', 130900, '泊头', NULL, NULL, 'B', 116.570160, 38.073479, 3, 'tr_0 tr_130000 tr_130900', 1);
INSERT INTO `sys_area`
VALUES (130982, '任丘市', 130900, '任丘', NULL, NULL, 'R', 116.106766, 38.706512, 3, 'tr_0 tr_130000 tr_130900', 10);
INSERT INTO `sys_area`
VALUES (130983, '黄骅市', 130900, '黄骅', NULL, NULL, 'H', 117.343803, 38.369240, 3, 'tr_0 tr_130000 tr_130900', 6);
INSERT INTO `sys_area`
VALUES (130984, '河间市', 130900, '河间', NULL, NULL, 'H', 116.089455, 38.441490, 3, 'tr_0 tr_130000 tr_130900', 5);
INSERT INTO `sys_area`
VALUES (131000, '廊坊市', 130000, '廊坊', NULL, NULL, 'L', 116.704437, 39.523926, 2, 'tr_0 tr_130000', 6);
INSERT INTO `sys_area`
VALUES (131002, '安次区', 131000, '安次', NULL, NULL, 'A', 116.694542, 39.502567, 3, 'tr_0 tr_130000 tr_131000', 1);
INSERT INTO `sys_area`
VALUES (131003, '广阳区', 131000, '广阳', NULL, NULL, 'G', 116.713707, 39.521931, 3, 'tr_0 tr_130000 tr_131000', 5);
INSERT INTO `sys_area`
VALUES (131022, '固安县', 131000, '固安', NULL, NULL, 'G', 116.299896, 39.436466, 3, 'tr_0 tr_130000 tr_131000', 6);
INSERT INTO `sys_area`
VALUES (131023, '永清县', 131000, '永清', NULL, NULL, 'Y', 116.498093, 39.319717, 3, 'tr_0 tr_130000 tr_131000', 10);
INSERT INTO `sys_area`
VALUES (131024, '香河县', 131000, '香河', NULL, NULL, 'X', 117.007164, 39.757214, 3, 'tr_0 tr_130000 tr_131000', 9);
INSERT INTO `sys_area`
VALUES (131025, '大城县', 131000, '大城', NULL, NULL, 'D', 116.640732, 38.699215, 3, 'tr_0 tr_130000 tr_131000', 4);
INSERT INTO `sys_area`
VALUES (131026, '文安县', 131000, '文安', NULL, NULL, 'W', 116.460106, 38.866802, 3, 'tr_0 tr_130000 tr_131000', 8);
INSERT INTO `sys_area`
VALUES (131028, '大厂回族自治县', 131000, '大厂', NULL, NULL, 'D', 116.986504, 39.889267, 3, 'tr_0 tr_130000 tr_131000', 3);
INSERT INTO `sys_area`
VALUES (131081, '霸州市', 131000, '霸州', NULL, NULL, 'B', 116.392021, 39.117332, 3, 'tr_0 tr_130000 tr_131000', 2);
INSERT INTO `sys_area`
VALUES (131082, '三河市', 131000, '三河', NULL, NULL, 'S', 117.077019, 39.982777, 3, 'tr_0 tr_130000 tr_131000', 7);
INSERT INTO `sys_area`
VALUES (131100, '衡水市', 130000, '衡水', NULL, NULL, 'H', 115.665993, 37.735096, 2, 'tr_0 tr_130000', 5);
INSERT INTO `sys_area`
VALUES (131102, '桃城区', 131100, '桃城', NULL, NULL, 'T', 115.694946, 37.732239, 3, 'tr_0 tr_130000 tr_131100', 8);
INSERT INTO `sys_area`
VALUES (131121, '枣强县', 131100, '枣强', NULL, NULL, 'Z', 115.726501, 37.511513, 3, 'tr_0 tr_130000 tr_131100', 11);
INSERT INTO `sys_area`
VALUES (131122, '武邑县', 131100, '武邑', NULL, NULL, 'W', 115.892418, 37.803776, 3, 'tr_0 tr_130000 tr_131100', 10);
INSERT INTO `sys_area`
VALUES (131123, '武强县', 131100, '武强', NULL, NULL, 'W', 115.970238, 38.036980, 3, 'tr_0 tr_130000 tr_131100', 9);
INSERT INTO `sys_area`
VALUES (131124, '饶阳县', 131100, '饶阳', NULL, NULL, 'R', 115.726578, 38.232670, 3, 'tr_0 tr_130000 tr_131100', 6);
INSERT INTO `sys_area`
VALUES (131125, '安平县', 131100, '安平', NULL, NULL, 'A', 115.519630, 38.233513, 3, 'tr_0 tr_130000 tr_131100', 1);
INSERT INTO `sys_area`
VALUES (131126, '故城县', 131100, '故城', NULL, NULL, 'G', 115.966743, 37.350983, 3, 'tr_0 tr_130000 tr_131100', 3);
INSERT INTO `sys_area`
VALUES (131127, '景县', 131100, '景县', NULL, NULL, 'J', 116.258446, 37.686623, 3, 'tr_0 tr_130000 tr_131100', 4);
INSERT INTO `sys_area`
VALUES (131128, '阜城县', 131100, '阜城', NULL, NULL, 'F', 116.164726, 37.869946, 3, 'tr_0 tr_130000 tr_131100', 2);
INSERT INTO `sys_area`
VALUES (131181, '冀州市', 131100, '冀州', NULL, NULL, 'J', 115.579170, 37.542789, 3, 'tr_0 tr_130000 tr_131100', 5);
INSERT INTO `sys_area`
VALUES (131182, '深州市', 131100, '深州', NULL, NULL, 'S', 115.554596, 38.003471, 3, 'tr_0 tr_130000 tr_131100', 7);
INSERT INTO `sys_area`
VALUES (140000, '山西省', 0, '山西', NULL, NULL, 'S', 112.549248, 37.857014, 1, 'tr_0', 4);
INSERT INTO `sys_area`
VALUES (140100, '太原市', 140000, '太原', NULL, NULL, 'T', 112.549248, 37.857014, 2, 'tr_0 tr_140000', 8);
INSERT INTO `sys_area`
VALUES (140105, '小店区', 140100, '小店', NULL, NULL, 'X', 112.564270, 37.817974, 3, 'tr_0 tr_140000 tr_140100', 7);
INSERT INTO `sys_area`
VALUES (140106, '迎泽区', 140100, '迎泽', NULL, NULL, 'Y', 112.558853, 37.855804, 3, 'tr_0 tr_140000 tr_140100', 10);
INSERT INTO `sys_area`
VALUES (140107, '杏花岭区', 140100, '杏花岭', NULL, NULL, 'X', 112.560745, 37.879292, 3, 'tr_0 tr_140000 tr_140100', 8);
INSERT INTO `sys_area`
VALUES (140108, '尖草坪区', 140100, '尖草坪', NULL, NULL, 'J', 112.487122, 37.939892, 3, 'tr_0 tr_140000 tr_140100', 2);
INSERT INTO `sys_area`
VALUES (140109, '万柏林区', 140100, '万柏林', NULL, NULL, 'W', 112.522255, 37.862652, 3, 'tr_0 tr_140000 tr_140100', 6);
INSERT INTO `sys_area`
VALUES (140110, '晋源区', 140100, '晋源', NULL, NULL, 'J', 112.477852, 37.715618, 3, 'tr_0 tr_140000 tr_140100', 3);
INSERT INTO `sys_area`
VALUES (140121, '清徐县', 140100, '清徐', NULL, NULL, 'Q', 112.357964, 37.607288, 3, 'tr_0 tr_140000 tr_140100', 5);
INSERT INTO `sys_area`
VALUES (140122, '阳曲县', 140100, '阳曲', NULL, NULL, 'Y', 112.673820, 38.058796, 3, 'tr_0 tr_140000 tr_140100', 9);
INSERT INTO `sys_area`
VALUES (140123, '娄烦县', 140100, '娄烦', NULL, NULL, 'L', 111.793800, 38.066036, 3, 'tr_0 tr_140000 tr_140100', 4);
INSERT INTO `sys_area`
VALUES (140181, '古交市', 140100, '古交', NULL, NULL, 'G', 112.174355, 37.908535, 3, 'tr_0 tr_140000 tr_140100', 1);
INSERT INTO `sys_area`
VALUES (140200, '大同市', 140000, '大同', NULL, NULL, 'D', 113.295258, 40.090309, 2, 'tr_0 tr_140000', 2);
INSERT INTO `sys_area`
VALUES (140202, '城区', 140200, '城区', NULL, NULL, 'C', 113.301437, 40.090511, 3, 'tr_0 tr_140000 tr_140200', 1);
INSERT INTO `sys_area`
VALUES (140203, '矿区', 140200, '矿区', NULL, NULL, 'K', 113.168655, 40.036259, 3, 'tr_0 tr_140000 tr_140200', 5);
INSERT INTO `sys_area`
VALUES (140211, '南郊区', 140200, '南郊', NULL, NULL, 'N', 113.168922, 40.018021, 3, 'tr_0 tr_140000 tr_140200', 7);
INSERT INTO `sys_area`
VALUES (140212, '新荣区', 140200, '新荣', NULL, NULL, 'X', 113.141045, 40.258270, 3, 'tr_0 tr_140000 tr_140200', 9);
INSERT INTO `sys_area`
VALUES (140221, '阳高县', 140200, '阳高', NULL, NULL, 'Y', 113.749870, 40.364925, 3, 'tr_0 tr_140000 tr_140200', 10);
INSERT INTO `sys_area`
VALUES (140222, '天镇县', 140200, '天镇', NULL, NULL, 'T', 114.091118, 40.421337, 3, 'tr_0 tr_140000 tr_140200', 8);
INSERT INTO `sys_area`
VALUES (140223, '广灵县', 140200, '广灵', NULL, NULL, 'G', 114.279251, 39.763050, 3, 'tr_0 tr_140000 tr_140200', 3);
INSERT INTO `sys_area`
VALUES (140224, '灵丘县', 140200, '灵丘', NULL, NULL, 'L', 114.235764, 39.438866, 3, 'tr_0 tr_140000 tr_140200', 6);
INSERT INTO `sys_area`
VALUES (140225, '浑源县', 140200, '浑源', NULL, NULL, 'H', 113.698090, 39.699100, 3, 'tr_0 tr_140000 tr_140200', 4);
INSERT INTO `sys_area`
VALUES (140226, '左云县', 140200, '左云', NULL, NULL, 'Z', 112.706413, 40.012875, 3, 'tr_0 tr_140000 tr_140200', 11);
INSERT INTO `sys_area`
VALUES (140227, '大同县', 140200, '大同', NULL, NULL, 'D', 113.611305, 40.039345, 3, 'tr_0 tr_140000 tr_140200', 2);
INSERT INTO `sys_area`
VALUES (140300, '阳泉市', 140000, '阳泉', NULL, NULL, 'Y', 113.583282, 37.861187, 2, 'tr_0 tr_140000', 10);
INSERT INTO `sys_area`
VALUES (140302, '城区', 140300, '城区', NULL, NULL, 'C', 113.586510, 37.860939, 3, 'tr_0 tr_140000 tr_140300', 1);
INSERT INTO `sys_area`
VALUES (140303, '矿区', 140300, '矿区', NULL, NULL, 'K', 113.559067, 37.870087, 3, 'tr_0 tr_140000 tr_140300', 3);
INSERT INTO `sys_area`
VALUES (140311, '郊区', 140300, '郊区', NULL, NULL, 'J', 113.583282, 37.861187, 3, 'tr_0 tr_140000 tr_140300', 2);
INSERT INTO `sys_area`
VALUES (140321, '平定县', 140300, '平定', NULL, NULL, 'P', 113.631050, 37.800289, 3, 'tr_0 tr_140000 tr_140300', 4);
INSERT INTO `sys_area`
VALUES (140322, '盂县', 140300, '盂县', NULL, NULL, 'Y', 113.412231, 38.086132, 3, 'tr_0 tr_140000 tr_140300', 5);
INSERT INTO `sys_area`
VALUES (140400, '长治市', 140000, '长治', NULL, NULL, 'C', 113.113556, 36.191113, 2, 'tr_0 tr_140000', 1);
INSERT INTO `sys_area`
VALUES (140421, '长治县', 140400, '长治', NULL, NULL, 'C', 113.056679, 36.052437, 3, 'tr_0 tr_140000 tr_140400', 1);
INSERT INTO `sys_area`
VALUES (140423, '襄垣县', 140400, '襄垣', NULL, NULL, 'X', 113.050095, 36.532852, 3, 'tr_0 tr_140000 tr_140400', 12);
INSERT INTO `sys_area`
VALUES (140424, '屯留县', 140400, '屯留', NULL, NULL, 'T', 112.892738, 36.314072, 3, 'tr_0 tr_140000 tr_140400', 10);
INSERT INTO `sys_area`
VALUES (140425, '平顺县', 140400, '平顺', NULL, NULL, 'P', 113.438789, 36.200203, 3, 'tr_0 tr_140000 tr_140400', 7);
INSERT INTO `sys_area`
VALUES (140426, '黎城县', 140400, '黎城', NULL, NULL, 'L', 113.387367, 36.502972, 3, 'tr_0 tr_140000 tr_140400', 5);
INSERT INTO `sys_area`
VALUES (140427, '壶关县', 140400, '壶关', NULL, NULL, 'H', 113.206139, 36.110939, 3, 'tr_0 tr_140000 tr_140400', 3);
INSERT INTO `sys_area`
VALUES (140428, '长子县', 140400, '长子', NULL, NULL, 'C', 112.884659, 36.119484, 3, 'tr_0 tr_140000 tr_140400', 13);
INSERT INTO `sys_area`
VALUES (140429, '武乡县', 140400, '武乡', NULL, NULL, 'W', 112.865303, 36.834316, 3, 'tr_0 tr_140000 tr_140400', 11);
INSERT INTO `sys_area`
VALUES (140430, '沁县', 140400, '沁县', NULL, NULL, 'Q', 112.701378, 36.757122, 3, 'tr_0 tr_140000 tr_140400', 8);
INSERT INTO `sys_area`
VALUES (140431, '沁源县', 140400, '沁源', NULL, NULL, 'Q', 112.340881, 36.500778, 3, 'tr_0 tr_140000 tr_140400', 9);
INSERT INTO `sys_area`
VALUES (140481, '潞城市', 140400, '潞城', NULL, NULL, 'L', 113.223244, 36.332233, 3, 'tr_0 tr_140000 tr_140400', 6);
INSERT INTO `sys_area`
VALUES (140482, '城区', 140400, '城区', NULL, NULL, 'C', 113.114105, 36.187897, 3, 'tr_0 tr_140000 tr_140400', 2);
INSERT INTO `sys_area`
VALUES (140483, '郊区', 140400, '郊区', NULL, NULL, 'J', 113.101212, 36.218388, 3, 'tr_0 tr_140000 tr_140400', 4);
INSERT INTO `sys_area`
VALUES (140500, '晋城市', 140000, '晋城', NULL, NULL, 'J', 112.851273, 35.497555, 2, 'tr_0 tr_140000', 3);
INSERT INTO `sys_area`
VALUES (140502, '城区', 140500, '城区', NULL, NULL, 'C', 112.853104, 35.496639, 3, 'tr_0 tr_140000 tr_140500', 1);
INSERT INTO `sys_area`
VALUES (140521, '沁水县', 140500, '沁水', NULL, NULL, 'Q', 112.187210, 35.689472, 3, 'tr_0 tr_140000 tr_140500', 4);
INSERT INTO `sys_area`
VALUES (140522, '阳城县', 140500, '阳城', NULL, NULL, 'Y', 112.422012, 35.482178, 3, 'tr_0 tr_140000 tr_140500', 5);
INSERT INTO `sys_area`
VALUES (140524, '陵川县', 140500, '陵川', NULL, NULL, 'L', 113.278877, 35.775616, 3, 'tr_0 tr_140000 tr_140500', 3);
INSERT INTO `sys_area`
VALUES (140525, '泽州县', 140500, '泽州', NULL, NULL, 'Z', 112.899139, 35.617222, 3, 'tr_0 tr_140000 tr_140500', 6);
INSERT INTO `sys_area`
VALUES (140581, '高平市', 140500, '高平', NULL, NULL, 'G', 112.930695, 35.791355, 3, 'tr_0 tr_140000 tr_140500', 2);
INSERT INTO `sys_area`
VALUES (140600, '朔州市', 140000, '朔州', NULL, NULL, 'S', 112.433388, 39.331261, 2, 'tr_0 tr_140000', 7);
INSERT INTO `sys_area`
VALUES (140602, '朔城区', 140600, '朔城', NULL, NULL, 'S', 112.428673, 39.324524, 3, 'tr_0 tr_140000 tr_140600', 4);
INSERT INTO `sys_area`
VALUES (140603, '平鲁区', 140600, '平鲁', NULL, NULL, 'P', 112.295227, 39.515602, 3, 'tr_0 tr_140000 tr_140600', 2);
INSERT INTO `sys_area`
VALUES (140621, '山阴县', 140600, '山阴', NULL, NULL, 'S', 112.816399, 39.526772, 3, 'tr_0 tr_140000 tr_140600', 3);
INSERT INTO `sys_area`
VALUES (140622, '应县', 140600, '应县', NULL, NULL, 'Y', 113.187508, 39.559189, 3, 'tr_0 tr_140000 tr_140600', 5);
INSERT INTO `sys_area`
VALUES (140623, '右玉县', 140600, '右玉', NULL, NULL, 'Y', 112.465591, 39.988811, 3, 'tr_0 tr_140000 tr_140600', 6);
INSERT INTO `sys_area`
VALUES (140624, '怀仁县', 140600, '怀仁', NULL, NULL, 'H', 113.100510, 39.820789, 3, 'tr_0 tr_140000 tr_140600', 1);
INSERT INTO `sys_area`
VALUES (140700, '晋中市', 140000, '晋中', NULL, NULL, 'J', 112.736465, 37.696495, 2, 'tr_0 tr_140000', 4);
INSERT INTO `sys_area`
VALUES (140702, '榆次区', 140700, '榆次', NULL, NULL, 'Y', 112.740059, 37.697601, 3, 'tr_0 tr_140000 tr_140700', 9);
INSERT INTO `sys_area`
VALUES (140721, '榆社县', 140700, '榆社', NULL, NULL, 'Y', 112.973518, 37.069019, 3, 'tr_0 tr_140000 tr_140700', 10);
INSERT INTO `sys_area`
VALUES (140722, '左权县', 140700, '左权', NULL, NULL, 'Z', 113.377831, 37.079674, 3, 'tr_0 tr_140000 tr_140700', 11);
INSERT INTO `sys_area`
VALUES (140723, '和顺县', 140700, '和顺', NULL, NULL, 'H', 113.572922, 37.327026, 3, 'tr_0 tr_140000 tr_140700', 1);
INSERT INTO `sys_area`
VALUES (140724, '昔阳县', 140700, '昔阳', NULL, NULL, 'X', 113.706169, 37.604370, 3, 'tr_0 tr_140000 tr_140700', 8);
INSERT INTO `sys_area`
VALUES (140725, '寿阳县', 140700, '寿阳', NULL, NULL, 'S', 113.177711, 37.891136, 3, 'tr_0 tr_140000 tr_140700', 6);
INSERT INTO `sys_area`
VALUES (140726, '太谷县', 140700, '太谷', NULL, NULL, 'T', 112.554100, 37.424595, 3, 'tr_0 tr_140000 tr_140700', 7);
INSERT INTO `sys_area`
VALUES (140727, '祁县', 140700, '祁县', NULL, NULL, 'Q', 112.330528, 37.358738, 3, 'tr_0 tr_140000 tr_140700', 5);
INSERT INTO `sys_area`
VALUES (140728, '平遥县', 140700, '平遥', NULL, NULL, 'P', 112.174057, 37.195473, 3, 'tr_0 tr_140000 tr_140700', 4);
INSERT INTO `sys_area`
VALUES (140729, '灵石县', 140700, '灵石', NULL, NULL, 'L', 111.772758, 36.847469, 3, 'tr_0 tr_140000 tr_140700', 3);
INSERT INTO `sys_area`
VALUES (140781, '介休市', 140700, '介休', NULL, NULL, 'J', 111.913857, 37.027615, 3, 'tr_0 tr_140000 tr_140700', 2);
INSERT INTO `sys_area`
VALUES (140800, '运城市', 140000, '运城', NULL, NULL, 'Y', 111.003960, 35.022778, 2, 'tr_0 tr_140000', 11);
INSERT INTO `sys_area`
VALUES (140802, '盐湖区', 140800, '盐湖', NULL, NULL, 'Y', 111.000626, 35.025642, 3, 'tr_0 tr_140000 tr_140800', 11);
INSERT INTO `sys_area`
VALUES (140821, '临猗县', 140800, '临猗', NULL, NULL, 'L', 110.774933, 35.141884, 3, 'tr_0 tr_140000 tr_140800', 4);
INSERT INTO `sys_area`
VALUES (140822, '万荣县', 140800, '万荣', NULL, NULL, 'W', 110.843559, 35.417042, 3, 'tr_0 tr_140000 tr_140800', 7);
INSERT INTO `sys_area`
VALUES (140823, '闻喜县', 140800, '闻喜', NULL, NULL, 'W', 111.220306, 35.353840, 3, 'tr_0 tr_140000 tr_140800', 8);
INSERT INTO `sys_area`
VALUES (140824, '稷山县', 140800, '稷山', NULL, NULL, 'Z', 110.978996, 35.600410, 3, 'tr_0 tr_140000 tr_140800', 3);
INSERT INTO `sys_area`
VALUES (140825, '新绛县', 140800, '新绛', NULL, NULL, 'X', 111.225204, 35.613697, 3, 'tr_0 tr_140000 tr_140800', 10);
INSERT INTO `sys_area`
VALUES (140826, '绛县', 140800, '绛县', NULL, NULL, 'Z', 111.576180, 35.490452, 3, 'tr_0 tr_140000 tr_140800', 2);
INSERT INTO `sys_area`
VALUES (140827, '垣曲县', 140800, '垣曲', NULL, NULL, 'Y', 111.670990, 35.298294, 3, 'tr_0 tr_140000 tr_140800', 13);
INSERT INTO `sys_area`
VALUES (140828, '夏县', 140800, '夏县', NULL, NULL, 'X', 111.223175, 35.140442, 3, 'tr_0 tr_140000 tr_140800', 9);
INSERT INTO `sys_area`
VALUES (140829, '平陆县', 140800, '平陆', NULL, NULL, 'P', 111.212379, 34.837257, 3, 'tr_0 tr_140000 tr_140800', 5);
INSERT INTO `sys_area`
VALUES (140830, '芮城县', 140800, '芮城', NULL, NULL, 'Z', 110.691139, 34.694771, 3, 'tr_0 tr_140000 tr_140800', 6);
INSERT INTO `sys_area`
VALUES (140881, '永济市', 140800, '永济', NULL, NULL, 'Y', 110.447983, 34.865124, 3, 'tr_0 tr_140000 tr_140800', 12);
INSERT INTO `sys_area`
VALUES (140882, '河津市', 140800, '河津', NULL, NULL, 'H', 110.710266, 35.597149, 3, 'tr_0 tr_140000 tr_140800', 1);
INSERT INTO `sys_area`
VALUES (140900, '忻州市', 140000, '忻州', NULL, NULL, 'X', 112.733536, 38.417690, 2, 'tr_0 tr_140000', 9);
INSERT INTO `sys_area`
VALUES (140902, '忻府区', 140900, '忻府', NULL, NULL, 'X', 112.734116, 38.417744, 3, 'tr_0 tr_140000 tr_140900', 13);
INSERT INTO `sys_area`
VALUES (140921, '定襄县', 140900, '定襄', NULL, NULL, 'D', 112.963234, 38.484947, 3, 'tr_0 tr_140000 tr_140900', 3);
INSERT INTO `sys_area`
VALUES (140922, '五台县', 140900, '五台', NULL, NULL, 'W', 113.259010, 38.725712, 3, 'tr_0 tr_140000 tr_140900', 11);
INSERT INTO `sys_area`
VALUES (140923, '代县', 140900, '代县', NULL, NULL, 'D', 112.962517, 39.065140, 3, 'tr_0 tr_140000 tr_140900', 2);
INSERT INTO `sys_area`
VALUES (140924, '繁峙县', 140900, '繁峙', NULL, NULL, 'F', 113.267708, 39.188103, 3, 'tr_0 tr_140000 tr_140900', 4);
INSERT INTO `sys_area`
VALUES (140925, '宁武县', 140900, '宁武', NULL, NULL, 'N', 112.307938, 39.001717, 3, 'tr_0 tr_140000 tr_140900', 8);
INSERT INTO `sys_area`
VALUES (140926, '静乐县', 140900, '静乐', NULL, NULL, 'J', 111.940231, 38.355946, 3, 'tr_0 tr_140000 tr_140900', 6);
INSERT INTO `sys_area`
VALUES (140927, '神池县', 140900, '神池', NULL, NULL, 'S', 112.200439, 39.088467, 3, 'tr_0 tr_140000 tr_140900', 10);
INSERT INTO `sys_area`
VALUES (140928, '五寨县', 140900, '五寨', NULL, NULL, 'W', 111.841019, 38.912762, 3, 'tr_0 tr_140000 tr_140900', 12);
INSERT INTO `sys_area`
VALUES (140929, '岢岚县', 140900, '岢岚', NULL, NULL, 'Z', 111.569809, 38.705624, 3, 'tr_0 tr_140000 tr_140900', 7);
INSERT INTO `sys_area`
VALUES (140930, '河曲县', 140900, '河曲', NULL, NULL, 'H', 111.146606, 39.381893, 3, 'tr_0 tr_140000 tr_140900', 5);
INSERT INTO `sys_area`
VALUES (140931, '保德县', 140900, '保德', NULL, NULL, 'B', 111.085686, 39.022575, 3, 'tr_0 tr_140000 tr_140900', 1);
INSERT INTO `sys_area`
VALUES (140932, '偏关县', 140900, '偏关', NULL, NULL, 'P', 111.500481, 39.442154, 3, 'tr_0 tr_140000 tr_140900', 9);
INSERT INTO `sys_area`
VALUES (140981, '原平市', 140900, '原平', NULL, NULL, 'Y', 112.713135, 38.729187, 3, 'tr_0 tr_140000 tr_140900', 14);
INSERT INTO `sys_area`
VALUES (141000, '临汾市', 140000, '临汾', NULL, NULL, 'L', 111.517975, 36.084148, 2, 'tr_0 tr_140000', 5);
INSERT INTO `sys_area`
VALUES (141002, '尧都区', 141000, '尧都', NULL, NULL, 'Y', 111.522942, 36.080364, 3, 'tr_0 tr_140000 tr_141000', 15);
INSERT INTO `sys_area`
VALUES (141021, '曲沃县', 141000, '曲沃', NULL, NULL, 'Q', 111.475533, 35.641388, 3, 'tr_0 tr_140000 tr_141000', 11);
INSERT INTO `sys_area`
VALUES (141022, '翼城县', 141000, '翼城', NULL, NULL, 'Y', 111.713509, 35.738621, 3, 'tr_0 tr_140000 tr_141000', 16);
INSERT INTO `sys_area`
VALUES (141023, '襄汾县', 141000, '襄汾', NULL, NULL, 'X', 111.442932, 35.876141, 3, 'tr_0 tr_140000 tr_141000', 12);
INSERT INTO `sys_area`
VALUES (141024, '洪洞县', 141000, '洪洞', NULL, NULL, 'H', 111.673691, 36.255741, 3, 'tr_0 tr_140000 tr_141000', 6);
INSERT INTO `sys_area`
VALUES (141025, '古县', 141000, '古县', NULL, NULL, 'G', 111.920204, 36.268551, 3, 'tr_0 tr_140000 tr_141000', 5);
INSERT INTO `sys_area`
VALUES (141026, '安泽县', 141000, '安泽', NULL, NULL, 'A', 112.251373, 36.146030, 3, 'tr_0 tr_140000 tr_141000', 1);
INSERT INTO `sys_area`
VALUES (141027, '浮山县', 141000, '浮山', NULL, NULL, 'F', 111.850037, 35.971359, 3, 'tr_0 tr_140000 tr_141000', 4);
INSERT INTO `sys_area`
VALUES (141028, '吉县', 141000, '吉县', NULL, NULL, 'J', 110.682854, 36.099354, 3, 'tr_0 tr_140000 tr_141000', 9);
INSERT INTO `sys_area`
VALUES (141029, '乡宁县', 141000, '乡宁', NULL, NULL, 'X', 110.857368, 35.975403, 3, 'tr_0 tr_140000 tr_141000', 13);
INSERT INTO `sys_area`
VALUES (141030, '大宁县', 141000, '大宁', NULL, NULL, 'D', 110.751282, 36.463829, 3, 'tr_0 tr_140000 tr_141000', 2);
INSERT INTO `sys_area`
VALUES (141031, '隰县', 141000, '隰县', NULL, NULL, 'Z', 110.935806, 36.692677, 3, 'tr_0 tr_140000 tr_141000', 14);
INSERT INTO `sys_area`
VALUES (141032, '永和县', 141000, '永和', NULL, NULL, 'Y', 110.631279, 36.760612, 3, 'tr_0 tr_140000 tr_141000', 17);
INSERT INTO `sys_area`
VALUES (141033, '蒲县', 141000, '蒲县', NULL, NULL, 'P', 111.097328, 36.411682, 3, 'tr_0 tr_140000 tr_141000', 10);
INSERT INTO `sys_area`
VALUES (141034, '汾西县', 141000, '汾西', NULL, NULL, 'F', 111.563019, 36.653370, 3, 'tr_0 tr_140000 tr_141000', 3);
INSERT INTO `sys_area`
VALUES (141081, '侯马市', 141000, '侯马', NULL, NULL, 'H', 111.371269, 35.620300, 3, 'tr_0 tr_140000 tr_141000', 7);
INSERT INTO `sys_area`
VALUES (141082, '霍州市', 141000, '霍州', NULL, NULL, 'H', 111.723106, 36.572021, 3, 'tr_0 tr_140000 tr_141000', 8);
INSERT INTO `sys_area`
VALUES (141100, '吕梁市', 140000, '吕梁', NULL, NULL, 'L', 111.134338, 37.524364, 2, 'tr_0 tr_140000', 6);
INSERT INTO `sys_area`
VALUES (141102, '离石区', 141100, '离石', NULL, NULL, 'L', 111.134460, 37.524036, 3, 'tr_0 tr_140000 tr_141100', 7);
INSERT INTO `sys_area`
VALUES (141121, '文水县', 141100, '文水', NULL, NULL, 'W', 112.032593, 37.436314, 3, 'tr_0 tr_140000 tr_141100', 10);
INSERT INTO `sys_area`
VALUES (141122, '交城县', 141100, '交城', NULL, NULL, 'J', 112.159157, 37.555157, 3, 'tr_0 tr_140000 tr_141100', 3);
INSERT INTO `sys_area`
VALUES (141123, '兴县', 141100, '兴县', NULL, NULL, 'X', 111.124817, 38.464134, 3, 'tr_0 tr_140000 tr_141100', 12);
INSERT INTO `sys_area`
VALUES (141124, '临县', 141100, '临县', NULL, NULL, 'L', 110.995964, 37.960808, 3, 'tr_0 tr_140000 tr_141100', 6);
INSERT INTO `sys_area`
VALUES (141125, '柳林县', 141100, '柳林', NULL, NULL, 'L', 110.896133, 37.431664, 3, 'tr_0 tr_140000 tr_141100', 8);
INSERT INTO `sys_area`
VALUES (141126, '石楼县', 141100, '石楼', NULL, NULL, 'S', 110.837120, 36.999428, 3, 'tr_0 tr_140000 tr_141100', 9);
INSERT INTO `sys_area`
VALUES (141127, '岚县', 141100, '岚县', NULL, NULL, 'Z', 111.671555, 38.278652, 3, 'tr_0 tr_140000 tr_141100', 5);
INSERT INTO `sys_area`
VALUES (141128, '方山县', 141100, '方山', NULL, NULL, 'F', 111.238884, 37.892632, 3, 'tr_0 tr_140000 tr_141100', 1);
INSERT INTO `sys_area`
VALUES (141129, '中阳县', 141100, '中阳', NULL, NULL, 'Z', 111.193321, 37.342052, 3, 'tr_0 tr_140000 tr_141100', 13);
INSERT INTO `sys_area`
VALUES (141130, '交口县', 141100, '交口', NULL, NULL, 'J', 111.183189, 36.983067, 3, 'tr_0 tr_140000 tr_141100', 4);
INSERT INTO `sys_area`
VALUES (141181, '孝义市', 141100, '孝义', NULL, NULL, 'X', 111.781570, 37.144474, 3, 'tr_0 tr_140000 tr_141100', 11);
INSERT INTO `sys_area`
VALUES (141182, '汾阳市', 141100, '汾阳', NULL, NULL, 'F', 111.785271, 37.267742, 3, 'tr_0 tr_140000 tr_141100', 2);
INSERT INTO `sys_area`
VALUES (150000, '内蒙古自治区', 0, '内蒙古', NULL, NULL, 'N', 111.670799, 40.818310, 1, 'tr_0', 5);
INSERT INTO `sys_area`
VALUES (150100, '呼和浩特市', 150000, '呼和浩特', NULL, NULL, 'H', 111.670799, 40.818310, 2, 'tr_0 tr_150000', 6);
INSERT INTO `sys_area`
VALUES (150102, '新城区', 150100, '新城', NULL, NULL, 'X', 111.685966, 40.826225, 3, 'tr_0 tr_150000 tr_150100', 8);
INSERT INTO `sys_area`
VALUES (150103, '回民区', 150100, '回民', NULL, NULL, 'H', 111.662163, 40.815147, 3, 'tr_0 tr_150000 tr_150100', 2);
INSERT INTO `sys_area`
VALUES (150104, '玉泉区', 150100, '玉泉', NULL, NULL, 'Y', 111.665428, 40.799419, 3, 'tr_0 tr_150000 tr_150100', 9);
INSERT INTO `sys_area`
VALUES (150105, '赛罕区', 150100, '赛罕', NULL, NULL, 'S', 111.698463, 40.807835, 3, 'tr_0 tr_150000 tr_150100', 4);
INSERT INTO `sys_area`
VALUES (150121, '土默特左旗', 150100, '土默特左', NULL, NULL, 'T', 111.133614, 40.720417, 3, 'tr_0 tr_150000 tr_150100', 5);
INSERT INTO `sys_area`
VALUES (150122, '托克托县', 150100, '托克托', NULL, NULL, 'T', 111.197319, 40.276730, 3, 'tr_0 tr_150000 tr_150100', 6);
INSERT INTO `sys_area`
VALUES (150123, '和林格尔县', 150100, '和林格尔', NULL, NULL, 'H', 111.824142, 40.380287, 3, 'tr_0 tr_150000 tr_150100', 1);
INSERT INTO `sys_area`
VALUES (150124, '清水河县', 150100, '清水河', NULL, NULL, 'Q', 111.672218, 39.912479, 3, 'tr_0 tr_150000 tr_150100', 3);
INSERT INTO `sys_area`
VALUES (150125, '武川县', 150100, '武川', NULL, NULL, 'W', 111.456566, 41.094482, 3, 'tr_0 tr_150000 tr_150100', 7);
INSERT INTO `sys_area`
VALUES (150200, '包头市', 150000, '包头', NULL, NULL, 'B', 109.840408, 40.658169, 2, 'tr_0 tr_150000', 2);
INSERT INTO `sys_area`
VALUES (150202, '东河区', 150200, '东河', NULL, NULL, 'D', 110.026894, 40.587055, 3, 'tr_0 tr_150000 tr_150200', 3);
INSERT INTO `sys_area`
VALUES (150203, '昆都仑区', 150200, '昆都仑', NULL, NULL, 'K', 109.822929, 40.661346, 3, 'tr_0 tr_150000 tr_150200', 6);
INSERT INTO `sys_area`
VALUES (150204, '青山区', 150200, '青山', NULL, NULL, 'Q', 109.880051, 40.668556, 3, 'tr_0 tr_150000 tr_150200', 7);
INSERT INTO `sys_area`
VALUES (150205, '石拐区', 150200, '石拐', NULL, NULL, 'S', 110.272568, 40.672092, 3, 'tr_0 tr_150000 tr_150200', 8);
INSERT INTO `sys_area`
VALUES (150206, '白云鄂博矿区', 150200, '白云矿区', NULL, NULL, 'B', 109.970161, 41.769245, 3, 'tr_0 tr_150000 tr_150200', 1);
INSERT INTO `sys_area`
VALUES (150207, '九原区', 150200, '九原', NULL, NULL, 'J', 109.968124, 40.600582, 3, 'tr_0 tr_150000 tr_150200', 5);
INSERT INTO `sys_area`
VALUES (150221, '土默特右旗', 150200, '土默特右', NULL, NULL, 'T', 110.526764, 40.566433, 3, 'tr_0 tr_150000 tr_150200', 9);
INSERT INTO `sys_area`
VALUES (150222, '固阳县', 150200, '固阳', NULL, NULL, 'G', 110.063423, 41.030003, 3, 'tr_0 tr_150000 tr_150200', 4);
INSERT INTO `sys_area`
VALUES (150223, '达尔罕茂明安联合旗', 150200, '达尔罕茂明安联合', NULL, NULL, 'D', 109.840408, 40.658169, 3, 'tr_0 tr_150000 tr_150200', 2);
INSERT INTO `sys_area`
VALUES (150300, '乌海市', 150000, '乌海', NULL, NULL, 'W', 106.825562, 39.673733, 2, 'tr_0 tr_150000', 9);
INSERT INTO `sys_area`
VALUES (150302, '海勃湾区', 150300, '海勃湾', NULL, NULL, 'H', 106.817764, 39.673527, 3, 'tr_0 tr_150000 tr_150300', 1);
INSERT INTO `sys_area`
VALUES (150303, '海南区', 150300, '海南', NULL, NULL, 'H', 106.884789, 39.441528, 3, 'tr_0 tr_150000 tr_150300', 2);
INSERT INTO `sys_area`
VALUES (150304, '乌达区', 150300, '乌达', NULL, NULL, 'W', 106.722710, 39.502289, 3, 'tr_0 tr_150000 tr_150300', 3);
INSERT INTO `sys_area`
VALUES (150400, '赤峰市', 150000, '赤峰', NULL, NULL, 'C', 118.956802, 42.275318, 2, 'tr_0 tr_150000', 4);
INSERT INTO `sys_area`
VALUES (150402, '红山区', 150400, '红山', NULL, NULL, 'H', 118.961090, 42.269733, 3, 'tr_0 tr_150000 tr_150400', 5);
INSERT INTO `sys_area`
VALUES (150403, '元宝山区', 150400, '元宝山', NULL, NULL, 'Y', 119.289879, 42.041168, 3, 'tr_0 tr_150000 tr_150400', 12);
INSERT INTO `sys_area`
VALUES (150404, '松山区', 150400, '松山', NULL, NULL, 'S', 118.938957, 42.281048, 3, 'tr_0 tr_150000 tr_150400', 10);
INSERT INTO `sys_area`
VALUES (150421, '阿鲁科尔沁旗', 150400, '阿鲁科尔沁', NULL, NULL, 'A', 120.094971, 43.878769, 3, 'tr_0 tr_150000 tr_150400', 1);
INSERT INTO `sys_area`
VALUES (150422, '巴林左旗', 150400, '巴林左', NULL, NULL, 'B', 119.391739, 43.980717, 3, 'tr_0 tr_150000 tr_150400', 4);
INSERT INTO `sys_area`
VALUES (150423, '巴林右旗', 150400, '巴林右', NULL, NULL, 'B', 118.678345, 43.528961, 3, 'tr_0 tr_150000 tr_150400', 3);
INSERT INTO `sys_area`
VALUES (150424, '林西县', 150400, '林西', NULL, NULL, 'L', 118.057747, 43.605328, 3, 'tr_0 tr_150000 tr_150400', 8);
INSERT INTO `sys_area`
VALUES (150425, '克什克腾旗', 150400, '克什克腾', NULL, NULL, 'K', 117.542465, 43.256233, 3, 'tr_0 tr_150000 tr_150400', 7);
INSERT INTO `sys_area`
VALUES (150426, '翁牛特旗', 150400, '翁牛特', NULL, NULL, 'W', 119.022621, 42.937126, 3, 'tr_0 tr_150000 tr_150400', 11);
INSERT INTO `sys_area`
VALUES (150428, '喀喇沁旗', 150400, '喀喇沁', NULL, NULL, 'K', 118.708572, 41.927780, 3, 'tr_0 tr_150000 tr_150400', 6);
INSERT INTO `sys_area`
VALUES (150429, '宁城县', 150400, '宁城', NULL, NULL, 'N', 119.339241, 41.598694, 3, 'tr_0 tr_150000 tr_150400', 9);
INSERT INTO `sys_area`
VALUES (150430, '敖汉旗', 150400, '敖汉', NULL, NULL, 'A', 119.906487, 42.287010, 3, 'tr_0 tr_150000 tr_150400', 2);
INSERT INTO `sys_area`
VALUES (150500, '通辽市', 150000, '通辽', NULL, NULL, 'T', 122.263123, 43.617428, 2, 'tr_0 tr_150000', 8);
INSERT INTO `sys_area`
VALUES (150502, '科尔沁区', 150500, '科尔沁', NULL, NULL, 'K', 122.264046, 43.617420, 3, 'tr_0 tr_150000 tr_150500', 3);
INSERT INTO `sys_area`
VALUES (150521, '科尔沁左翼中旗', 150500, '科尔沁左翼中', NULL, NULL, 'K', 123.313873, 44.127167, 3, 'tr_0 tr_150000 tr_150500', 5);
INSERT INTO `sys_area`
VALUES (150522, '科尔沁左翼后旗', 150500, '科尔沁左翼后', NULL, NULL, 'K', 122.355156, 42.954563, 3, 'tr_0 tr_150000 tr_150500', 4);
INSERT INTO `sys_area`
VALUES (150523, '开鲁县', 150500, '开鲁', NULL, NULL, 'K', 121.308800, 43.602432, 3, 'tr_0 tr_150000 tr_150500', 2);
INSERT INTO `sys_area`
VALUES (150524, '库伦旗', 150500, '库伦', NULL, NULL, 'K', 121.774887, 42.734692, 3, 'tr_0 tr_150000 tr_150500', 6);
INSERT INTO `sys_area`
VALUES (150525, '奈曼旗', 150500, '奈曼', NULL, NULL, 'N', 120.662544, 42.846851, 3, 'tr_0 tr_150000 tr_150500', 7);
INSERT INTO `sys_area`
VALUES (150526, '扎鲁特旗', 150500, '扎鲁特', NULL, NULL, 'Z', 120.905273, 44.555294, 3, 'tr_0 tr_150000 tr_150500', 8);
INSERT INTO `sys_area`
VALUES (150581, '霍林郭勒市', 150500, '霍林郭勒', NULL, NULL, 'H', 119.657860, 45.532360, 3, 'tr_0 tr_150000 tr_150500', 1);
INSERT INTO `sys_area`
VALUES (150600, '鄂尔多斯市', 150000, '鄂尔多斯', NULL, NULL, 'E', 109.990288, 39.817181, 2, 'tr_0 tr_150000', 5);
INSERT INTO `sys_area`
VALUES (150602, '东胜区', 150600, '东胜', NULL, NULL, 'D', 109.989449, 39.817879, 3, 'tr_0 tr_150000 tr_150600', 2);
INSERT INTO `sys_area`
VALUES (150621, '达拉特旗', 150600, '达拉特', NULL, NULL, 'D', 110.040283, 40.404076, 3, 'tr_0 tr_150000 tr_150600', 1);
INSERT INTO `sys_area`
VALUES (150622, '准格尔旗', 150600, '准格尔', NULL, NULL, 'Z', 111.238335, 39.865219, 3, 'tr_0 tr_150000 tr_150600', 8);
INSERT INTO `sys_area`
VALUES (150623, '鄂托克前旗', 150600, '鄂托克前', NULL, NULL, 'E', 107.481720, 38.183258, 3, 'tr_0 tr_150000 tr_150600', 4);
INSERT INTO `sys_area`
VALUES (150624, '鄂托克旗', 150600, '鄂托克', NULL, NULL, 'E', 107.982605, 39.095753, 3, 'tr_0 tr_150000 tr_150600', 3);
INSERT INTO `sys_area`
VALUES (150625, '杭锦旗', 150600, '杭锦', NULL, NULL, 'H', 108.736320, 39.831787, 3, 'tr_0 tr_150000 tr_150600', 5);
INSERT INTO `sys_area`
VALUES (150626, '乌审旗', 150600, '乌审', NULL, NULL, 'W', 108.842453, 38.596611, 3, 'tr_0 tr_150000 tr_150600', 6);
INSERT INTO `sys_area`
VALUES (150627, '伊金霍洛旗', 150600, '伊金霍洛', NULL, NULL, 'Y', 109.787399, 39.604313, 3, 'tr_0 tr_150000 tr_150600', 7);
INSERT INTO `sys_area`
VALUES (150700, '呼伦贝尔市', 150000, '呼伦贝尔', NULL, NULL, 'H', 119.758171, 49.215332, 2, 'tr_0 tr_150000', 7);
INSERT INTO `sys_area`
VALUES (150702, '海拉尔区', 150700, '海拉尔', NULL, NULL, 'H', 119.764923, 49.213890, 3, 'tr_0 tr_150000 tr_150700', 7);
INSERT INTO `sys_area`
VALUES (150703, '扎赉诺尔区', 150700, '扎赉诺尔', NULL, NULL, 'Z', 117.792702, 49.486942, 3, 'tr_0 tr_150000 tr_150700', 13);
INSERT INTO `sys_area`
VALUES (150721, '阿荣旗', 150700, '阿荣', NULL, NULL, 'A', 123.464615, 48.130505, 3, 'tr_0 tr_150000 tr_150700', 1);
INSERT INTO `sys_area`
VALUES (150722, '莫力达瓦达斡尔族自治旗', 150700, '莫力达瓦', NULL, NULL, 'M', 124.507401, 48.478386, 3, 'tr_0 tr_150000 tr_150700', 9);
INSERT INTO `sys_area`
VALUES (150723, '鄂伦春自治旗', 150700, '鄂伦春', NULL, NULL, 'E', 123.725685, 50.590176, 3, 'tr_0 tr_150000 tr_150700', 4);
INSERT INTO `sys_area`
VALUES (150724, '鄂温克族自治旗', 150700, '鄂温克', NULL, NULL, 'E', 119.754044, 49.143291, 3, 'tr_0 tr_150000 tr_150700', 5);
INSERT INTO `sys_area`
VALUES (150725, '陈巴尔虎旗', 150700, '陈巴尔虎', NULL, NULL, 'C', 119.437607, 49.328423, 3, 'tr_0 tr_150000 tr_150700', 2);
INSERT INTO `sys_area`
VALUES (150726, '新巴尔虎左旗', 150700, '新巴尔虎左', NULL, NULL, 'X', 118.267456, 48.216572, 3, 'tr_0 tr_150000 tr_150700', 11);
INSERT INTO `sys_area`
VALUES (150727, '新巴尔虎右旗', 150700, '新巴尔虎右', NULL, NULL, 'X', 116.825989, 48.669132, 3, 'tr_0 tr_150000 tr_150700', 10);
INSERT INTO `sys_area`
VALUES (150781, '满洲里市', 150700, '满洲里', NULL, NULL, 'M', 117.455559, 49.590790, 3, 'tr_0 tr_150000 tr_150700', 8);
INSERT INTO `sys_area`
VALUES (150782, '牙克石市', 150700, '牙克石', NULL, NULL, 'Y', 120.729004, 49.287025, 3, 'tr_0 tr_150000 tr_150700', 12);
INSERT INTO `sys_area`
VALUES (150783, '扎兰屯市', 150700, '扎兰屯', NULL, NULL, 'Z', 122.744400, 48.007412, 3, 'tr_0 tr_150000 tr_150700', 14);
INSERT INTO `sys_area`
VALUES (150784, '额尔古纳市', 150700, '额尔古纳', NULL, NULL, 'E', 120.178635, 50.243900, 3, 'tr_0 tr_150000 tr_150700', 3);
INSERT INTO `sys_area`
VALUES (150785, '根河市', 150700, '根河', NULL, NULL, 'G', 121.532722, 50.780453, 3, 'tr_0 tr_150000 tr_150700', 6);
INSERT INTO `sys_area`
VALUES (150800, '巴彦淖尔市', 150000, '巴彦淖尔', NULL, NULL, 'B', 107.416962, 40.757401, 2, 'tr_0 tr_150000', 3);
INSERT INTO `sys_area`
VALUES (150802, '临河区', 150800, '临河', NULL, NULL, 'L', 107.417015, 40.757092, 3, 'tr_0 tr_150000 tr_150800', 3);
INSERT INTO `sys_area`
VALUES (150821, '五原县', 150800, '五原', NULL, NULL, 'W', 108.270660, 41.097637, 3, 'tr_0 tr_150000 tr_150800', 7);
INSERT INTO `sys_area`
VALUES (150822, '磴口县', 150800, '磴口', NULL, NULL, 'Z', 107.006058, 40.330479, 3, 'tr_0 tr_150000 tr_150800', 1);
INSERT INTO `sys_area`
VALUES (150823, '乌拉特前旗', 150800, '乌拉特前', NULL, NULL, 'W', 108.656815, 40.725208, 3, 'tr_0 tr_150000 tr_150800', 5);
INSERT INTO `sys_area`
VALUES (150824, '乌拉特中旗', 150800, '乌拉特中', NULL, NULL, 'W', 108.515259, 41.572540, 3, 'tr_0 tr_150000 tr_150800', 6);
INSERT INTO `sys_area`
VALUES (150825, '乌拉特后旗', 150800, '乌拉特后', NULL, NULL, 'W', 107.074944, 41.084309, 3, 'tr_0 tr_150000 tr_150800', 4);
INSERT INTO `sys_area`
VALUES (150826, '杭锦后旗', 150800, '杭锦后', NULL, NULL, 'H', 107.147682, 40.888798, 3, 'tr_0 tr_150000 tr_150800', 2);
INSERT INTO `sys_area`
VALUES (150900, '乌兰察布市', 150000, '乌兰察布', NULL, NULL, 'W', 113.114540, 41.034126, 2, 'tr_0 tr_150000', 10);
INSERT INTO `sys_area`
VALUES (150902, '集宁区', 150900, '集宁', NULL, NULL, 'J', 113.116455, 41.034134, 3, 'tr_0 tr_150000 tr_150900', 6);
INSERT INTO `sys_area`
VALUES (150921, '卓资县', 150900, '卓资', NULL, NULL, 'Z', 112.577705, 40.895760, 3, 'tr_0 tr_150000 tr_150900', 11);
INSERT INTO `sys_area`
VALUES (150922, '化德县', 150900, '化德', NULL, NULL, 'H', 114.010078, 41.899334, 3, 'tr_0 tr_150000 tr_150900', 5);
INSERT INTO `sys_area`
VALUES (150923, '商都县', 150900, '商都', NULL, NULL, 'S', 113.560646, 41.560162, 3, 'tr_0 tr_150000 tr_150900', 8);
INSERT INTO `sys_area`
VALUES (150924, '兴和县', 150900, '兴和', NULL, NULL, 'X', 113.834007, 40.872437, 3, 'tr_0 tr_150000 tr_150900', 10);
INSERT INTO `sys_area`
VALUES (150925, '凉城县', 150900, '凉城', NULL, NULL, 'L', 112.500908, 40.531628, 3, 'tr_0 tr_150000 tr_150900', 7);
INSERT INTO `sys_area`
VALUES (150926, '察哈尔右翼前旗', 150900, '察哈尔右翼前', NULL, NULL, 'C', 113.211960, 40.786858, 3, 'tr_0 tr_150000 tr_150900', 2);
INSERT INTO `sys_area`
VALUES (150927, '察哈尔右翼中旗', 150900, '察哈尔右翼中', NULL, NULL, 'C', 112.633560, 41.274212, 3, 'tr_0 tr_150000 tr_150900', 3);
INSERT INTO `sys_area`
VALUES (150928, '察哈尔右翼后旗', 150900, '察哈尔右翼后', NULL, NULL, 'C', 113.190598, 41.447212, 3, 'tr_0 tr_150000 tr_150900', 1);
INSERT INTO `sys_area`
VALUES (150929, '四子王旗', 150900, '四子王', NULL, NULL, 'S', 111.701233, 41.528114, 3, 'tr_0 tr_150000 tr_150900', 9);
INSERT INTO `sys_area`
VALUES (150981, '丰镇市', 150900, '丰镇', NULL, NULL, 'F', 113.163460, 40.437534, 3, 'tr_0 tr_150000 tr_150900', 4);
INSERT INTO `sys_area`
VALUES (152200, '兴安盟', 150000, '兴安', NULL, NULL, 'X', 122.070320, 46.076267, 2, 'tr_0 tr_150000', 12);
INSERT INTO `sys_area`
VALUES (152201, '乌兰浩特市', 152200, '乌兰浩特', NULL, NULL, 'W', 122.068977, 46.077236, 3, 'tr_0 tr_150000 tr_152200', 5);
INSERT INTO `sys_area`
VALUES (152202, '阿尔山市', 152200, '阿尔山', NULL, NULL, 'A', 119.943657, 47.176998, 3, 'tr_0 tr_150000 tr_152200', 1);
INSERT INTO `sys_area`
VALUES (152221, '科尔沁右翼前旗', 152200, '科尔沁右翼前', NULL, NULL, 'K', 121.957542, 46.076496, 3, 'tr_0 tr_150000 tr_152200', 2);
INSERT INTO `sys_area`
VALUES (152222, '科尔沁右翼中旗', 152200, '科尔沁右翼中', NULL, NULL, 'K', 121.472816, 45.059647, 3, 'tr_0 tr_150000 tr_152200', 3);
INSERT INTO `sys_area`
VALUES (152223, '扎赉特旗', 152200, '扎赉特', NULL, NULL, 'Z', 122.909332, 46.725136, 3, 'tr_0 tr_150000 tr_152200', 6);
INSERT INTO `sys_area`
VALUES (152224, '突泉县', 152200, '突泉', NULL, NULL, 'T', 121.564857, 45.380985, 3, 'tr_0 tr_150000 tr_152200', 4);
INSERT INTO `sys_area`
VALUES (152500, '锡林郭勒盟', 150000, '锡林郭勒', NULL, NULL, 'X', 116.090996, 43.944019, 2, 'tr_0 tr_150000', 11);
INSERT INTO `sys_area`
VALUES (152501, '二连浩特市', 152500, '二连浩特', NULL, NULL, 'E', 111.979813, 43.652897, 3, 'tr_0 tr_150000 tr_152500', 4);
INSERT INTO `sys_area`
VALUES (152502, '锡林浩特市', 152500, '锡林浩特', NULL, NULL, 'X', 116.091904, 43.944302, 3, 'tr_0 tr_150000 tr_152500', 9);
INSERT INTO `sys_area`
VALUES (152522, '阿巴嘎旗', 152500, '阿巴嘎', NULL, NULL, 'A', 114.970619, 44.022728, 3, 'tr_0 tr_150000 tr_152500', 1);
INSERT INTO `sys_area`
VALUES (152523, '苏尼特左旗', 152500, '苏尼特左', NULL, NULL, 'S', 113.653412, 43.854107, 3, 'tr_0 tr_150000 tr_152500', 6);
INSERT INTO `sys_area`
VALUES (152524, '苏尼特右旗', 152500, '苏尼特右', NULL, NULL, 'S', 112.655388, 42.746662, 3, 'tr_0 tr_150000 tr_152500', 5);
INSERT INTO `sys_area`
VALUES (152525, '东乌珠穆沁旗', 152500, '东乌珠穆沁', NULL, NULL, 'D', 116.980019, 45.510307, 3, 'tr_0 tr_150000 tr_152500', 2);
INSERT INTO `sys_area`
VALUES (152526, '西乌珠穆沁旗', 152500, '西乌珠穆沁', NULL, NULL, 'X', 117.615250, 44.586147, 3, 'tr_0 tr_150000 tr_152500', 10);
INSERT INTO `sys_area`
VALUES (152527, '太仆寺旗', 152500, '太仆寺', NULL, NULL, 'T', 115.287277, 41.895199, 3, 'tr_0 tr_150000 tr_152500', 7);
INSERT INTO `sys_area`
VALUES (152528, '镶黄旗', 152500, '镶黄', NULL, NULL, 'X', 113.843872, 42.239227, 3, 'tr_0 tr_150000 tr_152500', 8);
INSERT INTO `sys_area`
VALUES (152529, '正镶白旗', 152500, '正镶白', NULL, NULL, 'Z', 115.031425, 42.286808, 3, 'tr_0 tr_150000 tr_152500', 12);
INSERT INTO `sys_area`
VALUES (152530, '正蓝旗', 152500, '正蓝', NULL, NULL, 'Z', 116.003311, 42.245895, 3, 'tr_0 tr_150000 tr_152500', 11);
INSERT INTO `sys_area`
VALUES (152531, '多伦县', 152500, '多伦', NULL, NULL, 'D', 116.477287, 42.197964, 3, 'tr_0 tr_150000 tr_152500', 3);
INSERT INTO `sys_area`
VALUES (152900, '阿拉善盟', 150000, '阿拉善', NULL, NULL, 'A', 105.706421, 38.844814, 2, 'tr_0 tr_150000', 1);
INSERT INTO `sys_area`
VALUES (152921, '阿拉善左旗', 152900, '阿拉善左', NULL, NULL, 'A', 105.701920, 38.847240, 3, 'tr_0 tr_150000 tr_152900', 2);
INSERT INTO `sys_area`
VALUES (152922, '阿拉善右旗', 152900, '阿拉善右', NULL, NULL, 'A', 101.671982, 39.211590, 3, 'tr_0 tr_150000 tr_152900', 1);
INSERT INTO `sys_area`
VALUES (152923, '额济纳旗', 152900, '额济纳', NULL, NULL, 'E', 101.069443, 41.958813, 3, 'tr_0 tr_150000 tr_152900', 3);
INSERT INTO `sys_area`
VALUES (210000, '辽宁省', 0, '辽宁', NULL, NULL, 'L', 123.429092, 41.796768, 1, 'tr_0', 6);
INSERT INTO `sys_area`
VALUES (210100, '沈阳市', 210000, '沈阳', NULL, NULL, 'S', 123.429092, 41.796768, 2, 'tr_0 tr_210000', 12);
INSERT INTO `sys_area`
VALUES (210102, '和平区', 210100, '和平', NULL, NULL, 'H', 123.406662, 41.788074, 3, 'tr_0 tr_210000 tr_210100', 4);
INSERT INTO `sys_area`
VALUES (210103, '沈河区', 210100, '沈河', NULL, NULL, 'S', 123.445694, 41.795589, 3, 'tr_0 tr_210000 tr_210100', 9);
INSERT INTO `sys_area`
VALUES (210104, '大东区', 210100, '大东', NULL, NULL, 'D', 123.469955, 41.808502, 3, 'tr_0 tr_210000 tr_210100', 1);
INSERT INTO `sys_area`
VALUES (210105, '皇姑区', 210100, '皇姑', NULL, NULL, 'H', 123.405678, 41.822334, 3, 'tr_0 tr_210000 tr_210100', 5);
INSERT INTO `sys_area`
VALUES (210106, '铁西区', 210100, '铁西', NULL, NULL, 'T', 123.350662, 41.787807, 3, 'tr_0 tr_210000 tr_210100', 11);
INSERT INTO `sys_area`
VALUES (210111, '苏家屯区', 210100, '苏家屯', NULL, NULL, 'S', 123.341606, 41.665905, 3, 'tr_0 tr_210000 tr_210100', 10);
INSERT INTO `sys_area`
VALUES (210112, '东陵区', 210100, '东陵', NULL, NULL, 'D', 123.458984, 41.741947, 3, 'tr_0 tr_210000 tr_210100', 2);
INSERT INTO `sys_area`
VALUES (210114, '于洪区', 210100, '于洪', NULL, NULL, 'Y', 123.310829, 41.795834, 3, 'tr_0 tr_210000 tr_210100', 13);
INSERT INTO `sys_area`
VALUES (210122, '辽中县', 210100, '辽中', NULL, NULL, 'L', 122.731270, 41.512726, 3, 'tr_0 tr_210000 tr_210100', 7);
INSERT INTO `sys_area`
VALUES (210123, '康平县', 210100, '康平', NULL, NULL, 'K', 123.352699, 42.741531, 3, 'tr_0 tr_210000 tr_210100', 6);
INSERT INTO `sys_area`
VALUES (210124, '法库县', 210100, '法库', NULL, NULL, 'F', 123.416725, 42.507046, 3, 'tr_0 tr_210000 tr_210100', 3);
INSERT INTO `sys_area`
VALUES (210181, '新民市', 210100, '新民', NULL, NULL, 'X', 122.828865, 41.996510, 3, 'tr_0 tr_210000 tr_210100', 12);
INSERT INTO `sys_area`
VALUES (210184, '沈北新区', 210100, '沈北', NULL, NULL, 'S', 123.521469, 42.052311, 3, 'tr_0 tr_210000 tr_210100', 8);
INSERT INTO `sys_area`
VALUES (210200, '大连市', 210000, '大连', NULL, NULL, 'D', 121.618622, 38.914589, 2, 'tr_0 tr_210000', 4);
INSERT INTO `sys_area`
VALUES (210202, '中山区', 210200, '中山', NULL, NULL, 'Z', 121.643761, 38.921555, 3, 'tr_0 tr_210000 tr_210200', 4);
INSERT INTO `sys_area`
VALUES (210203, '西岗区', 210200, '西岗', NULL, NULL, 'X', 121.616112, 38.914265, 3, 'tr_0 tr_210000 tr_210200', 9);
INSERT INTO `sys_area`
VALUES (210204, '沙河口区', 210200, '沙河口', NULL, NULL, 'S', 121.593704, 38.912861, 3, 'tr_0 tr_210000 tr_210200', 7);
INSERT INTO `sys_area`
VALUES (210211, '甘井子区', 210200, '甘井子', NULL, NULL, 'G', 121.582611, 38.975147, 3, 'tr_0 tr_210000 tr_210200', 2);
INSERT INTO `sys_area`
VALUES (210212, '旅顺口区', 210200, '旅顺口', NULL, NULL, 'L', 121.267128, 38.812042, 3, 'tr_0 tr_210000 tr_210200', 5);
INSERT INTO `sys_area`
VALUES (210213, '金州区', 210200, '金州', NULL, NULL, 'J', 121.789413, 39.052746, 3, 'tr_0 tr_210000 tr_210200', 3);
INSERT INTO `sys_area`
VALUES (210224, '长海县', 210200, '长海', NULL, NULL, 'C', 122.587822, 39.272400, 3, 'tr_0 tr_210000 tr_210200', 1);
INSERT INTO `sys_area`
VALUES (210281, '瓦房店市', 210200, '瓦房店', NULL, NULL, 'W', 122.002655, 39.630650, 3, 'tr_0 tr_210000 tr_210200', 8);
INSERT INTO `sys_area`
VALUES (210282, '普兰店市', 210200, '普兰店', NULL, NULL, 'P', 121.970497, 39.401554, 3, 'tr_0 tr_210000 tr_210200', 6);
INSERT INTO `sys_area`
VALUES (210283, '庄河市', 210200, '庄河', NULL, NULL, 'Z', 122.970612, 39.698292, 3, 'tr_0 tr_210000 tr_210200', 10);
INSERT INTO `sys_area`
VALUES (210300, '鞍山市', 210000, '鞍山', NULL, NULL, 'A', 122.995628, 41.110626, 2, 'tr_0 tr_210000', 1);
INSERT INTO `sys_area`
VALUES (210302, '铁东区', 210300, '铁东', NULL, NULL, 'T', 122.994476, 41.110344, 3, 'tr_0 tr_210000 tr_210300', 5);
INSERT INTO `sys_area`
VALUES (210303, '铁西区', 210300, '铁西', NULL, NULL, 'T', 122.971832, 41.110691, 3, 'tr_0 tr_210000 tr_210300', 6);
INSERT INTO `sys_area`
VALUES (210304, '立山区', 210300, '立山', NULL, NULL, 'L', 123.024803, 41.150623, 3, 'tr_0 tr_210000 tr_210300', 2);
INSERT INTO `sys_area`
VALUES (210311, '千山区', 210300, '千山', NULL, NULL, 'Q', 122.957878, 41.070721, 3, 'tr_0 tr_210000 tr_210300', 3);
INSERT INTO `sys_area`
VALUES (210321, '台安县', 210300, '台安', NULL, NULL, 'T', 122.429733, 41.386860, 3, 'tr_0 tr_210000 tr_210300', 4);
INSERT INTO `sys_area`
VALUES (210323, '岫岩满族自治县', 210300, '岫岩', NULL, NULL, 'Z', 123.288330, 40.281509, 3, 'tr_0 tr_210000 tr_210300', 7);
INSERT INTO `sys_area`
VALUES (210381, '海城市', 210300, '海城', NULL, NULL, 'H', 122.752197, 40.852531, 3, 'tr_0 tr_210000 tr_210300', 1);
INSERT INTO `sys_area`
VALUES (210400, '抚顺市', 210000, '抚顺', NULL, NULL, 'F', 123.921112, 41.875957, 2, 'tr_0 tr_210000', 6);
INSERT INTO `sys_area`
VALUES (210402, '新抚区', 210400, '新抚', NULL, NULL, 'X', 123.902855, 41.860821, 3, 'tr_0 tr_210000 tr_210400', 7);
INSERT INTO `sys_area`
VALUES (210403, '东洲区', 210400, '东洲', NULL, NULL, 'D', 124.047218, 41.866829, 3, 'tr_0 tr_210000 tr_210400', 1);
INSERT INTO `sys_area`
VALUES (210404, '望花区', 210400, '望花', NULL, NULL, 'W', 123.801506, 41.851803, 3, 'tr_0 tr_210000 tr_210400', 5);
INSERT INTO `sys_area`
VALUES (210411, '顺城区', 210400, '顺城', NULL, NULL, 'S', 123.917168, 41.881130, 3, 'tr_0 tr_210000 tr_210400', 4);
INSERT INTO `sys_area`
VALUES (210421, '抚顺县', 210400, '抚顺', NULL, NULL, 'F', 124.097977, 41.922646, 3, 'tr_0 tr_210000 tr_210400', 2);
INSERT INTO `sys_area`
VALUES (210422, '新宾满族自治县', 210400, '新宾', NULL, NULL, 'X', 125.037544, 41.732456, 3, 'tr_0 tr_210000 tr_210400', 6);
INSERT INTO `sys_area`
VALUES (210423, '清原满族自治县', 210400, '清原', NULL, NULL, 'Q', 124.927193, 42.101349, 3, 'tr_0 tr_210000 tr_210400', 3);
INSERT INTO `sys_area`
VALUES (210500, '本溪市', 210000, '本溪', NULL, NULL, 'B', 123.770515, 41.297909, 2, 'tr_0 tr_210000', 2);
INSERT INTO `sys_area`
VALUES (210502, '平山区', 210500, '平山', NULL, NULL, 'P', 123.761230, 41.291580, 3, 'tr_0 tr_210000 tr_210500', 5);
INSERT INTO `sys_area`
VALUES (210503, '溪湖区', 210500, '溪湖', NULL, NULL, 'X', 123.765228, 41.330055, 3, 'tr_0 tr_210000 tr_210500', 6);
INSERT INTO `sys_area`
VALUES (210504, '明山区', 210500, '明山', NULL, NULL, 'M', 123.763290, 41.302429, 3, 'tr_0 tr_210000 tr_210500', 3);
INSERT INTO `sys_area`
VALUES (210505, '南芬区', 210500, '南芬', NULL, NULL, 'N', 123.748383, 41.104092, 3, 'tr_0 tr_210000 tr_210500', 4);
INSERT INTO `sys_area`
VALUES (210521, '本溪满族自治县', 210500, '本溪', NULL, NULL, 'B', 124.126160, 41.300343, 3, 'tr_0 tr_210000 tr_210500', 1);
INSERT INTO `sys_area`
VALUES (210522, '桓仁满族自治县', 210500, '桓仁', NULL, NULL, 'H', 125.359192, 41.268997, 3, 'tr_0 tr_210000 tr_210500', 2);
INSERT INTO `sys_area`
VALUES (210600, '丹东市', 210000, '丹东', NULL, NULL, 'D', 124.383041, 40.124294, 2, 'tr_0 tr_210000', 5);
INSERT INTO `sys_area`
VALUES (210602, '元宝区', 210600, '元宝', NULL, NULL, 'Y', 124.397812, 40.136482, 3, 'tr_0 tr_210000 tr_210600', 4);
INSERT INTO `sys_area`
VALUES (210603, '振兴区', 210600, '振兴', NULL, NULL, 'Z', 124.361153, 40.102802, 3, 'tr_0 tr_210000 tr_210600', 6);
INSERT INTO `sys_area`
VALUES (210604, '振安区', 210600, '振安', NULL, NULL, 'Z', 124.427711, 40.158558, 3, 'tr_0 tr_210000 tr_210600', 5);
INSERT INTO `sys_area`
VALUES (210624, '宽甸满族自治县', 210600, '宽甸', NULL, NULL, 'K', 124.784866, 40.730412, 3, 'tr_0 tr_210000 tr_210600', 3);
INSERT INTO `sys_area`
VALUES (210681, '东港市', 210600, '东港', NULL, NULL, 'D', 124.149437, 39.883469, 3, 'tr_0 tr_210000 tr_210600', 1);
INSERT INTO `sys_area`
VALUES (210682, '凤城市', 210600, '凤城', NULL, NULL, 'F', 124.071068, 40.457565, 3, 'tr_0 tr_210000 tr_210600', 2);
INSERT INTO `sys_area`
VALUES (210700, '锦州市', 210000, '锦州', NULL, NULL, 'J', 121.135742, 41.119270, 2, 'tr_0 tr_210000', 9);
INSERT INTO `sys_area`
VALUES (210702, '古塔区', 210700, '古塔', NULL, NULL, 'G', 121.130089, 41.115719, 3, 'tr_0 tr_210000 tr_210700', 2);
INSERT INTO `sys_area`
VALUES (210703, '凌河区', 210700, '凌河', NULL, NULL, 'L', 121.151306, 41.114662, 3, 'tr_0 tr_210000 tr_210700', 5);
INSERT INTO `sys_area`
VALUES (210711, '太和区', 210700, '太和', NULL, NULL, 'T', 121.107300, 41.105377, 3, 'tr_0 tr_210000 tr_210700', 6);
INSERT INTO `sys_area`
VALUES (210726, '黑山县', 210700, '黑山', NULL, NULL, 'H', 122.117912, 41.691803, 3, 'tr_0 tr_210000 tr_210700', 3);
INSERT INTO `sys_area`
VALUES (210727, '义县', 210700, '义县', NULL, NULL, 'Y', 121.242828, 41.537224, 3, 'tr_0 tr_210000 tr_210700', 7);
INSERT INTO `sys_area`
VALUES (210781, '凌海市', 210700, '凌海', NULL, NULL, 'L', 121.364235, 41.171738, 3, 'tr_0 tr_210000 tr_210700', 4);
INSERT INTO `sys_area`
VALUES (210782, '北镇市', 210700, '北镇', NULL, NULL, 'B', 121.795959, 41.598763, 3, 'tr_0 tr_210000 tr_210700', 1);
INSERT INTO `sys_area`
VALUES (210800, '营口市', 210000, '营口', NULL, NULL, 'Y', 122.235153, 40.667431, 2, 'tr_0 tr_210000', 14);
INSERT INTO `sys_area`
VALUES (210802, '站前区', 210800, '站前', NULL, NULL, 'Z', 122.253235, 40.669949, 3, 'tr_0 tr_210000 tr_210800', 6);
INSERT INTO `sys_area`
VALUES (210803, '西市区', 210800, '西市', NULL, NULL, 'X', 122.210068, 40.663086, 3, 'tr_0 tr_210000 tr_210800', 5);
INSERT INTO `sys_area`
VALUES (210804, '鲅鱼圈区', 210800, '鲅鱼圈', NULL, NULL, 'Z', 122.127243, 40.263645, 3, 'tr_0 tr_210000 tr_210800', 1);
INSERT INTO `sys_area`
VALUES (210811, '老边区', 210800, '老边', NULL, NULL, 'L', 122.382584, 40.682724, 3, 'tr_0 tr_210000 tr_210800', 4);
INSERT INTO `sys_area`
VALUES (210881, '盖州市', 210800, '盖州', NULL, NULL, 'G', 122.355537, 40.405235, 3, 'tr_0 tr_210000 tr_210800', 3);
INSERT INTO `sys_area`
VALUES (210882, '大石桥市', 210800, '大石桥', NULL, NULL, 'D', 122.505898, 40.633972, 3, 'tr_0 tr_210000 tr_210800', 2);
INSERT INTO `sys_area`
VALUES (210900, '阜新市', 210000, '阜新', NULL, NULL, 'F', 121.648964, 42.011795, 2, 'tr_0 tr_210000', 7);
INSERT INTO `sys_area`
VALUES (210902, '海州区', 210900, '海州', NULL, NULL, 'H', 121.657639, 42.011162, 3, 'tr_0 tr_210000 tr_210900', 2);
INSERT INTO `sys_area`
VALUES (210903, '新邱区', 210900, '新邱', NULL, NULL, 'X', 121.790543, 42.086601, 3, 'tr_0 tr_210000 tr_210900', 6);
INSERT INTO `sys_area`
VALUES (210904, '太平区', 210900, '太平', NULL, NULL, 'T', 121.677574, 42.011147, 3, 'tr_0 tr_210000 tr_210900', 4);
INSERT INTO `sys_area`
VALUES (210905, '清河门区', 210900, '清河门', NULL, NULL, 'Q', 121.420181, 41.780476, 3, 'tr_0 tr_210000 tr_210900', 3);
INSERT INTO `sys_area`
VALUES (210911, '细河区', 210900, '细河', NULL, NULL, 'X', 121.654793, 42.019218, 3, 'tr_0 tr_210000 tr_210900', 5);
INSERT INTO `sys_area`
VALUES (210921, '阜新蒙古族自治县', 210900, '阜新', NULL, NULL, 'F', 121.743126, 42.058605, 3, 'tr_0 tr_210000 tr_210900', 1);
INSERT INTO `sys_area`
VALUES (210922, '彰武县', 210900, '彰武', NULL, NULL, 'Z', 122.537445, 42.384823, 3, 'tr_0 tr_210000 tr_210900', 7);
INSERT INTO `sys_area`
VALUES (211000, '辽阳市', 210000, '辽阳', NULL, NULL, 'L', 123.181519, 41.269402, 2, 'tr_0 tr_210000', 10);
INSERT INTO `sys_area`
VALUES (211002, '白塔区', 211000, '白塔', NULL, NULL, 'B', 123.172607, 41.267448, 3, 'tr_0 tr_210000 tr_211000', 1);
INSERT INTO `sys_area`
VALUES (211003, '文圣区', 211000, '文圣', NULL, NULL, 'W', 123.188225, 41.266766, 3, 'tr_0 tr_210000 tr_211000', 7);
INSERT INTO `sys_area`
VALUES (211004, '宏伟区', 211000, '宏伟', NULL, NULL, 'H', 123.200462, 41.205746, 3, 'tr_0 tr_210000 tr_211000', 4);
INSERT INTO `sys_area`
VALUES (211005, '弓长岭区', 211000, '弓长岭', NULL, NULL, 'G', 123.431633, 41.157829, 3, 'tr_0 tr_210000 tr_211000', 3);
INSERT INTO `sys_area`
VALUES (211011, '太子河区', 211000, '太子河', NULL, NULL, 'T', 123.185333, 41.251682, 3, 'tr_0 tr_210000 tr_211000', 6);
INSERT INTO `sys_area`
VALUES (211021, '辽阳县', 211000, '辽阳', NULL, NULL, 'L', 123.079674, 41.216480, 3, 'tr_0 tr_210000 tr_211000', 5);
INSERT INTO `sys_area`
VALUES (211081, '灯塔市', 211000, '灯塔', NULL, NULL, 'D', 123.325867, 41.427837, 3, 'tr_0 tr_210000 tr_211000', 2);
INSERT INTO `sys_area`
VALUES (211100, '盘锦市', 210000, '盘锦', NULL, NULL, 'P', 122.069572, 41.124485, 2, 'tr_0 tr_210000', 11);
INSERT INTO `sys_area`
VALUES (211102, '双台子区', 211100, '双台子', NULL, NULL, 'S', 122.055733, 41.190365, 3, 'tr_0 tr_210000 tr_211100', 3);
INSERT INTO `sys_area`
VALUES (211103, '兴隆台区', 211100, '兴隆台', NULL, NULL, 'X', 122.071625, 41.122421, 3, 'tr_0 tr_210000 tr_211100', 4);
INSERT INTO `sys_area`
VALUES (211121, '大洼县', 211100, '大洼', NULL, NULL, 'D', 122.071709, 40.994427, 3, 'tr_0 tr_210000 tr_211100', 1);
INSERT INTO `sys_area`
VALUES (211122, '盘山县', 211100, '盘山', NULL, NULL, 'P', 121.985283, 41.240700, 3, 'tr_0 tr_210000 tr_211100', 2);
INSERT INTO `sys_area`
VALUES (211200, '铁岭市', 210000, '铁岭', NULL, NULL, 'T', 123.844276, 42.290585, 2, 'tr_0 tr_210000', 13);
INSERT INTO `sys_area`
VALUES (211202, '银州区', 211200, '银州', NULL, NULL, 'Y', 123.844879, 42.292278, 3, 'tr_0 tr_210000 tr_211200', 7);
INSERT INTO `sys_area`
VALUES (211204, '清河区', 211200, '清河', NULL, NULL, 'Q', 124.148956, 42.542976, 3, 'tr_0 tr_210000 tr_211200', 4);
INSERT INTO `sys_area`
VALUES (211221, '铁岭县', 211200, '铁岭', NULL, NULL, 'T', 123.725670, 42.223316, 3, 'tr_0 tr_210000 tr_211200', 5);
INSERT INTO `sys_area`
VALUES (211223, '西丰县', 211200, '西丰', NULL, NULL, 'X', 124.723320, 42.738091, 3, 'tr_0 tr_210000 tr_211200', 6);
INSERT INTO `sys_area`
VALUES (211224, '昌图县', 211200, '昌图', NULL, NULL, 'C', 124.110168, 42.784443, 3, 'tr_0 tr_210000 tr_211200', 1);
INSERT INTO `sys_area`
VALUES (211281, '调兵山市', 211200, '调兵山', NULL, NULL, 'D', 123.545364, 42.450733, 3, 'tr_0 tr_210000 tr_211200', 2);
INSERT INTO `sys_area`
VALUES (211282, '开原市', 211200, '开原', NULL, NULL, 'K', 124.045547, 42.542141, 3, 'tr_0 tr_210000 tr_211200', 3);
INSERT INTO `sys_area`
VALUES (211300, '朝阳市', 210000, '朝阳', NULL, NULL, 'C', 120.451180, 41.576759, 2, 'tr_0 tr_210000', 3);
INSERT INTO `sys_area`
VALUES (211302, '双塔区', 211300, '双塔', NULL, NULL, 'S', 120.448769, 41.579388, 3, 'tr_0 tr_210000 tr_211300', 7);
INSERT INTO `sys_area`
VALUES (211303, '龙城区', 211300, '龙城', NULL, NULL, 'L', 120.413376, 41.576748, 3, 'tr_0 tr_210000 tr_211300', 6);
INSERT INTO `sys_area`
VALUES (211321, '朝阳县', 211300, '朝阳', NULL, NULL, 'C', 120.404221, 41.526340, 3, 'tr_0 tr_210000 tr_211300', 2);
INSERT INTO `sys_area`
VALUES (211322, '建平县', 211300, '建平', NULL, NULL, 'J', 119.642365, 41.402576, 3, 'tr_0 tr_210000 tr_211300', 3);
INSERT INTO `sys_area`
VALUES (211324, '喀喇沁左翼蒙古族自治县', 211300, '喀左', NULL, NULL, 'K', 119.744881, 41.125427, 3, 'tr_0 tr_210000 tr_211300', 4);
INSERT INTO `sys_area`
VALUES (211381, '北票市', 211300, '北票', NULL, NULL, 'B', 120.766953, 41.803288, 3, 'tr_0 tr_210000 tr_211300', 1);
INSERT INTO `sys_area`
VALUES (211382, '凌源市', 211300, '凌源', NULL, NULL, 'L', 119.404793, 41.243088, 3, 'tr_0 tr_210000 tr_211300', 5);
INSERT INTO `sys_area`
VALUES (211400, '葫芦岛市', 210000, '葫芦岛', NULL, NULL, 'H', 120.856392, 40.755573, 2, 'tr_0 tr_210000', 8);
INSERT INTO `sys_area`
VALUES (211402, '连山区', 211400, '连山', NULL, NULL, 'L', 120.859367, 40.755142, 3, 'tr_0 tr_210000 tr_211400', 2);
INSERT INTO `sys_area`
VALUES (211403, '龙港区', 211400, '龙港', NULL, NULL, 'L', 120.838570, 40.709991, 3, 'tr_0 tr_210000 tr_211400', 3);
INSERT INTO `sys_area`
VALUES (211404, '南票区', 211400, '南票', NULL, NULL, 'N', 120.752312, 41.098812, 3, 'tr_0 tr_210000 tr_211400', 4);
INSERT INTO `sys_area`
VALUES (211421, '绥中县', 211400, '绥中', NULL, NULL, 'S', 120.342110, 40.328407, 3, 'tr_0 tr_210000 tr_211400', 5);
INSERT INTO `sys_area`
VALUES (211422, '建昌县', 211400, '建昌', NULL, NULL, 'J', 119.807777, 40.812870, 3, 'tr_0 tr_210000 tr_211400', 1);
INSERT INTO `sys_area`
VALUES (211481, '兴城市', 211400, '兴城', NULL, NULL, 'X', 120.729362, 40.619411, 3, 'tr_0 tr_210000 tr_211400', 6);
INSERT INTO `sys_area`
VALUES (220000, '吉林省', 0, '吉林', NULL, NULL, 'J', 125.324501, 43.886841, 1, 'tr_0', 7);
INSERT INTO `sys_area`
VALUES (220100, '长春市', 220000, '长春', NULL, NULL, 'C', 125.324501, 43.886841, 2, 'tr_0 tr_220000', 3);
INSERT INTO `sys_area`
VALUES (220102, '南关区', 220100, '南关', NULL, NULL, 'N', 125.337234, 43.890236, 3, 'tr_0 tr_220000 tr_220100', 7);
INSERT INTO `sys_area`
VALUES (220103, '宽城区', 220100, '宽城', NULL, NULL, 'K', 125.342827, 43.903824, 3, 'tr_0 tr_220000 tr_220100', 5);
INSERT INTO `sys_area`
VALUES (220104, '朝阳区', 220100, '朝阳', NULL, NULL, 'C', 125.318039, 43.864910, 3, 'tr_0 tr_220000 tr_220100', 1);
INSERT INTO `sys_area`
VALUES (220105, '二道区', 220100, '二道', NULL, NULL, 'E', 125.384727, 43.870823, 3, 'tr_0 tr_220000 tr_220100', 3);
INSERT INTO `sys_area`
VALUES (220106, '绿园区', 220100, '绿园', NULL, NULL, 'L', 125.272469, 43.892178, 3, 'tr_0 tr_220000 tr_220100', 6);
INSERT INTO `sys_area`
VALUES (220112, '双阳区', 220100, '双阳', NULL, NULL, 'S', 125.659019, 43.525169, 3, 'tr_0 tr_220000 tr_220100', 9);
INSERT INTO `sys_area`
VALUES (220122, '农安县', 220100, '农安', NULL, NULL, 'N', 125.175285, 44.431259, 3, 'tr_0 tr_220000 tr_220100', 8);
INSERT INTO `sys_area`
VALUES (220181, '九台市', 220100, '九台', NULL, NULL, 'J', 125.844681, 44.157154, 3, 'tr_0 tr_220000 tr_220100', 4);
INSERT INTO `sys_area`
VALUES (220182, '榆树市', 220100, '榆树', NULL, NULL, 'Y', 126.550110, 44.827641, 3, 'tr_0 tr_220000 tr_220100', 10);
INSERT INTO `sys_area`
VALUES (220183, '德惠市', 220100, '德惠', NULL, NULL, 'D', 125.703323, 44.533909, 3, 'tr_0 tr_220000 tr_220100', 2);
INSERT INTO `sys_area`
VALUES (220200, '吉林市', 220000, '吉林', NULL, NULL, 'J', 126.553017, 43.843578, 2, 'tr_0 tr_220000', 4);
INSERT INTO `sys_area`
VALUES (220202, '昌邑区', 220200, '昌邑', NULL, NULL, 'C', 126.570763, 43.851116, 3, 'tr_0 tr_220000 tr_220200', 1);
INSERT INTO `sys_area`
VALUES (220203, '龙潭区', 220200, '龙潭', NULL, NULL, 'L', 126.561432, 43.909756, 3, 'tr_0 tr_220000 tr_220200', 6);
INSERT INTO `sys_area`
VALUES (220204, '船营区', 220200, '船营', NULL, NULL, 'C', 126.552391, 43.843803, 3, 'tr_0 tr_220000 tr_220200', 2);
INSERT INTO `sys_area`
VALUES (220211, '丰满区', 220200, '丰满', NULL, NULL, 'F', 126.560760, 43.816593, 3, 'tr_0 tr_220000 tr_220200', 3);
INSERT INTO `sys_area`
VALUES (220221, '永吉县', 220200, '永吉', NULL, NULL, 'Y', 126.501625, 43.667416, 3, 'tr_0 tr_220000 tr_220200', 9);
INSERT INTO `sys_area`
VALUES (220281, '蛟河市', 220200, '蛟河', NULL, NULL, 'Z', 127.342735, 43.720577, 3, 'tr_0 tr_220000 tr_220200', 5);
INSERT INTO `sys_area`
VALUES (220282, '桦甸市', 220200, '桦甸', NULL, NULL, 'Z', 126.745445, 42.972092, 3, 'tr_0 tr_220000 tr_220200', 4);
INSERT INTO `sys_area`
VALUES (220283, '舒兰市', 220200, '舒兰', NULL, NULL, 'S', 126.947815, 44.410908, 3, 'tr_0 tr_220000 tr_220200', 8);
INSERT INTO `sys_area`
VALUES (220284, '磐石市', 220200, '磐石', NULL, NULL, 'P', 126.059929, 42.942474, 3, 'tr_0 tr_220000 tr_220200', 7);
INSERT INTO `sys_area`
VALUES (220300, '四平市', 220000, '四平', NULL, NULL, 'S', 124.370789, 43.170345, 2, 'tr_0 tr_220000', 6);
INSERT INTO `sys_area`
VALUES (220302, '铁西区', 220300, '铁西', NULL, NULL, 'T', 124.360893, 43.176262, 3, 'tr_0 tr_220000 tr_220300', 5);
INSERT INTO `sys_area`
VALUES (220303, '铁东区', 220300, '铁东', NULL, NULL, 'T', 124.388466, 43.167259, 3, 'tr_0 tr_220000 tr_220300', 4);
INSERT INTO `sys_area`
VALUES (220322, '梨树县', 220300, '梨树', NULL, NULL, 'L', 124.335800, 43.308311, 3, 'tr_0 tr_220000 tr_220300', 2);
INSERT INTO `sys_area`
VALUES (220323, '伊通满族自治县', 220300, '伊通', NULL, NULL, 'Y', 125.303123, 43.345463, 3, 'tr_0 tr_220000 tr_220300', 6);
INSERT INTO `sys_area`
VALUES (220381, '公主岭市', 220300, '公主岭', NULL, NULL, 'G', 124.817589, 43.509476, 3, 'tr_0 tr_220000 tr_220300', 1);
INSERT INTO `sys_area`
VALUES (220382, '双辽市', 220300, '双辽', NULL, NULL, 'S', 123.505280, 43.518276, 3, 'tr_0 tr_220000 tr_220300', 3);
INSERT INTO `sys_area`
VALUES (220400, '辽源市', 220000, '辽源', NULL, NULL, 'L', 125.145348, 42.902691, 2, 'tr_0 tr_220000', 5);
INSERT INTO `sys_area`
VALUES (220402, '龙山区', 220400, '龙山', NULL, NULL, 'L', 125.145164, 42.902702, 3, 'tr_0 tr_220000 tr_220400', 3);
INSERT INTO `sys_area`
VALUES (220403, '西安区', 220400, '西安', NULL, NULL, 'X', 125.151421, 42.920414, 3, 'tr_0 tr_220000 tr_220400', 4);
INSERT INTO `sys_area`
VALUES (220421, '东丰县', 220400, '东丰', NULL, NULL, 'D', 125.529625, 42.675228, 3, 'tr_0 tr_220000 tr_220400', 1);
INSERT INTO `sys_area`
VALUES (220422, '东辽县', 220400, '东辽', NULL, NULL, 'D', 124.991997, 42.927723, 3, 'tr_0 tr_220000 tr_220400', 2);
INSERT INTO `sys_area`
VALUES (220500, '通化市', 220000, '通化', NULL, NULL, 'T', 125.936501, 41.721176, 2, 'tr_0 tr_220000', 8);
INSERT INTO `sys_area`
VALUES (220502, '东昌区', 220500, '东昌', NULL, NULL, 'D', 125.936714, 41.721233, 3, 'tr_0 tr_220000 tr_220500', 1);
INSERT INTO `sys_area`
VALUES (220503, '二道江区', 220500, '二道江', NULL, NULL, 'E', 126.045990, 41.777565, 3, 'tr_0 tr_220000 tr_220500', 2);
INSERT INTO `sys_area`
VALUES (220521, '通化县', 220500, '通化', NULL, NULL, 'T', 125.753120, 41.677917, 3, 'tr_0 tr_220000 tr_220500', 7);
INSERT INTO `sys_area`
VALUES (220523, '辉南县', 220500, '辉南', NULL, NULL, 'H', 126.042824, 42.683460, 3, 'tr_0 tr_220000 tr_220500', 3);
INSERT INTO `sys_area`
VALUES (220524, '柳河县', 220500, '柳河', NULL, NULL, 'L', 125.740540, 42.281483, 3, 'tr_0 tr_220000 tr_220500', 5);
INSERT INTO `sys_area`
VALUES (220581, '梅河口市', 220500, '梅河口', NULL, NULL, 'M', 125.687340, 42.530003, 3, 'tr_0 tr_220000 tr_220500', 6);
INSERT INTO `sys_area`
VALUES (220582, '集安市', 220500, '集安', NULL, NULL, 'J', 126.186203, 41.126274, 3, 'tr_0 tr_220000 tr_220500', 4);
INSERT INTO `sys_area`
VALUES (220600, '白山市', 220000, '白山', NULL, NULL, 'B', 126.427841, 41.942505, 2, 'tr_0 tr_220000', 2);
INSERT INTO `sys_area`
VALUES (220602, '浑江区', 220600, '浑江', NULL, NULL, 'H', 126.428032, 41.943066, 3, 'tr_0 tr_220000 tr_220600', 3);
INSERT INTO `sys_area`
VALUES (220621, '抚松县', 220600, '抚松', NULL, NULL, 'F', 127.273796, 42.332642, 3, 'tr_0 tr_220000 tr_220600', 2);
INSERT INTO `sys_area`
VALUES (220622, '靖宇县', 220600, '靖宇', NULL, NULL, 'J', 126.808388, 42.389690, 3, 'tr_0 tr_220000 tr_220600', 5);
INSERT INTO `sys_area`
VALUES (220623, '长白朝鲜族自治县', 220600, '长白', NULL, NULL, 'C', 128.203384, 41.419361, 3, 'tr_0 tr_220000 tr_220600', 1);
INSERT INTO `sys_area`
VALUES (220625, '江源区', 220600, '江源', NULL, NULL, 'J', 126.584229, 42.048107, 3, 'tr_0 tr_220000 tr_220600', 4);
INSERT INTO `sys_area`
VALUES (220681, '临江市', 220600, '临江', NULL, NULL, 'L', 126.919296, 41.810688, 3, 'tr_0 tr_220000 tr_220600', 6);
INSERT INTO `sys_area`
VALUES (220700, '松原市', 220000, '松原', NULL, NULL, 'S', 124.823608, 45.118244, 2, 'tr_0 tr_220000', 7);
INSERT INTO `sys_area`
VALUES (220702, '宁江区', 220700, '宁江', NULL, NULL, 'N', 124.827850, 45.176498, 3, 'tr_0 tr_220000 tr_220700', 3);
INSERT INTO `sys_area`
VALUES (220721, '前郭尔罗斯蒙古族自治县', 220700, '前郭', NULL, NULL, 'Q', 124.826805, 45.116287, 3, 'tr_0 tr_220000 tr_220700', 5);
INSERT INTO `sys_area`
VALUES (220722, '长岭县', 220700, '长岭', NULL, NULL, 'C', 123.985184, 44.276581, 3, 'tr_0 tr_220000 tr_220700', 1);
INSERT INTO `sys_area`
VALUES (220723, '乾安县', 220700, '乾安', NULL, NULL, 'Q', 124.024361, 45.006847, 3, 'tr_0 tr_220000 tr_220700', 4);
INSERT INTO `sys_area`
VALUES (220724, '扶余市', 220700, '扶余', NULL, NULL, 'F', 126.042755, 44.986198, 3, 'tr_0 tr_220000 tr_220700', 2);
INSERT INTO `sys_area`
VALUES (220800, '白城市', 220000, '白城', NULL, NULL, 'B', 122.841110, 45.619026, 2, 'tr_0 tr_220000', 1);
INSERT INTO `sys_area`
VALUES (220802, '洮北区', 220800, '洮北', NULL, NULL, 'Z', 122.842499, 45.619251, 3, 'tr_0 tr_220000 tr_220800', 2);
INSERT INTO `sys_area`
VALUES (220821, '镇赉县', 220800, '镇赉', NULL, NULL, 'Z', 123.202248, 45.846088, 3, 'tr_0 tr_220000 tr_220800', 5);
INSERT INTO `sys_area`
VALUES (220822, '通榆县', 220800, '通榆', NULL, NULL, 'T', 123.088547, 44.809151, 3, 'tr_0 tr_220000 tr_220800', 4);
INSERT INTO `sys_area`
VALUES (220881, '洮南市', 220800, '洮南', NULL, NULL, 'Z', 122.783775, 45.339111, 3, 'tr_0 tr_220000 tr_220800', 3);
INSERT INTO `sys_area`
VALUES (220882, '大安市', 220800, '大安', NULL, NULL, 'D', 124.291512, 45.507648, 3, 'tr_0 tr_220000 tr_220800', 1);
INSERT INTO `sys_area`
VALUES (222400, '延边朝鲜族自治州', 220000, '延边朝鲜族', NULL, NULL, 'Y', 129.513229, 42.904823, 2, 'tr_0 tr_220000', 9);
INSERT INTO `sys_area`
VALUES (222401, '延吉市', 222400, '延吉', NULL, NULL, 'Y', 129.515793, 42.906963, 3, 'tr_0 tr_220000 tr_222400', 8);
INSERT INTO `sys_area`
VALUES (222402, '图们市', 222400, '图们', NULL, NULL, 'T', 129.846695, 42.966621, 3, 'tr_0 tr_220000 tr_222400', 6);
INSERT INTO `sys_area`
VALUES (222403, '敦化市', 222400, '敦化', NULL, NULL, 'D', 128.229858, 43.366920, 3, 'tr_0 tr_220000 tr_222400', 2);
INSERT INTO `sys_area`
VALUES (222404, '珲春市', 222400, '珲春', NULL, NULL, 'Z', 130.365784, 42.871056, 3, 'tr_0 tr_220000 tr_222400', 4);
INSERT INTO `sys_area`
VALUES (222405, '龙井市', 222400, '龙井', NULL, NULL, 'L', 129.425751, 42.771030, 3, 'tr_0 tr_220000 tr_222400', 5);
INSERT INTO `sys_area`
VALUES (222406, '和龙市', 222400, '和龙', NULL, NULL, 'H', 129.008743, 42.547005, 3, 'tr_0 tr_220000 tr_222400', 3);
INSERT INTO `sys_area`
VALUES (222424, '汪清县', 222400, '汪清', NULL, NULL, 'W', 129.766159, 43.315426, 3, 'tr_0 tr_220000 tr_222400', 7);
INSERT INTO `sys_area`
VALUES (222426, '安图县', 222400, '安图', NULL, NULL, 'A', 128.901871, 43.110992, 3, 'tr_0 tr_220000 tr_222400', 1);
INSERT INTO `sys_area`
VALUES (230000, '黑龙江省', 0, '黑龙江', NULL, NULL, 'H', 126.642464, 45.756966, 1, 'tr_0', 8);
INSERT INTO `sys_area`
VALUES (230100, '哈尔滨市', 230000, '哈尔滨', NULL, NULL, 'H', 126.642464, 45.756966, 2, 'tr_0 tr_230000', 3);
INSERT INTO `sys_area`
VALUES (230102, '道里区', 230100, '道里', NULL, NULL, 'D', 126.612534, 45.762035, 3, 'tr_0 tr_230000 tr_230100', 4);
INSERT INTO `sys_area`
VALUES (230103, '南岗区', 230100, '南岗', NULL, NULL, 'N', 126.652100, 45.755970, 3, 'tr_0 tr_230000 tr_230100', 10);
INSERT INTO `sys_area`
VALUES (230104, '道外区', 230100, '道外', NULL, NULL, 'D', 126.648834, 45.784538, 3, 'tr_0 tr_230000 tr_230100', 5);
INSERT INTO `sys_area`
VALUES (230106, '香坊区', 230100, '香坊', NULL, NULL, 'X', 126.667046, 45.713066, 3, 'tr_0 tr_230000 tr_230100', 6);
INSERT INTO `sys_area`
VALUES (230108, '平房区', 230100, '平房', NULL, NULL, 'P', 126.629257, 45.605568, 3, 'tr_0 tr_230000 tr_230100', 11);
INSERT INTO `sys_area`
VALUES (230109, '松北区', 230100, '松北', NULL, NULL, 'S', 126.563065, 45.814655, 3, 'tr_0 tr_230000 tr_230100', 14);
INSERT INTO `sys_area`
VALUES (230111, '呼兰区', 230100, '呼兰', NULL, NULL, 'H', 126.603302, 45.984230, 3, 'tr_0 tr_230000 tr_230100', 8);
INSERT INTO `sys_area`
VALUES (230123, '依兰县', 230100, '依兰', NULL, NULL, 'Y', 129.565598, 46.315105, 3, 'tr_0 tr_230000 tr_230100', 18);
INSERT INTO `sys_area`
VALUES (230124, '方正县', 230100, '方正', NULL, NULL, 'F', 128.836136, 45.839535, 3, 'tr_0 tr_230000 tr_230100', 7);
INSERT INTO `sys_area`
VALUES (230125, '宾县', 230100, '宾县', NULL, NULL, 'B', 127.485939, 45.759369, 3, 'tr_0 tr_230000 tr_230100', 3);
INSERT INTO `sys_area`
VALUES (230126, '巴彦县', 230100, '巴彦', NULL, NULL, 'B', 127.403603, 46.081890, 3, 'tr_0 tr_230000 tr_230100', 2);
INSERT INTO `sys_area`
VALUES (230127, '木兰县', 230100, '木兰', NULL, NULL, 'M', 128.042679, 45.949825, 3, 'tr_0 tr_230000 tr_230100', 9);
INSERT INTO `sys_area`
VALUES (230128, '通河县', 230100, '通河', NULL, NULL, 'T', 128.747787, 45.977619, 3, 'tr_0 tr_230000 tr_230100', 15);
INSERT INTO `sys_area`
VALUES (230129, '延寿县', 230100, '延寿', NULL, NULL, 'Y', 128.331879, 45.455647, 3, 'tr_0 tr_230000 tr_230100', 17);
INSERT INTO `sys_area`
VALUES (230181, '阿城区', 230100, '阿城', NULL, NULL, 'A', 126.972725, 45.538372, 3, 'tr_0 tr_230000 tr_230100', 1);
INSERT INTO `sys_area`
VALUES (230182, '双城市', 230100, '双城', NULL, NULL, 'S', 126.308784, 45.377941, 3, 'tr_0 tr_230000 tr_230100', 13);
INSERT INTO `sys_area`
VALUES (230183, '尚志市', 230100, '尚志', NULL, NULL, 'S', 127.968536, 45.214954, 3, 'tr_0 tr_230000 tr_230100', 12);
INSERT INTO `sys_area`
VALUES (230184, '五常市', 230100, '五常', NULL, NULL, 'W', 127.157593, 44.919418, 3, 'tr_0 tr_230000 tr_230100', 16);
INSERT INTO `sys_area`
VALUES (230200, '齐齐哈尔市', 230000, '齐齐哈尔', NULL, NULL, 'Q', 123.957916, 47.342079, 2, 'tr_0 tr_230000', 9);
INSERT INTO `sys_area`
VALUES (230202, '龙沙区', 230200, '龙沙', NULL, NULL, 'L', 123.957336, 47.341736, 3, 'tr_0 tr_230000 tr_230200', 10);
INSERT INTO `sys_area`
VALUES (230203, '建华区', 230200, '建华', NULL, NULL, 'J', 123.955887, 47.354492, 3, 'tr_0 tr_230000 tr_230200', 6);
INSERT INTO `sys_area`
VALUES (230204, '铁锋区', 230200, '铁锋', NULL, NULL, 'T', 123.973557, 47.339500, 3, 'tr_0 tr_230000 tr_230200', 15);
INSERT INTO `sys_area`
VALUES (230205, '昂昂溪区', 230200, '昂昂溪', NULL, NULL, 'A', 123.813179, 47.156868, 3, 'tr_0 tr_230000 tr_230200', 1);
INSERT INTO `sys_area`
VALUES (230206, '富拉尔基区', 230200, '富拉尔基', NULL, NULL, 'F', 123.638870, 47.206970, 3, 'tr_0 tr_230000 tr_230200', 3);
INSERT INTO `sys_area`
VALUES (230207, '碾子山区', 230200, '碾子山', NULL, NULL, 'N', 122.887970, 47.514011, 3, 'tr_0 tr_230000 tr_230200', 13);
INSERT INTO `sys_area`
VALUES (230208, '梅里斯达斡尔族区', 230200, '梅里斯达斡尔族', NULL, NULL, 'M', 123.754601, 47.311111, 3, 'tr_0 tr_230000 tr_230200', 11);
INSERT INTO `sys_area`
VALUES (230221, '龙江县', 230200, '龙江', NULL, NULL, 'L', 123.187225, 47.336388, 3, 'tr_0 tr_230000 tr_230200', 9);
INSERT INTO `sys_area`
VALUES (230223, '依安县', 230200, '依安', NULL, NULL, 'Y', 125.307564, 47.890099, 3, 'tr_0 tr_230000 tr_230200', 16);
INSERT INTO `sys_area`
VALUES (230224, '泰来县', 230200, '泰来', NULL, NULL, 'T', 123.419533, 46.392330, 3, 'tr_0 tr_230000 tr_230200', 14);
INSERT INTO `sys_area`
VALUES (230225, '甘南县', 230200, '甘南', NULL, NULL, 'G', 123.506035, 47.917839, 3, 'tr_0 tr_230000 tr_230200', 5);
INSERT INTO `sys_area`
VALUES (230227, '富裕县', 230200, '富裕', NULL, NULL, 'F', 124.469109, 47.797173, 3, 'tr_0 tr_230000 tr_230200', 4);
INSERT INTO `sys_area`
VALUES (230229, '克山县', 230200, '克山', NULL, NULL, 'K', 125.874352, 48.034344, 3, 'tr_0 tr_230000 tr_230200', 8);
INSERT INTO `sys_area`
VALUES (230230, '克东县', 230200, '克东', NULL, NULL, 'K', 126.249092, 48.037319, 3, 'tr_0 tr_230000 tr_230200', 7);
INSERT INTO `sys_area`
VALUES (230231, '拜泉县', 230200, '拜泉', NULL, NULL, 'B', 126.091911, 47.607365, 3, 'tr_0 tr_230000 tr_230200', 2);
INSERT INTO `sys_area`
VALUES (230281, '讷河市', 230200, '讷河', NULL, NULL, 'Z', 124.882172, 48.481133, 3, 'tr_0 tr_230000 tr_230200', 12);
INSERT INTO `sys_area`
VALUES (230300, '鸡西市', 230000, '鸡西', NULL, NULL, 'J', 130.975967, 45.300045, 2, 'tr_0 tr_230000', 7);
INSERT INTO `sys_area`
VALUES (230302, '鸡冠区', 230300, '鸡冠', NULL, NULL, 'J', 130.974380, 45.300339, 3, 'tr_0 tr_230000 tr_230300', 6);
INSERT INTO `sys_area`
VALUES (230303, '恒山区', 230300, '恒山', NULL, NULL, 'H', 130.910629, 45.213242, 3, 'tr_0 tr_230000 tr_230300', 3);
INSERT INTO `sys_area`
VALUES (230304, '滴道区', 230300, '滴道', NULL, NULL, 'D', 130.846817, 45.348812, 3, 'tr_0 tr_230000 tr_230300', 2);
INSERT INTO `sys_area`
VALUES (230305, '梨树区', 230300, '梨树', NULL, NULL, 'L', 130.697784, 45.092194, 3, 'tr_0 tr_230000 tr_230300', 7);
INSERT INTO `sys_area`
VALUES (230306, '城子河区', 230300, '城子河', NULL, NULL, 'C', 131.010498, 45.338249, 3, 'tr_0 tr_230000 tr_230300', 1);
INSERT INTO `sys_area`
VALUES (230307, '麻山区', 230300, '麻山', NULL, NULL, 'M', 130.481125, 45.209606, 3, 'tr_0 tr_230000 tr_230300', 8);
INSERT INTO `sys_area`
VALUES (230321, '鸡东县', 230300, '鸡东', NULL, NULL, 'J', 131.148911, 45.250893, 3, 'tr_0 tr_230000 tr_230300', 5);
INSERT INTO `sys_area`
VALUES (230381, '虎林市', 230300, '虎林', NULL, NULL, 'H', 132.973877, 45.767986, 3, 'tr_0 tr_230000 tr_230300', 4);
INSERT INTO `sys_area`
VALUES (230382, '密山市', 230300, '密山', NULL, NULL, 'M', 131.874130, 45.547249, 3, 'tr_0 tr_230000 tr_230300', 9);
INSERT INTO `sys_area`
VALUES (230400, '鹤岗市', 230000, '鹤岗', NULL, NULL, 'H', 130.277481, 47.332085, 2, 'tr_0 tr_230000', 4);
INSERT INTO `sys_area`
VALUES (230402, '向阳区', 230400, '向阳', NULL, NULL, 'X', 130.292480, 47.345371, 3, 'tr_0 tr_230000 tr_230400', 6);
INSERT INTO `sys_area`
VALUES (230403, '工农区', 230400, '工农', NULL, NULL, 'G', 130.276657, 47.331676, 3, 'tr_0 tr_230000 tr_230400', 2);
INSERT INTO `sys_area`
VALUES (230404, '南山区', 230400, '南山', NULL, NULL, 'N', 130.275528, 47.313240, 3, 'tr_0 tr_230000 tr_230400', 4);
INSERT INTO `sys_area`
VALUES (230405, '兴安区', 230400, '兴安', NULL, NULL, 'X', 130.236176, 47.252911, 3, 'tr_0 tr_230000 tr_230400', 7);
INSERT INTO `sys_area`
VALUES (230406, '东山区', 230400, '东山', NULL, NULL, 'D', 130.317139, 47.337383, 3, 'tr_0 tr_230000 tr_230400', 1);
INSERT INTO `sys_area`
VALUES (230407, '兴山区', 230400, '兴山', NULL, NULL, 'X', 130.305344, 47.359970, 3, 'tr_0 tr_230000 tr_230400', 8);
INSERT INTO `sys_area`
VALUES (230421, '萝北县', 230400, '萝北', NULL, NULL, 'L', 130.829086, 47.577576, 3, 'tr_0 tr_230000 tr_230400', 3);
INSERT INTO `sys_area`
VALUES (230422, '绥滨县', 230400, '绥滨', NULL, NULL, 'S', 131.860519, 47.289890, 3, 'tr_0 tr_230000 tr_230400', 5);
INSERT INTO `sys_area`
VALUES (230500, '双鸭山市', 230000, '双鸭山', NULL, NULL, 'S', 131.157303, 46.643440, 2, 'tr_0 tr_230000', 11);
INSERT INTO `sys_area`
VALUES (230502, '尖山区', 230500, '尖山', NULL, NULL, 'J', 131.158966, 46.642960, 3, 'tr_0 tr_230000 tr_230500', 3);
INSERT INTO `sys_area`
VALUES (230503, '岭东区', 230500, '岭东', NULL, NULL, 'L', 131.163681, 46.591076, 3, 'tr_0 tr_230000 tr_230500', 5);
INSERT INTO `sys_area`
VALUES (230505, '四方台区', 230500, '四方台', NULL, NULL, 'S', 131.333176, 46.594345, 3, 'tr_0 tr_230000 tr_230500', 7);
INSERT INTO `sys_area`
VALUES (230506, '宝山区', 230500, '宝山', NULL, NULL, 'B', 131.404297, 46.573364, 3, 'tr_0 tr_230000 tr_230500', 2);
INSERT INTO `sys_area`
VALUES (230521, '集贤县', 230500, '集贤', NULL, NULL, 'J', 131.139328, 46.728981, 3, 'tr_0 tr_230000 tr_230500', 4);
INSERT INTO `sys_area`
VALUES (230522, '友谊县', 230500, '友谊', NULL, NULL, 'Y', 131.810623, 46.775158, 3, 'tr_0 tr_230000 tr_230500', 8);
INSERT INTO `sys_area`
VALUES (230523, '宝清县', 230500, '宝清', NULL, NULL, 'B', 132.206421, 46.328781, 3, 'tr_0 tr_230000 tr_230500', 1);
INSERT INTO `sys_area`
VALUES (230524, '饶河县', 230500, '饶河', NULL, NULL, 'R', 134.021164, 46.801289, 3, 'tr_0 tr_230000 tr_230500', 6);
INSERT INTO `sys_area`
VALUES (230600, '大庆市', 230000, '大庆', NULL, NULL, 'D', 125.112717, 46.590733, 2, 'tr_0 tr_230000', 1);
INSERT INTO `sys_area`
VALUES (230602, '萨尔图区', 230600, '萨尔图', NULL, NULL, 'S', 125.114639, 46.596355, 3, 'tr_0 tr_230000 tr_230600', 7);
INSERT INTO `sys_area`
VALUES (230603, '龙凤区', 230600, '龙凤', NULL, NULL, 'L', 125.145798, 46.573948, 3, 'tr_0 tr_230000 tr_230600', 5);
INSERT INTO `sys_area`
VALUES (230604, '让胡路区', 230600, '让胡路', NULL, NULL, 'R', 124.868340, 46.653255, 3, 'tr_0 tr_230000 tr_230600', 6);
INSERT INTO `sys_area`
VALUES (230605, '红岗区', 230600, '红岗', NULL, NULL, 'H', 124.889526, 46.403049, 3, 'tr_0 tr_230000 tr_230600', 3);
INSERT INTO `sys_area`
VALUES (230606, '大同区', 230600, '大同', NULL, NULL, 'D', 124.818512, 46.034306, 3, 'tr_0 tr_230000 tr_230600', 1);
INSERT INTO `sys_area`
VALUES (230621, '肇州县', 230600, '肇州', NULL, NULL, 'Z', 125.273254, 45.708687, 3, 'tr_0 tr_230000 tr_230600', 9);
INSERT INTO `sys_area`
VALUES (230622, '肇源县', 230600, '肇源', NULL, NULL, 'Z', 125.081970, 45.518833, 3, 'tr_0 tr_230000 tr_230600', 8);
INSERT INTO `sys_area`
VALUES (230623, '林甸县', 230600, '林甸', NULL, NULL, 'L', 124.877739, 47.186413, 3, 'tr_0 tr_230000 tr_230600', 4);
INSERT INTO `sys_area`
VALUES (230624, '杜尔伯特蒙古族自治县', 230600, '杜尔伯特', NULL, NULL, 'D', 124.446259, 46.865974, 3, 'tr_0 tr_230000 tr_230600', 2);
INSERT INTO `sys_area`
VALUES (230700, '伊春市', 230000, '伊春', NULL, NULL, 'Y', 128.899399, 47.724773, 2, 'tr_0 tr_230000', 13);
INSERT INTO `sys_area`
VALUES (230702, '伊春区', 230700, '伊春', NULL, NULL, 'Y', 128.899277, 47.726852, 3, 'tr_0 tr_230000 tr_230700', 16);
INSERT INTO `sys_area`
VALUES (230703, '南岔区', 230700, '南岔', NULL, NULL, 'N', 129.282455, 47.137314, 3, 'tr_0 tr_230000 tr_230700', 7);
INSERT INTO `sys_area`
VALUES (230704, '友好区', 230700, '友好', NULL, NULL, 'Y', 128.838959, 47.854301, 3, 'tr_0 tr_230000 tr_230700', 17);
INSERT INTO `sys_area`
VALUES (230705, '西林区', 230700, '西林', NULL, NULL, 'X', 129.311447, 47.479439, 3, 'tr_0 tr_230000 tr_230700', 14);
INSERT INTO `sys_area`
VALUES (230706, '翠峦区', 230700, '翠峦', NULL, NULL, 'C', 128.671753, 47.726227, 3, 'tr_0 tr_230000 tr_230700', 1);
INSERT INTO `sys_area`
VALUES (230707, '新青区', 230700, '新青', NULL, NULL, 'X', 129.529953, 48.288292, 3, 'tr_0 tr_230000 tr_230700', 15);
INSERT INTO `sys_area`
VALUES (230708, '美溪区', 230700, '美溪', NULL, NULL, 'M', 129.133408, 47.636101, 3, 'tr_0 tr_230000 tr_230700', 6);
INSERT INTO `sys_area`
VALUES (230709, '金山屯区', 230700, '金山屯', NULL, NULL, 'J', 129.435944, 47.412949, 3, 'tr_0 tr_230000 tr_230700', 5);
INSERT INTO `sys_area`
VALUES (230710, '五营区', 230700, '五营', NULL, NULL, 'W', 129.245026, 48.108204, 3, 'tr_0 tr_230000 tr_230700', 13);
INSERT INTO `sys_area`
VALUES (230711, '乌马河区', 230700, '乌马河', NULL, NULL, 'W', 128.802948, 47.726959, 3, 'tr_0 tr_230000 tr_230700', 11);
INSERT INTO `sys_area`
VALUES (230712, '汤旺河区', 230700, '汤旺河', NULL, NULL, 'T', 129.572235, 48.453651, 3, 'tr_0 tr_230000 tr_230700', 9);
INSERT INTO `sys_area`
VALUES (230713, '带岭区', 230700, '带岭', NULL, NULL, 'D', 129.021149, 47.027531, 3, 'tr_0 tr_230000 tr_230700', 2);
INSERT INTO `sys_area`
VALUES (230714, '乌伊岭区', 230700, '乌伊岭', NULL, NULL, 'W', 129.437851, 48.591122, 3, 'tr_0 tr_230000 tr_230700', 12);
INSERT INTO `sys_area`
VALUES (230715, '红星区', 230700, '红星', NULL, NULL, 'H', 129.388794, 48.238369, 3, 'tr_0 tr_230000 tr_230700', 3);
INSERT INTO `sys_area`
VALUES (230716, '上甘岭区', 230700, '上甘岭', NULL, NULL, 'S', 129.025085, 47.974857, 3, 'tr_0 tr_230000 tr_230700', 8);
INSERT INTO `sys_area`
VALUES (230722, '嘉荫县', 230700, '嘉荫', NULL, NULL, 'J', 130.397690, 48.891376, 3, 'tr_0 tr_230000 tr_230700', 4);
INSERT INTO `sys_area`
VALUES (230781, '铁力市', 230700, '铁力', NULL, NULL, 'T', 128.030563, 46.985771, 3, 'tr_0 tr_230000 tr_230700', 10);
INSERT INTO `sys_area`
VALUES (230800, '佳木斯市', 230000, '佳木斯', NULL, NULL, 'J', 130.361633, 46.809605, 2, 'tr_0 tr_230000', 6);
INSERT INTO `sys_area`
VALUES (230803, '向阳区', 230800, '向阳', NULL, NULL, 'X', 130.361786, 46.809647, 3, 'tr_0 tr_230000 tr_230800', 10);
INSERT INTO `sys_area`
VALUES (230804, '前进区', 230800, '前进', NULL, NULL, 'Q', 130.377686, 46.812344, 3, 'tr_0 tr_230000 tr_230800', 7);
INSERT INTO `sys_area`
VALUES (230805, '东风区', 230800, '东风', NULL, NULL, 'D', 130.403290, 46.822475, 3, 'tr_0 tr_230000 tr_230800', 1);
INSERT INTO `sys_area`
VALUES (230811, '郊区', 230800, '郊区', NULL, NULL, 'J', 130.361633, 46.809605, 3, 'tr_0 tr_230000 tr_230800', 6);
INSERT INTO `sys_area`
VALUES (230822, '桦南县', 230800, '桦南', NULL, NULL, 'Z', 130.570114, 46.240116, 3, 'tr_0 tr_230000 tr_230800', 5);
INSERT INTO `sys_area`
VALUES (230826, '桦川县', 230800, '桦川', NULL, NULL, 'Z', 130.723709, 47.023041, 3, 'tr_0 tr_230000 tr_230800', 4);
INSERT INTO `sys_area`
VALUES (230828, '汤原县', 230800, '汤原', NULL, NULL, 'T', 129.904465, 46.730049, 3, 'tr_0 tr_230000 tr_230800', 8);
INSERT INTO `sys_area`
VALUES (230833, '抚远县', 230800, '抚远', NULL, NULL, 'F', 134.294495, 48.364708, 3, 'tr_0 tr_230000 tr_230800', 3);
INSERT INTO `sys_area`
VALUES (230881, '同江市', 230800, '同江', NULL, NULL, 'T', 132.510117, 47.651131, 3, 'tr_0 tr_230000 tr_230800', 9);
INSERT INTO `sys_area`
VALUES (230882, '富锦市', 230800, '富锦', NULL, NULL, 'F', 132.037949, 47.250748, 3, 'tr_0 tr_230000 tr_230800', 2);
INSERT INTO `sys_area`
VALUES (230900, '七台河市', 230000, '七台河', NULL, NULL, 'Q', 131.015579, 45.771267, 2, 'tr_0 tr_230000', 10);
INSERT INTO `sys_area`
VALUES (230902, '新兴区', 230900, '新兴', NULL, NULL, 'X', 130.889481, 45.794258, 3, 'tr_0 tr_230000 tr_230900', 4);
INSERT INTO `sys_area`
VALUES (230903, '桃山区', 230900, '桃山', NULL, NULL, 'T', 131.015854, 45.771217, 3, 'tr_0 tr_230000 tr_230900', 3);
INSERT INTO `sys_area`
VALUES (230904, '茄子河区', 230900, '茄子河', NULL, NULL, 'Q', 131.071564, 45.776588, 3, 'tr_0 tr_230000 tr_230900', 2);
INSERT INTO `sys_area`
VALUES (230921, '勃利县', 230900, '勃利', NULL, NULL, 'B', 130.575027, 45.751572, 3, 'tr_0 tr_230000 tr_230900', 1);
INSERT INTO `sys_area`
VALUES (231000, '牡丹江市', 230000, '牡丹江', NULL, NULL, 'M', 129.618607, 44.582962, 2, 'tr_0 tr_230000', 8);
INSERT INTO `sys_area`
VALUES (231002, '东安区', 231000, '东安', NULL, NULL, 'D', 129.623291, 44.582397, 3, 'tr_0 tr_230000 tr_231000', 2);
INSERT INTO `sys_area`
VALUES (231003, '阳明区', 231000, '阳明', NULL, NULL, 'Y', 129.634644, 44.596329, 3, 'tr_0 tr_230000 tr_231000', 10);
INSERT INTO `sys_area`
VALUES (231004, '爱民区', 231000, '爱民', NULL, NULL, 'A', 129.601227, 44.595444, 3, 'tr_0 tr_230000 tr_231000', 1);
INSERT INTO `sys_area`
VALUES (231005, '西安区', 231000, '西安', NULL, NULL, 'X', 129.613113, 44.581032, 3, 'tr_0 tr_230000 tr_231000', 9);
INSERT INTO `sys_area`
VALUES (231024, '东宁县', 231000, '东宁', NULL, NULL, 'D', 131.125290, 44.063580, 3, 'tr_0 tr_230000 tr_231000', 3);
INSERT INTO `sys_area`
VALUES (231025, '林口县', 231000, '林口', NULL, NULL, 'L', 130.268402, 45.286644, 3, 'tr_0 tr_230000 tr_231000', 5);
INSERT INTO `sys_area`
VALUES (231081, '绥芬河市', 231000, '绥芬河', NULL, NULL, 'S', 131.164856, 44.396866, 3, 'tr_0 tr_230000 tr_231000', 8);
INSERT INTO `sys_area`
VALUES (231083, '海林市', 231000, '海林', NULL, NULL, 'H', 129.387909, 44.574150, 3, 'tr_0 tr_230000 tr_231000', 4);
INSERT INTO `sys_area`
VALUES (231084, '宁安市', 231000, '宁安', NULL, NULL, 'N', 129.470016, 44.346836, 3, 'tr_0 tr_230000 tr_231000', 7);
INSERT INTO `sys_area`
VALUES (231085, '穆棱市', 231000, '穆棱', NULL, NULL, 'M', 130.527084, 44.919670, 3, 'tr_0 tr_230000 tr_231000', 6);
INSERT INTO `sys_area`
VALUES (231100, '黑河市', 230000, '黑河', NULL, NULL, 'H', 127.499023, 50.249584, 2, 'tr_0 tr_230000', 5);
INSERT INTO `sys_area`
VALUES (231102, '爱辉区', 231100, '爱辉', NULL, NULL, 'A', 127.497643, 50.249027, 3, 'tr_0 tr_230000 tr_231100', 1);
INSERT INTO `sys_area`
VALUES (231121, '嫩江县', 231100, '嫩江', NULL, NULL, 'N', 125.229904, 49.177460, 3, 'tr_0 tr_230000 tr_231100', 3);
INSERT INTO `sys_area`
VALUES (231123, '逊克县', 231100, '逊克', NULL, NULL, 'X', 128.476151, 49.582973, 3, 'tr_0 tr_230000 tr_231100', 6);
INSERT INTO `sys_area`
VALUES (231124, '孙吴县', 231100, '孙吴', NULL, NULL, 'S', 127.327316, 49.423943, 3, 'tr_0 tr_230000 tr_231100', 4);
INSERT INTO `sys_area`
VALUES (231181, '北安市', 231100, '北安', NULL, NULL, 'B', 126.508736, 48.245438, 3, 'tr_0 tr_230000 tr_231100', 2);
INSERT INTO `sys_area`
VALUES (231182, '五大连池市', 231100, '五大连池', NULL, NULL, 'W', 126.197693, 48.512688, 3, 'tr_0 tr_230000 tr_231100', 5);
INSERT INTO `sys_area`
VALUES (231200, '绥化市', 230000, '绥化', NULL, NULL, 'S', 126.992928, 46.637394, 2, 'tr_0 tr_230000', 12);
INSERT INTO `sys_area`
VALUES (231202, '北林区', 231200, '北林', NULL, NULL, 'B', 126.990662, 46.634911, 3, 'tr_0 tr_230000 tr_231200', 2);
INSERT INTO `sys_area`
VALUES (231221, '望奎县', 231200, '望奎', NULL, NULL, 'W', 126.484192, 46.833519, 3, 'tr_0 tr_230000 tr_231200', 9);
INSERT INTO `sys_area`
VALUES (231222, '兰西县', 231200, '兰西', NULL, NULL, 'L', 126.289314, 46.259037, 3, 'tr_0 tr_230000 tr_231200', 4);
INSERT INTO `sys_area`
VALUES (231223, '青冈县', 231200, '青冈', NULL, NULL, 'Q', 126.112267, 46.686596, 3, 'tr_0 tr_230000 tr_231200', 7);
INSERT INTO `sys_area`
VALUES (231224, '庆安县', 231200, '庆安', NULL, NULL, 'Q', 127.510025, 46.879204, 3, 'tr_0 tr_230000 tr_231200', 6);
INSERT INTO `sys_area`
VALUES (231225, '明水县', 231200, '明水', NULL, NULL, 'M', 125.907547, 47.183529, 3, 'tr_0 tr_230000 tr_231200', 5);
INSERT INTO `sys_area`
VALUES (231226, '绥棱县', 231200, '绥棱', NULL, NULL, 'S', 127.111122, 47.247196, 3, 'tr_0 tr_230000 tr_231200', 8);
INSERT INTO `sys_area`
VALUES (231281, '安达市', 231200, '安达', NULL, NULL, 'A', 125.329926, 46.410614, 3, 'tr_0 tr_230000 tr_231200', 1);
INSERT INTO `sys_area`
VALUES (231282, '肇东市', 231200, '肇东', NULL, NULL, 'Z', 125.991402, 46.069469, 3, 'tr_0 tr_230000 tr_231200', 10);
INSERT INTO `sys_area`
VALUES (231283, '海伦市', 231200, '海伦', NULL, NULL, 'H', 126.969383, 47.460426, 3, 'tr_0 tr_230000 tr_231200', 3);
INSERT INTO `sys_area`
VALUES (232700, '大兴安岭地区', 230000, '大兴安岭', NULL, NULL, 'D', 124.711525, 52.335262, 2, 'tr_0 tr_230000', 2);
INSERT INTO `sys_area`
VALUES (232702, '松岭区', 232700, '松岭', NULL, NULL, 'S', 124.711525, 52.335262, 3, 'tr_0 tr_230000 tr_232700', 5);
INSERT INTO `sys_area`
VALUES (232703, '新林区', 232700, '新林', NULL, NULL, 'X', 124.711525, 52.335262, 3, 'tr_0 tr_230000 tr_232700', 7);
INSERT INTO `sys_area`
VALUES (232704, '呼中区', 232700, '呼中', NULL, NULL, 'H', 123.603500, 52.037003, 3, 'tr_0 tr_230000 tr_232700', 2);
INSERT INTO `sys_area`
VALUES (232721, '呼玛县', 232700, '呼玛', NULL, NULL, 'H', 126.662102, 51.726997, 3, 'tr_0 tr_230000 tr_232700', 1);
INSERT INTO `sys_area`
VALUES (232722, '塔河县', 232700, '塔河', NULL, NULL, 'T', 124.710518, 52.335228, 3, 'tr_0 tr_230000 tr_232700', 6);
INSERT INTO `sys_area`
VALUES (232723, '漠河县', 232700, '漠河', NULL, NULL, 'M', 122.536255, 52.972073, 3, 'tr_0 tr_230000 tr_232700', 4);
INSERT INTO `sys_area`
VALUES (232724, '加格达奇区', 232700, '加格达奇', NULL, NULL, 'J', 124.126717, 50.424652, 3, 'tr_0 tr_230000 tr_232700', 3);
INSERT INTO `sys_area`
VALUES (310000, '上海', 0, '上海', NULL, NULL, 'S', 121.472641, 31.231707, 1, 'tr_0', 9);
INSERT INTO `sys_area`
VALUES (310100, '上海市', 310000, '上海', NULL, NULL, 'S', 121.472641, 31.231707, 2, 'tr_0 tr_310000', 1);
INSERT INTO `sys_area`
VALUES (310101, '黄浦区', 310100, '黄浦', NULL, NULL, 'H', 121.490318, 31.222771, 3, 'tr_0 tr_310000 tr_310100', 13);
INSERT INTO `sys_area`
VALUES (310104, '徐汇区', 310100, '徐汇', NULL, NULL, 'X', 121.437523, 31.179974, 3, 'tr_0 tr_310000 tr_310100', 15);
INSERT INTO `sys_area`
VALUES (310105, '长宁区', 310100, '长宁', NULL, NULL, 'C', 121.422203, 31.218122, 3, 'tr_0 tr_310000 tr_310100', 11);
INSERT INTO `sys_area`
VALUES (310106, '静安区', 310100, '静安', NULL, NULL, 'J', 121.448227, 31.229004, 3, 'tr_0 tr_310000 tr_310100', 14);
INSERT INTO `sys_area`
VALUES (310107, '普陀区', 310100, '普陀', NULL, NULL, 'P', 121.392502, 31.241701, 3, 'tr_0 tr_310000 tr_310100', 12);
INSERT INTO `sys_area`
VALUES (310108, '闸北区', 310100, '闸北', NULL, NULL, 'Z', 121.465691, 31.253180, 3, 'tr_0 tr_310000 tr_310100', 17);
INSERT INTO `sys_area`
VALUES (310109, '虹口区', 310100, '虹口', NULL, NULL, 'H', 121.491829, 31.260969, 3, 'tr_0 tr_310000 tr_310100', 10);
INSERT INTO `sys_area`
VALUES (310110, '杨浦区', 310100, '杨浦', NULL, NULL, 'Y', 121.522797, 31.270756, 3, 'tr_0 tr_310000 tr_310100', 16);
INSERT INTO `sys_area`
VALUES (310112, '闵行区', 310100, '闵行', NULL, NULL, 'Z', 121.375969, 31.111658, 3, 'tr_0 tr_310000 tr_310100', 9);
INSERT INTO `sys_area`
VALUES (310113, '宝山区', 310100, '宝山', NULL, NULL, 'B', 121.489937, 31.398895, 3, 'tr_0 tr_310000 tr_310100', 1);
INSERT INTO `sys_area`
VALUES (310114, '嘉定区', 310100, '嘉定', NULL, NULL, 'J', 121.250336, 31.383524, 3, 'tr_0 tr_310000 tr_310100', 4);
INSERT INTO `sys_area`
VALUES (310115, '浦东新区', 310100, '浦东', NULL, NULL, 'P', 121.567703, 31.245943, 3, 'tr_0 tr_310000 tr_310100', 6);
INSERT INTO `sys_area`
VALUES (310116, '金山区', 310100, '金山', NULL, NULL, 'J', 121.330734, 30.724697, 3, 'tr_0 tr_310000 tr_310100', 5);
INSERT INTO `sys_area`
VALUES (310117, '松江区', 310100, '松江', NULL, NULL, 'S', 121.223541, 31.030470, 3, 'tr_0 tr_310000 tr_310100', 8);
INSERT INTO `sys_area`
VALUES (310118, '青浦区', 310100, '青浦', NULL, NULL, 'Q', 121.113022, 31.151209, 3, 'tr_0 tr_310000 tr_310100', 7);
INSERT INTO `sys_area`
VALUES (310120, '奉贤区', 310100, '奉贤', NULL, NULL, 'F', 121.458473, 30.912346, 3, 'tr_0 tr_310000 tr_310100', 3);
INSERT INTO `sys_area`
VALUES (310181, '光明', 310100, '光明', NULL, NULL, 'G', 121.579964, 31.649693, 3, 'tr_0 tr_330000 tr_330700', 20);
INSERT INTO `sys_area`
VALUES (310182, '上实', 310100, '上实', NULL, NULL, 'S', 121.579964, 31.649693, 3, 'tr_0 tr_330000 tr_330700', 21);
INSERT INTO `sys_area`
VALUES (310183, '地产', 310100, '地产', NULL, NULL, 'D', 121.579964, 31.649693, 3, 'tr_0 tr_330000 tr_330700', 22);
INSERT INTO `sys_area`
VALUES (310184, '域外农场', 310100, '域外农场', NULL, NULL, 'Y', 121.579964, 31.649693, 3, 'tr_0 tr_310000 tr_310100', 50);
INSERT INTO `sys_area`
VALUES (310230, '崇明区', 310100, '崇明', NULL, NULL, 'C', 121.579964, 31.649693, 3, 'tr_0 tr_310000 tr_310100', 2);
INSERT INTO `sys_area`
VALUES (320000, '江苏省', 0, '江苏', NULL, NULL, 'J', 118.767410, 32.041546, 1, 'tr_0', 10);
INSERT INTO `sys_area`
VALUES (320100, '南京市', 320000, '南京', NULL, NULL, 'N', 118.767410, 32.041546, 2, 'tr_0 tr_320000', 4);
INSERT INTO `sys_area`
VALUES (320102, '玄武区', 320100, '玄武', NULL, NULL, 'X', 118.792198, 32.050678, 3, 'tr_0 tr_320000 tr_320100', 10);
INSERT INTO `sys_area`
VALUES (320104, '秦淮区', 320100, '秦淮', NULL, NULL, 'Q', 118.786087, 32.033817, 3, 'tr_0 tr_320000 tr_320100', 1);
INSERT INTO `sys_area`
VALUES (320105, '建邺区', 320100, '建邺', NULL, NULL, 'J', 118.732689, 32.004539, 3, 'tr_0 tr_320000 tr_320100', 5);
INSERT INTO `sys_area`
VALUES (320106, '鼓楼区', 320100, '鼓楼', NULL, NULL, 'G', 118.769737, 32.066967, 3, 'tr_0 tr_320000 tr_320100', 3);
INSERT INTO `sys_area`
VALUES (320111, '浦口区', 320100, '浦口', NULL, NULL, 'P', 118.625305, 32.058392, 3, 'tr_0 tr_320000 tr_320100', 8);
INSERT INTO `sys_area`
VALUES (320113, '栖霞区', 320100, '栖霞', NULL, NULL, 'Q', 118.808701, 32.102146, 3, 'tr_0 tr_320000 tr_320100', 9);
INSERT INTO `sys_area`
VALUES (320114, '雨花台区', 320100, '雨花台', NULL, NULL, 'Y', 118.772072, 31.995947, 3, 'tr_0 tr_320000 tr_320100', 11);
INSERT INTO `sys_area`
VALUES (320115, '江宁区', 320100, '江宁', NULL, NULL, 'J', 118.850624, 31.953419, 3, 'tr_0 tr_320000 tr_320100', 4);
INSERT INTO `sys_area`
VALUES (320116, '六合区', 320100, '六合', NULL, NULL, 'L', 118.850647, 32.340656, 3, 'tr_0 tr_320000 tr_320100', 7);
INSERT INTO `sys_area`
VALUES (320117, '溧水区', 320100, '溧水', NULL, NULL, 'Z', 119.028732, 31.653061, 3, 'tr_0 tr_320000 tr_320100', 6);
INSERT INTO `sys_area`
VALUES (320118, '高淳区', 320100, '高淳', NULL, NULL, 'G', 118.875893, 31.327131, 3, 'tr_0 tr_320000 tr_320100', 2);
INSERT INTO `sys_area`
VALUES (320200, '无锡市', 320000, '无锡', NULL, NULL, 'W', 120.301666, 31.574730, 2, 'tr_0 tr_320000', 9);
INSERT INTO `sys_area`
VALUES (320202, '崇安区', 320200, '崇安', NULL, NULL, 'C', 120.301628, 31.574705, 3, 'tr_0 tr_320000 tr_320200', 3);
INSERT INTO `sys_area`
VALUES (320203, '南长区', 320200, '南长', NULL, NULL, 'N', 120.308449, 31.563759, 3, 'tr_0 tr_320000 tr_320200', 6);
INSERT INTO `sys_area`
VALUES (320204, '北塘区', 320200, '北塘', NULL, NULL, 'B', 120.295158, 31.586575, 3, 'tr_0 tr_320000 tr_320200', 1);
INSERT INTO `sys_area`
VALUES (320205, '锡山区', 320200, '锡山', NULL, NULL, 'X', 120.357300, 31.585560, 3, 'tr_0 tr_320000 tr_320200', 7);
INSERT INTO `sys_area`
VALUES (320206, '惠山区', 320200, '惠山', NULL, NULL, 'H', 120.303543, 31.681019, 3, 'tr_0 tr_320000 tr_320200', 4);
INSERT INTO `sys_area`
VALUES (320211, '滨湖区', 320200, '滨湖', NULL, NULL, 'B', 120.266052, 31.550228, 3, 'tr_0 tr_320000 tr_320200', 2);
INSERT INTO `sys_area`
VALUES (320281, '江阴市', 320200, '江阴', NULL, NULL, 'J', 120.275894, 31.910984, 3, 'tr_0 tr_320000 tr_320200', 5);
INSERT INTO `sys_area`
VALUES (320282, '宜兴市', 320200, '宜兴', NULL, NULL, 'Y', 119.820541, 31.364384, 3, 'tr_0 tr_320000 tr_320200', 8);
INSERT INTO `sys_area`
VALUES (320300, '徐州市', 320000, '徐州', NULL, NULL, 'X', 117.184814, 34.261791, 2, 'tr_0 tr_320000', 10);
INSERT INTO `sys_area`
VALUES (320302, '鼓楼区', 320300, '鼓楼', NULL, NULL, 'G', 117.192940, 34.269398, 3, 'tr_0 tr_320000 tr_320300', 2);
INSERT INTO `sys_area`
VALUES (320303, '云龙区', 320300, '云龙', NULL, NULL, 'Y', 117.194588, 34.254807, 3, 'tr_0 tr_320000 tr_320300', 10);
INSERT INTO `sys_area`
VALUES (320305, '贾汪区', 320300, '贾汪', NULL, NULL, 'J', 117.450211, 34.441643, 3, 'tr_0 tr_320000 tr_320300', 3);
INSERT INTO `sys_area`
VALUES (320311, '泉山区', 320300, '泉山', NULL, NULL, 'Q', 117.182228, 34.262249, 3, 'tr_0 tr_320000 tr_320300', 7);
INSERT INTO `sys_area`
VALUES (320321, '丰县', 320300, '丰县', NULL, NULL, 'F', 116.592888, 34.696945, 3, 'tr_0 tr_320000 tr_320300', 1);
INSERT INTO `sys_area`
VALUES (320322, '沛县', 320300, '沛县', NULL, NULL, 'P', 116.937180, 34.729046, 3, 'tr_0 tr_320000 tr_320300', 5);
INSERT INTO `sys_area`
VALUES (320323, '铜山区', 320300, '铜山', NULL, NULL, 'T', 117.183891, 34.192879, 3, 'tr_0 tr_320000 tr_320300', 4);
INSERT INTO `sys_area`
VALUES (320324, '睢宁县', 320300, '睢宁', NULL, NULL, 'Z', 117.950661, 33.899223, 3, 'tr_0 tr_320000 tr_320300', 8);
INSERT INTO `sys_area`
VALUES (320381, '新沂市', 320300, '新沂', NULL, NULL, 'X', 118.345825, 34.368778, 3, 'tr_0 tr_320000 tr_320300', 9);
INSERT INTO `sys_area`
VALUES (320382, '邳州市', 320300, '邳州', NULL, NULL, 'Z', 117.963921, 34.314709, 3, 'tr_0 tr_320000 tr_320300', 6);
INSERT INTO `sys_area`
VALUES (320400, '常州市', 320000, '常州', NULL, NULL, 'C', 119.946976, 31.772753, 2, 'tr_0 tr_320000', 1);
INSERT INTO `sys_area`
VALUES (320402, '天宁区', 320400, '天宁', NULL, NULL, 'T', 119.963783, 31.779633, 3, 'tr_0 tr_320000 tr_320400', 4);
INSERT INTO `sys_area`
VALUES (320404, '钟楼区', 320400, '钟楼', NULL, NULL, 'Z', 119.948387, 31.780960, 3, 'tr_0 tr_320000 tr_320400', 7);
INSERT INTO `sys_area`
VALUES (320405, '戚墅堰区', 320400, '戚墅堰', NULL, NULL, 'Q', 120.064751, 31.721663, 3, 'tr_0 tr_320000 tr_320400', 3);
INSERT INTO `sys_area`
VALUES (320411, '新北区', 320400, '新北', NULL, NULL, 'X', 119.974655, 31.824663, 3, 'tr_0 tr_320000 tr_320400', 6);
INSERT INTO `sys_area`
VALUES (320412, '武进区', 320400, '武进', NULL, NULL, 'W', 119.958771, 31.718567, 3, 'tr_0 tr_320000 tr_320400', 5);
INSERT INTO `sys_area`
VALUES (320481, '溧阳市', 320400, '溧阳', NULL, NULL, 'Z', 119.487816, 31.427080, 3, 'tr_0 tr_320000 tr_320400', 2);
INSERT INTO `sys_area`
VALUES (320482, '金坛市', 320400, '金坛', NULL, NULL, 'J', 119.573395, 31.744398, 3, 'tr_0 tr_320000 tr_320400', 1);
INSERT INTO `sys_area`
VALUES (320500, '苏州市', 320000, '苏州', NULL, NULL, 'S', 120.619583, 31.299379, 2, 'tr_0 tr_320000', 7);
INSERT INTO `sys_area`
VALUES (320505, '虎丘区', 320500, '虎丘', NULL, NULL, 'H', 120.566833, 31.294846, 3, 'tr_0 tr_320000 tr_320500', 3);
INSERT INTO `sys_area`
VALUES (320506, '吴中区', 320500, '吴中', NULL, NULL, 'W', 120.624619, 31.270840, 3, 'tr_0 tr_320000 tr_320500', 7);
INSERT INTO `sys_area`
VALUES (320507, '相城区', 320500, '相城', NULL, NULL, 'X', 120.618958, 31.396685, 3, 'tr_0 tr_320000 tr_320500', 8);
INSERT INTO `sys_area`
VALUES (320508, '姑苏区', 320500, '姑苏', NULL, NULL, 'G', 120.622246, 31.311415, 3, 'tr_0 tr_320000 tr_320500', 2);
INSERT INTO `sys_area`
VALUES (320581, '常熟市', 320500, '常熟', NULL, NULL, 'C', 120.748520, 31.658155, 3, 'tr_0 tr_320000 tr_320500', 1);
INSERT INTO `sys_area`
VALUES (320582, '张家港市', 320500, '张家港', NULL, NULL, 'Z', 120.543442, 31.865553, 3, 'tr_0 tr_320000 tr_320500', 9);
INSERT INTO `sys_area`
VALUES (320583, '昆山市', 320500, '昆山', NULL, NULL, 'K', 120.958138, 31.381926, 3, 'tr_0 tr_320000 tr_320500', 4);
INSERT INTO `sys_area`
VALUES (320584, '吴江区', 320500, '吴江', NULL, NULL, 'W', 120.641602, 31.160404, 3, 'tr_0 tr_320000 tr_320500', 6);
INSERT INTO `sys_area`
VALUES (320585, '太仓市', 320500, '太仓', NULL, NULL, 'T', 121.112274, 31.452568, 3, 'tr_0 tr_320000 tr_320500', 5);
INSERT INTO `sys_area`
VALUES (320600, '南通市', 320000, '南通', NULL, NULL, 'N', 120.864609, 32.016212, 2, 'tr_0 tr_320000', 5);
INSERT INTO `sys_area`
VALUES (320602, '崇川区', 320600, '崇川', NULL, NULL, 'C', 120.866348, 32.015278, 3, 'tr_0 tr_320000 tr_320600', 1);
INSERT INTO `sys_area`
VALUES (320611, '港闸区', 320600, '港闸', NULL, NULL, 'G', 120.833900, 32.040298, 3, 'tr_0 tr_320000 tr_320600', 2);
INSERT INTO `sys_area`
VALUES (320612, '通州区', 320600, '通州', NULL, NULL, 'T', 121.073174, 32.084286, 3, 'tr_0 tr_320000 tr_320600', 8);
INSERT INTO `sys_area`
VALUES (320621, '海安县', 320600, '海安', NULL, NULL, 'H', 120.465996, 32.540291, 3, 'tr_0 tr_320000 tr_320600', 3);
INSERT INTO `sys_area`
VALUES (320623, '如东县', 320600, '如东', NULL, NULL, 'R', 121.186089, 32.311832, 3, 'tr_0 tr_320000 tr_320600', 6);
INSERT INTO `sys_area`
VALUES (320681, '启东市', 320600, '启东', NULL, NULL, 'Q', 121.659721, 31.810158, 3, 'tr_0 tr_320000 tr_320600', 5);
INSERT INTO `sys_area`
VALUES (320682, '如皋市', 320600, '如皋', NULL, NULL, 'R', 120.566322, 32.391590, 3, 'tr_0 tr_320000 tr_320600', 7);
INSERT INTO `sys_area`
VALUES (320684, '海门市', 320600, '海门', NULL, NULL, 'H', 121.176605, 31.893528, 3, 'tr_0 tr_320000 tr_320600', 4);
INSERT INTO `sys_area`
VALUES (320700, '连云港市', 320000, '连云港', NULL, NULL, 'L', 119.178818, 34.600018, 2, 'tr_0 tr_320000', 3);
INSERT INTO `sys_area`
VALUES (320703, '连云区', 320700, '连云', NULL, NULL, 'L', 119.366486, 34.739529, 3, 'tr_0 tr_320000 tr_320700', 6);
INSERT INTO `sys_area`
VALUES (320705, '新浦区', 320700, '新浦', NULL, NULL, 'X', 119.182106, 34.597046, 3, 'tr_0 tr_320000 tr_320700', 7);
INSERT INTO `sys_area`
VALUES (320706, '海州区', 320700, '海州', NULL, NULL, 'H', 119.137146, 34.571289, 3, 'tr_0 tr_320000 tr_320700', 5);
INSERT INTO `sys_area`
VALUES (320721, '赣榆县', 320700, '赣榆', NULL, NULL, 'G', 119.128777, 34.839153, 3, 'tr_0 tr_320000 tr_320700', 2);
INSERT INTO `sys_area`
VALUES (320722, '东海县', 320700, '东海', NULL, NULL, 'D', 118.766487, 34.522858, 3, 'tr_0 tr_320000 tr_320700', 1);
INSERT INTO `sys_area`
VALUES (320723, '灌云县', 320700, '灌云', NULL, NULL, 'G', 119.255737, 34.298435, 3, 'tr_0 tr_320000 tr_320700', 4);
INSERT INTO `sys_area`
VALUES (320724, '灌南县', 320700, '灌南', NULL, NULL, 'G', 119.352333, 34.092552, 3, 'tr_0 tr_320000 tr_320700', 3);
INSERT INTO `sys_area`
VALUES (320800, '淮安市', 320000, '淮安', NULL, NULL, 'H', 119.021263, 33.597507, 2, 'tr_0 tr_320000', 2);
INSERT INTO `sys_area`
VALUES (320802, '清河区', 320800, '清河', NULL, NULL, 'Q', 119.019455, 33.603233, 3, 'tr_0 tr_320000 tr_320800', 6);
INSERT INTO `sys_area`
VALUES (320803, '淮安区', 320800, '淮安', NULL, NULL, 'H', 119.146339, 33.507500, 3, 'tr_0 tr_320000 tr_320800', 2);
INSERT INTO `sys_area`
VALUES (320804, '淮阴区', 320800, '淮阴', NULL, NULL, 'H', 119.020821, 33.622452, 3, 'tr_0 tr_320000 tr_320800', 3);
INSERT INTO `sys_area`
VALUES (320811, '清浦区', 320800, '清浦', NULL, NULL, 'Q', 119.030495, 33.580742, 3, 'tr_0 tr_320000 tr_320800', 7);
INSERT INTO `sys_area`
VALUES (320826, '涟水县', 320800, '涟水', NULL, NULL, 'L', 119.266075, 33.771309, 3, 'tr_0 tr_320000 tr_320800', 5);
INSERT INTO `sys_area`
VALUES (320829, '洪泽县', 320800, '洪泽', NULL, NULL, 'H', 118.867874, 33.294975, 3, 'tr_0 tr_320000 tr_320800', 1);
INSERT INTO `sys_area`
VALUES (320830, '盱眙县', 320800, '盱眙', NULL, NULL, 'Z', 118.493820, 33.004391, 3, 'tr_0 tr_320000 tr_320800', 8);
INSERT INTO `sys_area`
VALUES (320831, '金湖县', 320800, '金湖', NULL, NULL, 'J', 119.016937, 33.018162, 3, 'tr_0 tr_320000 tr_320800', 4);
INSERT INTO `sys_area`
VALUES (320900, '盐城市', 320000, '盐城', NULL, NULL, 'Y', 120.139999, 33.377632, 2, 'tr_0 tr_320000', 11);
INSERT INTO `sys_area`
VALUES (320902, '亭湖区', 320900, '亭湖', NULL, NULL, 'T', 120.136078, 33.383911, 3, 'tr_0 tr_320000 tr_320900', 7);
INSERT INTO `sys_area`
VALUES (320903, '盐都区', 320900, '盐都', NULL, NULL, 'Y', 120.139755, 33.341290, 3, 'tr_0 tr_320000 tr_320900', 9);
INSERT INTO `sys_area`
VALUES (320921, '响水县', 320900, '响水', NULL, NULL, 'X', 119.579575, 34.199959, 3, 'tr_0 tr_320000 tr_320900', 8);
INSERT INTO `sys_area`
VALUES (320922, '滨海县', 320900, '滨海', NULL, NULL, 'B', 119.828438, 33.989887, 3, 'tr_0 tr_320000 tr_320900', 1);
INSERT INTO `sys_area`
VALUES (320923, '阜宁县', 320900, '阜宁', NULL, NULL, 'F', 119.805336, 33.785728, 3, 'tr_0 tr_320000 tr_320900', 4);
INSERT INTO `sys_area`
VALUES (320924, '射阳县', 320900, '射阳', NULL, NULL, 'S', 120.257446, 33.773781, 3, 'tr_0 tr_320000 tr_320900', 6);
INSERT INTO `sys_area`
VALUES (320925, '建湖县', 320900, '建湖', NULL, NULL, 'J', 119.793106, 33.472622, 3, 'tr_0 tr_320000 tr_320900', 5);
INSERT INTO `sys_area`
VALUES (320981, '东台市', 320900, '东台', NULL, NULL, 'D', 120.314102, 32.853172, 3, 'tr_0 tr_320000 tr_320900', 3);
INSERT INTO `sys_area`
VALUES (320982, '大丰市', 320900, '大丰', NULL, NULL, 'D', 120.470322, 33.199532, 3, 'tr_0 tr_320000 tr_320900', 2);
INSERT INTO `sys_area`
VALUES (321000, '扬州市', 320000, '扬州', NULL, NULL, 'Y', 119.421005, 32.393158, 2, 'tr_0 tr_320000', 12);
INSERT INTO `sys_area`
VALUES (321002, '广陵区', 321000, '广陵', NULL, NULL, 'G', 119.442268, 32.392155, 3, 'tr_0 tr_320000 tr_321000', 3);
INSERT INTO `sys_area`
VALUES (321003, '邗江区', 321000, '邗江', NULL, NULL, 'Z', 119.397774, 32.377899, 3, 'tr_0 tr_320000 tr_321000', 4);
INSERT INTO `sys_area`
VALUES (321023, '宝应县', 321000, '宝应', NULL, NULL, 'B', 119.321281, 33.236938, 3, 'tr_0 tr_320000 tr_321000', 1);
INSERT INTO `sys_area`
VALUES (321081, '仪征市', 321000, '仪征', NULL, NULL, 'Y', 119.182442, 32.271965, 3, 'tr_0 tr_320000 tr_321000', 6);
INSERT INTO `sys_area`
VALUES (321084, '高邮市', 321000, '高邮', NULL, NULL, 'G', 119.443840, 32.785164, 3, 'tr_0 tr_320000 tr_321000', 2);
INSERT INTO `sys_area`
VALUES (321088, '江都区', 321000, '江都', NULL, NULL, 'J', 119.567482, 32.426563, 3, 'tr_0 tr_320000 tr_321000', 5);
INSERT INTO `sys_area`
VALUES (321100, '镇江市', 320000, '镇江', NULL, NULL, 'Z', 119.452751, 32.204403, 2, 'tr_0 tr_320000', 13);
INSERT INTO `sys_area`
VALUES (321102, '京口区', 321100, '京口', NULL, NULL, 'J', 119.454575, 32.206192, 3, 'tr_0 tr_320000 tr_321100', 3);
INSERT INTO `sys_area`
VALUES (321111, '润州区', 321100, '润州', NULL, NULL, 'R', 119.414879, 32.213501, 3, 'tr_0 tr_320000 tr_321100', 5);
INSERT INTO `sys_area`
VALUES (321112, '丹徒区', 321100, '丹徒', NULL, NULL, 'D', 119.433884, 32.128971, 3, 'tr_0 tr_320000 tr_321100', 1);
INSERT INTO `sys_area`
VALUES (321181, '丹阳市', 321100, '丹阳', NULL, NULL, 'D', 119.581909, 31.991459, 3, 'tr_0 tr_320000 tr_321100', 2);
INSERT INTO `sys_area`
VALUES (321182, '扬中市', 321100, '扬中', NULL, NULL, 'Y', 119.828056, 32.237267, 3, 'tr_0 tr_320000 tr_321100', 6);
INSERT INTO `sys_area`
VALUES (321183, '句容市', 321100, '句容', NULL, NULL, 'J', 119.167137, 31.947355, 3, 'tr_0 tr_320000 tr_321100', 4);
INSERT INTO `sys_area`
VALUES (321200, '泰州市', 320000, '泰州', NULL, NULL, 'T', 119.915176, 32.484882, 2, 'tr_0 tr_320000', 8);
INSERT INTO `sys_area`
VALUES (321202, '海陵区', 321200, '海陵', NULL, NULL, 'H', 119.920189, 32.488407, 3, 'tr_0 tr_320000 tr_321200', 2);
INSERT INTO `sys_area`
VALUES (321203, '高港区', 321200, '高港', NULL, NULL, 'G', 119.881660, 32.315701, 3, 'tr_0 tr_320000 tr_321200', 1);
INSERT INTO `sys_area`
VALUES (321281, '兴化市', 321200, '兴化', NULL, NULL, 'X', 119.840164, 32.938065, 3, 'tr_0 tr_320000 tr_321200', 6);
INSERT INTO `sys_area`
VALUES (321282, '靖江市', 321200, '靖江', NULL, NULL, 'J', 120.268250, 32.018169, 3, 'tr_0 tr_320000 tr_321200', 4);
INSERT INTO `sys_area`
VALUES (321283, '泰兴市', 321200, '泰兴', NULL, NULL, 'T', 120.020226, 32.168785, 3, 'tr_0 tr_320000 tr_321200', 5);
INSERT INTO `sys_area`
VALUES (321284, '姜堰区', 321200, '姜堰', NULL, NULL, 'J', 120.148209, 32.508484, 3, 'tr_0 tr_320000 tr_321200', 3);
INSERT INTO `sys_area`
VALUES (321300, '宿迁市', 320000, '宿迁', NULL, NULL, 'S', 118.275162, 33.963009, 2, 'tr_0 tr_320000', 6);
INSERT INTO `sys_area`
VALUES (321302, '宿城区', 321300, '宿城', NULL, NULL, 'S', 118.278984, 33.937725, 3, 'tr_0 tr_320000 tr_321300', 4);
INSERT INTO `sys_area`
VALUES (321311, '宿豫区', 321300, '宿豫', NULL, NULL, 'S', 118.330009, 33.941071, 3, 'tr_0 tr_320000 tr_321300', 5);
INSERT INTO `sys_area`
VALUES (321322, '沭阳县', 321300, '沭阳', NULL, NULL, 'Z', 118.775887, 34.129097, 3, 'tr_0 tr_320000 tr_321300', 1);
INSERT INTO `sys_area`
VALUES (321323, '泗阳县', 321300, '泗阳', NULL, NULL, 'Z', 118.681282, 33.711433, 3, 'tr_0 tr_320000 tr_321300', 3);
INSERT INTO `sys_area`
VALUES (321324, '泗洪县', 321300, '泗洪', NULL, NULL, 'Z', 118.211823, 33.456539, 3, 'tr_0 tr_320000 tr_321300', 2);
INSERT INTO `sys_area`
VALUES (330000, '浙江省', 0, '浙江', NULL, NULL, 'Z', 120.153580, 30.287458, 1, 'tr_0', 11);
INSERT INTO `sys_area`
VALUES (330100, '杭州市', 330000, '杭州', NULL, NULL, 'H', 120.153580, 30.287458, 2, 'tr_0 tr_330000', 1);
INSERT INTO `sys_area`
VALUES (330102, '上城区', 330100, '上城', NULL, NULL, 'S', 120.171463, 30.250237, 3, 'tr_0 tr_330000 tr_330100', 8);
INSERT INTO `sys_area`
VALUES (330103, '下城区', 330100, '下城', NULL, NULL, 'X', 120.172760, 30.276272, 3, 'tr_0 tr_330000 tr_330100', 10);
INSERT INTO `sys_area`
VALUES (330104, '江干区', 330100, '江干', NULL, NULL, 'J', 120.202637, 30.266603, 3, 'tr_0 tr_330000 tr_330100', 6);
INSERT INTO `sys_area`
VALUES (330105, '拱墅区', 330100, '拱墅', NULL, NULL, 'G', 120.150055, 30.314697, 3, 'tr_0 tr_330000 tr_330100', 4);
INSERT INTO `sys_area`
VALUES (330106, '西湖区', 330100, '西湖', NULL, NULL, 'X', 120.147377, 30.272934, 3, 'tr_0 tr_330000 tr_330100', 12);
INSERT INTO `sys_area`
VALUES (330108, '滨江区', 330100, '滨江', NULL, NULL, 'B', 120.210617, 30.206615, 3, 'tr_0 tr_330000 tr_330100', 1);
INSERT INTO `sys_area`
VALUES (330109, '萧山区', 330100, '萧山', NULL, NULL, 'X', 120.270691, 30.162931, 3, 'tr_0 tr_330000 tr_330100', 11);
INSERT INTO `sys_area`
VALUES (330110, '余杭区', 330100, '余杭', NULL, NULL, 'Y', 120.301735, 30.421186, 3, 'tr_0 tr_330000 tr_330100', 13);
INSERT INTO `sys_area`
VALUES (330122, '桐庐县', 330100, '桐庐', NULL, NULL, 'T', 119.685043, 29.797438, 3, 'tr_0 tr_330000 tr_330100', 9);
INSERT INTO `sys_area`
VALUES (330127, '淳安县', 330100, '淳安', NULL, NULL, 'C', 119.044273, 29.604177, 3, 'tr_0 tr_330000 tr_330100', 2);
INSERT INTO `sys_area`
VALUES (330182, '建德市', 330100, '建德', NULL, NULL, 'J', 119.279091, 29.472284, 3, 'tr_0 tr_330000 tr_330100', 5);
INSERT INTO `sys_area`
VALUES (330183, '富阳市', 330100, '富阳', NULL, NULL, 'F', 119.949867, 30.049871, 3, 'tr_0 tr_330000 tr_330100', 3);
INSERT INTO `sys_area`
VALUES (330185, '临安市', 330100, '临安', NULL, NULL, 'L', 119.715103, 30.231153, 3, 'tr_0 tr_330000 tr_330100', 7);
INSERT INTO `sys_area`
VALUES (330200, '宁波市', 330000, '宁波', NULL, NULL, 'N', 121.549789, 29.868387, 2, 'tr_0 tr_330000', 6);
INSERT INTO `sys_area`
VALUES (330203, '海曙区', 330200, '海曙', NULL, NULL, 'H', 121.539696, 29.874453, 3, 'tr_0 tr_330000 tr_330200', 4);
INSERT INTO `sys_area`
VALUES (330204, '江东区', 330200, '江东', NULL, NULL, 'J', 121.572990, 29.866543, 3, 'tr_0 tr_330000 tr_330200', 6);
INSERT INTO `sys_area`
VALUES (330205, '江北区', 330200, '江北', NULL, NULL, 'J', 121.559280, 29.888361, 3, 'tr_0 tr_330000 tr_330200', 5);
INSERT INTO `sys_area`
VALUES (330206, '北仑区', 330200, '北仑', NULL, NULL, 'B', 121.831306, 29.909439, 3, 'tr_0 tr_330000 tr_330200', 1);
INSERT INTO `sys_area`
VALUES (330211, '镇海区', 330200, '镇海', NULL, NULL, 'Z', 121.713165, 29.952106, 3, 'tr_0 tr_330000 tr_330200', 11);
INSERT INTO `sys_area`
VALUES (330212, '鄞州区', 330200, '鄞州', NULL, NULL, 'Z', 121.558434, 29.831661, 3, 'tr_0 tr_330000 tr_330200', 9);
INSERT INTO `sys_area`
VALUES (330225, '象山县', 330200, '象山', NULL, NULL, 'X', 121.877090, 29.470205, 3, 'tr_0 tr_330000 tr_330200', 8);
INSERT INTO `sys_area`
VALUES (330226, '宁海县', 330200, '宁海', NULL, NULL, 'N', 121.432610, 29.299835, 3, 'tr_0 tr_330000 tr_330200', 7);
INSERT INTO `sys_area`
VALUES (330281, '余姚市', 330200, '余姚', NULL, NULL, 'Y', 121.156296, 30.045404, 3, 'tr_0 tr_330000 tr_330200', 10);
INSERT INTO `sys_area`
VALUES (330282, '慈溪市', 330200, '慈溪', NULL, NULL, 'C', 121.248055, 30.177141, 3, 'tr_0 tr_330000 tr_330200', 2);
INSERT INTO `sys_area`
VALUES (330283, '奉化市', 330200, '奉化', NULL, NULL, 'F', 121.410889, 29.662348, 3, 'tr_0 tr_330000 tr_330200', 3);
INSERT INTO `sys_area`
VALUES (330300, '温州市', 330000, '温州', NULL, NULL, 'W', 120.672112, 28.000574, 2, 'tr_0 tr_330000', 10);
INSERT INTO `sys_area`
VALUES (330302, '鹿城区', 330300, '鹿城', NULL, NULL, 'L', 120.674232, 28.003351, 3, 'tr_0 tr_330000 tr_330300', 4);
INSERT INTO `sys_area`
VALUES (330303, '龙湾区', 330300, '龙湾', NULL, NULL, 'L', 120.763466, 27.970255, 3, 'tr_0 tr_330000 tr_330300', 3);
INSERT INTO `sys_area`
VALUES (330304, '瓯海区', 330300, '瓯海', NULL, NULL, 'Z', 120.637146, 28.006445, 3, 'tr_0 tr_330000 tr_330300', 5);
INSERT INTO `sys_area`
VALUES (330322, '洞头县', 330300, '洞头', NULL, NULL, 'D', 121.156181, 27.836058, 3, 'tr_0 tr_330000 tr_330300', 2);
INSERT INTO `sys_area`
VALUES (330324, '永嘉县', 330300, '永嘉', NULL, NULL, 'Y', 120.690971, 28.153887, 3, 'tr_0 tr_330000 tr_330300', 10);
INSERT INTO `sys_area`
VALUES (330326, '平阳县', 330300, '平阳', NULL, NULL, 'P', 120.564384, 27.669300, 3, 'tr_0 tr_330000 tr_330300', 6);
INSERT INTO `sys_area`
VALUES (330327, '苍南县', 330300, '苍南', NULL, NULL, 'C', 120.406258, 27.507744, 3, 'tr_0 tr_330000 tr_330300', 1);
INSERT INTO `sys_area`
VALUES (330328, '文成县', 330300, '文成', NULL, NULL, 'W', 120.092453, 27.789133, 3, 'tr_0 tr_330000 tr_330300', 9);
INSERT INTO `sys_area`
VALUES (330329, '泰顺县', 330300, '泰顺', NULL, NULL, 'T', 119.716240, 27.557308, 3, 'tr_0 tr_330000 tr_330300', 8);
INSERT INTO `sys_area`
VALUES (330381, '瑞安市', 330300, '瑞安', NULL, NULL, 'R', 120.646172, 27.779322, 3, 'tr_0 tr_330000 tr_330300', 7);
INSERT INTO `sys_area`
VALUES (330382, '乐清市', 330300, '乐清', NULL, NULL, 'L', 120.967148, 28.116083, 3, 'tr_0 tr_330000 tr_330300', 11);
INSERT INTO `sys_area`
VALUES (330400, '嘉兴市', 330000, '嘉兴', NULL, NULL, 'J', 120.750862, 30.762653, 2, 'tr_0 tr_330000', 3);
INSERT INTO `sys_area`
VALUES (330402, '南湖区', 330400, '南湖', NULL, NULL, 'N', 120.749954, 30.764652, 3, 'tr_0 tr_330000 tr_330400', 4);
INSERT INTO `sys_area`
VALUES (330411, '秀洲区', 330400, '秀洲', NULL, NULL, 'X', 120.720428, 30.763323, 3, 'tr_0 tr_330000 tr_330400', 7);
INSERT INTO `sys_area`
VALUES (330421, '嘉善县', 330400, '嘉善', NULL, NULL, 'J', 120.921867, 30.841352, 3, 'tr_0 tr_330000 tr_330400', 3);
INSERT INTO `sys_area`
VALUES (330424, '海盐县', 330400, '海盐', NULL, NULL, 'H', 120.942017, 30.522223, 3, 'tr_0 tr_330000 tr_330400', 2);
INSERT INTO `sys_area`
VALUES (330481, '海宁市', 330400, '海宁', NULL, NULL, 'H', 120.688820, 30.525543, 3, 'tr_0 tr_330000 tr_330400', 1);
INSERT INTO `sys_area`
VALUES (330482, '平湖市', 330400, '平湖', NULL, NULL, 'P', 121.014664, 30.698921, 3, 'tr_0 tr_330000 tr_330400', 5);
INSERT INTO `sys_area`
VALUES (330483, '桐乡市', 330400, '桐乡', NULL, NULL, 'T', 120.551086, 30.629065, 3, 'tr_0 tr_330000 tr_330400', 6);
INSERT INTO `sys_area`
VALUES (330500, '湖州市', 330000, '湖州', NULL, NULL, 'H', 120.102402, 30.867199, 2, 'tr_0 tr_330000', 2);
INSERT INTO `sys_area`
VALUES (330502, '吴兴区', 330500, '吴兴', NULL, NULL, 'W', 120.101418, 30.867252, 3, 'tr_0 tr_330000 tr_330500', 5);
INSERT INTO `sys_area`
VALUES (330503, '南浔区', 330500, '南浔', NULL, NULL, 'N', 120.417198, 30.872742, 3, 'tr_0 tr_330000 tr_330500', 4);
INSERT INTO `sys_area`
VALUES (330521, '德清县', 330500, '德清', NULL, NULL, 'D', 119.967659, 30.534927, 3, 'tr_0 tr_330000 tr_330500', 3);
INSERT INTO `sys_area`
VALUES (330522, '长兴县', 330500, '长兴', NULL, NULL, 'C', 119.910126, 31.004749, 3, 'tr_0 tr_330000 tr_330500', 2);
INSERT INTO `sys_area`
VALUES (330523, '安吉县', 330500, '安吉', NULL, NULL, 'A', 119.687889, 30.631973, 3, 'tr_0 tr_330000 tr_330500', 1);
INSERT INTO `sys_area`
VALUES (330600, '绍兴市', 330000, '绍兴', NULL, NULL, 'S', 120.582115, 29.997116, 2, 'tr_0 tr_330000', 8);
INSERT INTO `sys_area`
VALUES (330602, '越城区', 330600, '越城', NULL, NULL, 'Y', 120.585312, 29.996992, 3, 'tr_0 tr_330000 tr_330600', 5);
INSERT INTO `sys_area`
VALUES (330621, '绍兴县', 330600, '绍兴', NULL, NULL, 'S', 120.582115, 29.997116, 3, 'tr_0 tr_330000 tr_330600', 2);
INSERT INTO `sys_area`
VALUES (330624, '新昌县', 330600, '新昌', NULL, NULL, 'X', 120.905663, 29.501205, 3, 'tr_0 tr_330000 tr_330600', 4);
INSERT INTO `sys_area`
VALUES (330681, '诸暨市', 330600, '诸暨', NULL, NULL, 'Z', 120.244324, 29.713661, 3, 'tr_0 tr_330000 tr_330600', 6);
INSERT INTO `sys_area`
VALUES (330682, '上虞市', 330600, '上虞', NULL, NULL, 'S', 120.582115, 29.997116, 3, 'tr_0 tr_330000 tr_330600', 1);
INSERT INTO `sys_area`
VALUES (330683, '嵊州市', 330600, '嵊州', NULL, NULL, 'Z', 120.828880, 29.586605, 3, 'tr_0 tr_330000 tr_330600', 3);
INSERT INTO `sys_area`
VALUES (330700, '金华市', 330000, '金华', NULL, NULL, 'J', 119.649506, 29.089523, 2, 'tr_0 tr_330000', 4);
INSERT INTO `sys_area`
VALUES (330702, '婺城区', 330700, '婺城', NULL, NULL, 'Z', 119.652580, 29.082607, 3, 'tr_0 tr_330000 tr_330700', 6);
INSERT INTO `sys_area`
VALUES (330703, '金东区', 330700, '金东', NULL, NULL, 'J', 119.681267, 29.095835, 3, 'tr_0 tr_330000 tr_330700', 2);
INSERT INTO `sys_area`
VALUES (330723, '武义县', 330700, '武义', NULL, NULL, 'W', 119.819160, 28.896563, 3, 'tr_0 tr_330000 tr_330700', 7);
INSERT INTO `sys_area`
VALUES (330726, '浦江县', 330700, '浦江', NULL, NULL, 'P', 119.893364, 29.451254, 3, 'tr_0 tr_330000 tr_330700', 5);
INSERT INTO `sys_area`
VALUES (330727, '磐安县', 330700, '磐安', NULL, NULL, 'P', 120.445129, 29.052628, 3, 'tr_0 tr_330000 tr_330700', 4);
INSERT INTO `sys_area`
VALUES (330781, '兰溪市', 330700, '兰溪', NULL, NULL, 'L', 119.460518, 29.210066, 3, 'tr_0 tr_330000 tr_330700', 3);
INSERT INTO `sys_area`
VALUES (330782, '义乌市', 330700, '义乌', NULL, NULL, 'Y', 120.074913, 29.306864, 3, 'tr_0 tr_330000 tr_330700', 8);
INSERT INTO `sys_area`
VALUES (330783, '东阳市', 330700, '东阳', NULL, NULL, 'D', 120.233337, 29.262547, 3, 'tr_0 tr_330000 tr_330700', 1);
INSERT INTO `sys_area`
VALUES (330784, '永康市', 330700, '永康', NULL, NULL, 'Y', 120.036331, 28.895292, 3, 'tr_0 tr_330000 tr_330700', 9);
INSERT INTO `sys_area`
VALUES (330800, '衢州市', 330000, '衢州', NULL, NULL, 'Z', 118.872627, 28.941708, 2, 'tr_0 tr_330000', 7);
INSERT INTO `sys_area`
VALUES (330802, '柯城区', 330800, '柯城', NULL, NULL, 'K', 118.873039, 28.944538, 3, 'tr_0 tr_330000 tr_330800', 4);
INSERT INTO `sys_area`
VALUES (330803, '衢江区', 330800, '衢江', NULL, NULL, 'Z', 118.957680, 28.973194, 3, 'tr_0 tr_330000 tr_330800', 6);
INSERT INTO `sys_area`
VALUES (330822, '常山县', 330800, '常山', NULL, NULL, 'C', 118.521652, 28.900040, 3, 'tr_0 tr_330000 tr_330800', 1);
INSERT INTO `sys_area`
VALUES (330824, '开化县', 330800, '开化', NULL, NULL, 'K', 118.414436, 29.136503, 3, 'tr_0 tr_330000 tr_330800', 3);
INSERT INTO `sys_area`
VALUES (330825, '龙游县', 330800, '龙游', NULL, NULL, 'L', 119.172523, 29.031364, 3, 'tr_0 tr_330000 tr_330800', 5);
INSERT INTO `sys_area`
VALUES (330881, '江山市', 330800, '江山', NULL, NULL, 'J', 118.627876, 28.734674, 3, 'tr_0 tr_330000 tr_330800', 2);
INSERT INTO `sys_area`
VALUES (330900, '舟山市', 330000, '舟山', NULL, NULL, 'Z', 122.106865, 30.016027, 2, 'tr_0 tr_330000', 11);
INSERT INTO `sys_area`
VALUES (330902, '定海区', 330900, '定海', NULL, NULL, 'D', 122.108498, 30.016422, 3, 'tr_0 tr_330000 tr_330900', 2);
INSERT INTO `sys_area`
VALUES (330903, '普陀区', 330900, '普陀', NULL, NULL, 'P', 122.301956, 29.945614, 3, 'tr_0 tr_330000 tr_330900', 3);
INSERT INTO `sys_area`
VALUES (330921, '岱山县', 330900, '岱山', NULL, NULL, 'Z', 122.201134, 30.242865, 3, 'tr_0 tr_330000 tr_330900', 1);
INSERT INTO `sys_area`
VALUES (330922, '嵊泗县', 330900, '嵊泗', NULL, NULL, 'Z', 122.457809, 30.727165, 3, 'tr_0 tr_330000 tr_330900', 4);
INSERT INTO `sys_area`
VALUES (331000, '台州市', 330000, '台州', NULL, NULL, 'T', 121.428596, 28.661379, 2, 'tr_0 tr_330000', 9);
INSERT INTO `sys_area`
VALUES (331002, '椒江区', 331000, '椒江', NULL, NULL, 'J', 121.431046, 28.676149, 3, 'tr_0 tr_330000 tr_331000', 2);
INSERT INTO `sys_area`
VALUES (331003, '黄岩区', 331000, '黄岩', NULL, NULL, 'H', 121.262138, 28.644880, 3, 'tr_0 tr_330000 tr_331000', 1);
INSERT INTO `sys_area`
VALUES (331004, '路桥区', 331000, '路桥', NULL, NULL, 'L', 121.372917, 28.581799, 3, 'tr_0 tr_330000 tr_331000', 4);
INSERT INTO `sys_area`
VALUES (331021, '玉环县', 331000, '玉环', NULL, NULL, 'Y', 121.232338, 28.128420, 3, 'tr_0 tr_330000 tr_331000', 9);
INSERT INTO `sys_area`
VALUES (331022, '三门县', 331000, '三门', NULL, NULL, 'S', 121.376427, 29.118956, 3, 'tr_0 tr_330000 tr_331000', 5);
INSERT INTO `sys_area`
VALUES (331023, '天台县', 331000, '天台', NULL, NULL, 'T', 121.031227, 29.141127, 3, 'tr_0 tr_330000 tr_331000', 6);
INSERT INTO `sys_area`
VALUES (331024, '仙居县', 331000, '仙居', NULL, NULL, 'X', 120.735077, 28.849213, 3, 'tr_0 tr_330000 tr_331000', 8);
INSERT INTO `sys_area`
VALUES (331081, '温岭市', 331000, '温岭', NULL, NULL, 'W', 121.373611, 28.368780, 3, 'tr_0 tr_330000 tr_331000', 7);
INSERT INTO `sys_area`
VALUES (331082, '临海市', 331000, '临海', NULL, NULL, 'L', 121.131226, 28.845442, 3, 'tr_0 tr_330000 tr_331000', 3);
INSERT INTO `sys_area`
VALUES (331100, '丽水市', 330000, '丽水', NULL, NULL, 'L', 119.921783, 28.451994, 2, 'tr_0 tr_330000', 5);
INSERT INTO `sys_area`
VALUES (331102, '莲都区', 331100, '莲都', NULL, NULL, 'L', 119.922295, 28.451103, 3, 'tr_0 tr_330000 tr_331100', 3);
INSERT INTO `sys_area`
VALUES (331121, '青田县', 331100, '青田', NULL, NULL, 'Q', 120.291939, 28.135246, 3, 'tr_0 tr_330000 tr_331100', 5);
INSERT INTO `sys_area`
VALUES (331122, '缙云县', 331100, '缙云', NULL, NULL, 'Z', 120.078964, 28.654207, 3, 'tr_0 tr_330000 tr_331100', 2);
INSERT INTO `sys_area`
VALUES (331123, '遂昌县', 331100, '遂昌', NULL, NULL, 'S', 119.275887, 28.592400, 3, 'tr_0 tr_330000 tr_331100', 8);
INSERT INTO `sys_area`
VALUES (331124, '松阳县', 331100, '松阳', NULL, NULL, 'S', 119.485291, 28.449938, 3, 'tr_0 tr_330000 tr_331100', 7);
INSERT INTO `sys_area`
VALUES (331125, '云和县', 331100, '云和', NULL, NULL, 'Y', 119.569458, 28.111076, 3, 'tr_0 tr_330000 tr_331100', 9);
INSERT INTO `sys_area`
VALUES (331126, '庆元县', 331100, '庆元', NULL, NULL, 'Q', 119.067230, 27.618231, 3, 'tr_0 tr_330000 tr_331100', 6);
INSERT INTO `sys_area`
VALUES (331127, '景宁畲族自治县', 331100, '景宁', NULL, NULL, 'J', 119.634666, 27.977247, 3, 'tr_0 tr_330000 tr_331100', 1);
INSERT INTO `sys_area`
VALUES (331181, '龙泉市', 331100, '龙泉', NULL, NULL, 'L', 119.132317, 28.069178, 3, 'tr_0 tr_330000 tr_331100', 4);
INSERT INTO `sys_area`
VALUES (340000, '安徽省', 0, '安徽', NULL, NULL, 'A', 117.283043, 31.861191, 1, 'tr_0', 12);
INSERT INTO `sys_area`
VALUES (340100, '合肥市', 340000, '合肥', NULL, NULL, 'H', 117.283043, 31.861191, 2, 'tr_0 tr_340000', 7);
INSERT INTO `sys_area`
VALUES (340102, '瑶海区', 340100, '瑶海', NULL, NULL, 'Y', 117.315361, 31.869610, 3, 'tr_0 tr_340000 tr_340100', 9);
INSERT INTO `sys_area`
VALUES (340103, '庐阳区', 340100, '庐阳', NULL, NULL, 'L', 117.283775, 31.869011, 3, 'tr_0 tr_340000 tr_340100', 7);
INSERT INTO `sys_area`
VALUES (340104, '蜀山区', 340100, '蜀山', NULL, NULL, 'S', 117.262070, 31.855867, 3, 'tr_0 tr_340000 tr_340100', 8);
INSERT INTO `sys_area`
VALUES (340111, '包河区', 340100, '包河', NULL, NULL, 'B', 117.285751, 31.829559, 3, 'tr_0 tr_340000 tr_340100', 1);
INSERT INTO `sys_area`
VALUES (340121, '长丰县', 340100, '长丰', NULL, NULL, 'C', 117.164696, 32.478546, 3, 'tr_0 tr_340000 tr_340100', 2);
INSERT INTO `sys_area`
VALUES (340122, '肥东县', 340100, '肥东', NULL, NULL, 'F', 117.463219, 31.883991, 3, 'tr_0 tr_340000 tr_340100', 4);
INSERT INTO `sys_area`
VALUES (340123, '肥西县', 340100, '肥西', NULL, NULL, 'F', 117.166115, 31.719646, 3, 'tr_0 tr_340000 tr_340100', 5);
INSERT INTO `sys_area`
VALUES (340200, '芜湖市', 340000, '芜湖', NULL, NULL, 'W', 118.376450, 31.326319, 2, 'tr_0 tr_340000', 15);
INSERT INTO `sys_area`
VALUES (340202, '镜湖区', 340200, '镜湖', NULL, NULL, 'J', 118.376343, 31.325590, 3, 'tr_0 tr_340000 tr_340200', 2);
INSERT INTO `sys_area`
VALUES (340203, '弋江区', 340200, '弋江', NULL, NULL, 'Z', 118.377480, 31.313395, 3, 'tr_0 tr_340000 tr_340200', 8);
INSERT INTO `sys_area`
VALUES (340207, '鸠江区', 340200, '鸠江', NULL, NULL, 'Z', 118.400177, 31.362717, 3, 'tr_0 tr_340000 tr_340200', 3);
INSERT INTO `sys_area`
VALUES (340208, '三山区', 340200, '三山', NULL, NULL, 'S', 118.233986, 31.225424, 3, 'tr_0 tr_340000 tr_340200', 5);
INSERT INTO `sys_area`
VALUES (340221, '芜湖县', 340200, '芜湖', NULL, NULL, 'W', 118.572304, 31.145262, 3, 'tr_0 tr_340000 tr_340200', 6);
INSERT INTO `sys_area`
VALUES (340222, '繁昌县', 340200, '繁昌', NULL, NULL, 'F', 118.201347, 31.080896, 3, 'tr_0 tr_340000 tr_340200', 1);
INSERT INTO `sys_area`
VALUES (340223, '南陵县', 340200, '南陵', NULL, NULL, 'N', 118.337105, 30.919638, 3, 'tr_0 tr_340000 tr_340200', 4);
INSERT INTO `sys_area`
VALUES (340300, '蚌埠市', 340000, '蚌埠', NULL, NULL, 'B', 117.363228, 32.939667, 2, 'tr_0 tr_340000', 2);
INSERT INTO `sys_area`
VALUES (340302, '龙子湖区', 340300, '龙子湖', NULL, NULL, 'L', 117.382309, 32.950451, 3, 'tr_0 tr_340000 tr_340300', 5);
INSERT INTO `sys_area`
VALUES (340303, '蚌山区', 340300, '蚌山', NULL, NULL, 'B', 117.355789, 32.938065, 3, 'tr_0 tr_340000 tr_340300', 1);
INSERT INTO `sys_area`
VALUES (340304, '禹会区', 340300, '禹会', NULL, NULL, 'Y', 117.352592, 32.931934, 3, 'tr_0 tr_340000 tr_340300', 7);
INSERT INTO `sys_area`
VALUES (340311, '淮上区', 340300, '淮上', NULL, NULL, 'H', 117.347092, 32.963146, 3, 'tr_0 tr_340000 tr_340300', 3);
INSERT INTO `sys_area`
VALUES (340321, '怀远县', 340300, '怀远', NULL, NULL, 'H', 117.200172, 32.956936, 3, 'tr_0 tr_340000 tr_340300', 4);
INSERT INTO `sys_area`
VALUES (340322, '五河县', 340300, '五河', NULL, NULL, 'W', 117.888809, 33.146202, 3, 'tr_0 tr_340000 tr_340300', 6);
INSERT INTO `sys_area`
VALUES (340323, '固镇县', 340300, '固镇', NULL, NULL, 'G', 117.315964, 33.318680, 3, 'tr_0 tr_340000 tr_340300', 2);
INSERT INTO `sys_area`
VALUES (340400, '淮南市', 340000, '淮南', NULL, NULL, 'H', 117.018326, 32.647575, 2, 'tr_0 tr_340000', 9);
INSERT INTO `sys_area`
VALUES (340402, '大通区', 340400, '大通', NULL, NULL, 'D', 117.052925, 32.632065, 3, 'tr_0 tr_340000 tr_340400', 2);
INSERT INTO `sys_area`
VALUES (340403, '田家庵区', 340400, '田家庵', NULL, NULL, 'T', 117.018318, 32.644341, 3, 'tr_0 tr_340000 tr_340400', 5);
INSERT INTO `sys_area`
VALUES (340404, '谢家集区', 340400, '谢家集', NULL, NULL, 'X', 116.865356, 32.598289, 3, 'tr_0 tr_340000 tr_340400', 6);
INSERT INTO `sys_area`
VALUES (340405, '八公山区', 340400, '八公山', NULL, NULL, 'B', 116.841110, 32.628227, 3, 'tr_0 tr_340000 tr_340400', 1);
INSERT INTO `sys_area`
VALUES (340406, '潘集区', 340400, '潘集', NULL, NULL, 'P', 116.816879, 32.782116, 3, 'tr_0 tr_340000 tr_340400', 4);
INSERT INTO `sys_area`
VALUES (340421, '凤台县', 340400, '凤台', NULL, NULL, 'F', 116.722771, 32.705383, 3, 'tr_0 tr_340000 tr_340400', 3);
INSERT INTO `sys_area`
VALUES (340500, '马鞍山市', 340000, '马鞍山', NULL, NULL, 'M', 118.507904, 31.689362, 2, 'tr_0 tr_340000', 12);
INSERT INTO `sys_area`
VALUES (340503, '花山区', 340500, '花山', NULL, NULL, 'H', 118.511307, 31.699020, 3, 'tr_0 tr_340000 tr_340500', 5);
INSERT INTO `sys_area`
VALUES (340504, '雨山区', 340500, '雨山', NULL, NULL, 'Y', 118.493103, 31.685911, 3, 'tr_0 tr_340000 tr_340500', 6);
INSERT INTO `sys_area`
VALUES (340506, '博望区', 340500, '博望', NULL, NULL, 'B', 118.843742, 31.562321, 3, 'tr_0 tr_340000 tr_340500', 1);
INSERT INTO `sys_area`
VALUES (340521, '当涂县', 340500, '当涂', NULL, NULL, 'D', 118.489876, 31.556168, 3, 'tr_0 tr_340000 tr_340500', 2);
INSERT INTO `sys_area`
VALUES (340600, '淮北市', 340000, '淮北', NULL, NULL, 'H', 116.794662, 33.971706, 2, 'tr_0 tr_340000', 8);
INSERT INTO `sys_area`
VALUES (340602, '杜集区', 340600, '杜集', NULL, NULL, 'D', 116.833923, 33.991219, 3, 'tr_0 tr_340000 tr_340600', 1);
INSERT INTO `sys_area`
VALUES (340603, '相山区', 340600, '相山', NULL, NULL, 'X', 116.790771, 33.970917, 3, 'tr_0 tr_340000 tr_340600', 4);
INSERT INTO `sys_area`
VALUES (340604, '烈山区', 340600, '烈山', NULL, NULL, 'L', 116.809464, 33.889530, 3, 'tr_0 tr_340000 tr_340600', 2);
INSERT INTO `sys_area`
VALUES (340621, '濉溪县', 340600, '濉溪', NULL, NULL, 'Z', 116.767433, 33.916409, 3, 'tr_0 tr_340000 tr_340600', 3);
INSERT INTO `sys_area`
VALUES (340700, '铜陵市', 340000, '铜陵', NULL, NULL, 'T', 117.816574, 30.929935, 2, 'tr_0 tr_340000', 14);
INSERT INTO `sys_area`
VALUES (340702, '铜官山区', 340700, '铜官山', NULL, NULL, 'T', 117.818428, 30.931820, 3, 'tr_0 tr_340000 tr_340700', 3);
INSERT INTO `sys_area`
VALUES (340703, '狮子山区', 340700, '狮子山', NULL, NULL, 'S', 117.864098, 30.946249, 3, 'tr_0 tr_340000 tr_340700', 2);
INSERT INTO `sys_area`
VALUES (340711, '郊区', 340700, '郊区', NULL, NULL, 'J', 117.816574, 30.929935, 3, 'tr_0 tr_340000 tr_340700', 1);
INSERT INTO `sys_area`
VALUES (340721, '铜陵县', 340700, '铜陵', NULL, NULL, 'T', 117.792290, 30.952337, 3, 'tr_0 tr_340000 tr_340700', 4);
INSERT INTO `sys_area`
VALUES (340800, '安庆市', 340000, '安庆', NULL, NULL, 'A', 117.043549, 30.508829, 2, 'tr_0 tr_340000', 1);
INSERT INTO `sys_area`
VALUES (340802, '迎江区', 340800, '迎江', NULL, NULL, 'Y', 117.044968, 30.506374, 3, 'tr_0 tr_340000 tr_340800', 8);
INSERT INTO `sys_area`
VALUES (340803, '大观区', 340800, '大观', NULL, NULL, 'D', 117.034515, 30.505632, 3, 'tr_0 tr_340000 tr_340800', 1);
INSERT INTO `sys_area`
VALUES (340811, '宜秀区', 340800, '宜秀', NULL, NULL, 'Y', 117.070000, 30.541323, 3, 'tr_0 tr_340000 tr_340800', 9);
INSERT INTO `sys_area`
VALUES (340822, '怀宁县', 340800, '怀宁', NULL, NULL, 'H', 116.828667, 30.734995, 3, 'tr_0 tr_340000 tr_340800', 2);
INSERT INTO `sys_area`
VALUES (340823, '枞阳县', 340800, '枞阳', NULL, NULL, 'Z', 117.222031, 30.700615, 3, 'tr_0 tr_340000 tr_340800', 11);
INSERT INTO `sys_area`
VALUES (340824, '潜山县', 340800, '潜山', NULL, NULL, 'Q', 116.573669, 30.638222, 3, 'tr_0 tr_340000 tr_340800', 3);
INSERT INTO `sys_area`
VALUES (340825, '太湖县', 340800, '太湖', NULL, NULL, 'T', 116.305222, 30.451868, 3, 'tr_0 tr_340000 tr_340800', 5);
INSERT INTO `sys_area`
VALUES (340826, '宿松县', 340800, '宿松', NULL, NULL, 'S', 116.120201, 30.158327, 3, 'tr_0 tr_340000 tr_340800', 4);
INSERT INTO `sys_area`
VALUES (340827, '望江县', 340800, '望江', NULL, NULL, 'W', 116.690926, 30.124910, 3, 'tr_0 tr_340000 tr_340800', 7);
INSERT INTO `sys_area`
VALUES (340828, '岳西县', 340800, '岳西', NULL, NULL, 'Y', 116.360481, 30.848501, 3, 'tr_0 tr_340000 tr_340800', 10);
INSERT INTO `sys_area`
VALUES (340881, '桐城市', 340800, '桐城', NULL, NULL, 'T', 116.959656, 31.050575, 3, 'tr_0 tr_340000 tr_340800', 6);
INSERT INTO `sys_area`
VALUES (341000, '黄山市', 340000, '黄山', NULL, NULL, 'H', 118.317322, 29.709238, 2, 'tr_0 tr_340000', 10);
INSERT INTO `sys_area`
VALUES (341002, '屯溪区', 341000, '屯溪', NULL, NULL, 'T', 118.317352, 29.709187, 3, 'tr_0 tr_340000 tr_341000', 5);
INSERT INTO `sys_area`
VALUES (341003, '黄山区', 341000, '黄山', NULL, NULL, 'H', 118.136642, 30.294518, 3, 'tr_0 tr_340000 tr_341000', 1);
INSERT INTO `sys_area`
VALUES (341004, '徽州区', 341000, '徽州', NULL, NULL, 'H', 118.339745, 29.825201, 3, 'tr_0 tr_340000 tr_341000', 2);
INSERT INTO `sys_area`
VALUES (341021, '歙县', 341000, '歙县', NULL, NULL, 'Z', 118.428024, 29.867748, 3, 'tr_0 tr_340000 tr_341000', 4);
INSERT INTO `sys_area`
VALUES (341022, '休宁县', 341000, '休宁', NULL, NULL, 'X', 118.188530, 29.788877, 3, 'tr_0 tr_340000 tr_341000', 6);
INSERT INTO `sys_area`
VALUES (341023, '黟县', 341000, '黟县', NULL, NULL, 'Z', 117.942909, 29.923813, 3, 'tr_0 tr_340000 tr_341000', 7);
INSERT INTO `sys_area`
VALUES (341024, '祁门县', 341000, '祁门', NULL, NULL, 'Q', 117.717239, 29.853472, 3, 'tr_0 tr_340000 tr_341000', 3);
INSERT INTO `sys_area`
VALUES (341100, '滁州市', 340000, '滁州', NULL, NULL, 'C', 118.316261, 32.303627, 2, 'tr_0 tr_340000', 5);
INSERT INTO `sys_area`
VALUES (341102, '琅琊区', 341100, '琅琊', NULL, NULL, 'L', 118.316475, 32.303799, 3, 'tr_0 tr_340000 tr_341100', 4);
INSERT INTO `sys_area`
VALUES (341103, '南谯区', 341100, '南谯', NULL, NULL, 'N', 118.296951, 32.329842, 3, 'tr_0 tr_340000 tr_341100', 6);
INSERT INTO `sys_area`
VALUES (341122, '来安县', 341100, '来安', NULL, NULL, 'L', 118.433296, 32.450230, 3, 'tr_0 tr_340000 tr_341100', 3);
INSERT INTO `sys_area`
VALUES (341124, '全椒县', 341100, '全椒', NULL, NULL, 'Q', 118.268578, 32.093849, 3, 'tr_0 tr_340000 tr_341100', 7);
INSERT INTO `sys_area`
VALUES (341125, '定远县', 341100, '定远', NULL, NULL, 'D', 117.683716, 32.527103, 3, 'tr_0 tr_340000 tr_341100', 1);
INSERT INTO `sys_area`
VALUES (341126, '凤阳县', 341100, '凤阳', NULL, NULL, 'F', 117.562462, 32.867146, 3, 'tr_0 tr_340000 tr_341100', 2);
INSERT INTO `sys_area`
VALUES (341181, '天长市', 341100, '天长', NULL, NULL, 'T', 119.011215, 32.681499, 3, 'tr_0 tr_340000 tr_341100', 8);
INSERT INTO `sys_area`
VALUES (341182, '明光市', 341100, '明光', NULL, NULL, 'M', 117.998047, 32.781204, 3, 'tr_0 tr_340000 tr_341100', 5);
INSERT INTO `sys_area`
VALUES (341200, '阜阳市', 340000, '阜阳', NULL, NULL, 'F', 115.819733, 32.896969, 2, 'tr_0 tr_340000', 6);
INSERT INTO `sys_area`
VALUES (341202, '颍州区', 341200, '颍州', NULL, NULL, 'Z', 115.813911, 32.891239, 3, 'tr_0 tr_340000 tr_341200', 8);
INSERT INTO `sys_area`
VALUES (341203, '颍东区', 341200, '颍东', NULL, NULL, 'Z', 115.858749, 32.908859, 3, 'tr_0 tr_340000 tr_341200', 5);
INSERT INTO `sys_area`
VALUES (341204, '颍泉区', 341200, '颍泉', NULL, NULL, 'Z', 115.804527, 32.924797, 3, 'tr_0 tr_340000 tr_341200', 6);
INSERT INTO `sys_area`
VALUES (341221, '临泉县', 341200, '临泉', NULL, NULL, 'L', 115.261688, 33.062698, 3, 'tr_0 tr_340000 tr_341200', 3);
INSERT INTO `sys_area`
VALUES (341222, '太和县', 341200, '太和', NULL, NULL, 'T', 115.627243, 33.162289, 3, 'tr_0 tr_340000 tr_341200', 4);
INSERT INTO `sys_area`
VALUES (341225, '阜南县', 341200, '阜南', NULL, NULL, 'F', 115.590530, 32.638103, 3, 'tr_0 tr_340000 tr_341200', 1);
INSERT INTO `sys_area`
VALUES (341226, '颍上县', 341200, '颍上', NULL, NULL, 'Z', 116.259125, 32.637066, 3, 'tr_0 tr_340000 tr_341200', 7);
INSERT INTO `sys_area`
VALUES (341282, '界首市', 341200, '界首', NULL, NULL, 'J', 115.362114, 33.261532, 3, 'tr_0 tr_340000 tr_341200', 2);
INSERT INTO `sys_area`
VALUES (341300, '宿州市', 340000, '宿州', NULL, NULL, 'S', 116.984085, 33.633892, 2, 'tr_0 tr_340000', 13);
INSERT INTO `sys_area`
VALUES (341302, '埇桥区', 341300, '埇桥', NULL, NULL, '埇', 116.983307, 33.633854, 3, 'tr_0 tr_340000 tr_341300', 5);
INSERT INTO `sys_area`
VALUES (341321, '砀山县', 341300, '砀山', NULL, NULL, 'Z', 116.351112, 34.426247, 3, 'tr_0 tr_340000 tr_341300', 1);
INSERT INTO `sys_area`
VALUES (341322, '萧县', 341300, '萧县', NULL, NULL, 'X', 116.945396, 34.183266, 3, 'tr_0 tr_340000 tr_341300', 4);
INSERT INTO `sys_area`
VALUES (341323, '灵璧县', 341300, '灵璧', NULL, NULL, 'L', 117.551491, 33.540630, 3, 'tr_0 tr_340000 tr_341300', 2);
INSERT INTO `sys_area`
VALUES (341324, '泗县', 341300, '泗县', NULL, NULL, 'Z', 117.885445, 33.477581, 3, 'tr_0 tr_340000 tr_341300', 3);
INSERT INTO `sys_area`
VALUES (341400, '巢湖市', 340100, '巢湖', NULL, NULL, 'C', 117.874153, 31.600517, 3, 'tr_0 tr_340000 tr_340100', 3);
INSERT INTO `sys_area`
VALUES (341421, '庐江县', 340100, '庐江', NULL, NULL, 'L', 117.289841, 31.251488, 3, 'tr_0 tr_340000 tr_340100', 6);
INSERT INTO `sys_area`
VALUES (341422, '无为县', 340200, '无为', NULL, NULL, 'W', 117.911430, 31.303076, 3, 'tr_0 tr_340000 tr_340200', 7);
INSERT INTO `sys_area`
VALUES (341423, '含山县', 340500, '含山', NULL, NULL, 'H', 118.105545, 31.727758, 3, 'tr_0 tr_340000 tr_340500', 3);
INSERT INTO `sys_area`
VALUES (341424, '和县', 340500, '和县', NULL, NULL, 'H', 118.362999, 31.716635, 3, 'tr_0 tr_340000 tr_340500', 4);
INSERT INTO `sys_area`
VALUES (341500, '六安市', 340000, '六安', NULL, NULL, 'L', 116.507675, 31.752890, 2, 'tr_0 tr_340000', 11);
INSERT INTO `sys_area`
VALUES (341502, '金安区', 341500, '金安', NULL, NULL, 'J', 116.503288, 31.754492, 3, 'tr_0 tr_340000 tr_341500', 3);
INSERT INTO `sys_area`
VALUES (341503, '裕安区', 341500, '裕安', NULL, NULL, 'Y', 116.494545, 31.750692, 3, 'tr_0 tr_340000 tr_341500', 7);
INSERT INTO `sys_area`
VALUES (341521, '寿县', 341500, '寿县', NULL, NULL, 'S', 116.785347, 32.577305, 3, 'tr_0 tr_340000 tr_341500', 5);
INSERT INTO `sys_area`
VALUES (341522, '霍邱县', 341500, '霍邱', NULL, NULL, 'H', 116.278877, 32.341305, 3, 'tr_0 tr_340000 tr_341500', 1);
INSERT INTO `sys_area`
VALUES (341523, '舒城县', 341500, '舒城', NULL, NULL, 'S', 116.944092, 31.462849, 3, 'tr_0 tr_340000 tr_341500', 6);
INSERT INTO `sys_area`
VALUES (341524, '金寨县', 341500, '金寨', NULL, NULL, 'J', 115.878517, 31.681623, 3, 'tr_0 tr_340000 tr_341500', 4);
INSERT INTO `sys_area`
VALUES (341525, '霍山县', 341500, '霍山', NULL, NULL, 'H', 116.333076, 31.402456, 3, 'tr_0 tr_340000 tr_341500', 2);
INSERT INTO `sys_area`
VALUES (341600, '亳州市', 340000, '亳州', NULL, NULL, 'B', 115.782936, 33.869339, 2, 'tr_0 tr_340000', 3);
INSERT INTO `sys_area`
VALUES (341602, '谯城区', 341600, '谯城', NULL, NULL, 'Z', 115.781212, 33.869286, 3, 'tr_0 tr_340000 tr_341600', 4);
INSERT INTO `sys_area`
VALUES (341621, '涡阳县', 341600, '涡阳', NULL, NULL, 'W', 116.211548, 33.502831, 3, 'tr_0 tr_340000 tr_341600', 1);
INSERT INTO `sys_area`
VALUES (341622, '蒙城县', 341600, '蒙城', NULL, NULL, 'M', 116.560333, 33.260815, 3, 'tr_0 tr_340000 tr_341600', 3);
INSERT INTO `sys_area`
VALUES (341623, '利辛县', 341600, '利辛', NULL, NULL, 'L', 116.207779, 33.143501, 3, 'tr_0 tr_340000 tr_341600', 2);
INSERT INTO `sys_area`
VALUES (341700, '池州市', 340000, '池州', NULL, NULL, 'C', 117.489159, 30.656036, 2, 'tr_0 tr_340000', 4);
INSERT INTO `sys_area`
VALUES (341702, '贵池区', 341700, '贵池', NULL, NULL, 'G', 117.488342, 30.657377, 3, 'tr_0 tr_340000 tr_341700', 2);
INSERT INTO `sys_area`
VALUES (341721, '东至县', 341700, '东至', NULL, NULL, 'D', 117.021477, 30.096567, 3, 'tr_0 tr_340000 tr_341700', 1);
INSERT INTO `sys_area`
VALUES (341722, '石台县', 341700, '石台', NULL, NULL, 'S', 117.482910, 30.210323, 3, 'tr_0 tr_340000 tr_341700', 4);
INSERT INTO `sys_area`
VALUES (341723, '青阳县', 341700, '青阳', NULL, NULL, 'Q', 117.857391, 30.638180, 3, 'tr_0 tr_340000 tr_341700', 3);
INSERT INTO `sys_area`
VALUES (341800, '宣城市', 340000, '宣城', NULL, NULL, 'X', 118.757996, 30.945667, 2, 'tr_0 tr_340000', 16);
INSERT INTO `sys_area`
VALUES (341802, '宣州区', 341800, '宣州', NULL, NULL, 'X', 118.758415, 30.946003, 3, 'tr_0 tr_340000 tr_341800', 7);
INSERT INTO `sys_area`
VALUES (341821, '郎溪县', 341800, '郎溪', NULL, NULL, 'L', 119.185020, 31.127834, 3, 'tr_0 tr_340000 tr_341800', 5);
INSERT INTO `sys_area`
VALUES (341822, '广德县', 341800, '广德', NULL, NULL, 'G', 119.417519, 30.893116, 3, 'tr_0 tr_340000 tr_341800', 1);
INSERT INTO `sys_area`
VALUES (341823, '泾县', 341800, '泾县', NULL, NULL, 'Z', 118.412399, 30.685974, 3, 'tr_0 tr_340000 tr_341800', 3);
INSERT INTO `sys_area`
VALUES (341824, '绩溪县', 341800, '绩溪', NULL, NULL, 'J', 118.594704, 30.065268, 3, 'tr_0 tr_340000 tr_341800', 4);
INSERT INTO `sys_area`
VALUES (341825, '旌德县', 341800, '旌德', NULL, NULL, 'Z', 118.543083, 30.288057, 3, 'tr_0 tr_340000 tr_341800', 2);
INSERT INTO `sys_area`
VALUES (341881, '宁国市', 341800, '宁国', NULL, NULL, 'N', 118.983406, 30.626530, 3, 'tr_0 tr_340000 tr_341800', 6);
INSERT INTO `sys_area`
VALUES (350000, '福建省', 0, '福建', NULL, NULL, 'F', 119.306236, 26.075302, 1, 'tr_0', 13);
INSERT INTO `sys_area`
VALUES (350100, '福州市', 350000, '福州', NULL, NULL, 'F', 119.306236, 26.075302, 2, 'tr_0 tr_350000', 1);
INSERT INTO `sys_area`
VALUES (350102, '鼓楼区', 350100, '鼓楼', NULL, NULL, 'G', 119.299294, 26.082285, 3, 'tr_0 tr_350000 tr_350100', 4);
INSERT INTO `sys_area`
VALUES (350103, '台江区', 350100, '台江', NULL, NULL, 'T', 119.310158, 26.058617, 3, 'tr_0 tr_350000 tr_350100', 12);
INSERT INTO `sys_area`
VALUES (350104, '仓山区', 350100, '仓山', NULL, NULL, 'C', 119.320992, 26.038912, 3, 'tr_0 tr_350000 tr_350100', 1);
INSERT INTO `sys_area`
VALUES (350105, '马尾区', 350100, '马尾', NULL, NULL, 'M', 119.458725, 25.991976, 3, 'tr_0 tr_350000 tr_350100', 8);
INSERT INTO `sys_area`
VALUES (350111, '晋安区', 350100, '晋安', NULL, NULL, 'J', 119.328598, 26.078836, 3, 'tr_0 tr_350000 tr_350100', 5);
INSERT INTO `sys_area`
VALUES (350121, '闽侯县', 350100, '闽侯', NULL, NULL, 'M', 119.145119, 26.148567, 3, 'tr_0 tr_350000 tr_350100', 9);
INSERT INTO `sys_area`
VALUES (350122, '连江县', 350100, '连江', NULL, NULL, 'L', 119.538368, 26.202108, 3, 'tr_0 tr_350000 tr_350100', 6);
INSERT INTO `sys_area`
VALUES (350123, '罗源县', 350100, '罗源', NULL, NULL, 'L', 119.552643, 26.487234, 3, 'tr_0 tr_350000 tr_350100', 7);
INSERT INTO `sys_area`
VALUES (350124, '闽清县', 350100, '闽清', NULL, NULL, 'M', 118.868416, 26.223793, 3, 'tr_0 tr_350000 tr_350100', 10);
INSERT INTO `sys_area`
VALUES (350125, '永泰县', 350100, '永泰', NULL, NULL, 'Y', 118.939087, 25.864824, 3, 'tr_0 tr_350000 tr_350100', 13);
INSERT INTO `sys_area`
VALUES (350128, '平潭县', 350100, '平潭', NULL, NULL, 'P', 119.791199, 25.503672, 3, 'tr_0 tr_350000 tr_350100', 11);
INSERT INTO `sys_area`
VALUES (350181, '福清市', 350100, '福清', NULL, NULL, 'F', 119.376991, 25.720402, 3, 'tr_0 tr_350000 tr_350100', 3);
INSERT INTO `sys_area`
VALUES (350182, '长乐市', 350100, '长乐', NULL, NULL, 'C', 119.510849, 25.960583, 3, 'tr_0 tr_350000 tr_350100', 2);
INSERT INTO `sys_area`
VALUES (350200, '厦门市', 350000, '厦门', NULL, NULL, 'X', 118.110222, 24.490475, 2, 'tr_0 tr_350000', 8);
INSERT INTO `sys_area`
VALUES (350203, '思明区', 350200, '思明', NULL, NULL, 'S', 118.087830, 24.462059, 3, 'tr_0 tr_350000 tr_350200', 4);
INSERT INTO `sys_area`
VALUES (350205, '海沧区', 350200, '海沧', NULL, NULL, 'H', 118.036362, 24.492512, 3, 'tr_0 tr_350000 tr_350200', 1);
INSERT INTO `sys_area`
VALUES (350206, '湖里区', 350200, '湖里', NULL, NULL, 'H', 118.109428, 24.512764, 3, 'tr_0 tr_350000 tr_350200', 2);
INSERT INTO `sys_area`
VALUES (350211, '集美区', 350200, '集美', NULL, NULL, 'J', 118.100868, 24.572874, 3, 'tr_0 tr_350000 tr_350200', 3);
INSERT INTO `sys_area`
VALUES (350212, '同安区', 350200, '同安', NULL, NULL, 'T', 118.150452, 24.729334, 3, 'tr_0 tr_350000 tr_350200', 5);
INSERT INTO `sys_area`
VALUES (350213, '翔安区', 350200, '翔安', NULL, NULL, 'X', 118.242813, 24.637480, 3, 'tr_0 tr_350000 tr_350200', 6);
INSERT INTO `sys_area`
VALUES (350300, '莆田市', 350000, '莆田', NULL, NULL, 'P', 119.007561, 25.431011, 2, 'tr_0 tr_350000', 5);
INSERT INTO `sys_area`
VALUES (350302, '城厢区', 350300, '城厢', NULL, NULL, 'C', 119.001030, 25.433737, 3, 'tr_0 tr_350000 tr_350300', 1);
INSERT INTO `sys_area`
VALUES (350303, '涵江区', 350300, '涵江', NULL, NULL, 'H', 119.119102, 25.459272, 3, 'tr_0 tr_350000 tr_350300', 2);
INSERT INTO `sys_area`
VALUES (350304, '荔城区', 350300, '荔城', NULL, NULL, 'L', 119.020050, 25.430046, 3, 'tr_0 tr_350000 tr_350300', 3);
INSERT INTO `sys_area`
VALUES (350305, '秀屿区', 350300, '秀屿', NULL, NULL, 'X', 119.092606, 25.316141, 3, 'tr_0 tr_350000 tr_350300', 5);
INSERT INTO `sys_area`
VALUES (350322, '仙游县', 350300, '仙游', NULL, NULL, 'X', 118.694328, 25.356529, 3, 'tr_0 tr_350000 tr_350300', 4);
INSERT INTO `sys_area`
VALUES (350400, '三明市', 350000, '三明', NULL, NULL, 'S', 117.635002, 26.265444, 2, 'tr_0 tr_350000', 7);
INSERT INTO `sys_area`
VALUES (350402, '梅列区', 350400, '梅列', NULL, NULL, 'M', 117.636871, 26.269209, 3, 'tr_0 tr_350000 tr_350400', 4);
INSERT INTO `sys_area`
VALUES (350403, '三元区', 350400, '三元', NULL, NULL, 'S', 117.607414, 26.234192, 3, 'tr_0 tr_350000 tr_350400', 8);
INSERT INTO `sys_area`
VALUES (350421, '明溪县', 350400, '明溪', NULL, NULL, 'M', 117.201843, 26.357374, 3, 'tr_0 tr_350000 tr_350400', 5);
INSERT INTO `sys_area`
VALUES (350423, '清流县', 350400, '清流', NULL, NULL, 'Q', 116.815819, 26.177610, 3, 'tr_0 tr_350000 tr_350400', 7);
INSERT INTO `sys_area`
VALUES (350424, '宁化县', 350400, '宁化', NULL, NULL, 'N', 116.659721, 26.259932, 3, 'tr_0 tr_350000 tr_350400', 6);
INSERT INTO `sys_area`
VALUES (350425, '大田县', 350400, '大田', NULL, NULL, 'D', 117.849358, 25.690804, 3, 'tr_0 tr_350000 tr_350400', 1);
INSERT INTO `sys_area`
VALUES (350426, '尤溪县', 350400, '尤溪', NULL, NULL, 'Y', 118.188576, 26.169262, 3, 'tr_0 tr_350000 tr_350400', 12);
INSERT INTO `sys_area`
VALUES (350427, '沙县', 350400, '沙县', NULL, NULL, 'S', 117.789093, 26.397362, 3, 'tr_0 tr_350000 tr_350400', 9);
INSERT INTO `sys_area`
VALUES (350428, '将乐县', 350400, '将乐', NULL, NULL, 'J', 117.473557, 26.728666, 3, 'tr_0 tr_350000 tr_350400', 2);
INSERT INTO `sys_area`
VALUES (350429, '泰宁县', 350400, '泰宁', NULL, NULL, 'T', 117.177521, 26.897995, 3, 'tr_0 tr_350000 tr_350400', 10);
INSERT INTO `sys_area`
VALUES (350430, '建宁县', 350400, '建宁', NULL, NULL, 'J', 116.845833, 26.831398, 3, 'tr_0 tr_350000 tr_350400', 3);
INSERT INTO `sys_area`
VALUES (350481, '永安市', 350400, '永安', NULL, NULL, 'Y', 117.364449, 25.974075, 3, 'tr_0 tr_350000 tr_350400', 11);
INSERT INTO `sys_area`
VALUES (350500, '泉州市', 350000, '泉州', NULL, NULL, 'Q', 118.589424, 24.908854, 2, 'tr_0 tr_350000', 6);
INSERT INTO `sys_area`
VALUES (350502, '鲤城区', 350500, '鲤城', NULL, NULL, 'L', 118.588928, 24.907644, 3, 'tr_0 tr_350000 tr_350500', 7);
INSERT INTO `sys_area`
VALUES (350503, '丰泽区', 350500, '丰泽', NULL, NULL, 'F', 118.605148, 24.896042, 3, 'tr_0 tr_350000 tr_350500', 3);
INSERT INTO `sys_area`
VALUES (350504, '洛江区', 350500, '洛江', NULL, NULL, 'L', 118.670311, 24.941153, 3, 'tr_0 tr_350000 tr_350500', 8);
INSERT INTO `sys_area`
VALUES (350505, '泉港区', 350500, '泉港', NULL, NULL, 'Q', 118.912285, 25.126860, 3, 'tr_0 tr_350000 tr_350500', 10);
INSERT INTO `sys_area`
VALUES (350521, '惠安县', 350500, '惠安', NULL, NULL, 'H', 118.798950, 25.028719, 3, 'tr_0 tr_350000 tr_350500', 4);
INSERT INTO `sys_area`
VALUES (350524, '安溪县', 350500, '安溪', NULL, NULL, 'A', 118.186012, 25.056824, 3, 'tr_0 tr_350000 tr_350500', 1);
INSERT INTO `sys_area`
VALUES (350525, '永春县', 350500, '永春', NULL, NULL, 'Y', 118.295029, 25.320721, 3, 'tr_0 tr_350000 tr_350500', 12);
INSERT INTO `sys_area`
VALUES (350526, '德化县', 350500, '德化', NULL, NULL, 'D', 118.242989, 25.489004, 3, 'tr_0 tr_350000 tr_350500', 2);
INSERT INTO `sys_area`
VALUES (350527, '金门县', 350500, '金门', NULL, NULL, 'J', 118.323219, 24.436417, 3, 'tr_0 tr_350000 tr_350500', 6);
INSERT INTO `sys_area`
VALUES (350581, '石狮市', 350500, '石狮', NULL, NULL, 'S', 118.628403, 24.731977, 3, 'tr_0 tr_350000 tr_350500', 11);
INSERT INTO `sys_area`
VALUES (350582, '晋江市', 350500, '晋江', NULL, NULL, 'J', 118.577339, 24.807322, 3, 'tr_0 tr_350000 tr_350500', 5);
INSERT INTO `sys_area`
VALUES (350583, '南安市', 350500, '南安', NULL, NULL, 'N', 118.387032, 24.959494, 3, 'tr_0 tr_350000 tr_350500', 9);
INSERT INTO `sys_area`
VALUES (350600, '漳州市', 350000, '漳州', NULL, NULL, 'Z', 117.661804, 24.510897, 2, 'tr_0 tr_350000', 9);
INSERT INTO `sys_area`
VALUES (350602, '芗城区', 350600, '芗城', NULL, NULL, 'Z', 117.656464, 24.509954, 3, 'tr_0 tr_350000 tr_350600', 8);
INSERT INTO `sys_area`
VALUES (350603, '龙文区', 350600, '龙文', NULL, NULL, 'L', 117.671387, 24.515656, 3, 'tr_0 tr_350000 tr_350600', 5);
INSERT INTO `sys_area`
VALUES (350622, '云霄县', 350600, '云霄', NULL, NULL, 'Y', 117.340942, 23.950485, 3, 'tr_0 tr_350000 tr_350600', 9);
INSERT INTO `sys_area`
VALUES (350623, '漳浦县', 350600, '漳浦', NULL, NULL, 'Z', 117.614021, 24.117907, 3, 'tr_0 tr_350000 tr_350600', 10);
INSERT INTO `sys_area`
VALUES (350624, '诏安县', 350600, '诏安', NULL, NULL, 'Z', 117.176086, 23.710835, 3, 'tr_0 tr_350000 tr_350600', 11);
INSERT INTO `sys_area`
VALUES (350625, '长泰县', 350600, '长泰', NULL, NULL, 'C', 117.755913, 24.621475, 3, 'tr_0 tr_350000 tr_350600', 1);
INSERT INTO `sys_area`
VALUES (350626, '东山县', 350600, '东山', NULL, NULL, 'D', 117.427681, 23.702845, 3, 'tr_0 tr_350000 tr_350600', 2);
INSERT INTO `sys_area`
VALUES (350627, '南靖县', 350600, '南靖', NULL, NULL, 'N', 117.365463, 24.516424, 3, 'tr_0 tr_350000 tr_350600', 6);
INSERT INTO `sys_area`
VALUES (350628, '平和县', 350600, '平和', NULL, NULL, 'P', 117.313545, 24.366158, 3, 'tr_0 tr_350000 tr_350600', 7);
INSERT INTO `sys_area`
VALUES (350629, '华安县', 350600, '华安', NULL, NULL, 'H', 117.536308, 25.001415, 3, 'tr_0 tr_350000 tr_350600', 3);
INSERT INTO `sys_area`
VALUES (350681, '龙海市', 350600, '龙海', NULL, NULL, 'L', 117.817291, 24.445341, 3, 'tr_0 tr_350000 tr_350600', 4);
INSERT INTO `sys_area`
VALUES (350700, '南平市', 350000, '南平', NULL, NULL, 'N', 118.178459, 26.635628, 2, 'tr_0 tr_350000', 3);
INSERT INTO `sys_area`
VALUES (350702, '延平区', 350700, '延平', NULL, NULL, 'Y', 118.178917, 26.636080, 3, 'tr_0 tr_350000 tr_350700', 9);
INSERT INTO `sys_area`
VALUES (350721, '顺昌县', 350700, '顺昌', NULL, NULL, 'S', 117.807709, 26.792850, 3, 'tr_0 tr_350000 tr_350700', 6);
INSERT INTO `sys_area`
VALUES (350722, '浦城县', 350700, '浦城', NULL, NULL, 'P', 118.536819, 27.920412, 3, 'tr_0 tr_350000 tr_350700', 4);
INSERT INTO `sys_area`
VALUES (350723, '光泽县', 350700, '光泽', NULL, NULL, 'G', 117.337898, 27.542803, 3, 'tr_0 tr_350000 tr_350700', 1);
INSERT INTO `sys_area`
VALUES (350724, '松溪县', 350700, '松溪', NULL, NULL, 'S', 118.783493, 27.525785, 3, 'tr_0 tr_350000 tr_350700', 7);
INSERT INTO `sys_area`
VALUES (350725, '政和县', 350700, '政和', NULL, NULL, 'Z', 118.858658, 27.365398, 3, 'tr_0 tr_350000 tr_350700', 10);
INSERT INTO `sys_area`
VALUES (350781, '邵武市', 350700, '邵武', NULL, NULL, 'S', 117.491547, 27.337952, 3, 'tr_0 tr_350000 tr_350700', 5);
INSERT INTO `sys_area`
VALUES (350782, '武夷山市', 350700, '武夷山', NULL, NULL, 'W', 118.032799, 27.751734, 3, 'tr_0 tr_350000 tr_350700', 8);
INSERT INTO `sys_area`
VALUES (350783, '建瓯市', 350700, '建瓯', NULL, NULL, 'J', 118.321762, 27.035021, 3, 'tr_0 tr_350000 tr_350700', 2);
INSERT INTO `sys_area`
VALUES (350784, '建阳市', 350700, '建阳', NULL, NULL, 'J', 118.122673, 27.332067, 3, 'tr_0 tr_350000 tr_350700', 3);
INSERT INTO `sys_area`
VALUES (350800, '龙岩市', 350000, '龙岩', NULL, NULL, 'L', 117.029778, 25.091602, 2, 'tr_0 tr_350000', 2);
INSERT INTO `sys_area`
VALUES (350802, '新罗区', 350800, '新罗', NULL, NULL, 'X', 117.030724, 25.091801, 3, 'tr_0 tr_350000 tr_350800', 5);
INSERT INTO `sys_area`
VALUES (350821, '长汀县', 350800, '长汀', NULL, NULL, 'C', 116.361008, 25.842278, 3, 'tr_0 tr_350000 tr_350800', 1);
INSERT INTO `sys_area`
VALUES (350822, '永定县', 350800, '永定', NULL, NULL, 'Y', 116.732689, 24.720442, 3, 'tr_0 tr_350000 tr_350800', 6);
INSERT INTO `sys_area`
VALUES (350823, '上杭县', 350800, '上杭', NULL, NULL, 'S', 116.424774, 25.050018, 3, 'tr_0 tr_350000 tr_350800', 3);
INSERT INTO `sys_area`
VALUES (350824, '武平县', 350800, '武平', NULL, NULL, 'W', 116.100929, 25.088650, 3, 'tr_0 tr_350000 tr_350800', 4);
INSERT INTO `sys_area`
VALUES (350825, '连城县', 350800, '连城', NULL, NULL, 'L', 116.756683, 25.708506, 3, 'tr_0 tr_350000 tr_350800', 2);
INSERT INTO `sys_area`
VALUES (350881, '漳平市', 350800, '漳平', NULL, NULL, 'Z', 117.420731, 25.291597, 3, 'tr_0 tr_350000 tr_350800', 7);
INSERT INTO `sys_area`
VALUES (350900, '宁德市', 350000, '宁德', NULL, NULL, 'N', 119.527084, 26.659241, 2, 'tr_0 tr_350000', 4);
INSERT INTO `sys_area`
VALUES (350902, '蕉城区', 350900, '蕉城', NULL, NULL, 'J', 119.527222, 26.659252, 3, 'tr_0 tr_350000 tr_350900', 4);
INSERT INTO `sys_area`
VALUES (350921, '霞浦县', 350900, '霞浦', NULL, NULL, 'X', 120.005211, 26.882069, 3, 'tr_0 tr_350000 tr_350900', 7);
INSERT INTO `sys_area`
VALUES (350922, '古田县', 350900, '古田', NULL, NULL, 'G', 118.743156, 26.577492, 3, 'tr_0 tr_350000 tr_350900', 3);
INSERT INTO `sys_area`
VALUES (350923, '屏南县', 350900, '屏南', NULL, NULL, 'P', 118.987541, 26.910826, 3, 'tr_0 tr_350000 tr_350900', 5);
INSERT INTO `sys_area`
VALUES (350924, '寿宁县', 350900, '寿宁', NULL, NULL, 'S', 119.506737, 27.457798, 3, 'tr_0 tr_350000 tr_350900', 6);
INSERT INTO `sys_area`
VALUES (350925, '周宁县', 350900, '周宁', NULL, NULL, 'Z', 119.338242, 27.103106, 3, 'tr_0 tr_350000 tr_350900', 9);
INSERT INTO `sys_area`
VALUES (350926, '柘荣县', 350900, '柘荣', NULL, NULL, 'Z', 119.898224, 27.236162, 3, 'tr_0 tr_350000 tr_350900', 8);
INSERT INTO `sys_area`
VALUES (350981, '福安市', 350900, '福安', NULL, NULL, 'F', 119.650795, 27.084246, 3, 'tr_0 tr_350000 tr_350900', 1);
INSERT INTO `sys_area`
VALUES (350982, '福鼎市', 350900, '福鼎', NULL, NULL, 'F', 120.219765, 27.318884, 3, 'tr_0 tr_350000 tr_350900', 2);
INSERT INTO `sys_area`
VALUES (360000, '江西省', 0, '江西', NULL, NULL, 'J', 115.892151, 28.676493, 1, 'tr_0', 14);
INSERT INTO `sys_area`
VALUES (360100, '南昌市', 360000, '南昌', NULL, NULL, 'N', 115.892151, 28.676493, 2, 'tr_0 tr_360000', 6);
INSERT INTO `sys_area`
VALUES (360102, '东湖区', 360100, '东湖', NULL, NULL, 'D', 115.889671, 28.682987, 3, 'tr_0 tr_360000 tr_360100', 2);
INSERT INTO `sys_area`
VALUES (360103, '西湖区', 360100, '西湖', NULL, NULL, 'X', 115.910652, 28.662901, 3, 'tr_0 tr_360000 tr_360100', 8);
INSERT INTO `sys_area`
VALUES (360104, '青云谱区', 360100, '青云谱', NULL, NULL, 'Q', 115.907295, 28.635723, 3, 'tr_0 tr_360000 tr_360100', 6);
INSERT INTO `sys_area`
VALUES (360105, '湾里区', 360100, '湾里', NULL, NULL, 'W', 115.731323, 28.714804, 3, 'tr_0 tr_360000 tr_360100', 7);
INSERT INTO `sys_area`
VALUES (360111, '青山湖区', 360100, '青山湖', NULL, NULL, 'Q', 115.949043, 28.689293, 3, 'tr_0 tr_360000 tr_360100', 5);
INSERT INTO `sys_area`
VALUES (360121, '南昌县', 360100, '南昌', NULL, NULL, 'N', 115.942467, 28.543781, 3, 'tr_0 tr_360000 tr_360100', 4);
INSERT INTO `sys_area`
VALUES (360122, '新建县', 360100, '新建', NULL, NULL, 'X', 115.820808, 28.690788, 3, 'tr_0 tr_360000 tr_360100', 9);
INSERT INTO `sys_area`
VALUES (360123, '安义县', 360100, '安义', NULL, NULL, 'A', 115.553108, 28.841333, 3, 'tr_0 tr_360000 tr_360100', 1);
INSERT INTO `sys_area`
VALUES (360124, '进贤县', 360100, '进贤', NULL, NULL, 'J', 116.267670, 28.365681, 3, 'tr_0 tr_360000 tr_360100', 3);
INSERT INTO `sys_area`
VALUES (360200, '景德镇市', 360000, '景德镇', NULL, NULL, 'J', 117.214661, 29.292561, 2, 'tr_0 tr_360000', 4);
INSERT INTO `sys_area`
VALUES (360202, '昌江区', 360200, '昌江', NULL, NULL, 'C', 117.195023, 29.288465, 3, 'tr_0 tr_360000 tr_360200', 1);
INSERT INTO `sys_area`
VALUES (360203, '珠山区', 360200, '珠山', NULL, NULL, 'Z', 117.214813, 29.292812, 3, 'tr_0 tr_360000 tr_360200', 4);
INSERT INTO `sys_area`
VALUES (360222, '浮梁县', 360200, '浮梁', NULL, NULL, 'F', 117.217613, 29.352251, 3, 'tr_0 tr_360000 tr_360200', 2);
INSERT INTO `sys_area`
VALUES (360281, '乐平市', 360200, '乐平', NULL, NULL, 'L', 117.129379, 28.967361, 3, 'tr_0 tr_360000 tr_360200', 3);
INSERT INTO `sys_area`
VALUES (360300, '萍乡市', 360000, '萍乡', NULL, NULL, 'P', 113.852188, 27.622946, 2, 'tr_0 tr_360000', 7);
INSERT INTO `sys_area`
VALUES (360302, '安源区', 360300, '安源', NULL, NULL, 'A', 113.855042, 27.625826, 3, 'tr_0 tr_360000 tr_360300', 1);
INSERT INTO `sys_area`
VALUES (360313, '湘东区', 360300, '湘东', NULL, NULL, 'X', 113.745598, 27.639318, 3, 'tr_0 tr_360000 tr_360300', 5);
INSERT INTO `sys_area`
VALUES (360321, '莲花县', 360300, '莲花', NULL, NULL, 'L', 113.955582, 27.127808, 3, 'tr_0 tr_360000 tr_360300', 2);
INSERT INTO `sys_area`
VALUES (360322, '上栗县', 360300, '上栗', NULL, NULL, 'S', 113.800522, 27.877041, 3, 'tr_0 tr_360000 tr_360300', 4);
INSERT INTO `sys_area`
VALUES (360323, '芦溪县', 360300, '芦溪', NULL, NULL, 'L', 114.041206, 27.633633, 3, 'tr_0 tr_360000 tr_360300', 3);
INSERT INTO `sys_area`
VALUES (360400, '九江市', 360000, '九江', NULL, NULL, 'J', 115.992813, 29.712034, 2, 'tr_0 tr_360000', 5);
INSERT INTO `sys_area`
VALUES (360402, '庐山区', 360400, '庐山', NULL, NULL, 'L', 115.990120, 29.676174, 3, 'tr_0 tr_360000 tr_360400', 6);
INSERT INTO `sys_area`
VALUES (360403, '浔阳区', 360400, '浔阳', NULL, NULL, 'Z', 115.995949, 29.724649, 3, 'tr_0 tr_360000 tr_360400', 12);
INSERT INTO `sys_area`
VALUES (360421, '九江县', 360400, '九江', NULL, NULL, 'J', 115.892975, 29.610264, 3, 'tr_0 tr_360000 tr_360400', 5);
INSERT INTO `sys_area`
VALUES (360423, '武宁县', 360400, '武宁', NULL, NULL, 'W', 115.105644, 29.260181, 3, 'tr_0 tr_360000 tr_360400', 9);
INSERT INTO `sys_area`
VALUES (360424, '修水县', 360400, '修水', NULL, NULL, 'X', 114.573425, 29.032728, 3, 'tr_0 tr_360000 tr_360400', 11);
INSERT INTO `sys_area`
VALUES (360425, '永修县', 360400, '永修', NULL, NULL, 'Y', 115.809052, 29.018211, 3, 'tr_0 tr_360000 tr_360400', 13);
INSERT INTO `sys_area`
VALUES (360426, '德安县', 360400, '德安', NULL, NULL, 'D', 115.762611, 29.327475, 3, 'tr_0 tr_360000 tr_360400', 1);
INSERT INTO `sys_area`
VALUES (360427, '星子县', 360400, '星子', NULL, NULL, 'X', 116.043739, 29.456169, 3, 'tr_0 tr_360000 tr_360400', 10);
INSERT INTO `sys_area`
VALUES (360428, '都昌县', 360400, '都昌', NULL, NULL, 'D', 116.205116, 29.275105, 3, 'tr_0 tr_360000 tr_360400', 2);
INSERT INTO `sys_area`
VALUES (360429, '湖口县', 360400, '湖口', NULL, NULL, 'H', 116.244316, 29.726299, 3, 'tr_0 tr_360000 tr_360400', 4);
INSERT INTO `sys_area`
VALUES (360430, '彭泽县', 360400, '彭泽', NULL, NULL, 'P', 116.555840, 29.898865, 3, 'tr_0 tr_360000 tr_360400', 7);
INSERT INTO `sys_area`
VALUES (360481, '瑞昌市', 360400, '瑞昌', NULL, NULL, 'R', 115.669083, 29.676600, 3, 'tr_0 tr_360000 tr_360400', 8);
INSERT INTO `sys_area`
VALUES (360483, '共青城市', 360400, '共青城', NULL, NULL, 'G', 115.805710, 29.247885, 3, 'tr_0 tr_360000 tr_360400', 3);
INSERT INTO `sys_area`
VALUES (360500, '新余市', 360000, '新余', NULL, NULL, 'X', 114.930832, 27.810835, 2, 'tr_0 tr_360000', 9);
INSERT INTO `sys_area`
VALUES (360502, '渝水区', 360500, '渝水', NULL, NULL, 'Y', 114.923920, 27.819172, 3, 'tr_0 tr_360000 tr_360500', 2);
INSERT INTO `sys_area`
VALUES (360521, '分宜县', 360500, '分宜', NULL, NULL, 'F', 114.675262, 27.811300, 3, 'tr_0 tr_360000 tr_360500', 1);
INSERT INTO `sys_area`
VALUES (360600, '鹰潭市', 360000, '鹰潭', NULL, NULL, 'Y', 117.033836, 28.238638, 2, 'tr_0 tr_360000', 11);
INSERT INTO `sys_area`
VALUES (360602, '月湖区', 360600, '月湖', NULL, NULL, 'Y', 117.034111, 28.239077, 3, 'tr_0 tr_360000 tr_360600', 2);
INSERT INTO `sys_area`
VALUES (360603, '余江区', 360600, '余江', NULL, NULL, 'Y', 116.822762, 28.206177, 3, 'tr_0 tr_360000 tr_360600', 3);
INSERT INTO `sys_area`
VALUES (360681, '贵溪市', 360600, '贵溪', NULL, NULL, 'G', 117.212105, 28.283693, 3, 'tr_0 tr_360000 tr_360600', 1);
INSERT INTO `sys_area`
VALUES (360700, '赣州市', 360000, '赣州', NULL, NULL, 'G', 114.940277, 25.850969, 2, 'tr_0 tr_360000', 2);
INSERT INTO `sys_area`
VALUES (360702, '章贡区', 360700, '章贡', NULL, NULL, 'Z', 114.938721, 25.851368, 3, 'tr_0 tr_360000 tr_360700', 18);
INSERT INTO `sys_area`
VALUES (360721, '赣县', 360700, '赣县', NULL, NULL, 'G', 115.018463, 25.865433, 3, 'tr_0 tr_360000 tr_360700', 5);
INSERT INTO `sys_area`
VALUES (360722, '信丰县', 360700, '信丰', NULL, NULL, 'X', 114.930893, 25.380230, 3, 'tr_0 tr_360000 tr_360700', 13);
INSERT INTO `sys_area`
VALUES (360723, '大余县', 360700, '大余', NULL, NULL, 'D', 114.362244, 25.395937, 3, 'tr_0 tr_360000 tr_360700', 3);
INSERT INTO `sys_area`
VALUES (360724, '上犹县', 360700, '上犹', NULL, NULL, 'S', 114.540535, 25.794285, 3, 'tr_0 tr_360000 tr_360700', 12);
INSERT INTO `sys_area`
VALUES (360725, '崇义县', 360700, '崇义', NULL, NULL, 'C', 114.307350, 25.687910, 3, 'tr_0 tr_360000 tr_360700', 2);
INSERT INTO `sys_area`
VALUES (360726, '安远县', 360700, '安远', NULL, NULL, 'A', 115.392326, 25.134590, 3, 'tr_0 tr_360000 tr_360700', 1);
INSERT INTO `sys_area`
VALUES (360727, '龙南县', 360700, '龙南', NULL, NULL, 'L', 114.792656, 24.904760, 3, 'tr_0 tr_360000 tr_360700', 7);
INSERT INTO `sys_area`
VALUES (360728, '定南县', 360700, '定南', NULL, NULL, 'D', 115.032669, 24.774277, 3, 'tr_0 tr_360000 tr_360700', 4);
INSERT INTO `sys_area`
VALUES (360729, '全南县', 360700, '全南', NULL, NULL, 'Q', 114.531586, 24.742651, 3, 'tr_0 tr_360000 tr_360700', 10);
INSERT INTO `sys_area`
VALUES (360730, '宁都县', 360700, '宁都', NULL, NULL, 'N', 116.018784, 26.472054, 3, 'tr_0 tr_360000 tr_360700', 9);
INSERT INTO `sys_area`
VALUES (360731, '于都县', 360700, '于都', NULL, NULL, 'Y', 115.411201, 25.955032, 3, 'tr_0 tr_360000 tr_360700', 17);
INSERT INTO `sys_area`
VALUES (360732, '兴国县', 360700, '兴国', NULL, NULL, 'X', 115.351898, 26.330488, 3, 'tr_0 tr_360000 tr_360700', 15);
INSERT INTO `sys_area`
VALUES (360733, '会昌县', 360700, '会昌', NULL, NULL, 'H', 115.791161, 25.599125, 3, 'tr_0 tr_360000 tr_360700', 6);
INSERT INTO `sys_area`
VALUES (360734, '寻乌县', 360700, '寻乌', NULL, NULL, 'X', 115.651398, 24.954136, 3, 'tr_0 tr_360000 tr_360700', 16);
INSERT INTO `sys_area`
VALUES (360735, '石城县', 360700, '石城', NULL, NULL, 'S', 116.342247, 26.326582, 3, 'tr_0 tr_360000 tr_360700', 14);
INSERT INTO `sys_area`
VALUES (360781, '瑞金市', 360700, '瑞金', NULL, NULL, 'R', 116.034851, 25.875278, 3, 'tr_0 tr_360000 tr_360700', 11);
INSERT INTO `sys_area`
VALUES (360782, '南康市', 360700, '南康', NULL, NULL, 'N', 114.756935, 25.661720, 3, 'tr_0 tr_360000 tr_360700', 8);
INSERT INTO `sys_area`
VALUES (360800, '吉安市', 360000, '吉安', NULL, NULL, 'J', 114.986374, 27.111698, 2, 'tr_0 tr_360000', 3);
INSERT INTO `sys_area`
VALUES (360802, '吉州区', 360800, '吉州', NULL, NULL, 'J', 114.987328, 27.112368, 3, 'tr_0 tr_360000 tr_360800', 5);
INSERT INTO `sys_area`
VALUES (360803, '青原区', 360800, '青原', NULL, NULL, 'Q', 115.016304, 27.105879, 3, 'tr_0 tr_360000 tr_360800', 6);
INSERT INTO `sys_area`
VALUES (360821, '吉安县', 360800, '吉安', NULL, NULL, 'J', 114.905113, 27.040043, 3, 'tr_0 tr_360000 tr_360800', 2);
INSERT INTO `sys_area`
VALUES (360822, '吉水县', 360800, '吉水', NULL, NULL, 'J', 115.134567, 27.213446, 3, 'tr_0 tr_360000 tr_360800', 4);
INSERT INTO `sys_area`
VALUES (360823, '峡江县', 360800, '峡江', NULL, NULL, 'X', 115.319328, 27.580862, 3, 'tr_0 tr_360000 tr_360800', 10);
INSERT INTO `sys_area`
VALUES (360824, '新干县', 360800, '新干', NULL, NULL, 'X', 115.399292, 27.755758, 3, 'tr_0 tr_360000 tr_360800', 11);
INSERT INTO `sys_area`
VALUES (360825, '永丰县', 360800, '永丰', NULL, NULL, 'Y', 115.435562, 27.321087, 3, 'tr_0 tr_360000 tr_360800', 12);
INSERT INTO `sys_area`
VALUES (360826, '泰和县', 360800, '泰和', NULL, NULL, 'T', 114.901390, 26.790165, 3, 'tr_0 tr_360000 tr_360800', 8);
INSERT INTO `sys_area`
VALUES (360827, '遂川县', 360800, '遂川', NULL, NULL, 'S', 114.516891, 26.323706, 3, 'tr_0 tr_360000 tr_360800', 7);
INSERT INTO `sys_area`
VALUES (360828, '万安县', 360800, '万安', NULL, NULL, 'W', 114.784691, 26.462086, 3, 'tr_0 tr_360000 tr_360800', 9);
INSERT INTO `sys_area`
VALUES (360829, '安福县', 360800, '安福', NULL, NULL, 'A', 114.613838, 27.382746, 3, 'tr_0 tr_360000 tr_360800', 1);
INSERT INTO `sys_area`
VALUES (360830, '永新县', 360800, '永新', NULL, NULL, 'Y', 114.242531, 26.944721, 3, 'tr_0 tr_360000 tr_360800', 13);
INSERT INTO `sys_area`
VALUES (360881, '井冈山市', 360800, '井冈山', NULL, NULL, 'J', 114.284424, 26.745918, 3, 'tr_0 tr_360000 tr_360800', 3);
INSERT INTO `sys_area`
VALUES (360900, '宜春市', 360000, '宜春', NULL, NULL, 'Y', 114.391136, 27.804300, 2, 'tr_0 tr_360000', 10);
INSERT INTO `sys_area`
VALUES (360902, '袁州区', 360900, '袁州', NULL, NULL, 'Y', 114.387383, 27.800117, 3, 'tr_0 tr_360000 tr_360900', 9);
INSERT INTO `sys_area`
VALUES (360921, '奉新县', 360900, '奉新', NULL, NULL, 'F', 115.389900, 28.700672, 3, 'tr_0 tr_360000 tr_360900', 2);
INSERT INTO `sys_area`
VALUES (360922, '万载县', 360900, '万载', NULL, NULL, 'W', 114.449013, 28.104528, 3, 'tr_0 tr_360000 tr_360900', 7);
INSERT INTO `sys_area`
VALUES (360923, '上高县', 360900, '上高', NULL, NULL, 'S', 114.932655, 28.234789, 3, 'tr_0 tr_360000 tr_360900', 5);
INSERT INTO `sys_area`
VALUES (360924, '宜丰县', 360900, '宜丰', NULL, NULL, 'Y', 114.787384, 28.388288, 3, 'tr_0 tr_360000 tr_360900', 8);
INSERT INTO `sys_area`
VALUES (360925, '靖安县', 360900, '靖安', NULL, NULL, 'J', 115.361748, 28.860540, 3, 'tr_0 tr_360000 tr_360900', 4);
INSERT INTO `sys_area`
VALUES (360926, '铜鼓县', 360900, '铜鼓', NULL, NULL, 'T', 114.370140, 28.520956, 3, 'tr_0 tr_360000 tr_360900', 6);
INSERT INTO `sys_area`
VALUES (360981, '丰城市', 360900, '丰城', NULL, NULL, 'F', 115.786003, 28.191584, 3, 'tr_0 tr_360000 tr_360900', 1);
INSERT INTO `sys_area`
VALUES (360982, '樟树市', 360900, '樟树', NULL, NULL, 'Z', 115.543388, 28.055899, 3, 'tr_0 tr_360000 tr_360900', 10);
INSERT INTO `sys_area`
VALUES (360983, '高安市', 360900, '高安', NULL, NULL, 'G', 115.381531, 28.420952, 3, 'tr_0 tr_360000 tr_360900', 3);
INSERT INTO `sys_area`
VALUES (361000, '抚州市', 360000, '抚州', NULL, NULL, 'F', 116.358353, 27.983850, 2, 'tr_0 tr_360000', 1);
INSERT INTO `sys_area`
VALUES (361002, '临川区', 361000, '临川', NULL, NULL, 'L', 116.361404, 27.981918, 3, 'tr_0 tr_360000 tr_361000', 7);
INSERT INTO `sys_area`
VALUES (361003, '东乡区', 361000, '东乡', NULL, NULL, 'D', 116.605339, 28.232500, 3, 'tr_0 tr_360000 tr_361000', 2);
INSERT INTO `sys_area`
VALUES (361021, '南城县', 361000, '南城', NULL, NULL, 'N', 116.639450, 27.555309, 3, 'tr_0 tr_360000 tr_361000', 8);
INSERT INTO `sys_area`
VALUES (361022, '黎川县', 361000, '黎川', NULL, NULL, 'L', 116.914574, 27.292561, 3, 'tr_0 tr_360000 tr_361000', 6);
INSERT INTO `sys_area`
VALUES (361023, '南丰县', 361000, '南丰', NULL, NULL, 'N', 116.532997, 27.210133, 3, 'tr_0 tr_360000 tr_361000', 9);
INSERT INTO `sys_area`
VALUES (361024, '崇仁县', 361000, '崇仁', NULL, NULL, 'C', 116.059113, 27.760906, 3, 'tr_0 tr_360000 tr_361000', 1);
INSERT INTO `sys_area`
VALUES (361025, '乐安县', 361000, '乐安', NULL, NULL, 'L', 115.838432, 27.420101, 3, 'tr_0 tr_360000 tr_361000', 5);
INSERT INTO `sys_area`
VALUES (361026, '宜黄县', 361000, '宜黄', NULL, NULL, 'Y', 116.223022, 27.546513, 3, 'tr_0 tr_360000 tr_361000', 10);
INSERT INTO `sys_area`
VALUES (361027, '金溪县', 361000, '金溪', NULL, NULL, 'J', 116.778748, 27.907387, 3, 'tr_0 tr_360000 tr_361000', 4);
INSERT INTO `sys_area`
VALUES (361028, '资溪县', 361000, '资溪', NULL, NULL, 'Z', 117.066093, 27.706530, 3, 'tr_0 tr_360000 tr_361000', 11);
INSERT INTO `sys_area`
VALUES (361030, '广昌县', 361000, '广昌', NULL, NULL, 'G', 116.327293, 26.838427, 3, 'tr_0 tr_360000 tr_361000', 3);
INSERT INTO `sys_area`
VALUES (361100, '上饶市', 360000, '上饶', NULL, NULL, 'S', 117.971184, 28.444420, 2, 'tr_0 tr_360000', 8);
INSERT INTO `sys_area`
VALUES (361102, '信州区', 361100, '信州', NULL, NULL, 'X', 117.970520, 28.445377, 3, 'tr_0 tr_360000 tr_361100', 6);
INSERT INTO `sys_area`
VALUES (361121, '上饶县', 361100, '上饶', NULL, NULL, 'S', 117.906120, 28.453897, 3, 'tr_0 tr_360000 tr_361100', 5);
INSERT INTO `sys_area`
VALUES (361122, '广丰县', 361100, '广丰', NULL, NULL, 'G', 118.189850, 28.440285, 3, 'tr_0 tr_360000 tr_361100', 2);
INSERT INTO `sys_area`
VALUES (361123, '玉山县', 361100, '玉山', NULL, NULL, 'Y', 118.244408, 28.673479, 3, 'tr_0 tr_360000 tr_361100', 12);
INSERT INTO `sys_area`
VALUES (361124, '铅山县', 361100, '铅山', NULL, NULL, 'Q', 117.711906, 28.310892, 3, 'tr_0 tr_360000 tr_361100', 9);
INSERT INTO `sys_area`
VALUES (361125, '横峰县', 361100, '横峰', NULL, NULL, 'H', 117.608246, 28.415104, 3, 'tr_0 tr_360000 tr_361100', 3);
INSERT INTO `sys_area`
VALUES (361126, '弋阳县', 361100, '弋阳', NULL, NULL, 'Z', 117.435005, 28.402391, 3, 'tr_0 tr_360000 tr_361100', 10);
INSERT INTO `sys_area`
VALUES (361127, '余干县', 361100, '余干', NULL, NULL, 'Y', 116.691071, 28.691730, 3, 'tr_0 tr_360000 tr_361100', 11);
INSERT INTO `sys_area`
VALUES (361128, '鄱阳县', 361100, '鄱阳', NULL, NULL, 'Z', 116.673744, 28.993374, 3, 'tr_0 tr_360000 tr_361100', 4);
INSERT INTO `sys_area`
VALUES (361129, '万年县', 361100, '万年', NULL, NULL, 'W', 117.070152, 28.692589, 3, 'tr_0 tr_360000 tr_361100', 7);
INSERT INTO `sys_area`
VALUES (361130, '婺源县', 361100, '婺源', NULL, NULL, 'Z', 117.862190, 29.254015, 3, 'tr_0 tr_360000 tr_361100', 8);
INSERT INTO `sys_area`
VALUES (361181, '德兴市', 361100, '德兴', NULL, NULL, 'D', 117.578735, 28.945034, 3, 'tr_0 tr_360000 tr_361100', 1);
INSERT INTO `sys_area`
VALUES (370000, '山东省', 0, '山东', NULL, NULL, 'S', 117.000923, 36.675808, 1, 'tr_0', 15);
INSERT INTO `sys_area`
VALUES (370100, '济南市', 370000, '济南', NULL, NULL, 'J', 117.000923, 36.675808, 2, 'tr_0 tr_370000', 5);
INSERT INTO `sys_area`
VALUES (370102, '历下区', 370100, '历下', NULL, NULL, 'L', 117.038620, 36.664169, 3, 'tr_0 tr_370000 tr_370100', 5);
INSERT INTO `sys_area`
VALUES (370103, '市中区', 370100, '市中', NULL, NULL, 'S', 116.998978, 36.657352, 3, 'tr_0 tr_370000 tr_370100', 8);
INSERT INTO `sys_area`
VALUES (370104, '槐荫区', 370100, '槐荫', NULL, NULL, 'H', 116.947922, 36.668205, 3, 'tr_0 tr_370000 tr_370100', 2);
INSERT INTO `sys_area`
VALUES (370105, '天桥区', 370100, '天桥', NULL, NULL, 'T', 116.996086, 36.693375, 3, 'tr_0 tr_370000 tr_370100', 9);
INSERT INTO `sys_area`
VALUES (370112, '历城区', 370100, '历城', NULL, NULL, 'L', 117.063744, 36.681744, 3, 'tr_0 tr_370000 tr_370100', 4);
INSERT INTO `sys_area`
VALUES (370113, '长清区', 370100, '长清', NULL, NULL, 'C', 116.745880, 36.561050, 3, 'tr_0 tr_370000 tr_370100', 1);
INSERT INTO `sys_area`
VALUES (370124, '平阴县', 370100, '平阴', NULL, NULL, 'P', 116.455055, 36.286922, 3, 'tr_0 tr_370000 tr_370100', 6);
INSERT INTO `sys_area`
VALUES (370125, '济阳县', 370100, '济阳', NULL, NULL, 'J', 117.176033, 36.976772, 3, 'tr_0 tr_370000 tr_370100', 3);
INSERT INTO `sys_area`
VALUES (370126, '商河县', 370100, '商河', NULL, NULL, 'S', 117.156372, 37.310543, 3, 'tr_0 tr_370000 tr_370100', 7);
INSERT INTO `sys_area`
VALUES (370181, '章丘市', 370100, '章丘', NULL, NULL, 'Z', 117.540688, 36.712090, 3, 'tr_0 tr_370000 tr_370100', 10);
INSERT INTO `sys_area`
VALUES (370200, '青岛市', 370000, '青岛', NULL, NULL, 'Q', 120.355171, 36.082981, 2, 'tr_0 tr_370000', 10);
INSERT INTO `sys_area`
VALUES (370202, '市南区', 370200, '市南', NULL, NULL, 'S', 120.395966, 36.070892, 3, 'tr_0 tr_370000 tr_370200', 10);
INSERT INTO `sys_area`
VALUES (370203, '市北区', 370200, '市北', NULL, NULL, 'S', 120.355026, 36.083820, 3, 'tr_0 tr_370000 tr_370200', 9);
INSERT INTO `sys_area`
VALUES (370211, '黄岛区', 370200, '黄岛', NULL, NULL, 'H', 119.995522, 35.875137, 3, 'tr_0 tr_370000 tr_370200', 2);
INSERT INTO `sys_area`
VALUES (370212, '崂山区', 370200, '崂山', NULL, NULL, 'Z', 120.467392, 36.102570, 3, 'tr_0 tr_370000 tr_370200', 6);
INSERT INTO `sys_area`
VALUES (370213, '李沧区', 370200, '李沧', NULL, NULL, 'L', 120.421234, 36.160023, 3, 'tr_0 tr_370000 tr_370200', 7);
INSERT INTO `sys_area`
VALUES (370214, '城阳区', 370200, '城阳', NULL, NULL, 'C', 120.389137, 36.306831, 3, 'tr_0 tr_370000 tr_370200', 1);
INSERT INTO `sys_area`
VALUES (370281, '胶州市', 370200, '胶州', NULL, NULL, 'J', 120.006203, 36.285877, 3, 'tr_0 tr_370000 tr_370200', 3);
INSERT INTO `sys_area`
VALUES (370282, '即墨市', 370200, '即墨', NULL, NULL, 'J', 120.447350, 36.390846, 3, 'tr_0 tr_370000 tr_370200', 4);
INSERT INTO `sys_area`
VALUES (370283, '平度市', 370200, '平度', NULL, NULL, 'P', 119.959015, 36.788830, 3, 'tr_0 tr_370000 tr_370200', 8);
INSERT INTO `sys_area`
VALUES (370285, '莱西市', 370200, '莱西', NULL, NULL, 'L', 120.526222, 36.865089, 3, 'tr_0 tr_370000 tr_370200', 5);
INSERT INTO `sys_area`
VALUES (370300, '淄博市', 370000, '淄博', NULL, NULL, 'Z', 118.047646, 36.814938, 2, 'tr_0 tr_370000', 17);
INSERT INTO `sys_area`
VALUES (370302, '淄川区', 370300, '淄川', NULL, NULL, 'Z', 117.967697, 36.647270, 3, 'tr_0 tr_370000 tr_370300', 8);
INSERT INTO `sys_area`
VALUES (370303, '张店区', 370300, '张店', NULL, NULL, 'Z', 118.053520, 36.807049, 3, 'tr_0 tr_370000 tr_370300', 6);
INSERT INTO `sys_area`
VALUES (370304, '博山区', 370300, '博山', NULL, NULL, 'B', 117.858231, 36.497566, 3, 'tr_0 tr_370000 tr_370300', 1);
INSERT INTO `sys_area`
VALUES (370305, '临淄区', 370300, '临淄', NULL, NULL, 'L', 118.306015, 36.816658, 3, 'tr_0 tr_370000 tr_370300', 4);
INSERT INTO `sys_area`
VALUES (370306, '周村区', 370300, '周村', NULL, NULL, 'Z', 117.851036, 36.803699, 3, 'tr_0 tr_370000 tr_370300', 7);
INSERT INTO `sys_area`
VALUES (370321, '桓台县', 370300, '桓台', NULL, NULL, 'H', 118.101555, 36.959774, 3, 'tr_0 tr_370000 tr_370300', 3);
INSERT INTO `sys_area`
VALUES (370322, '高青县', 370300, '高青', NULL, NULL, 'G', 117.829842, 37.169582, 3, 'tr_0 tr_370000 tr_370300', 2);
INSERT INTO `sys_area`
VALUES (370323, '沂源县', 370300, '沂源', NULL, NULL, 'Y', 118.166161, 36.186283, 3, 'tr_0 tr_370000 tr_370300', 5);
INSERT INTO `sys_area`
VALUES (370400, '枣庄市', 370000, '枣庄', NULL, NULL, 'Z', 117.557961, 34.856422, 2, 'tr_0 tr_370000', 16);
INSERT INTO `sys_area`
VALUES (370402, '市中区', 370400, '市中', NULL, NULL, 'S', 117.557281, 34.856651, 3, 'tr_0 tr_370000 tr_370400', 2);
INSERT INTO `sys_area`
VALUES (370403, '薛城区', 370400, '薛城', NULL, NULL, 'X', 117.265289, 34.797890, 3, 'tr_0 tr_370000 tr_370400', 5);
INSERT INTO `sys_area`
VALUES (370404, '峄城区', 370400, '峄城', NULL, NULL, 'Z', 117.586319, 34.767712, 3, 'tr_0 tr_370000 tr_370400', 6);
INSERT INTO `sys_area`
VALUES (370405, '台儿庄区', 370400, '台儿庄', NULL, NULL, 'T', 117.734749, 34.564816, 3, 'tr_0 tr_370000 tr_370400', 3);
INSERT INTO `sys_area`
VALUES (370406, '山亭区', 370400, '山亭', NULL, NULL, 'S', 117.458969, 35.096077, 3, 'tr_0 tr_370000 tr_370400', 1);
INSERT INTO `sys_area`
VALUES (370481, '滕州市', 370400, '滕州', NULL, NULL, 'Z', 117.162102, 35.088497, 3, 'tr_0 tr_370000 tr_370400', 4);
INSERT INTO `sys_area`
VALUES (370500, '东营市', 370000, '东营', NULL, NULL, 'D', 118.664711, 37.434563, 2, 'tr_0 tr_370000', 3);
INSERT INTO `sys_area`
VALUES (370502, '东营区', 370500, '东营', NULL, NULL, 'D', 118.507545, 37.461567, 3, 'tr_0 tr_370000 tr_370500', 1);
INSERT INTO `sys_area`
VALUES (370503, '河口区', 370500, '河口', NULL, NULL, 'H', 118.529610, 37.886017, 3, 'tr_0 tr_370000 tr_370500', 3);
INSERT INTO `sys_area`
VALUES (370521, '垦利县', 370500, '垦利', NULL, NULL, 'K', 118.551315, 37.588680, 3, 'tr_0 tr_370000 tr_370500', 4);
INSERT INTO `sys_area`
VALUES (370522, '利津县', 370500, '利津', NULL, NULL, 'L', 118.248856, 37.493366, 3, 'tr_0 tr_370000 tr_370500', 5);
INSERT INTO `sys_area`
VALUES (370523, '广饶县', 370500, '广饶', NULL, NULL, 'G', 118.407524, 37.051609, 3, 'tr_0 tr_370000 tr_370500', 2);
INSERT INTO `sys_area`
VALUES (370600, '烟台市', 370000, '烟台', NULL, NULL, 'Y', 121.391380, 37.539295, 2, 'tr_0 tr_370000', 15);
INSERT INTO `sys_area`
VALUES (370602, '芝罘区', 370600, '芝罘', NULL, NULL, 'Z', 121.385880, 37.540924, 3, 'tr_0 tr_370000 tr_370600', 12);
INSERT INTO `sys_area`
VALUES (370611, '福山区', 370600, '福山', NULL, NULL, 'F', 121.264740, 37.496876, 3, 'tr_0 tr_370000 tr_370600', 2);
INSERT INTO `sys_area`
VALUES (370612, '牟平区', 370600, '牟平', NULL, NULL, 'M', 121.601509, 37.388355, 3, 'tr_0 tr_370000 tr_370600', 8);
INSERT INTO `sys_area`
VALUES (370613, '莱山区', 370600, '莱山', NULL, NULL, 'L', 121.448868, 37.473549, 3, 'tr_0 tr_370000 tr_370600', 4);
INSERT INTO `sys_area`
VALUES (370634, '长岛县', 370600, '长岛', NULL, NULL, 'C', 120.738342, 37.916195, 3, 'tr_0 tr_370000 tr_370600', 1);
INSERT INTO `sys_area`
VALUES (370681, '龙口市', 370600, '龙口', NULL, NULL, 'L', 120.528328, 37.648445, 3, 'tr_0 tr_370000 tr_370600', 7);
INSERT INTO `sys_area`
VALUES (370682, '莱阳市', 370600, '莱阳', NULL, NULL, 'L', 120.711151, 36.977036, 3, 'tr_0 tr_370000 tr_370600', 5);
INSERT INTO `sys_area`
VALUES (370683, '莱州市', 370600, '莱州', NULL, NULL, 'L', 119.942139, 37.182724, 3, 'tr_0 tr_370000 tr_370600', 6);
INSERT INTO `sys_area`
VALUES (370684, '蓬莱市', 370600, '蓬莱', NULL, NULL, 'P', 120.762688, 37.811169, 3, 'tr_0 tr_370000 tr_370600', 9);
INSERT INTO `sys_area`
VALUES (370685, '招远市', 370600, '招远', NULL, NULL, 'Z', 120.403145, 37.364918, 3, 'tr_0 tr_370000 tr_370600', 11);
INSERT INTO `sys_area`
VALUES (370686, '栖霞市', 370600, '栖霞', NULL, NULL, 'Q', 120.834099, 37.305855, 3, 'tr_0 tr_370000 tr_370600', 10);
INSERT INTO `sys_area`
VALUES (370687, '海阳市', 370600, '海阳', NULL, NULL, 'H', 121.168388, 36.780659, 3, 'tr_0 tr_370000 tr_370600', 3);
INSERT INTO `sys_area`
VALUES (370700, '潍坊市', 370000, '潍坊', NULL, NULL, 'W', 119.107079, 36.709251, 2, 'tr_0 tr_370000', 13);
INSERT INTO `sys_area`
VALUES (370702, '潍城区', 370700, '潍城', NULL, NULL, 'W', 119.103783, 36.710060, 3, 'tr_0 tr_370000 tr_370700', 11);
INSERT INTO `sys_area`
VALUES (370703, '寒亭区', 370700, '寒亭', NULL, NULL, 'H', 119.207863, 36.772102, 3, 'tr_0 tr_370000 tr_370700', 6);
INSERT INTO `sys_area`
VALUES (370704, '坊子区', 370700, '坊子', NULL, NULL, 'F', 119.166328, 36.654617, 3, 'tr_0 tr_370000 tr_370700', 4);
INSERT INTO `sys_area`
VALUES (370705, '奎文区', 370700, '奎文', NULL, NULL, 'K', 119.137360, 36.709496, 3, 'tr_0 tr_370000 tr_370700', 7);
INSERT INTO `sys_area`
VALUES (370724, '临朐县', 370700, '临朐', NULL, NULL, 'L', 118.539879, 36.516373, 3, 'tr_0 tr_370000 tr_370700', 8);
INSERT INTO `sys_area`
VALUES (370725, '昌乐县', 370700, '昌乐', NULL, NULL, 'C', 118.839996, 36.703255, 3, 'tr_0 tr_370000 tr_370700', 2);
INSERT INTO `sys_area`
VALUES (370781, '青州市', 370700, '青州', NULL, NULL, 'Q', 118.484695, 36.697857, 3, 'tr_0 tr_370000 tr_370700', 9);
INSERT INTO `sys_area`
VALUES (370782, '诸城市', 370700, '诸城', NULL, NULL, 'Z', 119.403183, 35.997093, 3, 'tr_0 tr_370000 tr_370700', 12);
INSERT INTO `sys_area`
VALUES (370783, '寿光市', 370700, '寿光', NULL, NULL, 'S', 118.736450, 36.874413, 3, 'tr_0 tr_370000 tr_370700', 10);
INSERT INTO `sys_area`
VALUES (370784, '安丘市', 370700, '安丘', NULL, NULL, 'A', 119.206886, 36.427418, 3, 'tr_0 tr_370000 tr_370700', 1);
INSERT INTO `sys_area`
VALUES (370785, '高密市', 370700, '高密', NULL, NULL, 'G', 119.757034, 36.377541, 3, 'tr_0 tr_370000 tr_370700', 5);
INSERT INTO `sys_area`
VALUES (370786, '昌邑市', 370700, '昌邑', NULL, NULL, 'C', 119.394501, 36.854939, 3, 'tr_0 tr_370000 tr_370700', 3);
INSERT INTO `sys_area`
VALUES (370800, '济宁市', 370000, '济宁', NULL, NULL, 'J', 116.587242, 35.415394, 2, 'tr_0 tr_370000', 6);
INSERT INTO `sys_area`
VALUES (370802, '市中区', 370800, '市中', NULL, NULL, 'S', 116.587242, 35.415394, 3, 'tr_0 tr_370000 tr_370800', 6);
INSERT INTO `sys_area`
VALUES (370811, '任城区', 370800, '任城', NULL, NULL, 'R', 116.631020, 35.431835, 3, 'tr_0 tr_370000 tr_370800', 5);
INSERT INTO `sys_area`
VALUES (370826, '微山县', 370800, '微山', NULL, NULL, 'W', 117.128609, 34.809525, 3, 'tr_0 tr_370000 tr_370800', 8);
INSERT INTO `sys_area`
VALUES (370827, '鱼台县', 370800, '鱼台', NULL, NULL, 'Y', 116.650024, 34.997707, 3, 'tr_0 tr_370000 tr_370800', 11);
INSERT INTO `sys_area`
VALUES (370828, '金乡县', 370800, '金乡', NULL, NULL, 'J', 116.310364, 35.069771, 3, 'tr_0 tr_370000 tr_370800', 2);
INSERT INTO `sys_area`
VALUES (370829, '嘉祥县', 370800, '嘉祥', NULL, NULL, 'J', 116.342888, 35.398098, 3, 'tr_0 tr_370000 tr_370800', 1);
INSERT INTO `sys_area`
VALUES (370830, '汶上县', 370800, '汶上', NULL, NULL, 'Z', 116.487144, 35.721745, 3, 'tr_0 tr_370000 tr_370800', 9);
INSERT INTO `sys_area`
VALUES (370831, '泗水县', 370800, '泗水', NULL, NULL, 'Z', 117.273605, 35.653217, 3, 'tr_0 tr_370000 tr_370800', 7);
INSERT INTO `sys_area`
VALUES (370832, '梁山县', 370800, '梁山', NULL, NULL, 'L', 116.089630, 35.801842, 3, 'tr_0 tr_370000 tr_370800', 3);
INSERT INTO `sys_area`
VALUES (370881, '曲阜市', 370800, '曲阜', NULL, NULL, 'Q', 116.991882, 35.592789, 3, 'tr_0 tr_370000 tr_370800', 4);
INSERT INTO `sys_area`
VALUES (370882, '兖州市', 370800, '兖州', NULL, NULL, 'Z', 116.587242, 35.415394, 3, 'tr_0 tr_370000 tr_370800', 10);
INSERT INTO `sys_area`
VALUES (370883, '邹城市', 370800, '邹城', NULL, NULL, 'Z', 116.966728, 35.405258, 3, 'tr_0 tr_370000 tr_370800', 12);
INSERT INTO `sys_area`
VALUES (370900, '泰安市', 370000, '泰安', NULL, NULL, 'T', 117.129066, 36.194969, 2, 'tr_0 tr_370000', 12);
INSERT INTO `sys_area`
VALUES (370902, '泰山区', 370900, '泰山', NULL, NULL, 'T', 117.129982, 36.189312, 3, 'tr_0 tr_370000 tr_370900', 5);
INSERT INTO `sys_area`
VALUES (370903, '岱岳区', 370900, '岱岳', NULL, NULL, 'Z', 117.043533, 36.184101, 3, 'tr_0 tr_370000 tr_370900', 1);
INSERT INTO `sys_area`
VALUES (370921, '宁阳县', 370900, '宁阳', NULL, NULL, 'N', 116.799294, 35.767540, 3, 'tr_0 tr_370000 tr_370900', 4);
INSERT INTO `sys_area`
VALUES (370923, '东平县', 370900, '东平', NULL, NULL, 'D', 116.461052, 35.930466, 3, 'tr_0 tr_370000 tr_370900', 2);
INSERT INTO `sys_area`
VALUES (370982, '新泰市', 370900, '新泰', NULL, NULL, 'X', 117.766090, 35.910385, 3, 'tr_0 tr_370000 tr_370900', 6);
INSERT INTO `sys_area`
VALUES (370983, '肥城市', 370900, '肥城', NULL, NULL, 'F', 116.763702, 36.185600, 3, 'tr_0 tr_370000 tr_370900', 3);
INSERT INTO `sys_area`
VALUES (371000, '威海市', 370000, '威海', NULL, NULL, 'W', 122.116394, 37.509689, 2, 'tr_0 tr_370000', 14);
INSERT INTO `sys_area`
VALUES (371002, '环翠区', 371000, '环翠', NULL, NULL, 'H', 122.116188, 37.510754, 3, 'tr_0 tr_370000 tr_371000', 1);
INSERT INTO `sys_area`
VALUES (371081, '文登市', 371000, '文登', NULL, NULL, 'W', 122.057137, 37.196213, 3, 'tr_0 tr_370000 tr_371000', 4);
INSERT INTO `sys_area`
VALUES (371082, '荣成市', 371000, '荣成', NULL, NULL, 'R', 122.422897, 37.160133, 3, 'tr_0 tr_370000 tr_371000', 2);
INSERT INTO `sys_area`
VALUES (371083, '乳山市', 371000, '乳山', NULL, NULL, 'R', 121.536346, 36.919621, 3, 'tr_0 tr_370000 tr_371000', 3);
INSERT INTO `sys_area`
VALUES (371100, '日照市', 370000, '日照', NULL, NULL, 'R', 119.461205, 35.428589, 2, 'tr_0 tr_370000', 11);
INSERT INTO `sys_area`
VALUES (371102, '东港区', 371100, '东港', NULL, NULL, 'D', 119.457703, 35.426151, 3, 'tr_0 tr_370000 tr_371100', 1);
INSERT INTO `sys_area`
VALUES (371103, '岚山区', 371100, '岚山', NULL, NULL, 'Z', 119.315842, 35.119793, 3, 'tr_0 tr_370000 tr_371100', 3);
INSERT INTO `sys_area`
VALUES (371121, '五莲县', 371100, '五莲', NULL, NULL, 'W', 119.206741, 35.751938, 3, 'tr_0 tr_370000 tr_371100', 4);
INSERT INTO `sys_area`
VALUES (371122, '莒县', 371100, '莒县', NULL, NULL, 'Z', 118.832855, 35.588116, 3, 'tr_0 tr_370000 tr_371100', 2);
INSERT INTO `sys_area`
VALUES (371200, '莱芜市', 370000, '莱芜', NULL, NULL, 'L', 117.677734, 36.214397, 2, 'tr_0 tr_370000', 7);
INSERT INTO `sys_area`
VALUES (371202, '莱城区', 371200, '莱城', NULL, NULL, 'L', 117.678352, 36.213661, 3, 'tr_0 tr_370000 tr_371200', 2);
INSERT INTO `sys_area`
VALUES (371203, '钢城区', 371200, '钢城', NULL, NULL, 'G', 117.820328, 36.058037, 3, 'tr_0 tr_370000 tr_371200', 1);
INSERT INTO `sys_area`
VALUES (371300, '临沂市', 370000, '临沂', NULL, NULL, 'L', 118.326447, 35.065281, 2, 'tr_0 tr_370000', 9);
INSERT INTO `sys_area`
VALUES (371302, '兰山区', 371300, '兰山', NULL, NULL, 'L', 118.327667, 35.061630, 3, 'tr_0 tr_370000 tr_371300', 5);
INSERT INTO `sys_area`
VALUES (371311, '罗庄区', 371300, '罗庄', NULL, NULL, 'L', 118.284798, 34.997204, 3, 'tr_0 tr_370000 tr_371300', 7);
INSERT INTO `sys_area`
VALUES (371312, '河东区', 371300, '河东', NULL, NULL, 'H', 118.398293, 35.085003, 3, 'tr_0 tr_370000 tr_371300', 3);
INSERT INTO `sys_area`
VALUES (371321, '沂南县', 371300, '沂南', NULL, NULL, 'Y', 118.455399, 35.547001, 3, 'tr_0 tr_370000 tr_371300', 11);
INSERT INTO `sys_area`
VALUES (371322, '郯城县', 371300, '郯城', NULL, NULL, 'Z', 118.342964, 34.614742, 3, 'tr_0 tr_370000 tr_371300', 10);
INSERT INTO `sys_area`
VALUES (371323, '沂水县', 371300, '沂水', NULL, NULL, 'Y', 118.634544, 35.787029, 3, 'tr_0 tr_370000 tr_371300', 12);
INSERT INTO `sys_area`
VALUES (371324, '苍山县', 371300, '苍山', NULL, NULL, 'C', 118.326447, 35.065281, 3, 'tr_0 tr_370000 tr_371300', 1);
INSERT INTO `sys_area`
VALUES (371325, '费县', 371300, '费县', NULL, NULL, 'F', 117.968872, 35.269173, 3, 'tr_0 tr_370000 tr_371300', 2);
INSERT INTO `sys_area`
VALUES (371326, '平邑县', 371300, '平邑', NULL, NULL, 'P', 117.631882, 35.511520, 3, 'tr_0 tr_370000 tr_371300', 9);
INSERT INTO `sys_area`
VALUES (371327, '莒南县', 371300, '莒南', NULL, NULL, 'Z', 118.838326, 35.175911, 3, 'tr_0 tr_370000 tr_371300', 4);
INSERT INTO `sys_area`
VALUES (371328, '蒙阴县', 371300, '蒙阴', NULL, NULL, 'M', 117.943268, 35.712437, 3, 'tr_0 tr_370000 tr_371300', 8);
INSERT INTO `sys_area`
VALUES (371329, '临沭县', 371300, '临沭', NULL, NULL, 'L', 118.648376, 34.917061, 3, 'tr_0 tr_370000 tr_371300', 6);
INSERT INTO `sys_area`
VALUES (371400, '德州市', 370000, '德州', NULL, NULL, 'D', 116.307426, 37.453968, 2, 'tr_0 tr_370000', 2);
INSERT INTO `sys_area`
VALUES (371402, '德城区', 371400, '德城', NULL, NULL, 'D', 116.307076, 37.453922, 3, 'tr_0 tr_370000 tr_371400', 1);
INSERT INTO `sys_area`
VALUES (371421, '陵县', 371400, '陵县', NULL, NULL, 'L', 116.574928, 37.332848, 3, 'tr_0 tr_370000 tr_371400', 3);
INSERT INTO `sys_area`
VALUES (371422, '宁津县', 371400, '宁津', NULL, NULL, 'N', 116.793716, 37.649620, 3, 'tr_0 tr_370000 tr_371400', 5);
INSERT INTO `sys_area`
VALUES (371423, '庆云县', 371400, '庆云', NULL, NULL, 'Q', 117.390511, 37.777725, 3, 'tr_0 tr_370000 tr_371400', 8);
INSERT INTO `sys_area`
VALUES (371424, '临邑县', 371400, '临邑', NULL, NULL, 'L', 116.867027, 37.192043, 3, 'tr_0 tr_370000 tr_371400', 4);
INSERT INTO `sys_area`
VALUES (371425, '齐河县', 371400, '齐河', NULL, NULL, 'Q', 116.758392, 36.795498, 3, 'tr_0 tr_370000 tr_371400', 7);
INSERT INTO `sys_area`
VALUES (371426, '平原县', 371400, '平原', NULL, NULL, 'P', 116.433907, 37.164467, 3, 'tr_0 tr_370000 tr_371400', 6);
INSERT INTO `sys_area`
VALUES (371427, '夏津县', 371400, '夏津', NULL, NULL, 'X', 116.003815, 36.950500, 3, 'tr_0 tr_370000 tr_371400', 10);
INSERT INTO `sys_area`
VALUES (371428, '武城县', 371400, '武城', NULL, NULL, 'W', 116.078629, 37.209526, 3, 'tr_0 tr_370000 tr_371400', 9);
INSERT INTO `sys_area`
VALUES (371481, '乐陵市', 371400, '乐陵', NULL, NULL, 'L', 117.216660, 37.729115, 3, 'tr_0 tr_370000 tr_371400', 2);
INSERT INTO `sys_area`
VALUES (371482, '禹城市', 371400, '禹城', NULL, NULL, 'Y', 116.642555, 36.934486, 3, 'tr_0 tr_370000 tr_371400', 11);
INSERT INTO `sys_area`
VALUES (371500, '聊城市', 370000, '聊城', NULL, NULL, 'L', 115.980370, 36.456013, 2, 'tr_0 tr_370000', 8);
INSERT INTO `sys_area`
VALUES (371502, '东昌府区', 371500, '东昌府', NULL, NULL, 'D', 115.980026, 36.456059, 3, 'tr_0 tr_370000 tr_371500', 2);
INSERT INTO `sys_area`
VALUES (371521, '阳谷县', 371500, '阳谷', NULL, NULL, 'Y', 115.784286, 36.113708, 3, 'tr_0 tr_370000 tr_371500', 8);
INSERT INTO `sys_area`
VALUES (371522, '莘县', 371500, '莘县', NULL, NULL, 'Z', 115.667290, 36.237598, 3, 'tr_0 tr_370000 tr_371500', 7);
INSERT INTO `sys_area`
VALUES (371523, '茌平县', 371500, '茌平', NULL, NULL, 'Z', 116.253349, 36.591934, 3, 'tr_0 tr_370000 tr_371500', 1);
INSERT INTO `sys_area`
VALUES (371524, '东阿县', 371500, '东阿', NULL, NULL, 'D', 116.248856, 36.336002, 3, 'tr_0 tr_370000 tr_371500', 3);
INSERT INTO `sys_area`
VALUES (371525, '冠县', 371500, '冠县', NULL, NULL, 'G', 115.444809, 36.483753, 3, 'tr_0 tr_370000 tr_371500', 5);
INSERT INTO `sys_area`
VALUES (371526, '高唐县', 371500, '高唐', NULL, NULL, 'G', 116.229660, 36.859756, 3, 'tr_0 tr_370000 tr_371500', 4);
INSERT INTO `sys_area`
VALUES (371581, '临清市', 371500, '临清', NULL, NULL, 'L', 115.713463, 36.842598, 3, 'tr_0 tr_370000 tr_371500', 6);
INSERT INTO `sys_area`
VALUES (371600, '滨州市', 370000, '滨州', NULL, NULL, 'B', 118.016975, 37.383541, 2, 'tr_0 tr_370000', 1);
INSERT INTO `sys_area`
VALUES (371602, '滨城区', 371600, '滨城', NULL, NULL, 'B', 118.020149, 37.384842, 3, 'tr_0 tr_370000 tr_371600', 1);
INSERT INTO `sys_area`
VALUES (371621, '惠民县', 371600, '惠民', NULL, NULL, 'H', 117.508942, 37.483875, 3, 'tr_0 tr_370000 tr_371600', 3);
INSERT INTO `sys_area`
VALUES (371622, '阳信县', 371600, '阳信', NULL, NULL, 'Y', 117.581329, 37.640491, 3, 'tr_0 tr_370000 tr_371600', 5);
INSERT INTO `sys_area`
VALUES (371623, '无棣县', 371600, '无棣', NULL, NULL, 'W', 117.616325, 37.740849, 3, 'tr_0 tr_370000 tr_371600', 4);
INSERT INTO `sys_area`
VALUES (371624, '沾化县', 371600, '沾化', NULL, NULL, 'Z', 118.129906, 37.698456, 3, 'tr_0 tr_370000 tr_371600', 6);
INSERT INTO `sys_area`
VALUES (371625, '博兴县', 371600, '博兴', NULL, NULL, 'B', 118.123093, 37.147003, 3, 'tr_0 tr_370000 tr_371600', 2);
INSERT INTO `sys_area`
VALUES (371626, '邹平县', 371600, '邹平', NULL, NULL, 'Z', 117.736809, 36.878029, 3, 'tr_0 tr_370000 tr_371600', 7);
INSERT INTO `sys_area`
VALUES (371700, '菏泽市', 370000, '菏泽', NULL, NULL, 'H', 115.469383, 35.246532, 2, 'tr_0 tr_370000', 4);
INSERT INTO `sys_area`
VALUES (371702, '牡丹区', 371700, '牡丹', NULL, NULL, 'M', 115.470947, 35.243111, 3, 'tr_0 tr_370000 tr_371700', 7);
INSERT INTO `sys_area`
VALUES (371721, '曹县', 371700, '曹县', NULL, NULL, 'C', 115.549484, 34.823254, 3, 'tr_0 tr_370000 tr_371700', 1);
INSERT INTO `sys_area`
VALUES (371722, '单县', 371700, '单县', NULL, NULL, 'D', 116.082619, 34.790852, 3, 'tr_0 tr_370000 tr_371700', 8);
INSERT INTO `sys_area`
VALUES (371723, '成武县', 371700, '成武', NULL, NULL, 'C', 115.897346, 34.947365, 3, 'tr_0 tr_370000 tr_371700', 2);
INSERT INTO `sys_area`
VALUES (371724, '巨野县', 371700, '巨野', NULL, NULL, 'J', 116.089340, 35.390999, 3, 'tr_0 tr_370000 tr_371700', 6);
INSERT INTO `sys_area`
VALUES (371725, '郓城县', 371700, '郓城', NULL, NULL, 'Z', 115.938850, 35.594772, 3, 'tr_0 tr_370000 tr_371700', 9);
INSERT INTO `sys_area`
VALUES (371726, '鄄城县', 371700, '鄄城', NULL, NULL, 'Z', 115.514343, 35.560257, 3, 'tr_0 tr_370000 tr_371700', 5);
INSERT INTO `sys_area`
VALUES (371727, '定陶县', 371700, '定陶', NULL, NULL, 'D', 115.569603, 35.072701, 3, 'tr_0 tr_370000 tr_371700', 3);
INSERT INTO `sys_area`
VALUES (371728, '东明县', 371700, '东明', NULL, NULL, 'D', 115.098412, 35.289639, 3, 'tr_0 tr_370000 tr_371700', 4);
INSERT INTO `sys_area`
VALUES (410000, '河南省', 0, '河南', NULL, NULL, 'H', 113.665413, 34.757977, 1, 'tr_0', 16);
INSERT INTO `sys_area`
VALUES (410100, '郑州市', 410000, '郑州', NULL, NULL, 'Z', 113.665413, 34.757977, 2, 'tr_0 tr_410000', 16);
INSERT INTO `sys_area`
VALUES (410102, '中原区', 410100, '中原', NULL, NULL, 'Z', 113.611572, 34.748287, 3, 'tr_0 tr_410000 tr_410100', 12);
INSERT INTO `sys_area`
VALUES (410103, '二七区', 410100, '二七', NULL, NULL, 'E', 113.645424, 34.730934, 3, 'tr_0 tr_410000 tr_410100', 2);
INSERT INTO `sys_area`
VALUES (410104, '管城回族区', 410100, '管城回族', NULL, NULL, 'G', 113.685310, 34.746452, 3, 'tr_0 tr_410000 tr_410100', 4);
INSERT INTO `sys_area`
VALUES (410105, '金水区', 410100, '金水', NULL, NULL, 'J', 113.686035, 34.775837, 3, 'tr_0 tr_410000 tr_410100', 6);
INSERT INTO `sys_area`
VALUES (410106, '上街区', 410100, '上街', NULL, NULL, 'S', 113.298279, 34.808689, 3, 'tr_0 tr_410000 tr_410100', 7);
INSERT INTO `sys_area`
VALUES (410108, '惠济区', 410100, '惠济', NULL, NULL, 'H', 113.618362, 34.828590, 3, 'tr_0 tr_410000 tr_410100', 5);
INSERT INTO `sys_area`
VALUES (410122, '中牟县', 410100, '中牟', NULL, NULL, 'Z', 114.022522, 34.721977, 3, 'tr_0 tr_410000 tr_410100', 11);
INSERT INTO `sys_area`
VALUES (410181, '巩义市', 410100, '巩义', NULL, NULL, 'G', 112.982826, 34.752178, 3, 'tr_0 tr_410000 tr_410100', 3);
INSERT INTO `sys_area`
VALUES (410182, '荥阳市', 410100, '荥阳', NULL, NULL, 'Z', 113.391525, 34.789078, 3, 'tr_0 tr_410000 tr_410100', 8);
INSERT INTO `sys_area`
VALUES (410183, '新密市', 410100, '新密', NULL, NULL, 'X', 113.380615, 34.537846, 3, 'tr_0 tr_410000 tr_410100', 9);
INSERT INTO `sys_area`
VALUES (410184, '新郑市', 410100, '新郑', NULL, NULL, 'X', 113.739670, 34.394218, 3, 'tr_0 tr_410000 tr_410100', 10);
INSERT INTO `sys_area`
VALUES (410185, '登封市', 410100, '登封', NULL, NULL, 'D', 113.037766, 34.459938, 3, 'tr_0 tr_410000 tr_410100', 1);
INSERT INTO `sys_area`
VALUES (410200, '开封市', 410000, '开封', NULL, NULL, 'K', 114.341446, 34.797050, 2, 'tr_0 tr_410000', 5);
INSERT INTO `sys_area`
VALUES (410202, '龙亭区', 410200, '龙亭', NULL, NULL, 'L', 114.353348, 34.799831, 3, 'tr_0 tr_410000 tr_410200', 5);
INSERT INTO `sys_area`
VALUES (410203, '顺河回族区', 410200, '顺河回族', NULL, NULL, 'S', 114.364876, 34.800461, 3, 'tr_0 tr_410000 tr_410200', 7);
INSERT INTO `sys_area`
VALUES (410204, '鼓楼区', 410200, '鼓楼', NULL, NULL, 'G', 114.348503, 34.792381, 3, 'tr_0 tr_410000 tr_410200', 1);
INSERT INTO `sys_area`
VALUES (410205, '禹王台区', 410200, '禹王台', NULL, NULL, 'Y', 114.350243, 34.779728, 3, 'tr_0 tr_410000 tr_410200', 10);
INSERT INTO `sys_area`
VALUES (410211, '金明区', 410200, '金明', NULL, NULL, 'J', 114.300682, 34.791512, 3, 'tr_0 tr_410000 tr_410200', 2);
INSERT INTO `sys_area`
VALUES (410221, '杞县', 410200, '杞县', NULL, NULL, 'Z', 114.770470, 34.554585, 3, 'tr_0 tr_410000 tr_410200', 6);
INSERT INTO `sys_area`
VALUES (410222, '通许县', 410200, '通许', NULL, NULL, 'T', 114.467735, 34.477303, 3, 'tr_0 tr_410000 tr_410200', 8);
INSERT INTO `sys_area`
VALUES (410223, '尉氏县', 410200, '尉氏', NULL, NULL, 'W', 114.193924, 34.412254, 3, 'tr_0 tr_410000 tr_410200', 9);
INSERT INTO `sys_area`
VALUES (410224, '开封县', 410200, '开封', NULL, NULL, 'K', 114.437622, 34.756477, 3, 'tr_0 tr_410000 tr_410200', 3);
INSERT INTO `sys_area`
VALUES (410225, '兰考县', 410200, '兰考', NULL, NULL, 'L', 114.820572, 34.829899, 3, 'tr_0 tr_410000 tr_410200', 4);
INSERT INTO `sys_area`
VALUES (410300, '洛阳市', 410000, '洛阳', NULL, NULL, 'L', 112.434471, 34.663040, 2, 'tr_0 tr_410000', 7);
INSERT INTO `sys_area`
VALUES (410302, '老城区', 410300, '老城', NULL, NULL, 'L', 112.477295, 34.682945, 3, 'tr_0 tr_410000 tr_410300', 4);
INSERT INTO `sys_area`
VALUES (410303, '西工区', 410300, '西工', NULL, NULL, 'X', 112.443230, 34.667847, 3, 'tr_0 tr_410000 tr_410300', 11);
INSERT INTO `sys_area`
VALUES (410304, '瀍河回族区', 410300, '瀍河回族', NULL, NULL, '瀍', 112.491623, 34.684738, 3, 'tr_0 tr_410000 tr_410300', 1);
INSERT INTO `sys_area`
VALUES (410305, '涧西区', 410300, '涧西', NULL, NULL, 'J', 112.399246, 34.654251, 3, 'tr_0 tr_410000 tr_410300', 2);
INSERT INTO `sys_area`
VALUES (410306, '吉利区', 410300, '吉利', NULL, NULL, 'J', 112.584793, 34.899094, 3, 'tr_0 tr_410000 tr_410300', 3);
INSERT INTO `sys_area`
VALUES (410307, '洛龙区', 410300, '洛龙', NULL, NULL, 'L', 112.456635, 34.618557, 3, 'tr_0 tr_410000 tr_410300', 6);
INSERT INTO `sys_area`
VALUES (410322, '孟津县', 410300, '孟津', NULL, NULL, 'M', 112.443893, 34.826485, 3, 'tr_0 tr_410000 tr_410300', 8);
INSERT INTO `sys_area`
VALUES (410323, '新安县', 410300, '新安', NULL, NULL, 'X', 112.141403, 34.728680, 3, 'tr_0 tr_410000 tr_410300', 12);
INSERT INTO `sys_area`
VALUES (410324, '栾川县', 410300, '栾川', NULL, NULL, 'Z', 111.618385, 33.783195, 3, 'tr_0 tr_410000 tr_410300', 5);
INSERT INTO `sys_area`
VALUES (410325, '嵩县', 410300, '嵩县', NULL, NULL, 'Z', 112.087769, 34.131561, 3, 'tr_0 tr_410000 tr_410300', 10);
INSERT INTO `sys_area`
VALUES (410326, '汝阳县', 410300, '汝阳', NULL, NULL, 'R', 112.473785, 34.153229, 3, 'tr_0 tr_410000 tr_410300', 9);
INSERT INTO `sys_area`
VALUES (410327, '宜阳县', 410300, '宜阳', NULL, NULL, 'Y', 112.179993, 34.516479, 3, 'tr_0 tr_410000 tr_410300', 15);
INSERT INTO `sys_area`
VALUES (410328, '洛宁县', 410300, '洛宁', NULL, NULL, 'L', 111.655396, 34.387180, 3, 'tr_0 tr_410000 tr_410300', 7);
INSERT INTO `sys_area`
VALUES (410329, '伊川县', 410300, '伊川', NULL, NULL, 'Y', 112.429382, 34.423416, 3, 'tr_0 tr_410000 tr_410300', 14);
INSERT INTO `sys_area`
VALUES (410381, '偃师市', 410300, '偃师', NULL, NULL, 'Z', 112.787743, 34.723042, 3, 'tr_0 tr_410000 tr_410300', 13);
INSERT INTO `sys_area`
VALUES (410400, '平顶山市', 410000, '平顶山', NULL, NULL, 'P', 113.307716, 33.735241, 2, 'tr_0 tr_410000', 9);
INSERT INTO `sys_area`
VALUES (410402, '新华区', 410400, '新华', NULL, NULL, 'X', 113.299065, 33.737579, 3, 'tr_0 tr_410000 tr_410400', 8);
INSERT INTO `sys_area`
VALUES (410403, '卫东区', 410400, '卫东', NULL, NULL, 'W', 113.310326, 33.739285, 3, 'tr_0 tr_410000 tr_410400', 6);
INSERT INTO `sys_area`
VALUES (410404, '石龙区', 410400, '石龙', NULL, NULL, 'S', 112.889885, 33.901539, 3, 'tr_0 tr_410000 tr_410400', 5);
INSERT INTO `sys_area`
VALUES (410411, '湛河区', 410400, '湛河', NULL, NULL, 'Z', 113.320869, 33.725681, 3, 'tr_0 tr_410000 tr_410400', 10);
INSERT INTO `sys_area`
VALUES (410421, '宝丰县', 410400, '宝丰', NULL, NULL, 'B', 113.066811, 33.866360, 3, 'tr_0 tr_410000 tr_410400', 1);
INSERT INTO `sys_area`
VALUES (410422, '叶县', 410400, '叶县', NULL, NULL, 'Y', 113.358299, 33.621250, 3, 'tr_0 tr_410000 tr_410400', 9);
INSERT INTO `sys_area`
VALUES (410423, '鲁山县', 410400, '鲁山', NULL, NULL, 'L', 112.906700, 33.740326, 3, 'tr_0 tr_410000 tr_410400', 3);
INSERT INTO `sys_area`
VALUES (410425, '郏县', 410400, '郏县', NULL, NULL, 'Z', 113.220451, 33.971992, 3, 'tr_0 tr_410000 tr_410400', 2);
INSERT INTO `sys_area`
VALUES (410481, '舞钢市', 410400, '舞钢', NULL, NULL, 'W', 113.526253, 33.302082, 3, 'tr_0 tr_410000 tr_410400', 7);
INSERT INTO `sys_area`
VALUES (410482, '汝州市', 410400, '汝州', NULL, NULL, 'R', 112.845337, 34.167408, 3, 'tr_0 tr_410000 tr_410400', 4);
INSERT INTO `sys_area`
VALUES (410500, '安阳市', 410000, '安阳', NULL, NULL, 'A', 114.352486, 36.103443, 2, 'tr_0 tr_410000', 1);
INSERT INTO `sys_area`
VALUES (410502, '文峰区', 410500, '文峰', NULL, NULL, 'W', 114.352562, 36.098103, 3, 'tr_0 tr_410000 tr_410500', 8);
INSERT INTO `sys_area`
VALUES (410503, '北关区', 410500, '北关', NULL, NULL, 'B', 114.352646, 36.109779, 3, 'tr_0 tr_410000 tr_410500', 2);
INSERT INTO `sys_area`
VALUES (410505, '殷都区', 410500, '殷都', NULL, NULL, 'Y', 114.300095, 36.108974, 3, 'tr_0 tr_410000 tr_410500', 9);
INSERT INTO `sys_area`
VALUES (410506, '龙安区', 410500, '龙安', NULL, NULL, 'L', 114.323524, 36.095570, 3, 'tr_0 tr_410000 tr_410500', 5);
INSERT INTO `sys_area`
VALUES (410522, '安阳县', 410500, '安阳', NULL, NULL, 'A', 114.130203, 36.130585, 3, 'tr_0 tr_410000 tr_410500', 1);
INSERT INTO `sys_area`
VALUES (410523, '汤阴县', 410500, '汤阴', NULL, NULL, 'T', 114.362358, 35.922348, 3, 'tr_0 tr_410000 tr_410500', 7);
INSERT INTO `sys_area`
VALUES (410526, '滑县', 410500, '滑县', NULL, NULL, 'H', 114.524002, 35.574627, 3, 'tr_0 tr_410000 tr_410500', 3);
INSERT INTO `sys_area`
VALUES (410527, '内黄县', 410500, '内黄', NULL, NULL, 'N', 114.904579, 35.953701, 3, 'tr_0 tr_410000 tr_410500', 6);
INSERT INTO `sys_area`
VALUES (410581, '林州市', 410500, '林州', NULL, NULL, 'L', 113.823769, 36.063404, 3, 'tr_0 tr_410000 tr_410500', 4);
INSERT INTO `sys_area`
VALUES (410600, '鹤壁市', 410000, '鹤壁', NULL, NULL, 'H', 114.295441, 35.748238, 2, 'tr_0 tr_410000', 2);
INSERT INTO `sys_area`
VALUES (410602, '鹤山区', 410600, '鹤山', NULL, NULL, 'H', 114.166550, 35.936127, 3, 'tr_0 tr_410000 tr_410600', 1);
INSERT INTO `sys_area`
VALUES (410603, '山城区', 410600, '山城', NULL, NULL, 'S', 114.184204, 35.896057, 3, 'tr_0 tr_410000 tr_410600', 4);
INSERT INTO `sys_area`
VALUES (410611, '淇滨区', 410600, '淇滨', NULL, NULL, 'Z', 114.293915, 35.748383, 3, 'tr_0 tr_410000 tr_410600', 2);
INSERT INTO `sys_area`
VALUES (410621, '浚县', 410600, '浚县', NULL, NULL, 'J', 114.550163, 35.671284, 3, 'tr_0 tr_410000 tr_410600', 5);
INSERT INTO `sys_area`
VALUES (410622, '淇县', 410600, '淇县', NULL, NULL, 'Z', 114.200378, 35.609478, 3, 'tr_0 tr_410000 tr_410600', 3);
INSERT INTO `sys_area`
VALUES (410700, '新乡市', 410000, '新乡', NULL, NULL, 'X', 113.883987, 35.302616, 2, 'tr_0 tr_410000', 14);
INSERT INTO `sys_area`
VALUES (410702, '红旗区', 410700, '红旗', NULL, NULL, 'H', 113.878159, 35.302685, 3, 'tr_0 tr_410000 tr_410700', 4);
INSERT INTO `sys_area`
VALUES (410703, '卫滨区', 410700, '卫滨', NULL, NULL, 'W', 113.866066, 35.304905, 3, 'tr_0 tr_410000 tr_410700', 8);
INSERT INTO `sys_area`
VALUES (410704, '凤泉区', 410700, '凤泉', NULL, NULL, 'F', 113.906715, 35.379856, 3, 'tr_0 tr_410000 tr_410700', 3);
INSERT INTO `sys_area`
VALUES (410711, '牧野区', 410700, '牧野', NULL, NULL, 'M', 113.897163, 35.312973, 3, 'tr_0 tr_410000 tr_410700', 7);
INSERT INTO `sys_area`
VALUES (410721, '新乡县', 410700, '新乡', NULL, NULL, 'X', 113.806183, 35.190022, 3, 'tr_0 tr_410000 tr_410700', 10);
INSERT INTO `sys_area`
VALUES (410724, '获嘉县', 410700, '获嘉', NULL, NULL, 'H', 113.657249, 35.261684, 3, 'tr_0 tr_410000 tr_410700', 6);
INSERT INTO `sys_area`
VALUES (410725, '原阳县', 410700, '原阳', NULL, NULL, 'Y', 113.965965, 35.054001, 3, 'tr_0 tr_410000 tr_410700', 12);
INSERT INTO `sys_area`
VALUES (410726, '延津县', 410700, '延津', NULL, NULL, 'Y', 114.200981, 35.149513, 3, 'tr_0 tr_410000 tr_410700', 11);
INSERT INTO `sys_area`
VALUES (410727, '封丘县', 410700, '封丘', NULL, NULL, 'F', 114.423409, 35.040569, 3, 'tr_0 tr_410000 tr_410700', 2);
INSERT INTO `sys_area`
VALUES (410728, '长垣县', 410700, '长垣', NULL, NULL, 'C', 114.673805, 35.196152, 3, 'tr_0 tr_410000 tr_410700', 1);
INSERT INTO `sys_area`
VALUES (410781, '卫辉市', 410700, '卫辉', NULL, NULL, 'W', 114.065857, 35.404297, 3, 'tr_0 tr_410000 tr_410700', 9);
INSERT INTO `sys_area`
VALUES (410782, '辉县市', 410700, '辉县', NULL, NULL, 'H', 113.802521, 35.461319, 3, 'tr_0 tr_410000 tr_410700', 5);
INSERT INTO `sys_area`
VALUES (410800, '焦作市', 410000, '焦作', NULL, NULL, 'J', 113.238266, 35.239040, 2, 'tr_0 tr_410000', 3);
INSERT INTO `sys_area`
VALUES (410802, '解放区', 410800, '解放', NULL, NULL, 'J', 113.226128, 35.241352, 3, 'tr_0 tr_410000 tr_410800', 2);
INSERT INTO `sys_area`
VALUES (410803, '中站区', 410800, '中站', NULL, NULL, 'Z', 113.175484, 35.236145, 3, 'tr_0 tr_410000 tr_410800', 10);
INSERT INTO `sys_area`
VALUES (410804, '马村区', 410800, '马村', NULL, NULL, 'M', 113.321701, 35.265453, 3, 'tr_0 tr_410000 tr_410800', 3);
INSERT INTO `sys_area`
VALUES (410811, '山阳区', 410800, '山阳', NULL, NULL, 'S', 113.267662, 35.214760, 3, 'tr_0 tr_410000 tr_410800', 6);
INSERT INTO `sys_area`
VALUES (410821, '修武县', 410800, '修武', NULL, NULL, 'X', 113.447464, 35.229923, 3, 'tr_0 tr_410000 tr_410800', 9);
INSERT INTO `sys_area`
VALUES (410822, '博爱县', 410800, '博爱', NULL, NULL, 'B', 113.069313, 35.170349, 3, 'tr_0 tr_410000 tr_410800', 1);
INSERT INTO `sys_area`
VALUES (410823, '武陟县', 410800, '武陟', NULL, NULL, 'W', 113.408333, 35.098850, 3, 'tr_0 tr_410000 tr_410800', 8);
INSERT INTO `sys_area`
VALUES (410825, '温县', 410800, '温县', NULL, NULL, 'W', 113.079117, 34.941235, 3, 'tr_0 tr_410000 tr_410800', 7);
INSERT INTO `sys_area`
VALUES (410881, '济源市', 410000, '济源', NULL, NULL, 'J', 112.590050, 35.090378, 2, 'tr_0 tr_410000', 4);
INSERT INTO `sys_area`
VALUES (410882, '沁阳市', 410800, '沁阳', NULL, NULL, 'Q', 112.934540, 35.089008, 3, 'tr_0 tr_410000 tr_410800', 5);
INSERT INTO `sys_area`
VALUES (410883, '孟州市', 410800, '孟州', NULL, NULL, 'M', 112.787079, 34.909630, 3, 'tr_0 tr_410000 tr_410800', 4);
INSERT INTO `sys_area`
VALUES (410900, '濮阳市', 410000, '濮阳', NULL, NULL, 'Z', 115.041298, 35.768234, 2, 'tr_0 tr_410000', 10);
INSERT INTO `sys_area`
VALUES (410902, '华龙区', 410900, '华龙', NULL, NULL, 'H', 115.031837, 35.760471, 3, 'tr_0 tr_410000 tr_410900', 2);
INSERT INTO `sys_area`
VALUES (410922, '清丰县', 410900, '清丰', NULL, NULL, 'Q', 115.107285, 35.902412, 3, 'tr_0 tr_410000 tr_410900', 5);
INSERT INTO `sys_area`
VALUES (410923, '南乐县', 410900, '南乐', NULL, NULL, 'N', 115.204338, 36.075203, 3, 'tr_0 tr_410000 tr_410900', 3);
INSERT INTO `sys_area`
VALUES (410926, '范县', 410900, '范县', NULL, NULL, 'F', 115.504211, 35.851978, 3, 'tr_0 tr_410000 tr_410900', 1);
INSERT INTO `sys_area`
VALUES (410927, '台前县', 410900, '台前', NULL, NULL, 'T', 115.855682, 35.996475, 3, 'tr_0 tr_410000 tr_410900', 6);
INSERT INTO `sys_area`
VALUES (410928, '濮阳县', 410900, '濮阳', NULL, NULL, 'Z', 115.023842, 35.710350, 3, 'tr_0 tr_410000 tr_410900', 4);
INSERT INTO `sys_area`
VALUES (411000, '许昌市', 410000, '许昌', NULL, NULL, 'X', 113.826065, 34.022957, 2, 'tr_0 tr_410000', 15);
INSERT INTO `sys_area`
VALUES (411002, '魏都区', 411000, '魏都', NULL, NULL, 'W', 113.828308, 34.027111, 3, 'tr_0 tr_410000 tr_411000', 2);
INSERT INTO `sys_area`
VALUES (411023, '许昌县', 411000, '许昌', NULL, NULL, 'X', 113.842896, 34.005016, 3, 'tr_0 tr_410000 tr_411000', 4);
INSERT INTO `sys_area`
VALUES (411024, '鄢陵县', 411000, '鄢陵', NULL, NULL, 'Z', 114.188507, 34.100502, 3, 'tr_0 tr_410000 tr_411000', 5);
INSERT INTO `sys_area`
VALUES (411025, '襄城县', 411000, '襄城', NULL, NULL, 'X', 113.493164, 33.855942, 3, 'tr_0 tr_410000 tr_411000', 3);
INSERT INTO `sys_area`
VALUES (411081, '禹州市', 411000, '禹州', NULL, NULL, 'Y', 113.471313, 34.154404, 3, 'tr_0 tr_410000 tr_411000', 6);
INSERT INTO `sys_area`
VALUES (411082, '长葛市', 411000, '长葛', NULL, NULL, 'C', 113.768913, 34.219257, 3, 'tr_0 tr_410000 tr_411000', 1);
INSERT INTO `sys_area`
VALUES (411100, '漯河市', 410000, '漯河', NULL, NULL, 'Z', 114.026405, 33.575855, 2, 'tr_0 tr_410000', 6);
INSERT INTO `sys_area`
VALUES (411102, '源汇区', 411100, '源汇', NULL, NULL, 'Y', 114.017944, 33.565441, 3, 'tr_0 tr_410000 tr_411100', 4);
INSERT INTO `sys_area`
VALUES (411103, '郾城区', 411100, '郾城', NULL, NULL, 'Z', 114.016815, 33.588898, 3, 'tr_0 tr_410000 tr_411100', 3);
INSERT INTO `sys_area`
VALUES (411104, '召陵区', 411100, '召陵', NULL, NULL, 'Z', 114.051689, 33.567554, 3, 'tr_0 tr_410000 tr_411100', 5);
INSERT INTO `sys_area`
VALUES (411121, '舞阳县', 411100, '舞阳', NULL, NULL, 'W', 113.610565, 33.436279, 3, 'tr_0 tr_410000 tr_411100', 2);
INSERT INTO `sys_area`
VALUES (411122, '临颍县', 411100, '临颍', NULL, NULL, 'L', 113.938889, 33.806091, 3, 'tr_0 tr_410000 tr_411100', 1);
INSERT INTO `sys_area`
VALUES (411200, '三门峡市', 410000, '三门峡', NULL, NULL, 'S', 111.194099, 34.777336, 2, 'tr_0 tr_410000', 11);
INSERT INTO `sys_area`
VALUES (411202, '湖滨区', 411200, '湖滨', NULL, NULL, 'H', 111.194870, 34.778118, 3, 'tr_0 tr_410000 tr_411200', 1);
INSERT INTO `sys_area`
VALUES (411221, '渑池县', 411200, '渑池', NULL, NULL, 'Z', 111.762993, 34.763489, 3, 'tr_0 tr_410000 tr_411200', 4);
INSERT INTO `sys_area`
VALUES (411222, '陕县', 411200, '陕县', NULL, NULL, 'S', 111.103851, 34.720245, 3, 'tr_0 tr_410000 tr_411200', 5);
INSERT INTO `sys_area`
VALUES (411224, '卢氏县', 411200, '卢氏', NULL, NULL, 'L', 111.052650, 34.053993, 3, 'tr_0 tr_410000 tr_411200', 3);
INSERT INTO `sys_area`
VALUES (411281, '义马市', 411200, '义马', NULL, NULL, 'Y', 111.869415, 34.746868, 3, 'tr_0 tr_410000 tr_411200', 6);
INSERT INTO `sys_area`
VALUES (411282, '灵宝市', 411200, '灵宝', NULL, NULL, 'L', 110.885773, 34.521263, 3, 'tr_0 tr_410000 tr_411200', 2);
INSERT INTO `sys_area`
VALUES (411300, '南阳市', 410000, '南阳', NULL, NULL, 'N', 112.540916, 32.999081, 2, 'tr_0 tr_410000', 8);
INSERT INTO `sys_area`
VALUES (411302, '宛城区', 411300, '宛城', NULL, NULL, 'W', 112.544594, 32.994858, 3, 'tr_0 tr_410000 tr_411300', 8);
INSERT INTO `sys_area`
VALUES (411303, '卧龙区', 411300, '卧龙', NULL, NULL, 'W', 112.528786, 32.989876, 3, 'tr_0 tr_410000 tr_411300', 9);
INSERT INTO `sys_area`
VALUES (411321, '南召县', 411300, '南召', NULL, NULL, 'N', 112.435585, 33.488617, 3, 'tr_0 tr_410000 tr_411300', 3);
INSERT INTO `sys_area`
VALUES (411322, '方城县', 411300, '方城', NULL, NULL, 'F', 113.010933, 33.255138, 3, 'tr_0 tr_410000 tr_411300', 2);
INSERT INTO `sys_area`
VALUES (411323, '西峡县', 411300, '西峡', NULL, NULL, 'X', 111.485771, 33.302982, 3, 'tr_0 tr_410000 tr_411300', 12);
INSERT INTO `sys_area`
VALUES (411324, '镇平县', 411300, '镇平', NULL, NULL, 'Z', 112.232719, 33.036652, 3, 'tr_0 tr_410000 tr_411300', 13);
INSERT INTO `sys_area`
VALUES (411325, '内乡县', 411300, '内乡', NULL, NULL, 'N', 111.843803, 33.046356, 3, 'tr_0 tr_410000 tr_411300', 4);
INSERT INTO `sys_area`
VALUES (411326, '淅川县', 411300, '淅川', NULL, NULL, 'Z', 111.489029, 33.136105, 3, 'tr_0 tr_410000 tr_411300', 10);
INSERT INTO `sys_area`
VALUES (411327, '社旗县', 411300, '社旗县', NULL, NULL, 'S', 112.938278, 33.056126, 3, 'tr_0 tr_410000 tr_411300', 5);
INSERT INTO `sys_area`
VALUES (411328, '唐河县', 411300, '唐河', NULL, NULL, 'T', 112.838493, 32.687893, 3, 'tr_0 tr_410000 tr_411300', 6);
INSERT INTO `sys_area`
VALUES (411329, '新野县', 411300, '新野', NULL, NULL, 'X', 112.365623, 32.524006, 3, 'tr_0 tr_410000 tr_411300', 11);
INSERT INTO `sys_area`
VALUES (411330, '桐柏县', 411300, '桐柏', NULL, NULL, 'T', 113.406059, 32.367153, 3, 'tr_0 tr_410000 tr_411300', 7);
INSERT INTO `sys_area`
VALUES (411381, '邓州市', 411300, '邓州', NULL, NULL, 'D', 112.092712, 32.681641, 3, 'tr_0 tr_410000 tr_411300', 1);
INSERT INTO `sys_area`
VALUES (411400, '商丘市', 410000, '商丘', NULL, NULL, 'S', 115.650497, 34.437054, 2, 'tr_0 tr_410000', 12);
INSERT INTO `sys_area`
VALUES (411402, '梁园区', 411400, '梁园', NULL, NULL, 'L', 115.654587, 34.436554, 3, 'tr_0 tr_410000 tr_411400', 1);
INSERT INTO `sys_area`
VALUES (411403, '睢阳区', 411400, '睢阳', NULL, NULL, 'Z', 115.653816, 34.390537, 3, 'tr_0 tr_410000 tr_411400', 5);
INSERT INTO `sys_area`
VALUES (411421, '民权县', 411400, '民权', NULL, NULL, 'M', 115.148148, 34.648457, 3, 'tr_0 tr_410000 tr_411400', 2);
INSERT INTO `sys_area`
VALUES (411422, '睢县', 411400, '睢县', NULL, NULL, 'Z', 115.070107, 34.428432, 3, 'tr_0 tr_410000 tr_411400', 4);
INSERT INTO `sys_area`
VALUES (411423, '宁陵县', 411400, '宁陵', NULL, NULL, 'N', 115.320053, 34.449299, 3, 'tr_0 tr_410000 tr_411400', 3);
INSERT INTO `sys_area`
VALUES (411424, '柘城县', 411400, '柘城', NULL, NULL, 'Z', 115.307434, 34.075275, 3, 'tr_0 tr_410000 tr_411400', 9);
INSERT INTO `sys_area`
VALUES (411425, '虞城县', 411400, '虞城', NULL, NULL, 'Y', 115.863808, 34.399635, 3, 'tr_0 tr_410000 tr_411400', 8);
INSERT INTO `sys_area`
VALUES (411426, '夏邑县', 411400, '夏邑', NULL, NULL, 'X', 116.139893, 34.240894, 3, 'tr_0 tr_410000 tr_411400', 6);
INSERT INTO `sys_area`
VALUES (411481, '永城市', 411400, '永城', NULL, NULL, 'Y', 116.449669, 33.931316, 3, 'tr_0 tr_410000 tr_411400', 7);
INSERT INTO `sys_area`
VALUES (411500, '信阳市', 410000, '信阳', NULL, NULL, 'X', 114.075027, 32.123276, 2, 'tr_0 tr_410000', 13);
INSERT INTO `sys_area`
VALUES (411502, '浉河区', 411500, '浉河', NULL, NULL, '浉', 114.075027, 32.123276, 3, 'tr_0 tr_410000 tr_411500', 8);
INSERT INTO `sys_area`
VALUES (411503, '平桥区', 411500, '平桥', NULL, NULL, 'P', 114.126030, 32.098396, 3, 'tr_0 tr_410000 tr_411500', 6);
INSERT INTO `sys_area`
VALUES (411521, '罗山县', 411500, '罗山', NULL, NULL, 'L', 114.533417, 32.203205, 3, 'tr_0 tr_410000 tr_411500', 5);
INSERT INTO `sys_area`
VALUES (411522, '光山县', 411500, '光山', NULL, NULL, 'G', 114.903580, 32.010399, 3, 'tr_0 tr_410000 tr_411500', 1);
INSERT INTO `sys_area`
VALUES (411523, '新县', 411500, '新县', NULL, NULL, 'X', 114.877052, 31.635151, 3, 'tr_0 tr_410000 tr_411500', 9);
INSERT INTO `sys_area`
VALUES (411524, '商城县', 411500, '商城', NULL, NULL, 'S', 115.406296, 31.799982, 3, 'tr_0 tr_410000 tr_411500', 7);
INSERT INTO `sys_area`
VALUES (411525, '固始县', 411500, '固始', NULL, NULL, 'G', 115.667328, 32.183075, 3, 'tr_0 tr_410000 tr_411500', 2);
INSERT INTO `sys_area`
VALUES (411526, '潢川县', 411500, '潢川', NULL, NULL, 'Z', 115.050125, 32.134026, 3, 'tr_0 tr_410000 tr_411500', 4);
INSERT INTO `sys_area`
VALUES (411527, '淮滨县', 411500, '淮滨', NULL, NULL, 'H', 115.415451, 32.452641, 3, 'tr_0 tr_410000 tr_411500', 3);
INSERT INTO `sys_area`
VALUES (411528, '息县', 411500, '息县', NULL, NULL, 'X', 114.740715, 32.344746, 3, 'tr_0 tr_410000 tr_411500', 10);
INSERT INTO `sys_area`
VALUES (411600, '周口市', 410000, '周口', NULL, NULL, 'Z', 114.649651, 33.620358, 2, 'tr_0 tr_410000', 17);
INSERT INTO `sys_area`
VALUES (411602, '川汇区', 411600, '川汇', NULL, NULL, 'C', 114.652138, 33.614838, 3, 'tr_0 tr_410000 tr_411600', 1);
INSERT INTO `sys_area`
VALUES (411621, '扶沟县', 411600, '扶沟', NULL, NULL, 'F', 114.392006, 34.054062, 3, 'tr_0 tr_410000 tr_411600', 3);
INSERT INTO `sys_area`
VALUES (411622, '西华县', 411600, '西华', NULL, NULL, 'X', 114.530067, 33.784378, 3, 'tr_0 tr_410000 tr_411600', 10);
INSERT INTO `sys_area`
VALUES (411623, '商水县', 411600, '商水', NULL, NULL, 'S', 114.609268, 33.543846, 3, 'tr_0 tr_410000 tr_411600', 6);
INSERT INTO `sys_area`
VALUES (411624, '沈丘县', 411600, '沈丘', NULL, NULL, 'S', 115.078377, 33.395515, 3, 'tr_0 tr_410000 tr_411600', 7);
INSERT INTO `sys_area`
VALUES (411625, '郸城县', 411600, '郸城', NULL, NULL, 'D', 115.189003, 33.643852, 3, 'tr_0 tr_410000 tr_411600', 2);
INSERT INTO `sys_area`
VALUES (411626, '淮阳县', 411600, '淮阳', NULL, NULL, 'H', 114.870163, 33.732548, 3, 'tr_0 tr_410000 tr_411600', 4);
INSERT INTO `sys_area`
VALUES (411627, '太康县', 411600, '太康', NULL, NULL, 'T', 114.853836, 34.065311, 3, 'tr_0 tr_410000 tr_411600', 8);
INSERT INTO `sys_area`
VALUES (411628, '鹿邑县', 411600, '鹿邑', NULL, NULL, 'L', 115.486389, 33.861069, 3, 'tr_0 tr_410000 tr_411600', 5);
INSERT INTO `sys_area`
VALUES (411681, '项城市', 411600, '项城', NULL, NULL, 'X', 114.899521, 33.443085, 3, 'tr_0 tr_410000 tr_411600', 9);
INSERT INTO `sys_area`
VALUES (411700, '驻马店市', 410000, '驻马店', NULL, NULL, 'Z', 114.024734, 32.980167, 2, 'tr_0 tr_410000', 18);
INSERT INTO `sys_area`
VALUES (411702, '驿城区', 411700, '驿城', NULL, NULL, 'Z', 114.029152, 32.977558, 3, 'tr_0 tr_410000 tr_411700', 9);
INSERT INTO `sys_area`
VALUES (411721, '西平县', 411700, '西平', NULL, NULL, 'X', 114.026863, 33.382317, 3, 'tr_0 tr_410000 tr_411700', 8);
INSERT INTO `sys_area`
VALUES (411722, '上蔡县', 411700, '上蔡', NULL, NULL, 'S', 114.266891, 33.264717, 3, 'tr_0 tr_410000 tr_411700', 5);
INSERT INTO `sys_area`
VALUES (411723, '平舆县', 411700, '平舆', NULL, NULL, 'P', 114.637108, 32.955627, 3, 'tr_0 tr_410000 tr_411700', 2);
INSERT INTO `sys_area`
VALUES (411724, '正阳县', 411700, '正阳', NULL, NULL, 'Z', 114.389481, 32.601826, 3, 'tr_0 tr_410000 tr_411700', 10);
INSERT INTO `sys_area`
VALUES (411725, '确山县', 411700, '确山', NULL, NULL, 'Q', 114.026680, 32.801537, 3, 'tr_0 tr_410000 tr_411700', 3);
INSERT INTO `sys_area`
VALUES (411726, '泌阳县', 411700, '泌阳', NULL, NULL, 'M', 113.326050, 32.725128, 3, 'tr_0 tr_410000 tr_411700', 1);
INSERT INTO `sys_area`
VALUES (411727, '汝南县', 411700, '汝南', NULL, NULL, 'R', 114.359497, 33.004536, 3, 'tr_0 tr_410000 tr_411700', 4);
INSERT INTO `sys_area`
VALUES (411728, '遂平县', 411700, '遂平', NULL, NULL, 'S', 114.003708, 33.146980, 3, 'tr_0 tr_410000 tr_411700', 6);
INSERT INTO `sys_area`
VALUES (411729, '新蔡县', 411700, '新蔡', NULL, NULL, 'X', 114.975243, 32.749947, 3, 'tr_0 tr_410000 tr_411700', 7);
INSERT INTO `sys_area`
VALUES (420000, '湖北省', 0, '湖北', NULL, NULL, 'H', 114.298569, 30.584354, 1, 'tr_0', 17);
INSERT INTO `sys_area`
VALUES (420100, '武汉市', 420000, '武汉', NULL, NULL, 'W', 114.298569, 30.584354, 2, 'tr_0 tr_420000', 12);
INSERT INTO `sys_area`
VALUES (420102, '江岸区', 420100, '江岸', NULL, NULL, 'J', 114.303040, 30.594912, 3, 'tr_0 tr_420000 tr_420100', 7);
INSERT INTO `sys_area`
VALUES (420103, '江汉区', 420100, '江汉', NULL, NULL, 'J', 114.283112, 30.578772, 3, 'tr_0 tr_420000 tr_420100', 8);
INSERT INTO `sys_area`
VALUES (420104, '硚口区', 420100, '硚口', NULL, NULL, 'C', 114.264565, 30.570610, 3, 'tr_0 tr_420000 tr_420100', 10);
INSERT INTO `sys_area`
VALUES (420105, '汉阳区', 420100, '汉阳', NULL, NULL, 'H', 114.265808, 30.549326, 3, 'tr_0 tr_420000 tr_420100', 4);
INSERT INTO `sys_area`
VALUES (420106, '武昌区', 420100, '武昌', NULL, NULL, 'W', 114.307343, 30.546535, 3, 'tr_0 tr_420000 tr_420100', 12);
INSERT INTO `sys_area`
VALUES (420107, '青山区', 420100, '青山', NULL, NULL, 'Q', 114.397072, 30.634214, 3, 'tr_0 tr_420000 tr_420100', 11);
INSERT INTO `sys_area`
VALUES (420111, '洪山区', 420100, '洪山', NULL, NULL, 'H', 114.400719, 30.504259, 3, 'tr_0 tr_420000 tr_420100', 5);
INSERT INTO `sys_area`
VALUES (420112, '东西湖区', 420100, '东西湖', NULL, NULL, 'D', 114.142487, 30.622467, 3, 'tr_0 tr_420000 tr_420100', 2);
INSERT INTO `sys_area`
VALUES (420113, '汉南区', 420100, '汉南', NULL, NULL, 'H', 114.081238, 30.309637, 3, 'tr_0 tr_420000 tr_420100', 3);
INSERT INTO `sys_area`
VALUES (420114, '蔡甸区', 420100, '蔡甸', NULL, NULL, 'C', 114.029343, 30.582186, 3, 'tr_0 tr_420000 tr_420100', 1);
INSERT INTO `sys_area`
VALUES (420115, '江夏区', 420100, '江夏', NULL, NULL, 'J', 114.313957, 30.349045, 3, 'tr_0 tr_420000 tr_420100', 9);
INSERT INTO `sys_area`
VALUES (420116, '黄陂区', 420100, '黄陂', NULL, NULL, 'H', 114.374023, 30.874155, 3, 'tr_0 tr_420000 tr_420100', 6);
INSERT INTO `sys_area`
VALUES (420117, '新洲区', 420100, '新洲', NULL, NULL, 'X', 114.802109, 30.842150, 3, 'tr_0 tr_420000 tr_420100', 13);
INSERT INTO `sys_area`
VALUES (420200, '黄石市', 420000, '黄石', NULL, NULL, 'H', 115.077049, 30.220074, 2, 'tr_0 tr_420000', 4);
INSERT INTO `sys_area`
VALUES (420202, '黄石港区', 420200, '黄石港', NULL, NULL, 'H', 115.090164, 30.212086, 3, 'tr_0 tr_420000 tr_420200', 2);
INSERT INTO `sys_area`
VALUES (420203, '西塞山区', 420200, '西塞山', NULL, NULL, 'X', 115.093353, 30.205364, 3, 'tr_0 tr_420000 tr_420200', 5);
INSERT INTO `sys_area`
VALUES (420204, '下陆区', 420200, '下陆', NULL, NULL, 'X', 114.975754, 30.177845, 3, 'tr_0 tr_420000 tr_420200', 4);
INSERT INTO `sys_area`
VALUES (420205, '铁山区', 420200, '铁山', NULL, NULL, 'T', 114.901367, 30.206011, 3, 'tr_0 tr_420000 tr_420200', 3);
INSERT INTO `sys_area`
VALUES (420222, '阳新县', 420200, '阳新', NULL, NULL, 'Y', 115.212883, 29.841572, 3, 'tr_0 tr_420000 tr_420200', 6);
INSERT INTO `sys_area`
VALUES (420281, '大冶市', 420200, '大冶', NULL, NULL, 'D', 114.974838, 30.098804, 3, 'tr_0 tr_420000 tr_420200', 1);
INSERT INTO `sys_area`
VALUES (420300, '十堰市', 420000, '十堰', NULL, NULL, 'S', 110.787918, 32.646908, 2, 'tr_0 tr_420000', 9);
INSERT INTO `sys_area`
VALUES (420302, '茅箭区', 420300, '茅箭', NULL, NULL, 'M', 110.786209, 32.644463, 3, 'tr_0 tr_420000 tr_420300', 3);
INSERT INTO `sys_area`
VALUES (420303, '张湾区', 420300, '张湾', NULL, NULL, 'Z', 110.772362, 32.652515, 3, 'tr_0 tr_420000 tr_420300', 6);
INSERT INTO `sys_area`
VALUES (420321, '郧县', 420300, '郧县', NULL, NULL, 'Y', 110.812096, 32.838268, 3, 'tr_0 tr_420000 tr_420300', 4);
INSERT INTO `sys_area`
VALUES (420322, '郧西县', 420300, '郧西', NULL, NULL, 'Y', 110.426476, 32.991459, 3, 'tr_0 tr_420000 tr_420300', 5);
INSERT INTO `sys_area`
VALUES (420323, '竹山县', 420300, '竹山', NULL, NULL, 'Z', 110.229599, 32.225861, 3, 'tr_0 tr_420000 tr_420300', 7);
INSERT INTO `sys_area`
VALUES (420324, '竹溪县', 420300, '竹溪', NULL, NULL, 'Z', 109.717194, 32.315342, 3, 'tr_0 tr_420000 tr_420300', 8);
INSERT INTO `sys_area`
VALUES (420325, '房县', 420300, '房县', NULL, NULL, 'F', 110.741966, 32.055000, 3, 'tr_0 tr_420000 tr_420300', 2);
INSERT INTO `sys_area`
VALUES (420381, '丹江口市', 420300, '丹江口', NULL, NULL, 'D', 111.513794, 32.538837, 3, 'tr_0 tr_420000 tr_420300', 1);
INSERT INTO `sys_area`
VALUES (420500, '宜昌市', 420000, '宜昌', NULL, NULL, 'Y', 111.290840, 30.702637, 2, 'tr_0 tr_420000', 17);
INSERT INTO `sys_area`
VALUES (420502, '西陵区', 420500, '西陵', NULL, NULL, 'X', 111.295471, 30.702477, 3, 'tr_0 tr_420000 tr_420500', 6);
INSERT INTO `sys_area`
VALUES (420503, '伍家岗区', 420500, '伍家岗', NULL, NULL, 'W', 111.307213, 30.679052, 3, 'tr_0 tr_420000 tr_420500', 5);
INSERT INTO `sys_area`
VALUES (420504, '点军区', 420500, '点军', NULL, NULL, 'D', 111.268166, 30.692322, 3, 'tr_0 tr_420000 tr_420500', 3);
INSERT INTO `sys_area`
VALUES (420505, '猇亭区', 420500, '猇亭', NULL, NULL, '猇', 111.290840, 30.702637, 3, 'tr_0 tr_420000 tr_420500', 8);
INSERT INTO `sys_area`
VALUES (420506, '夷陵区', 420500, '夷陵', NULL, NULL, 'Y', 111.326744, 30.770199, 3, 'tr_0 tr_420000 tr_420500', 10);
INSERT INTO `sys_area`
VALUES (420525, '远安县', 420500, '远安', NULL, NULL, 'Y', 111.643311, 31.059626, 3, 'tr_0 tr_420000 tr_420500', 11);
INSERT INTO `sys_area`
VALUES (420526, '兴山县', 420500, '兴山', NULL, NULL, 'X', 110.754501, 31.347950, 3, 'tr_0 tr_420000 tr_420500', 7);
INSERT INTO `sys_area`
VALUES (420527, '秭归县', 420500, '秭归', NULL, NULL, 'Z', 110.976784, 30.823908, 3, 'tr_0 tr_420000 tr_420500', 13);
INSERT INTO `sys_area`
VALUES (420528, '长阳土家族自治县', 420500, '长阳', NULL, NULL, 'C', 111.198479, 30.466534, 3, 'tr_0 tr_420000 tr_420500', 1);
INSERT INTO `sys_area`
VALUES (420529, '五峰土家族自治县', 420500, '五峰', NULL, NULL, 'W', 110.674934, 30.199251, 3, 'tr_0 tr_420000 tr_420500', 4);
INSERT INTO `sys_area`
VALUES (420581, '宜都市', 420500, '宜都', NULL, NULL, 'Y', 111.454369, 30.387234, 3, 'tr_0 tr_420000 tr_420500', 9);
INSERT INTO `sys_area`
VALUES (420582, '当阳市', 420500, '当阳', NULL, NULL, 'D', 111.793419, 30.824492, 3, 'tr_0 tr_420000 tr_420500', 2);
INSERT INTO `sys_area`
VALUES (420583, '枝江市', 420500, '枝江', NULL, NULL, 'Z', 111.751801, 30.425364, 3, 'tr_0 tr_420000 tr_420500', 12);
INSERT INTO `sys_area`
VALUES (420600, '襄阳市', 420000, '襄阳', NULL, NULL, 'X', 112.144150, 32.042427, 2, 'tr_0 tr_420000', 13);
INSERT INTO `sys_area`
VALUES (420602, '襄城区', 420600, '襄城', NULL, NULL, 'X', 112.150330, 32.015087, 3, 'tr_0 tr_420000 tr_420600', 6);
INSERT INTO `sys_area`
VALUES (420606, '樊城区', 420600, '樊城', NULL, NULL, 'F', 112.139572, 32.058590, 3, 'tr_0 tr_420000 tr_420600', 2);
INSERT INTO `sys_area`
VALUES (420607, '襄州区', 420600, '襄州', NULL, NULL, 'X', 112.197380, 32.085518, 3, 'tr_0 tr_420000 tr_420600', 7);
INSERT INTO `sys_area`
VALUES (420624, '南漳县', 420600, '南漳', NULL, NULL, 'N', 111.844421, 31.776920, 3, 'tr_0 tr_420000 tr_420600', 5);
INSERT INTO `sys_area`
VALUES (420625, '谷城县', 420600, '谷城', NULL, NULL, 'G', 111.640144, 32.262676, 3, 'tr_0 tr_420000 tr_420600', 3);
INSERT INTO `sys_area`
VALUES (420626, '保康县', 420600, '保康', NULL, NULL, 'B', 111.262238, 31.873507, 3, 'tr_0 tr_420000 tr_420600', 1);
INSERT INTO `sys_area`
VALUES (420682, '老河口市', 420600, '老河口', NULL, NULL, 'L', 111.675735, 32.385437, 3, 'tr_0 tr_420000 tr_420600', 4);
INSERT INTO `sys_area`
VALUES (420683, '枣阳市', 420600, '枣阳', NULL, NULL, 'Z', 112.765266, 32.123081, 3, 'tr_0 tr_420000 tr_420600', 9);
INSERT INTO `sys_area`
VALUES (420684, '宜城市', 420600, '宜城', NULL, NULL, 'Y', 112.261444, 31.709204, 3, 'tr_0 tr_420000 tr_420600', 8);
INSERT INTO `sys_area`
VALUES (420700, '鄂州市', 420000, '鄂州', NULL, NULL, 'E', 114.890594, 30.396536, 2, 'tr_0 tr_420000', 2);
INSERT INTO `sys_area`
VALUES (420702, '梁子湖区', 420700, '梁子湖', NULL, NULL, 'L', 114.681969, 30.098190, 3, 'tr_0 tr_420000 tr_420700', 3);
INSERT INTO `sys_area`
VALUES (420703, '华容区', 420700, '华容', NULL, NULL, 'H', 114.741478, 30.534468, 3, 'tr_0 tr_420000 tr_420700', 2);
INSERT INTO `sys_area`
VALUES (420704, '鄂城区', 420700, '鄂城', NULL, NULL, 'E', 114.890015, 30.396690, 3, 'tr_0 tr_420000 tr_420700', 1);
INSERT INTO `sys_area`
VALUES (420800, '荆门市', 420000, '荆门', NULL, NULL, 'J', 112.204254, 31.035419, 2, 'tr_0 tr_420000', 5);
INSERT INTO `sys_area`
VALUES (420802, '东宝区', 420800, '东宝', NULL, NULL, 'D', 112.204803, 31.033461, 3, 'tr_0 tr_420000 tr_420800', 1);
INSERT INTO `sys_area`
VALUES (420804, '掇刀区', 420800, '掇刀', NULL, NULL, 'D', 112.198410, 30.980799, 3, 'tr_0 tr_420000 tr_420800', 2);
INSERT INTO `sys_area`
VALUES (420821, '京山县', 420800, '京山', NULL, NULL, 'J', 113.114594, 31.022457, 3, 'tr_0 tr_420000 tr_420800', 3);
INSERT INTO `sys_area`
VALUES (420822, '沙洋县', 420800, '沙洋', NULL, NULL, 'S', 112.595215, 30.703590, 3, 'tr_0 tr_420000 tr_420800', 4);
INSERT INTO `sys_area`
VALUES (420881, '钟祥市', 420800, '钟祥', NULL, NULL, 'Z', 112.587265, 31.165573, 3, 'tr_0 tr_420000 tr_420800', 5);
INSERT INTO `sys_area`
VALUES (420900, '孝感市', 420000, '孝感', NULL, NULL, 'X', 113.926659, 30.926422, 2, 'tr_0 tr_420000', 16);
INSERT INTO `sys_area`
VALUES (420902, '孝南区', 420900, '孝南', NULL, NULL, 'X', 113.925850, 30.925966, 3, 'tr_0 tr_420000 tr_420900', 5);
INSERT INTO `sys_area`
VALUES (420921, '孝昌县', 420900, '孝昌', NULL, NULL, 'X', 113.988960, 31.251617, 3, 'tr_0 tr_420000 tr_420900', 4);
INSERT INTO `sys_area`
VALUES (420922, '大悟县', 420900, '大悟', NULL, NULL, 'D', 114.126251, 31.565483, 3, 'tr_0 tr_420000 tr_420900', 2);
INSERT INTO `sys_area`
VALUES (420923, '云梦县', 420900, '云梦', NULL, NULL, 'Y', 113.750618, 31.021690, 3, 'tr_0 tr_420000 tr_420900', 7);
INSERT INTO `sys_area`
VALUES (420981, '应城市', 420900, '应城', NULL, NULL, 'Y', 113.573845, 30.939037, 3, 'tr_0 tr_420000 tr_420900', 6);
INSERT INTO `sys_area`
VALUES (420982, '安陆市', 420900, '安陆', NULL, NULL, 'A', 113.690399, 31.261740, 3, 'tr_0 tr_420000 tr_420900', 1);
INSERT INTO `sys_area`
VALUES (420984, '汉川市', 420900, '汉川', NULL, NULL, 'H', 113.835304, 30.652164, 3, 'tr_0 tr_420000 tr_420900', 3);
INSERT INTO `sys_area`
VALUES (421000, '荆州市', 420000, '荆州', NULL, NULL, 'J', 112.238129, 30.326857, 2, 'tr_0 tr_420000', 6);
INSERT INTO `sys_area`
VALUES (421002, '沙市区', 421000, '沙市', NULL, NULL, 'S', 112.257431, 30.315895, 3, 'tr_0 tr_420000 tr_421000', 6);
INSERT INTO `sys_area`
VALUES (421003, '荆州区', 421000, '荆州', NULL, NULL, 'J', 112.195351, 30.350674, 3, 'tr_0 tr_420000 tr_421000', 5);
INSERT INTO `sys_area`
VALUES (421022, '公安县', 421000, '公安', NULL, NULL, 'G', 112.230179, 30.059065, 3, 'tr_0 tr_420000 tr_421000', 1);
INSERT INTO `sys_area`
VALUES (421023, '监利县', 421000, '监利', NULL, NULL, 'J', 112.904343, 29.820080, 3, 'tr_0 tr_420000 tr_421000', 4);
INSERT INTO `sys_area`
VALUES (421024, '江陵县', 421000, '江陵', NULL, NULL, 'J', 112.417351, 30.033918, 3, 'tr_0 tr_420000 tr_421000', 3);
INSERT INTO `sys_area`
VALUES (421081, '石首市', 421000, '石首', NULL, NULL, 'S', 112.408867, 29.716436, 3, 'tr_0 tr_420000 tr_421000', 7);
INSERT INTO `sys_area`
VALUES (421083, '洪湖市', 421000, '洪湖', NULL, NULL, 'H', 113.470306, 29.812969, 3, 'tr_0 tr_420000 tr_421000', 2);
INSERT INTO `sys_area`
VALUES (421087, '松滋市', 421000, '松滋', NULL, NULL, 'S', 111.778183, 30.176037, 3, 'tr_0 tr_420000 tr_421000', 8);
INSERT INTO `sys_area`
VALUES (421100, '黄冈市', 420000, '黄冈', NULL, NULL, 'H', 114.879364, 30.447712, 2, 'tr_0 tr_420000', 3);
INSERT INTO `sys_area`
VALUES (421102, '黄州区', 421100, '黄州', NULL, NULL, 'H', 114.878937, 30.447435, 3, 'tr_0 tr_420000 tr_421100', 3);
INSERT INTO `sys_area`
VALUES (421121, '团风县', 421100, '团风', NULL, NULL, 'T', 114.872032, 30.635691, 3, 'tr_0 tr_420000 tr_421100', 7);
INSERT INTO `sys_area`
VALUES (421122, '红安县', 421100, '红安', NULL, NULL, 'H', 114.615097, 31.284777, 3, 'tr_0 tr_420000 tr_421100', 1);
INSERT INTO `sys_area`
VALUES (421123, '罗田县', 421100, '罗田', NULL, NULL, 'L', 115.398987, 30.781679, 3, 'tr_0 tr_420000 tr_421100', 4);
INSERT INTO `sys_area`
VALUES (421124, '英山县', 421100, '英山', NULL, NULL, 'Y', 115.677528, 30.735794, 3, 'tr_0 tr_420000 tr_421100', 10);
INSERT INTO `sys_area`
VALUES (421125, '浠水县', 421100, '浠水', NULL, NULL, 'Z', 115.263443, 30.454838, 3, 'tr_0 tr_420000 tr_421100', 9);
INSERT INTO `sys_area`
VALUES (421126, '蕲春县', 421100, '蕲春', NULL, NULL, 'Z', 115.433968, 30.234926, 3, 'tr_0 tr_420000 tr_421100', 6);
INSERT INTO `sys_area`
VALUES (421127, '黄梅县', 421100, '黄梅', NULL, NULL, 'H', 115.942551, 30.075113, 3, 'tr_0 tr_420000 tr_421100', 2);
INSERT INTO `sys_area`
VALUES (421181, '麻城市', 421100, '麻城', NULL, NULL, 'M', 115.025414, 31.177906, 3, 'tr_0 tr_420000 tr_421100', 5);
INSERT INTO `sys_area`
VALUES (421182, '武穴市', 421100, '武穴', NULL, NULL, 'W', 115.562424, 29.849342, 3, 'tr_0 tr_420000 tr_421100', 8);
INSERT INTO `sys_area`
VALUES (421200, '咸宁市', 420000, '咸宁', NULL, NULL, 'X', 114.328964, 29.832798, 2, 'tr_0 tr_420000', 14);
INSERT INTO `sys_area`
VALUES (421202, '咸安区', 421200, '咸安', NULL, NULL, 'X', 114.333893, 29.824717, 3, 'tr_0 tr_420000 tr_421200', 6);
INSERT INTO `sys_area`
VALUES (421221, '嘉鱼县', 421200, '嘉鱼', NULL, NULL, 'J', 113.921547, 29.973364, 3, 'tr_0 tr_420000 tr_421200', 3);
INSERT INTO `sys_area`
VALUES (421222, '通城县', 421200, '通城', NULL, NULL, 'T', 113.814133, 29.246077, 3, 'tr_0 tr_420000 tr_421200', 4);
INSERT INTO `sys_area`
VALUES (421223, '崇阳县', 421200, '崇阳', NULL, NULL, 'C', 114.049957, 29.541010, 3, 'tr_0 tr_420000 tr_421200', 2);
INSERT INTO `sys_area`
VALUES (421224, '通山县', 421200, '通山', NULL, NULL, 'T', 114.493164, 29.604456, 3, 'tr_0 tr_420000 tr_421200', 5);
INSERT INTO `sys_area`
VALUES (421281, '赤壁市', 421200, '赤壁', NULL, NULL, 'C', 113.883659, 29.716879, 3, 'tr_0 tr_420000 tr_421200', 1);
INSERT INTO `sys_area`
VALUES (421300, '随州市', 420000, '随州', NULL, NULL, 'S', 113.373772, 31.717497, 2, 'tr_0 tr_420000', 10);
INSERT INTO `sys_area`
VALUES (421302, '曾都区', 421300, '曾都', NULL, NULL, 'Z', 113.374519, 31.717522, 3, 'tr_0 tr_420000 tr_421300', 3);
INSERT INTO `sys_area`
VALUES (421321, '随县', 421300, '随县', NULL, NULL, 'S', 113.301384, 31.854246, 3, 'tr_0 tr_420000 tr_421300', 2);
INSERT INTO `sys_area`
VALUES (421381, '广水市', 421300, '广水', NULL, NULL, 'G', 113.826599, 31.617731, 3, 'tr_0 tr_420000 tr_421300', 1);
INSERT INTO `sys_area`
VALUES (422800, '恩施土家族苗族自治州', 420000, '恩施', NULL, NULL, 'E', 109.486992, 30.283113, 2, 'tr_0 tr_420000', 1);
INSERT INTO `sys_area`
VALUES (422801, '恩施市', 422800, '恩施', NULL, NULL, 'E', 109.486763, 30.282406, 3, 'tr_0 tr_420000 tr_422800', 2);
INSERT INTO `sys_area`
VALUES (422802, '利川市', 422800, '利川', NULL, NULL, 'L', 108.943489, 30.294247, 3, 'tr_0 tr_420000 tr_422800', 6);
INSERT INTO `sys_area`
VALUES (422822, '建始县', 422800, '建始', NULL, NULL, 'J', 109.723824, 30.601631, 3, 'tr_0 tr_420000 tr_422800', 4);
INSERT INTO `sys_area`
VALUES (422823, '巴东县', 422800, '巴东', NULL, NULL, 'B', 110.336662, 31.041403, 3, 'tr_0 tr_420000 tr_422800', 1);
INSERT INTO `sys_area`
VALUES (422825, '宣恩县', 422800, '宣恩', NULL, NULL, 'X', 109.482819, 29.988670, 3, 'tr_0 tr_420000 tr_422800', 8);
INSERT INTO `sys_area`
VALUES (422826, '咸丰县', 422800, '咸丰', NULL, NULL, 'X', 109.150414, 29.678967, 3, 'tr_0 tr_420000 tr_422800', 7);
INSERT INTO `sys_area`
VALUES (422827, '来凤县', 422800, '来凤', NULL, NULL, 'L', 109.408325, 29.506945, 3, 'tr_0 tr_420000 tr_422800', 5);
INSERT INTO `sys_area`
VALUES (422828, '鹤峰县', 422800, '鹤峰', NULL, NULL, 'H', 110.033699, 29.887299, 3, 'tr_0 tr_420000 tr_422800', 3);
INSERT INTO `sys_area`
VALUES (429004, '仙桃市', 420000, '仙桃', NULL, NULL, 'X', 113.453972, 30.364952, 2, 'tr_0 tr_420000', 15);
INSERT INTO `sys_area`
VALUES (429005, '潜江市', 420000, '潜江', NULL, NULL, 'Q', 112.896866, 30.421215, 2, 'tr_0 tr_420000', 7);
INSERT INTO `sys_area`
VALUES (429006, '天门市', 420000, '天门', NULL, NULL, 'T', 113.165863, 30.653061, 2, 'tr_0 tr_420000', 11);
INSERT INTO `sys_area`
VALUES (429021, '神农架林区', 420000, '神农架', NULL, NULL, 'S', 114.298569, 30.584354, 2, 'tr_0 tr_420000', 8);
INSERT INTO `sys_area`
VALUES (430000, '湖南省', 0, '湖南', NULL, NULL, 'H', 112.982277, 28.194090, 1, 'tr_0', 18);
INSERT INTO `sys_area`
VALUES (430100, '长沙市', 430000, '长沙', NULL, NULL, 'C', 112.982277, 28.194090, 2, 'tr_0 tr_430000', 2);
INSERT INTO `sys_area`
VALUES (430102, '芙蓉区', 430100, '芙蓉', NULL, NULL, 'Z', 112.988091, 28.193106, 3, 'tr_0 tr_430000 tr_430100', 2);
INSERT INTO `sys_area`
VALUES (430103, '天心区', 430100, '天心', NULL, NULL, 'T', 112.973068, 28.192375, 3, 'tr_0 tr_430000 tr_430100', 6);
INSERT INTO `sys_area`
VALUES (430104, '岳麓区', 430100, '岳麓', NULL, NULL, 'Y', 112.911591, 28.213043, 3, 'tr_0 tr_430000 tr_430100', 8);
INSERT INTO `sys_area`
VALUES (430105, '开福区', 430100, '开福', NULL, NULL, 'K', 112.985527, 28.201336, 3, 'tr_0 tr_430000 tr_430100', 3);
INSERT INTO `sys_area`
VALUES (430111, '雨花区', 430100, '雨花', NULL, NULL, 'Y', 113.016335, 28.109938, 3, 'tr_0 tr_430000 tr_430100', 9);
INSERT INTO `sys_area`
VALUES (430121, '长沙县', 430100, '长沙', NULL, NULL, 'C', 113.080101, 28.237888, 3, 'tr_0 tr_430000 tr_430100', 1);
INSERT INTO `sys_area`
VALUES (430122, '望城区', 430100, '望城', NULL, NULL, 'W', 112.819550, 28.347458, 3, 'tr_0 tr_430000 tr_430100', 7);
INSERT INTO `sys_area`
VALUES (430124, '宁乡县', 430100, '宁乡', NULL, NULL, 'N', 112.553185, 28.253927, 3, 'tr_0 tr_430000 tr_430100', 5);
INSERT INTO `sys_area`
VALUES (430181, '浏阳市', 430100, '浏阳', NULL, NULL, 'Z', 113.633301, 28.141111, 3, 'tr_0 tr_430000 tr_430100', 4);
INSERT INTO `sys_area`
VALUES (430200, '株洲市', 430000, '株洲', NULL, NULL, 'Z', 113.151733, 27.835806, 2, 'tr_0 tr_430000', 14);
INSERT INTO `sys_area`
VALUES (430202, '荷塘区', 430200, '荷塘', NULL, NULL, 'H', 113.162544, 27.833036, 3, 'tr_0 tr_430000 tr_430200', 2);
INSERT INTO `sys_area`
VALUES (430203, '芦淞区', 430200, '芦淞', NULL, NULL, 'L', 113.155167, 27.827246, 3, 'tr_0 tr_430000 tr_430200', 4);
INSERT INTO `sys_area`
VALUES (430204, '石峰区', 430200, '石峰', NULL, NULL, 'S', 113.112953, 27.871944, 3, 'tr_0 tr_430000 tr_430200', 5);
INSERT INTO `sys_area`
VALUES (430211, '天元区', 430200, '天元', NULL, NULL, 'T', 113.136253, 27.826908, 3, 'tr_0 tr_430000 tr_430200', 6);
INSERT INTO `sys_area`
VALUES (430221, '株洲县', 430200, '株洲', NULL, NULL, 'Z', 113.146179, 27.705845, 3, 'tr_0 tr_430000 tr_430200', 9);
INSERT INTO `sys_area`
VALUES (430223, '攸县', 430200, '攸县', NULL, NULL, 'Z', 113.345772, 27.000071, 3, 'tr_0 tr_430000 tr_430200', 8);
INSERT INTO `sys_area`
VALUES (430224, '茶陵县', 430200, '茶陵', NULL, NULL, 'C', 113.546509, 26.789534, 3, 'tr_0 tr_430000 tr_430200', 1);
INSERT INTO `sys_area`
VALUES (430225, '炎陵县', 430200, '炎陵', NULL, NULL, 'Y', 113.776886, 26.489458, 3, 'tr_0 tr_430000 tr_430200', 7);
INSERT INTO `sys_area`
VALUES (430281, '醴陵市', 430200, '醴陵', NULL, NULL, 'Z', 113.507156, 27.657873, 3, 'tr_0 tr_430000 tr_430200', 3);
INSERT INTO `sys_area`
VALUES (430300, '湘潭市', 430000, '湘潭', NULL, NULL, 'X', 112.944054, 27.829729, 2, 'tr_0 tr_430000', 8);
INSERT INTO `sys_area`
VALUES (430302, '雨湖区', 430300, '雨湖', NULL, NULL, 'Y', 112.907425, 27.860769, 3, 'tr_0 tr_430000 tr_430300', 5);
INSERT INTO `sys_area`
VALUES (430304, '岳塘区', 430300, '岳塘', NULL, NULL, 'Y', 112.927704, 27.828854, 3, 'tr_0 tr_430000 tr_430300', 4);
INSERT INTO `sys_area`
VALUES (430321, '湘潭县', 430300, '湘潭', NULL, NULL, 'X', 112.952827, 27.778601, 3, 'tr_0 tr_430000 tr_430300', 2);
INSERT INTO `sys_area`
VALUES (430381, '湘乡市', 430300, '湘乡', NULL, NULL, 'X', 112.525215, 27.734919, 3, 'tr_0 tr_430000 tr_430300', 3);
INSERT INTO `sys_area`
VALUES (430382, '韶山市', 430300, '韶山', NULL, NULL, 'S', 112.528481, 27.922682, 3, 'tr_0 tr_430000 tr_430300', 1);
INSERT INTO `sys_area`
VALUES (430400, '衡阳市', 430000, '衡阳', NULL, NULL, 'H', 112.607697, 26.900358, 2, 'tr_0 tr_430000', 4);
INSERT INTO `sys_area`
VALUES (430405, '珠晖区', 430400, '珠晖', NULL, NULL, 'Z', 112.626328, 26.891064, 3, 'tr_0 tr_430000 tr_430400', 12);
INSERT INTO `sys_area`
VALUES (430406, '雁峰区', 430400, '雁峰', NULL, NULL, 'Y', 112.612244, 26.893694, 3, 'tr_0 tr_430000 tr_430400', 10);
INSERT INTO `sys_area`
VALUES (430407, '石鼓区', 430400, '石鼓', NULL, NULL, 'S', 112.607635, 26.903908, 3, 'tr_0 tr_430000 tr_430400', 9);
INSERT INTO `sys_area`
VALUES (430408, '蒸湘区', 430400, '蒸湘', NULL, NULL, 'Z', 112.570610, 26.890869, 3, 'tr_0 tr_430000 tr_430400', 11);
INSERT INTO `sys_area`
VALUES (430412, '南岳区', 430400, '南岳', NULL, NULL, 'N', 112.734146, 27.240536, 3, 'tr_0 tr_430000 tr_430400', 7);
INSERT INTO `sys_area`
VALUES (430421, '衡阳县', 430400, '衡阳', NULL, NULL, 'H', 112.379646, 26.962387, 3, 'tr_0 tr_430000 tr_430400', 5);
INSERT INTO `sys_area`
VALUES (430422, '衡南县', 430400, '衡南', NULL, NULL, 'H', 112.677460, 26.739973, 3, 'tr_0 tr_430000 tr_430400', 3);
INSERT INTO `sys_area`
VALUES (430423, '衡山县', 430400, '衡山', NULL, NULL, 'H', 112.869713, 27.234808, 3, 'tr_0 tr_430000 tr_430400', 4);
INSERT INTO `sys_area`
VALUES (430424, '衡东县', 430400, '衡东', NULL, NULL, 'H', 112.950409, 27.083530, 3, 'tr_0 tr_430000 tr_430400', 2);
INSERT INTO `sys_area`
VALUES (430426, '祁东县', 430400, '祁东', NULL, NULL, 'Q', 112.111191, 26.787109, 3, 'tr_0 tr_430000 tr_430400', 8);
INSERT INTO `sys_area`
VALUES (430481, '耒阳市', 430400, '耒阳', NULL, NULL, 'Z', 112.847214, 26.414162, 3, 'tr_0 tr_430000 tr_430400', 6);
INSERT INTO `sys_area`
VALUES (430482, '常宁市', 430400, '常宁', NULL, NULL, 'C', 112.396820, 26.406773, 3, 'tr_0 tr_430000 tr_430400', 1);
INSERT INTO `sys_area`
VALUES (430500, '邵阳市', 430000, '邵阳', NULL, NULL, 'S', 111.469231, 27.237843, 2, 'tr_0 tr_430000', 7);
INSERT INTO `sys_area`
VALUES (430502, '双清区', 430500, '双清', NULL, NULL, 'S', 111.479759, 27.240002, 3, 'tr_0 tr_430000 tr_430500', 8);
INSERT INTO `sys_area`
VALUES (430503, '大祥区', 430500, '大祥', NULL, NULL, 'D', 111.462967, 27.233593, 3, 'tr_0 tr_430000 tr_430500', 3);
INSERT INTO `sys_area`
VALUES (430511, '北塔区', 430500, '北塔', NULL, NULL, 'B', 111.452316, 27.245687, 3, 'tr_0 tr_430000 tr_430500', 1);
INSERT INTO `sys_area`
VALUES (430521, '邵东县', 430500, '邵东', NULL, NULL, 'S', 111.743172, 27.257273, 3, 'tr_0 tr_430000 tr_430500', 6);
INSERT INTO `sys_area`
VALUES (430522, '新邵县', 430500, '新邵', NULL, NULL, 'X', 111.459763, 27.311428, 3, 'tr_0 tr_430000 tr_430500', 12);
INSERT INTO `sys_area`
VALUES (430523, '邵阳县', 430500, '邵阳', NULL, NULL, 'S', 111.275703, 26.989714, 3, 'tr_0 tr_430000 tr_430500', 7);
INSERT INTO `sys_area`
VALUES (430524, '隆回县', 430500, '隆回', NULL, NULL, 'L', 111.038788, 27.116001, 3, 'tr_0 tr_430000 tr_430500', 5);
INSERT INTO `sys_area`
VALUES (430525, '洞口县', 430500, '洞口', NULL, NULL, 'D', 110.579208, 27.062286, 3, 'tr_0 tr_430000 tr_430500', 4);
INSERT INTO `sys_area`
VALUES (430527, '绥宁县', 430500, '绥宁', NULL, NULL, 'S', 110.155075, 26.580622, 3, 'tr_0 tr_430000 tr_430500', 9);
INSERT INTO `sys_area`
VALUES (430528, '新宁县', 430500, '新宁', NULL, NULL, 'X', 110.859116, 26.438911, 3, 'tr_0 tr_430000 tr_430500', 11);
INSERT INTO `sys_area`
VALUES (430529, '城步苗族自治县', 430500, '城步', NULL, NULL, 'C', 110.313225, 26.363575, 3, 'tr_0 tr_430000 tr_430500', 2);
INSERT INTO `sys_area`
VALUES (430581, '武冈市', 430500, '武冈', NULL, NULL, 'W', 110.636803, 26.732086, 3, 'tr_0 tr_430000 tr_430500', 10);
INSERT INTO `sys_area`
VALUES (430600, '岳阳市', 430000, '岳阳', NULL, NULL, 'Y', 113.132858, 29.370291, 2, 'tr_0 tr_430000', 12);
INSERT INTO `sys_area`
VALUES (430602, '岳阳楼区', 430600, '岳阳楼', NULL, NULL, 'Y', 113.120750, 29.366783, 3, 'tr_0 tr_430000 tr_430600', 7);
INSERT INTO `sys_area`
VALUES (430603, '云溪区', 430600, '云溪', NULL, NULL, 'Y', 113.273872, 29.473394, 3, 'tr_0 tr_430000 tr_430600', 9);
INSERT INTO `sys_area`
VALUES (430611, '君山区', 430600, '君山', NULL, NULL, 'J', 113.004082, 29.438063, 3, 'tr_0 tr_430000 tr_430600', 2);
INSERT INTO `sys_area`
VALUES (430621, '岳阳县', 430600, '岳阳', NULL, NULL, 'Y', 113.116074, 29.144842, 3, 'tr_0 tr_430000 tr_430600', 8);
INSERT INTO `sys_area`
VALUES (430623, '华容县', 430600, '华容', NULL, NULL, 'H', 112.559372, 29.524107, 3, 'tr_0 tr_430000 tr_430600', 1);
INSERT INTO `sys_area`
VALUES (430624, '湘阴县', 430600, '湘阴', NULL, NULL, 'X', 112.889748, 28.677498, 3, 'tr_0 tr_430000 tr_430600', 6);
INSERT INTO `sys_area`
VALUES (430626, '平江县', 430600, '平江', NULL, NULL, 'P', 113.593750, 28.701523, 3, 'tr_0 tr_430000 tr_430600', 5);
INSERT INTO `sys_area`
VALUES (430681, '汨罗市', 430600, '汨罗', NULL, NULL, 'Z', 113.079422, 28.803148, 3, 'tr_0 tr_430000 tr_430600', 4);
INSERT INTO `sys_area`
VALUES (430682, '临湘市', 430600, '临湘', NULL, NULL, 'L', 113.450806, 29.471594, 3, 'tr_0 tr_430000 tr_430600', 3);
INSERT INTO `sys_area`
VALUES (430700, '常德市', 430000, '常德', NULL, NULL, 'C', 111.691345, 29.040224, 2, 'tr_0 tr_430000', 1);
INSERT INTO `sys_area`
VALUES (430702, '武陵区', 430700, '武陵', NULL, NULL, 'W', 111.690720, 29.040478, 3, 'tr_0 tr_430000 tr_430700', 9);
INSERT INTO `sys_area`
VALUES (430703, '鼎城区', 430700, '鼎城', NULL, NULL, 'D', 111.685326, 29.014425, 3, 'tr_0 tr_430000 tr_430700', 2);
INSERT INTO `sys_area`
VALUES (430721, '安乡县', 430700, '安乡', NULL, NULL, 'A', 112.172287, 29.414482, 3, 'tr_0 tr_430000 tr_430700', 1);
INSERT INTO `sys_area`
VALUES (430722, '汉寿县', 430700, '汉寿', NULL, NULL, 'H', 111.968506, 28.907318, 3, 'tr_0 tr_430000 tr_430700', 3);
INSERT INTO `sys_area`
VALUES (430723, '澧县', 430700, '澧县', NULL, NULL, 'Z', 111.761681, 29.642639, 3, 'tr_0 tr_430000 tr_430700', 6);
INSERT INTO `sys_area`
VALUES (430724, '临澧县', 430700, '临澧', NULL, NULL, 'L', 111.645599, 29.443216, 3, 'tr_0 tr_430000 tr_430700', 5);
INSERT INTO `sys_area`
VALUES (430725, '桃源县', 430700, '桃源', NULL, NULL, 'T', 111.484505, 28.902735, 3, 'tr_0 tr_430000 tr_430700', 8);
INSERT INTO `sys_area`
VALUES (430726, '石门县', 430700, '石门', NULL, NULL, 'S', 111.379089, 29.584703, 3, 'tr_0 tr_430000 tr_430700', 7);
INSERT INTO `sys_area`
VALUES (430781, '津市市', 430700, '津市', NULL, NULL, 'J', 111.879608, 29.630867, 3, 'tr_0 tr_430000 tr_430700', 4);
INSERT INTO `sys_area`
VALUES (430800, '张家界市', 430000, '张家界', NULL, NULL, 'Z', 110.479919, 29.127401, 2, 'tr_0 tr_430000', 13);
INSERT INTO `sys_area`
VALUES (430802, '永定区', 430800, '永定', NULL, NULL, 'Y', 110.484558, 29.125961, 3, 'tr_0 tr_430000 tr_430800', 4);
INSERT INTO `sys_area`
VALUES (430811, '武陵源区', 430800, '武陵源', NULL, NULL, 'W', 110.547577, 29.347828, 3, 'tr_0 tr_430000 tr_430800', 3);
INSERT INTO `sys_area`
VALUES (430821, '慈利县', 430800, '慈利', NULL, NULL, 'C', 111.132706, 29.423876, 3, 'tr_0 tr_430000 tr_430800', 1);
INSERT INTO `sys_area`
VALUES (430822, '桑植县', 430800, '桑植', NULL, NULL, 'S', 110.164040, 29.399939, 3, 'tr_0 tr_430000 tr_430800', 2);
INSERT INTO `sys_area`
VALUES (430900, '益阳市', 430000, '益阳', NULL, NULL, 'Y', 112.355042, 28.570066, 2, 'tr_0 tr_430000', 10);
INSERT INTO `sys_area`
VALUES (430902, '资阳区', 430900, '资阳', NULL, NULL, 'Z', 112.330841, 28.592772, 3, 'tr_0 tr_430000 tr_430900', 6);
INSERT INTO `sys_area`
VALUES (430903, '赫山区', 430900, '赫山', NULL, NULL, 'H', 112.360947, 28.568327, 3, 'tr_0 tr_430000 tr_430900', 2);
INSERT INTO `sys_area`
VALUES (430921, '南县', 430900, '南县', NULL, NULL, 'N', 112.410400, 29.372181, 3, 'tr_0 tr_430000 tr_430900', 3);
INSERT INTO `sys_area`
VALUES (430922, '桃江县', 430900, '桃江', NULL, NULL, 'T', 112.139732, 28.520992, 3, 'tr_0 tr_430000 tr_430900', 4);
INSERT INTO `sys_area`
VALUES (430923, '安化县', 430900, '安化', NULL, NULL, 'A', 111.221825, 28.377420, 3, 'tr_0 tr_430000 tr_430900', 1);
INSERT INTO `sys_area`
VALUES (430981, '沅江市', 430900, '沅江', NULL, NULL, 'Z', 112.361092, 28.839712, 3, 'tr_0 tr_430000 tr_430900', 5);
INSERT INTO `sys_area`
VALUES (431000, '郴州市', 430000, '郴州', NULL, NULL, 'C', 113.032066, 25.793589, 2, 'tr_0 tr_430000', 3);
INSERT INTO `sys_area`
VALUES (431002, '北湖区', 431000, '北湖', NULL, NULL, 'B', 113.032211, 25.792627, 3, 'tr_0 tr_430000 tr_431000', 2);
INSERT INTO `sys_area`
VALUES (431003, '苏仙区', 431000, '苏仙', NULL, NULL, 'S', 113.038696, 25.793158, 3, 'tr_0 tr_430000 tr_431000', 8);
INSERT INTO `sys_area`
VALUES (431021, '桂阳县', 431000, '桂阳', NULL, NULL, 'G', 112.734467, 25.737448, 3, 'tr_0 tr_430000 tr_431000', 4);
INSERT INTO `sys_area`
VALUES (431022, '宜章县', 431000, '宜章', NULL, NULL, 'Y', 112.947884, 25.394344, 3, 'tr_0 tr_430000 tr_431000', 9);
INSERT INTO `sys_area`
VALUES (431023, '永兴县', 431000, '永兴', NULL, NULL, 'Y', 113.114822, 26.129393, 3, 'tr_0 tr_430000 tr_431000', 10);
INSERT INTO `sys_area`
VALUES (431024, '嘉禾县', 431000, '嘉禾', NULL, NULL, 'J', 112.370621, 25.587309, 3, 'tr_0 tr_430000 tr_431000', 5);
INSERT INTO `sys_area`
VALUES (431025, '临武县', 431000, '临武', NULL, NULL, 'L', 112.564590, 25.279119, 3, 'tr_0 tr_430000 tr_431000', 6);
INSERT INTO `sys_area`
VALUES (431026, '汝城县', 431000, '汝城', NULL, NULL, 'R', 113.685684, 25.553759, 3, 'tr_0 tr_430000 tr_431000', 7);
INSERT INTO `sys_area`
VALUES (431027, '桂东县', 431000, '桂东', NULL, NULL, 'G', 113.945877, 26.073917, 3, 'tr_0 tr_430000 tr_431000', 3);
INSERT INTO `sys_area`
VALUES (431028, '安仁县', 431000, '安仁', NULL, NULL, 'A', 113.272171, 26.708626, 3, 'tr_0 tr_430000 tr_431000', 1);
INSERT INTO `sys_area`
VALUES (431081, '资兴市', 431000, '资兴', NULL, NULL, 'Z', 113.236816, 25.974152, 3, 'tr_0 tr_430000 tr_431000', 11);
INSERT INTO `sys_area`
VALUES (431100, '永州市', 430000, '永州', NULL, NULL, 'Y', 111.608017, 26.434517, 2, 'tr_0 tr_430000', 11);
INSERT INTO `sys_area`
VALUES (431102, '零陵区', 431100, '零陵', NULL, NULL, 'L', 111.626350, 26.223347, 3, 'tr_0 tr_430000 tr_431100', 7);
INSERT INTO `sys_area`
VALUES (431103, '冷水滩区', 431100, '冷水滩', NULL, NULL, 'L', 111.607155, 26.434364, 3, 'tr_0 tr_430000 tr_431100', 6);
INSERT INTO `sys_area`
VALUES (431121, '祁阳县', 431100, '祁阳', NULL, NULL, 'Q', 111.857338, 26.585930, 3, 'tr_0 tr_430000 tr_431100', 9);
INSERT INTO `sys_area`
VALUES (431122, '东安县', 431100, '东安', NULL, NULL, 'D', 111.313034, 26.397278, 3, 'tr_0 tr_430000 tr_431100', 2);
INSERT INTO `sys_area`
VALUES (431123, '双牌县', 431100, '双牌', NULL, NULL, 'S', 111.662148, 25.959396, 3, 'tr_0 tr_430000 tr_431100', 10);
INSERT INTO `sys_area`
VALUES (431124, '道县', 431100, '道县', NULL, NULL, 'D', 111.591614, 25.518444, 3, 'tr_0 tr_430000 tr_431100', 1);
INSERT INTO `sys_area`
VALUES (431125, '江永县', 431100, '江永', NULL, NULL, 'J', 111.346802, 25.268154, 3, 'tr_0 tr_430000 tr_431100', 4);
INSERT INTO `sys_area`
VALUES (431126, '宁远县', 431100, '宁远', NULL, NULL, 'N', 111.944527, 25.584112, 3, 'tr_0 tr_430000 tr_431100', 8);
INSERT INTO `sys_area`
VALUES (431127, '蓝山县', 431100, '蓝山', NULL, NULL, 'L', 112.194199, 25.375256, 3, 'tr_0 tr_430000 tr_431100', 5);
INSERT INTO `sys_area`
VALUES (431128, '新田县', 431100, '新田', NULL, NULL, 'X', 112.220345, 25.906927, 3, 'tr_0 tr_430000 tr_431100', 11);
INSERT INTO `sys_area`
VALUES (431129, '江华瑶族自治县', 431100, '江华', NULL, NULL, 'J', 111.577278, 25.182596, 3, 'tr_0 tr_430000 tr_431100', 3);
INSERT INTO `sys_area`
VALUES (431200, '怀化市', 430000, '怀化', NULL, NULL, 'H', 109.978241, 27.550081, 2, 'tr_0 tr_430000', 5);
INSERT INTO `sys_area`
VALUES (431202, '鹤城区', 431200, '鹤城', NULL, NULL, 'H', 109.982239, 27.548473, 3, 'tr_0 tr_430000 tr_431200', 2);
INSERT INTO `sys_area`
VALUES (431221, '中方县', 431200, '中方', NULL, NULL, 'Z', 109.948059, 27.437361, 3, 'tr_0 tr_430000 tr_431200', 12);
INSERT INTO `sys_area`
VALUES (431222, '沅陵县', 431200, '沅陵', NULL, NULL, 'Z', 110.399162, 28.455553, 3, 'tr_0 tr_430000 tr_431200', 10);
INSERT INTO `sys_area`
VALUES (431223, '辰溪县', 431200, '辰溪', NULL, NULL, 'C', 110.196953, 28.005474, 3, 'tr_0 tr_430000 tr_431200', 1);
INSERT INTO `sys_area`
VALUES (431224, '溆浦县', 431200, '溆浦', NULL, NULL, 'Z', 110.593376, 27.903803, 3, 'tr_0 tr_430000 tr_431200', 9);
INSERT INTO `sys_area`
VALUES (431225, '会同县', 431200, '会同', NULL, NULL, 'H', 109.720787, 26.870789, 3, 'tr_0 tr_430000 tr_431200', 4);
INSERT INTO `sys_area`
VALUES (431226, '麻阳苗族自治县', 431200, '麻阳', NULL, NULL, 'M', 109.802811, 27.865992, 3, 'tr_0 tr_430000 tr_431200', 6);
INSERT INTO `sys_area`
VALUES (431227, '新晃侗族自治县', 431200, '新晃', NULL, NULL, 'X', 109.174446, 27.359898, 3, 'tr_0 tr_430000 tr_431200', 8);
INSERT INTO `sys_area`
VALUES (431228, '芷江侗族自治县', 431200, '芷江', NULL, NULL, 'Z', 109.687775, 27.437996, 3, 'tr_0 tr_430000 tr_431200', 11);
INSERT INTO `sys_area`
VALUES (431229, '靖州苗族侗族自治县', 431200, '靖州', NULL, NULL, 'J', 109.691162, 26.573511, 3, 'tr_0 tr_430000 tr_431200', 5);
INSERT INTO `sys_area`
VALUES (431230, '通道侗族自治县', 431200, '通道', NULL, NULL, 'T', 109.783356, 26.158348, 3, 'tr_0 tr_430000 tr_431200', 7);
INSERT INTO `sys_area`
VALUES (431281, '洪江市', 431200, '洪江', NULL, NULL, 'H', 109.831764, 27.201876, 3, 'tr_0 tr_430000 tr_431200', 3);
INSERT INTO `sys_area`
VALUES (431300, '娄底市', 430000, '娄底', NULL, NULL, 'L', 112.008499, 27.728136, 2, 'tr_0 tr_430000', 6);
INSERT INTO `sys_area`
VALUES (431302, '娄星区', 431300, '娄星', NULL, NULL, 'L', 112.008484, 27.726643, 3, 'tr_0 tr_430000 tr_431300', 3);
INSERT INTO `sys_area`
VALUES (431321, '双峰县', 431300, '双峰', NULL, NULL, 'S', 112.198242, 27.459126, 3, 'tr_0 tr_430000 tr_431300', 4);
INSERT INTO `sys_area`
VALUES (431322, '新化县', 431300, '新化', NULL, NULL, 'X', 111.306747, 27.737455, 3, 'tr_0 tr_430000 tr_431300', 5);
INSERT INTO `sys_area`
VALUES (431381, '冷水江市', 431300, '冷水江', NULL, NULL, 'L', 111.434677, 27.685759, 3, 'tr_0 tr_430000 tr_431300', 1);
INSERT INTO `sys_area`
VALUES (431382, '涟源市', 431300, '涟源', NULL, NULL, 'L', 111.670845, 27.692301, 3, 'tr_0 tr_430000 tr_431300', 2);
INSERT INTO `sys_area`
VALUES (433100, '湘西土家族苗族自治州', 430000, '湘西', NULL, NULL, 'X', 109.739738, 28.314297, 2, 'tr_0 tr_430000', 9);
INSERT INTO `sys_area`
VALUES (433101, '吉首市', 433100, '吉首', NULL, NULL, 'J', 109.738274, 28.314827, 3, 'tr_0 tr_430000 tr_433100', 5);
INSERT INTO `sys_area`
VALUES (433122, '泸溪县', 433100, '泸溪', NULL, NULL, 'Z', 110.214432, 28.214516, 3, 'tr_0 tr_430000 tr_433100', 7);
INSERT INTO `sys_area`
VALUES (433123, '凤凰县', 433100, '凤凰', NULL, NULL, 'F', 109.599190, 27.948309, 3, 'tr_0 tr_430000 tr_433100', 2);
INSERT INTO `sys_area`
VALUES (433124, '花垣县', 433100, '花垣', NULL, NULL, 'H', 109.479065, 28.581352, 3, 'tr_0 tr_430000 tr_433100', 4);
INSERT INTO `sys_area`
VALUES (433125, '保靖县', 433100, '保靖', NULL, NULL, 'B', 109.651443, 28.709604, 3, 'tr_0 tr_430000 tr_433100', 1);
INSERT INTO `sys_area`
VALUES (433126, '古丈县', 433100, '古丈', NULL, NULL, 'G', 109.949593, 28.616974, 3, 'tr_0 tr_430000 tr_433100', 3);
INSERT INTO `sys_area`
VALUES (433127, '永顺县', 433100, '永顺', NULL, NULL, 'Y', 109.853294, 28.998068, 3, 'tr_0 tr_430000 tr_433100', 8);
INSERT INTO `sys_area`
VALUES (433130, '龙山县', 433100, '龙山', NULL, NULL, 'L', 109.441193, 29.453438, 3, 'tr_0 tr_430000 tr_433100', 6);
INSERT INTO `sys_area`
VALUES (440000, '广东省', 0, '广东', NULL, NULL, 'G', 113.280640, 23.125177, 1, 'tr_0', 19);
INSERT INTO `sys_area`
VALUES (440100, '广州市', 440000, '广州', NULL, NULL, 'G', 113.280640, 23.125177, 2, 'tr_0 tr_440000', 5);
INSERT INTO `sys_area`
VALUES (440103, '荔湾区', 440100, '荔湾', NULL, NULL, 'L', 113.243034, 23.124943, 3, 'tr_0 tr_440000 tr_440100', 7);
INSERT INTO `sys_area`
VALUES (440104, '越秀区', 440100, '越秀', NULL, NULL, 'Y', 113.280716, 23.125624, 3, 'tr_0 tr_440000 tr_440100', 3);
INSERT INTO `sys_area`
VALUES (440105, '海珠区', 440100, '海珠', NULL, NULL, 'H', 113.262009, 23.103130, 3, 'tr_0 tr_440000 tr_440100', 4);
INSERT INTO `sys_area`
VALUES (440106, '天河区', 440100, '天河', NULL, NULL, 'T', 113.335365, 23.135590, 3, 'tr_0 tr_440000 tr_440100', 11);
INSERT INTO `sys_area`
VALUES (440111, '白云区', 440100, '白云', NULL, NULL, 'B', 113.262833, 23.162281, 3, 'tr_0 tr_440000 tr_440100', 1);
INSERT INTO `sys_area`
VALUES (440112, '黄埔区', 440100, '黄埔', NULL, NULL, 'H', 113.450760, 23.103239, 3, 'tr_0 tr_440000 tr_440100', 6);
INSERT INTO `sys_area`
VALUES (440113, '番禺区', 440100, '番禺', NULL, NULL, 'F', 113.364616, 22.938581, 3, 'tr_0 tr_440000 tr_440100', 10);
INSERT INTO `sys_area`
VALUES (440114, '花都区', 440100, '花都', NULL, NULL, 'H', 113.211182, 23.392050, 3, 'tr_0 tr_440000 tr_440100', 5);
INSERT INTO `sys_area`
VALUES (440115, '南沙区', 440100, '南沙', NULL, NULL, 'N', 113.537376, 22.794531, 3, 'tr_0 tr_440000 tr_440100', 9);
INSERT INTO `sys_area`
VALUES (440116, '萝岗区', 440100, '萝岗', NULL, NULL, 'L', 113.280640, 23.125177, 3, 'tr_0 tr_440000 tr_440100', 8);
INSERT INTO `sys_area`
VALUES (440183, '增城市', 440100, '增城', NULL, NULL, 'Z', 113.280640, 23.125177, 3, 'tr_0 tr_440000 tr_440100', 12);
INSERT INTO `sys_area`
VALUES (440184, '从化市', 440100, '从化', NULL, NULL, 'C', 113.280640, 23.125177, 3, 'tr_0 tr_440000 tr_440100', 2);
INSERT INTO `sys_area`
VALUES (440200, '韶关市', 440000, '韶关', NULL, NULL, 'S', 113.591545, 24.801323, 2, 'tr_0 tr_440000', 15);
INSERT INTO `sys_area`
VALUES (440203, '武江区', 440200, '武江', NULL, NULL, 'W', 113.588287, 24.800159, 3, 'tr_0 tr_440000 tr_440200', 8);
INSERT INTO `sys_area`
VALUES (440204, '浈江区', 440200, '浈江', NULL, NULL, 'Z', 113.599220, 24.803976, 3, 'tr_0 tr_440000 tr_440200', 10);
INSERT INTO `sys_area`
VALUES (440205, '曲江区', 440200, '曲江', NULL, NULL, 'Q', 113.605583, 24.680195, 3, 'tr_0 tr_440000 tr_440200', 3);
INSERT INTO `sys_area`
VALUES (440222, '始兴县', 440200, '始兴', NULL, NULL, 'S', 114.067207, 24.948364, 3, 'tr_0 tr_440000 tr_440200', 6);
INSERT INTO `sys_area`
VALUES (440224, '仁化县', 440200, '仁化', NULL, NULL, 'R', 113.748627, 25.088226, 3, 'tr_0 tr_440000 tr_440200', 4);
INSERT INTO `sys_area`
VALUES (440229, '翁源县', 440200, '翁源', NULL, NULL, 'W', 114.131287, 24.353888, 3, 'tr_0 tr_440000 tr_440200', 7);
INSERT INTO `sys_area`
VALUES (440232, '乳源瑶族自治县', 440200, '乳源', NULL, NULL, 'R', 113.278419, 24.776110, 3, 'tr_0 tr_440000 tr_440200', 5);
INSERT INTO `sys_area`
VALUES (440233, '新丰县', 440200, '新丰', NULL, NULL, 'X', 114.207031, 24.055412, 3, 'tr_0 tr_440000 tr_440200', 9);
INSERT INTO `sys_area`
VALUES (440281, '乐昌市', 440200, '乐昌', NULL, NULL, 'L', 113.352409, 25.128445, 3, 'tr_0 tr_440000 tr_440200', 1);
INSERT INTO `sys_area`
VALUES (440282, '南雄市', 440200, '南雄', NULL, NULL, 'N', 114.311234, 25.115328, 3, 'tr_0 tr_440000 tr_440200', 2);
INSERT INTO `sys_area`
VALUES (440300, '深圳市', 440000, '深圳', NULL, NULL, 'S', 114.085945, 22.547001, 2, 'tr_0 tr_440000', 16);
INSERT INTO `sys_area`
VALUES (440303, '罗湖区', 440300, '罗湖', NULL, NULL, 'L', 114.123886, 22.555342, 3, 'tr_0 tr_440000 tr_440300', 7);
INSERT INTO `sys_area`
VALUES (440304, '福田区', 440300, '福田', NULL, NULL, 'F', 114.050957, 22.541010, 3, 'tr_0 tr_440000 tr_440300', 3);
INSERT INTO `sys_area`
VALUES (440305, '南山区', 440300, '南山', NULL, NULL, 'N', 113.929428, 22.531221, 3, 'tr_0 tr_440000 tr_440300', 8);
INSERT INTO `sys_area`
VALUES (440306, '宝安区', 440300, '宝安', NULL, NULL, 'B', 113.828674, 22.754742, 3, 'tr_0 tr_440000 tr_440300', 1);
INSERT INTO `sys_area`
VALUES (440307, '龙岗区', 440300, '龙岗', NULL, NULL, 'L', 114.251373, 22.721512, 3, 'tr_0 tr_440000 tr_440300', 5);
INSERT INTO `sys_area`
VALUES (440308, '盐田区', 440300, '盐田', NULL, NULL, 'Y', 114.235367, 22.555069, 3, 'tr_0 tr_440000 tr_440300', 10);
INSERT INTO `sys_area`
VALUES (440320, '光明新区', 440300, '光明', NULL, NULL, 'G', 113.905037, 22.561985, 3, 'tr_0 tr_440000 tr_440300', 4);
INSERT INTO `sys_area`
VALUES (440321, '坪山新区', 440300, '坪山', NULL, NULL, 'P', 114.346252, 22.691254, 3, 'tr_0 tr_440000 tr_440300', 9);
INSERT INTO `sys_area`
VALUES (440322, '大鹏新区', 440300, '大鹏', NULL, NULL, 'D', 114.474602, 22.597641, 3, 'tr_0 tr_440000 tr_440300', 2);
INSERT INTO `sys_area`
VALUES (440323, '龙华新区', 440300, '龙华', NULL, NULL, 'L', 114.019348, 22.656408, 3, 'tr_0 tr_440000 tr_440300', 6);
INSERT INTO `sys_area`
VALUES (440400, '珠海市', 440000, '珠海', NULL, NULL, 'Z', 113.553986, 22.224979, 2, 'tr_0 tr_440000', 22);
INSERT INTO `sys_area`
VALUES (440402, '香洲区', 440400, '香洲', NULL, NULL, 'X', 113.550270, 22.271250, 3, 'tr_0 tr_440000 tr_440400', 3);
INSERT INTO `sys_area`
VALUES (440403, '斗门区', 440400, '斗门', NULL, NULL, 'D', 113.297737, 22.209118, 3, 'tr_0 tr_440000 tr_440400', 1);
INSERT INTO `sys_area`
VALUES (440404, '金湾区', 440400, '金湾', NULL, NULL, 'J', 113.345070, 22.139122, 3, 'tr_0 tr_440000 tr_440400', 2);
INSERT INTO `sys_area`
VALUES (440500, '汕头市', 440000, '汕头', NULL, NULL, 'S', 116.708466, 23.371019, 2, 'tr_0 tr_440000', 13);
INSERT INTO `sys_area`
VALUES (440507, '龙湖区', 440500, '龙湖', NULL, NULL, 'L', 116.732018, 23.373755, 3, 'tr_0 tr_440000 tr_440500', 6);
INSERT INTO `sys_area`
VALUES (440511, '金平区', 440500, '金平', NULL, NULL, 'J', 116.703583, 23.367071, 3, 'tr_0 tr_440000 tr_440500', 5);
INSERT INTO `sys_area`
VALUES (440512, '濠江区', 440500, '濠江', NULL, NULL, 'Z', 116.729530, 23.279345, 3, 'tr_0 tr_440000 tr_440500', 4);
INSERT INTO `sys_area`
VALUES (440513, '潮阳区', 440500, '潮阳', NULL, NULL, 'C', 116.602600, 23.262337, 3, 'tr_0 tr_440000 tr_440500', 2);
INSERT INTO `sys_area`
VALUES (440514, '潮南区', 440500, '潮南', NULL, NULL, 'C', 116.423607, 23.249798, 3, 'tr_0 tr_440000 tr_440500', 1);
INSERT INTO `sys_area`
VALUES (440515, '澄海区', 440500, '澄海', NULL, NULL, 'C', 116.763359, 23.468439, 3, 'tr_0 tr_440000 tr_440500', 3);
INSERT INTO `sys_area`
VALUES (440523, '南澳县', 440500, '南澳', NULL, NULL, 'N', 117.027107, 23.419561, 3, 'tr_0 tr_440000 tr_440500', 7);
INSERT INTO `sys_area`
VALUES (440600, '佛山市', 440000, '佛山', NULL, NULL, 'F', 113.122719, 23.028763, 2, 'tr_0 tr_440000', 4);
INSERT INTO `sys_area`
VALUES (440604, '禅城区', 440600, '禅城', NULL, NULL, 'Z', 113.112411, 23.019644, 3, 'tr_0 tr_440000 tr_440600', 1);
INSERT INTO `sys_area`
VALUES (440605, '南海区', 440600, '南海', NULL, NULL, 'N', 113.145576, 23.031563, 3, 'tr_0 tr_440000 tr_440600', 3);
INSERT INTO `sys_area`
VALUES (440606, '顺德区', 440600, '顺德', NULL, NULL, 'S', 113.281822, 22.758511, 3, 'tr_0 tr_440000 tr_440600', 5);
INSERT INTO `sys_area`
VALUES (440607, '三水区', 440600, '三水', NULL, NULL, 'S', 112.899414, 23.165039, 3, 'tr_0 tr_440000 tr_440600', 4);
INSERT INTO `sys_area`
VALUES (440608, '高明区', 440600, '高明', NULL, NULL, 'G', 112.882126, 22.893854, 3, 'tr_0 tr_440000 tr_440600', 2);
INSERT INTO `sys_area`
VALUES (440700, '江门市', 440000, '江门', NULL, NULL, 'J', 113.094940, 22.590431, 2, 'tr_0 tr_440000', 8);
INSERT INTO `sys_area`
VALUES (440703, '蓬江区', 440700, '蓬江', NULL, NULL, 'P', 113.078590, 22.596769, 3, 'tr_0 tr_440000 tr_440700', 5);
INSERT INTO `sys_area`
VALUES (440704, '江海区', 440700, '江海', NULL, NULL, 'J', 113.120598, 22.572210, 3, 'tr_0 tr_440000 tr_440700', 3);
INSERT INTO `sys_area`
VALUES (440705, '新会区', 440700, '新会', NULL, NULL, 'X', 113.038582, 22.520247, 3, 'tr_0 tr_440000 tr_440700', 7);
INSERT INTO `sys_area`
VALUES (440781, '台山市', 440700, '台山', NULL, NULL, 'T', 112.793411, 22.250713, 3, 'tr_0 tr_440000 tr_440700', 6);
INSERT INTO `sys_area`
VALUES (440783, '开平市', 440700, '开平', NULL, NULL, 'K', 112.692261, 22.366285, 3, 'tr_0 tr_440000 tr_440700', 4);
INSERT INTO `sys_area`
VALUES (440784, '鹤山市', 440700, '鹤山', NULL, NULL, 'H', 112.961792, 22.768105, 3, 'tr_0 tr_440000 tr_440700', 2);
INSERT INTO `sys_area`
VALUES (440785, '恩平市', 440700, '恩平', NULL, NULL, 'E', 112.314049, 22.182957, 3, 'tr_0 tr_440000 tr_440700', 1);
INSERT INTO `sys_area`
VALUES (440800, '湛江市', 440000, '湛江', NULL, NULL, 'Z', 110.364975, 21.274899, 2, 'tr_0 tr_440000', 19);
INSERT INTO `sys_area`
VALUES (440802, '赤坎区', 440800, '赤坎', NULL, NULL, 'C', 110.361633, 21.273365, 3, 'tr_0 tr_440000 tr_440800', 1);
INSERT INTO `sys_area`
VALUES (440803, '霞山区', 440800, '霞山', NULL, NULL, 'X', 110.406380, 21.194229, 3, 'tr_0 tr_440000 tr_440800', 8);
INSERT INTO `sys_area`
VALUES (440804, '坡头区', 440800, '坡头', NULL, NULL, 'P', 110.455635, 21.244410, 3, 'tr_0 tr_440000 tr_440800', 5);
INSERT INTO `sys_area`
VALUES (440811, '麻章区', 440800, '麻章', NULL, NULL, 'M', 110.329170, 21.265997, 3, 'tr_0 tr_440000 tr_440800', 4);
INSERT INTO `sys_area`
VALUES (440823, '遂溪县', 440800, '遂溪', NULL, NULL, 'S', 110.255318, 21.376915, 3, 'tr_0 tr_440000 tr_440800', 6);
INSERT INTO `sys_area`
VALUES (440825, '徐闻县', 440800, '徐闻', NULL, NULL, 'X', 110.175720, 20.326082, 3, 'tr_0 tr_440000 tr_440800', 9);
INSERT INTO `sys_area`
VALUES (440881, '廉江市', 440800, '廉江', NULL, NULL, 'L', 110.284958, 21.611280, 3, 'tr_0 tr_440000 tr_440800', 3);
INSERT INTO `sys_area`
VALUES (440882, '雷州市', 440800, '雷州', NULL, NULL, 'L', 110.088272, 20.908524, 3, 'tr_0 tr_440000 tr_440800', 2);
INSERT INTO `sys_area`
VALUES (440883, '吴川市', 440800, '吴川', NULL, NULL, 'W', 110.780510, 21.428453, 3, 'tr_0 tr_440000 tr_440800', 7);
INSERT INTO `sys_area`
VALUES (440900, '茂名市', 440000, '茂名', NULL, NULL, 'M', 110.919228, 21.659752, 2, 'tr_0 tr_440000', 10);
INSERT INTO `sys_area`
VALUES (440902, '茂南区', 440900, '茂南', NULL, NULL, 'M', 110.920540, 21.660425, 3, 'tr_0 tr_440000 tr_440900', 5);
INSERT INTO `sys_area`
VALUES (440903, '茂港区', 440900, '茂港', NULL, NULL, 'M', 111.052147, 21.463388, 3, 'tr_0 tr_440000 tr_440900', 4);
INSERT INTO `sys_area`
VALUES (440923, '电白县', 440900, '电白', NULL, NULL, 'D', 111.007263, 21.507219, 3, 'tr_0 tr_440000 tr_440900', 1);
INSERT INTO `sys_area`
VALUES (440981, '高州市', 440900, '高州', NULL, NULL, 'G', 110.853249, 21.915154, 3, 'tr_0 tr_440000 tr_440900', 2);
INSERT INTO `sys_area`
VALUES (440982, '化州市', 440900, '化州', NULL, NULL, 'H', 110.638390, 21.654953, 3, 'tr_0 tr_440000 tr_440900', 3);
INSERT INTO `sys_area`
VALUES (440983, '信宜市', 440900, '信宜', NULL, NULL, 'X', 110.941658, 22.352680, 3, 'tr_0 tr_440000 tr_440900', 6);
INSERT INTO `sys_area`
VALUES (441200, '肇庆市', 440000, '肇庆', NULL, NULL, 'Z', 112.472527, 23.051546, 2, 'tr_0 tr_440000', 20);
INSERT INTO `sys_area`
VALUES (441202, '端州区', 441200, '端州', NULL, NULL, 'D', 112.472328, 23.052662, 3, 'tr_0 tr_440000 tr_441200', 3);
INSERT INTO `sys_area`
VALUES (441203, '鼎湖区', 441200, '鼎湖', NULL, NULL, 'D', 112.565247, 23.155823, 3, 'tr_0 tr_440000 tr_441200', 2);
INSERT INTO `sys_area`
VALUES (441223, '广宁县', 441200, '广宁', NULL, NULL, 'G', 112.440422, 23.631487, 3, 'tr_0 tr_440000 tr_441200', 6);
INSERT INTO `sys_area`
VALUES (441224, '怀集县', 441200, '怀集', NULL, NULL, 'H', 112.182465, 23.913073, 3, 'tr_0 tr_440000 tr_441200', 7);
INSERT INTO `sys_area`
VALUES (441225, '封开县', 441200, '封开', NULL, NULL, 'F', 111.502975, 23.434731, 3, 'tr_0 tr_440000 tr_441200', 4);
INSERT INTO `sys_area`
VALUES (441226, '德庆县', 441200, '德庆', NULL, NULL, 'D', 111.781563, 23.141710, 3, 'tr_0 tr_440000 tr_441200', 1);
INSERT INTO `sys_area`
VALUES (441283, '高要市', 441200, '高要', NULL, NULL, 'G', 112.460846, 23.027695, 3, 'tr_0 tr_440000 tr_441200', 5);
INSERT INTO `sys_area`
VALUES (441284, '四会市', 441200, '四会', NULL, NULL, 'S', 112.695030, 23.340324, 3, 'tr_0 tr_440000 tr_441200', 8);
INSERT INTO `sys_area`
VALUES (441300, '惠州市', 440000, '惠州', NULL, NULL, 'H', 114.412598, 23.079405, 2, 'tr_0 tr_440000', 7);
INSERT INTO `sys_area`
VALUES (441302, '惠城区', 441300, '惠城', NULL, NULL, 'H', 114.413979, 23.079884, 3, 'tr_0 tr_440000 tr_441300', 2);
INSERT INTO `sys_area`
VALUES (441303, '惠阳区', 441300, '惠阳', NULL, NULL, 'H', 114.469444, 22.788509, 3, 'tr_0 tr_440000 tr_441300', 4);
INSERT INTO `sys_area`
VALUES (441322, '博罗县', 441300, '博罗', NULL, NULL, 'B', 114.284256, 23.167576, 3, 'tr_0 tr_440000 tr_441300', 1);
INSERT INTO `sys_area`
VALUES (441323, '惠东县', 441300, '惠东', NULL, NULL, 'H', 114.723091, 22.983036, 3, 'tr_0 tr_440000 tr_441300', 3);
INSERT INTO `sys_area`
VALUES (441324, '龙门县', 441300, '龙门', NULL, NULL, 'L', 114.259987, 23.723894, 3, 'tr_0 tr_440000 tr_441300', 5);
INSERT INTO `sys_area`
VALUES (441400, '梅州市', 440000, '梅州', NULL, NULL, 'M', 116.117584, 24.299112, 2, 'tr_0 tr_440000', 11);
INSERT INTO `sys_area`
VALUES (441402, '梅江区', 441400, '梅江', NULL, NULL, 'M', 116.121162, 24.302593, 3, 'tr_0 tr_440000 tr_441400', 4);
INSERT INTO `sys_area`
VALUES (441421, '梅县', 441400, '梅县', NULL, NULL, 'M', 116.083481, 24.267824, 3, 'tr_0 tr_440000 tr_441400', 5);
INSERT INTO `sys_area`
VALUES (441422, '大埔县', 441400, '大埔', NULL, NULL, 'D', 116.695518, 24.351587, 3, 'tr_0 tr_440000 tr_441400', 1);
INSERT INTO `sys_area`
VALUES (441423, '丰顺县', 441400, '丰顺', NULL, NULL, 'F', 116.184418, 23.752771, 3, 'tr_0 tr_440000 tr_441400', 2);
INSERT INTO `sys_area`
VALUES (441424, '五华县', 441400, '五华', NULL, NULL, 'W', 115.775002, 23.925425, 3, 'tr_0 tr_440000 tr_441400', 7);
INSERT INTO `sys_area`
VALUES (441426, '平远县', 441400, '平远', NULL, NULL, 'P', 115.891731, 24.569651, 3, 'tr_0 tr_440000 tr_441400', 6);
INSERT INTO `sys_area`
VALUES (441427, '蕉岭县', 441400, '蕉岭', NULL, NULL, 'J', 116.170532, 24.653313, 3, 'tr_0 tr_440000 tr_441400', 3);
INSERT INTO `sys_area`
VALUES (441481, '兴宁市', 441400, '兴宁', NULL, NULL, 'X', 115.731651, 24.138077, 3, 'tr_0 tr_440000 tr_441400', 8);
INSERT INTO `sys_area`
VALUES (441500, '汕尾市', 440000, '汕尾', NULL, NULL, 'S', 115.364235, 22.774485, 2, 'tr_0 tr_440000', 14);
INSERT INTO `sys_area`
VALUES (441502, '城区', 441500, '城区', NULL, NULL, 'C', 115.363670, 22.776228, 3, 'tr_0 tr_440000 tr_441500', 1);
INSERT INTO `sys_area`
VALUES (441521, '海丰县', 441500, '海丰', NULL, NULL, 'H', 115.337326, 22.971043, 3, 'tr_0 tr_440000 tr_441500', 2);
INSERT INTO `sys_area`
VALUES (441523, '陆河县', 441500, '陆河', NULL, NULL, 'L', 115.657562, 23.302683, 3, 'tr_0 tr_440000 tr_441500', 4);
INSERT INTO `sys_area`
VALUES (441581, '陆丰市', 441500, '陆丰', NULL, NULL, 'L', 115.644203, 22.946104, 3, 'tr_0 tr_440000 tr_441500', 3);
INSERT INTO `sys_area`
VALUES (441600, '河源市', 440000, '河源', NULL, NULL, 'H', 114.697800, 23.746265, 2, 'tr_0 tr_440000', 6);
INSERT INTO `sys_area`
VALUES (441602, '源城区', 441600, '源城', NULL, NULL, 'Y', 114.696831, 23.746256, 3, 'tr_0 tr_440000 tr_441600', 5);
INSERT INTO `sys_area`
VALUES (441621, '紫金县', 441600, '紫金', NULL, NULL, 'Z', 115.184380, 23.633743, 3, 'tr_0 tr_440000 tr_441600', 6);
INSERT INTO `sys_area`
VALUES (441622, '龙川县', 441600, '龙川', NULL, NULL, 'L', 115.256416, 24.101173, 3, 'tr_0 tr_440000 tr_441600', 4);
INSERT INTO `sys_area`
VALUES (441623, '连平县', 441600, '连平', NULL, NULL, 'L', 114.495949, 24.364227, 3, 'tr_0 tr_440000 tr_441600', 3);
INSERT INTO `sys_area`
VALUES (441624, '和平县', 441600, '和平', NULL, NULL, 'H', 114.941475, 24.443180, 3, 'tr_0 tr_440000 tr_441600', 2);
INSERT INTO `sys_area`
VALUES (441625, '东源县', 441600, '东源', NULL, NULL, 'D', 114.742714, 23.789093, 3, 'tr_0 tr_440000 tr_441600', 1);
INSERT INTO `sys_area`
VALUES (441700, '阳江市', 440000, '阳江', NULL, NULL, 'Y', 111.975105, 21.859222, 2, 'tr_0 tr_440000', 17);
INSERT INTO `sys_area`
VALUES (441702, '江城区', 441700, '江城', NULL, NULL, 'J', 111.968910, 21.859182, 3, 'tr_0 tr_440000 tr_441700', 1);
INSERT INTO `sys_area`
VALUES (441721, '阳西县', 441700, '阳西', NULL, NULL, 'Y', 111.617554, 21.753670, 3, 'tr_0 tr_440000 tr_441700', 4);
INSERT INTO `sys_area`
VALUES (441723, '阳东县', 441700, '阳东', NULL, NULL, 'Y', 112.011269, 21.864729, 3, 'tr_0 tr_440000 tr_441700', 3);
INSERT INTO `sys_area`
VALUES (441781, '阳春市', 441700, '阳春', NULL, NULL, 'Y', 111.790497, 22.169598, 3, 'tr_0 tr_440000 tr_441700', 2);
INSERT INTO `sys_area`
VALUES (441800, '清远市', 440000, '清远', NULL, NULL, 'Q', 113.051224, 23.685022, 2, 'tr_0 tr_440000', 12);
INSERT INTO `sys_area`
VALUES (441802, '清城区', 441800, '清城', NULL, NULL, 'Q', 113.048698, 23.688976, 3, 'tr_0 tr_440000 tr_441800', 5);
INSERT INTO `sys_area`
VALUES (441821, '佛冈县', 441800, '佛冈', NULL, NULL, 'F', 113.534096, 23.866739, 3, 'tr_0 tr_440000 tr_441800', 1);
INSERT INTO `sys_area`
VALUES (441823, '阳山县', 441800, '阳山', NULL, NULL, 'Y', 112.634018, 24.470285, 3, 'tr_0 tr_440000 tr_441800', 7);
INSERT INTO `sys_area`
VALUES (441825, '连山壮族瑶族自治县', 441800, '连山', NULL, NULL, 'L', 112.086555, 24.567270, 3, 'tr_0 tr_440000 tr_441800', 3);
INSERT INTO `sys_area`
VALUES (441826, '连南瑶族自治县', 441800, '连南', NULL, NULL, 'L', 112.290810, 24.719097, 3, 'tr_0 tr_440000 tr_441800', 2);
INSERT INTO `sys_area`
VALUES (441827, '清新区', 441800, '清新', NULL, NULL, 'Q', 113.015205, 23.736950, 3, 'tr_0 tr_440000 tr_441800', 6);
INSERT INTO `sys_area`
VALUES (441881, '英德市', 441800, '英德', NULL, NULL, 'Y', 113.405403, 24.186119, 3, 'tr_0 tr_440000 tr_441800', 8);
INSERT INTO `sys_area`
VALUES (441882, '连州市', 441800, '连州', NULL, NULL, 'L', 112.379272, 24.783966, 3, 'tr_0 tr_440000 tr_441800', 4);
INSERT INTO `sys_area`
VALUES (441900, '东莞市', 440000, '东莞', NULL, NULL, 'D', 113.746262, 23.046238, 2, 'tr_0 tr_440000', 2);
INSERT INTO `sys_area`
VALUES (442000, '中山市', 440000, '中山', NULL, NULL, 'Z', 113.382393, 22.521112, 2, 'tr_0 tr_440000', 21);
INSERT INTO `sys_area`
VALUES (442101, '东沙群岛', 440000, '东沙', NULL, NULL, 'D', 112.552948, 21.810463, 2, 'tr_0 tr_440000', 3);
INSERT INTO `sys_area`
VALUES (445100, '潮州市', 440000, '潮州', NULL, NULL, 'C', 116.632301, 23.661701, 2, 'tr_0 tr_440000', 1);
INSERT INTO `sys_area`
VALUES (445102, '湘桥区', 445100, '湘桥', NULL, NULL, 'X', 116.633652, 23.664675, 3, 'tr_0 tr_440000 tr_445100', 3);
INSERT INTO `sys_area`
VALUES (445121, '潮安区', 445100, '潮安', NULL, NULL, 'C', 116.679314, 23.461012, 3, 'tr_0 tr_440000 tr_445100', 1);
INSERT INTO `sys_area`
VALUES (445122, '饶平县', 445100, '饶平', NULL, NULL, 'R', 117.002052, 23.668171, 3, 'tr_0 tr_440000 tr_445100', 2);
INSERT INTO `sys_area`
VALUES (445200, '揭阳市', 440000, '揭阳', NULL, NULL, 'J', 116.355736, 23.543777, 2, 'tr_0 tr_440000', 9);
INSERT INTO `sys_area`
VALUES (445202, '榕城区', 445200, '榕城', NULL, NULL, 'Z', 116.357048, 23.535524, 3, 'tr_0 tr_440000 tr_445200', 5);
INSERT INTO `sys_area`
VALUES (445221, '揭东区', 445200, '揭东', NULL, NULL, 'J', 116.412949, 23.569887, 3, 'tr_0 tr_440000 tr_445200', 2);
INSERT INTO `sys_area`
VALUES (445222, '揭西县', 445200, '揭西', NULL, NULL, 'J', 115.838707, 23.427299, 3, 'tr_0 tr_440000 tr_445200', 3);
INSERT INTO `sys_area`
VALUES (445224, '惠来县', 445200, '惠来', NULL, NULL, 'H', 116.295830, 23.029835, 3, 'tr_0 tr_440000 tr_445200', 1);
INSERT INTO `sys_area`
VALUES (445281, '普宁市', 445200, '普宁', NULL, NULL, 'P', 116.165085, 23.297880, 3, 'tr_0 tr_440000 tr_445200', 4);
INSERT INTO `sys_area`
VALUES (445300, '云浮市', 440000, '云浮', NULL, NULL, 'Y', 112.044441, 22.929802, 2, 'tr_0 tr_440000', 18);
INSERT INTO `sys_area`
VALUES (445302, '云城区', 445300, '云城', NULL, NULL, 'Y', 112.044708, 22.930826, 3, 'tr_0 tr_440000 tr_445300', 5);
INSERT INTO `sys_area`
VALUES (445321, '新兴县', 445300, '新兴', NULL, NULL, 'X', 112.230827, 22.703203, 3, 'tr_0 tr_440000 tr_445300', 2);
INSERT INTO `sys_area`
VALUES (445322, '郁南县', 445300, '郁南', NULL, NULL, 'Y', 111.535919, 23.237709, 3, 'tr_0 tr_440000 tr_445300', 3);
INSERT INTO `sys_area`
VALUES (445323, '云安县', 445300, '云安', NULL, NULL, 'Y', 112.005608, 23.073153, 3, 'tr_0 tr_440000 tr_445300', 4);
INSERT INTO `sys_area`
VALUES (445381, '罗定市', 445300, '罗定', NULL, NULL, 'L', 111.578201, 22.765415, 3, 'tr_0 tr_440000 tr_445300', 1);
INSERT INTO `sys_area`
VALUES (450000, '广西壮族自治区', 0, '广西', NULL, NULL, 'G', 108.320007, 22.824020, 1, 'tr_0', 20);
INSERT INTO `sys_area`
VALUES (450100, '南宁市', 450000, '南宁', NULL, NULL, 'N', 108.320007, 22.824020, 2, 'tr_0 tr_450000', 11);
INSERT INTO `sys_area`
VALUES (450102, '兴宁区', 450100, '兴宁', NULL, NULL, 'X', 108.320190, 22.819511, 3, 'tr_0 tr_450000 tr_450100', 10);
INSERT INTO `sys_area`
VALUES (450103, '青秀区', 450100, '青秀', NULL, NULL, 'Q', 108.346115, 22.816614, 3, 'tr_0 tr_450000 tr_450100', 7);
INSERT INTO `sys_area`
VALUES (450105, '江南区', 450100, '江南', NULL, NULL, 'J', 108.310478, 22.799593, 3, 'tr_0 tr_450000 tr_450100', 3);
INSERT INTO `sys_area`
VALUES (450107, '西乡塘区', 450100, '西乡塘', NULL, NULL, 'X', 108.306900, 22.832779, 3, 'tr_0 tr_450000 tr_450100', 11);
INSERT INTO `sys_area`
VALUES (450108, '良庆区', 450100, '良庆', NULL, NULL, 'L', 108.322105, 22.759090, 3, 'tr_0 tr_450000 tr_450100', 4);
INSERT INTO `sys_area`
VALUES (450109, '邕宁区', 450100, '邕宁', NULL, NULL, 'Z', 108.484253, 22.756598, 3, 'tr_0 tr_450000 tr_450100', 12);
INSERT INTO `sys_area`
VALUES (450122, '武鸣县', 450100, '武鸣', NULL, NULL, 'W', 108.280716, 23.157164, 3, 'tr_0 tr_450000 tr_450100', 9);
INSERT INTO `sys_area`
VALUES (450123, '隆安县', 450100, '隆安', NULL, NULL, 'L', 107.688660, 23.174763, 3, 'tr_0 tr_450000 tr_450100', 5);
INSERT INTO `sys_area`
VALUES (450124, '马山县', 450100, '马山', NULL, NULL, 'M', 108.172905, 23.711758, 3, 'tr_0 tr_450000 tr_450100', 6);
INSERT INTO `sys_area`
VALUES (450125, '上林县', 450100, '上林', NULL, NULL, 'S', 108.603935, 23.431768, 3, 'tr_0 tr_450000 tr_450100', 8);
INSERT INTO `sys_area`
VALUES (450126, '宾阳县', 450100, '宾阳', NULL, NULL, 'B', 108.816734, 23.216885, 3, 'tr_0 tr_450000 tr_450100', 1);
INSERT INTO `sys_area`
VALUES (450127, '横县', 450100, '横县', NULL, NULL, 'H', 109.270988, 22.687429, 3, 'tr_0 tr_450000 tr_450100', 2);
INSERT INTO `sys_area`
VALUES (450200, '柳州市', 450000, '柳州', NULL, NULL, 'L', 109.411705, 24.314617, 2, 'tr_0 tr_450000', 10);
INSERT INTO `sys_area`
VALUES (450202, '城中区', 450200, '城中', NULL, NULL, 'C', 109.411751, 24.312325, 3, 'tr_0 tr_450000 tr_450200', 1);
INSERT INTO `sys_area`
VALUES (450203, '鱼峰区', 450200, '鱼峰', NULL, NULL, 'Y', 109.415367, 24.303848, 3, 'tr_0 tr_450000 tr_450200', 10);
INSERT INTO `sys_area`
VALUES (450204, '柳南区', 450200, '柳南', NULL, NULL, 'L', 109.395935, 24.287012, 3, 'tr_0 tr_450000 tr_450200', 5);
INSERT INTO `sys_area`
VALUES (450205, '柳北区', 450200, '柳北', NULL, NULL, 'L', 109.406578, 24.359144, 3, 'tr_0 tr_450000 tr_450200', 2);
INSERT INTO `sys_area`
VALUES (450206, '柳江区', 450200, '柳江', NULL, NULL, 'L', 109.334503, 24.257511, 3, 'tr_0 tr_450000 tr_450200', 4);
INSERT INTO `sys_area`
VALUES (450222, '柳城县', 450200, '柳城', NULL, NULL, 'L', 109.245811, 24.655121, 3, 'tr_0 tr_450000 tr_450200', 3);
INSERT INTO `sys_area`
VALUES (450223, '鹿寨县', 450200, '鹿寨', NULL, NULL, 'L', 109.740807, 24.483404, 3, 'tr_0 tr_450000 tr_450200', 6);
INSERT INTO `sys_area`
VALUES (450224, '融安县', 450200, '融安', NULL, NULL, 'R', 109.403618, 25.214703, 3, 'tr_0 tr_450000 tr_450200', 7);
INSERT INTO `sys_area`
VALUES (450225, '融水苗族自治县', 450200, '融水', NULL, NULL, 'R', 109.252747, 25.068811, 3, 'tr_0 tr_450000 tr_450200', 8);
INSERT INTO `sys_area`
VALUES (450226, '三江侗族自治县', 450200, '三江', NULL, NULL, 'S', 109.614845, 25.785530, 3, 'tr_0 tr_450000 tr_450200', 9);
INSERT INTO `sys_area`
VALUES (450300, '桂林市', 450000, '桂林', NULL, NULL, 'G', 110.299118, 25.274216, 2, 'tr_0 tr_450000', 6);
INSERT INTO `sys_area`
VALUES (450302, '秀峰区', 450300, '秀峰', NULL, NULL, 'X', 110.292442, 25.278543, 3, 'tr_0 tr_450000 tr_450300', 13);
INSERT INTO `sys_area`
VALUES (450303, '叠彩区', 450300, '叠彩', NULL, NULL, 'D', 110.300781, 25.301334, 3, 'tr_0 tr_450000 tr_450300', 1);
INSERT INTO `sys_area`
VALUES (450304, '象山区', 450300, '象山', NULL, NULL, 'X', 110.284882, 25.261986, 3, 'tr_0 tr_450000 tr_450300', 11);
INSERT INTO `sys_area`
VALUES (450305, '七星区', 450300, '七星', NULL, NULL, 'Q', 110.317574, 25.254339, 3, 'tr_0 tr_450000 tr_450300', 9);
INSERT INTO `sys_area`
VALUES (450311, '雁山区', 450300, '雁山', NULL, NULL, 'Y', 110.305664, 25.077646, 3, 'tr_0 tr_450000 tr_450300', 15);
INSERT INTO `sys_area`
VALUES (450321, '阳朔县', 450300, '阳朔', NULL, NULL, 'Y', 110.494698, 24.775339, 3, 'tr_0 tr_450000 tr_450300', 14);
INSERT INTO `sys_area`
VALUES (450322, '临桂区', 450300, '临桂', NULL, NULL, 'L', 110.205490, 25.246258, 3, 'tr_0 tr_450000 tr_450300', 5);
INSERT INTO `sys_area`
VALUES (450323, '灵川县', 450300, '灵川', NULL, NULL, 'L', 110.325714, 25.408541, 3, 'tr_0 tr_450000 tr_450300', 4);
INSERT INTO `sys_area`
VALUES (450324, '全州县', 450300, '全州', NULL, NULL, 'Q', 111.072990, 25.929897, 3, 'tr_0 tr_450000 tr_450300', 10);
INSERT INTO `sys_area`
VALUES (450325, '兴安县', 450300, '兴安', NULL, NULL, 'X', 110.670784, 25.609554, 3, 'tr_0 tr_450000 tr_450300', 12);
INSERT INTO `sys_area`
VALUES (450326, '永福县', 450300, '永福', NULL, NULL, 'Y', 109.989204, 24.986692, 3, 'tr_0 tr_450000 tr_450300', 16);
INSERT INTO `sys_area`
VALUES (450327, '灌阳县', 450300, '灌阳', NULL, NULL, 'G', 111.160248, 25.489098, 3, 'tr_0 tr_450000 tr_450300', 3);
INSERT INTO `sys_area`
VALUES (450328, '龙胜各族自治县', 450300, '龙胜', NULL, NULL, 'L', 110.009422, 25.796429, 3, 'tr_0 tr_450000 tr_450300', 7);
INSERT INTO `sys_area`
VALUES (450329, '资源县', 450300, '资源', NULL, NULL, 'Z', 110.642586, 26.034201, 3, 'tr_0 tr_450000 tr_450300', 17);
INSERT INTO `sys_area`
VALUES (450330, '平乐县', 450300, '平乐', NULL, NULL, 'P', 110.642822, 24.632215, 3, 'tr_0 tr_450000 tr_450300', 8);
INSERT INTO `sys_area`
VALUES (450331, '荔浦县', 450300, '荔浦', NULL, NULL, 'L', 110.400146, 24.497786, 3, 'tr_0 tr_450000 tr_450300', 6);
INSERT INTO `sys_area`
VALUES (450332, '恭城瑶族自治县', 450300, '恭城', NULL, NULL, 'G', 110.829521, 24.833612, 3, 'tr_0 tr_450000 tr_450300', 2);
INSERT INTO `sys_area`
VALUES (450400, '梧州市', 450000, '梧州', NULL, NULL, 'W', 111.297607, 23.474804, 2, 'tr_0 tr_450000', 13);
INSERT INTO `sys_area`
VALUES (450403, '万秀区', 450400, '万秀', NULL, NULL, 'W', 111.315819, 23.471317, 3, 'tr_0 tr_450000 tr_450400', 4);
INSERT INTO `sys_area`
VALUES (450405, '长洲区', 450400, '长洲', NULL, NULL, 'C', 111.275681, 23.477699, 3, 'tr_0 tr_450000 tr_450400', 3);
INSERT INTO `sys_area`
VALUES (450406, '龙圩区', 450400, '龙圩', NULL, NULL, 'L', 111.246033, 23.409960, 3, 'tr_0 tr_450000 tr_450400', 5);
INSERT INTO `sys_area`
VALUES (450421, '苍梧县', 450400, '苍梧', NULL, NULL, 'C', 111.544006, 23.845097, 3, 'tr_0 tr_450000 tr_450400', 1);
INSERT INTO `sys_area`
VALUES (450422, '藤县', 450400, '藤县', NULL, NULL, 'T', 110.931824, 23.373962, 3, 'tr_0 tr_450000 tr_450400', 7);
INSERT INTO `sys_area`
VALUES (450423, '蒙山县', 450400, '蒙山', NULL, NULL, 'M', 110.522598, 24.199829, 3, 'tr_0 tr_450000 tr_450400', 6);
INSERT INTO `sys_area`
VALUES (450481, '岑溪市', 450400, '岑溪', NULL, NULL, 'Z', 110.998116, 22.918406, 3, 'tr_0 tr_450000 tr_450400', 2);
INSERT INTO `sys_area`
VALUES (450500, '北海市', 450000, '北海', NULL, NULL, 'B', 109.119255, 21.473343, 2, 'tr_0 tr_450000', 1);
INSERT INTO `sys_area`
VALUES (450502, '海城区', 450500, '海城', NULL, NULL, 'H', 109.107529, 21.468443, 3, 'tr_0 tr_450000 tr_450500', 1);
INSERT INTO `sys_area`
VALUES (450503, '银海区', 450500, '银海', NULL, NULL, 'Y', 109.118706, 21.444908, 3, 'tr_0 tr_450000 tr_450500', 4);
INSERT INTO `sys_area`
VALUES (450512, '铁山港区', 450500, '铁山港', NULL, NULL, 'T', 109.450577, 21.592800, 3, 'tr_0 tr_450000 tr_450500', 3);
INSERT INTO `sys_area`
VALUES (450521, '合浦县', 450500, '合浦', NULL, NULL, 'H', 109.200691, 21.663553, 3, 'tr_0 tr_450000 tr_450500', 2);
INSERT INTO `sys_area`
VALUES (450600, '防城港市', 450000, '防城港', NULL, NULL, 'F', 108.345474, 21.614632, 2, 'tr_0 tr_450000', 4);
INSERT INTO `sys_area`
VALUES (450602, '港口区', 450600, '港口', NULL, NULL, 'G', 108.346283, 21.614407, 3, 'tr_0 tr_450000 tr_450600', 3);
INSERT INTO `sys_area`
VALUES (450603, '防城区', 450600, '防城', NULL, NULL, 'F', 108.358429, 21.764757, 3, 'tr_0 tr_450000 tr_450600', 2);
INSERT INTO `sys_area`
VALUES (450621, '上思县', 450600, '上思', NULL, NULL, 'S', 107.982140, 22.151423, 3, 'tr_0 tr_450000 tr_450600', 4);
INSERT INTO `sys_area`
VALUES (450681, '东兴市', 450600, '东兴', NULL, NULL, 'D', 107.970169, 21.541172, 3, 'tr_0 tr_450000 tr_450600', 1);
INSERT INTO `sys_area`
VALUES (450700, '钦州市', 450000, '钦州', NULL, NULL, 'Q', 108.624176, 21.967127, 2, 'tr_0 tr_450000', 12);
INSERT INTO `sys_area`
VALUES (450702, '钦南区', 450700, '钦南', NULL, NULL, 'Q', 108.626633, 21.966808, 3, 'tr_0 tr_450000 tr_450700', 4);
INSERT INTO `sys_area`
VALUES (450703, '钦北区', 450700, '钦北', NULL, NULL, 'Q', 108.449112, 22.132761, 3, 'tr_0 tr_450000 tr_450700', 3);
INSERT INTO `sys_area`
VALUES (450721, '灵山县', 450700, '灵山', NULL, NULL, 'L', 109.293465, 22.418041, 3, 'tr_0 tr_450000 tr_450700', 1);
INSERT INTO `sys_area`
VALUES (450722, '浦北县', 450700, '浦北', NULL, NULL, 'P', 109.556343, 22.268335, 3, 'tr_0 tr_450000 tr_450700', 2);
INSERT INTO `sys_area`
VALUES (450800, '贵港市', 450000, '贵港', NULL, NULL, 'G', 109.602142, 23.093599, 2, 'tr_0 tr_450000', 5);
INSERT INTO `sys_area`
VALUES (450802, '港北区', 450800, '港北', NULL, NULL, 'G', 109.594810, 23.107677, 3, 'tr_0 tr_450000 tr_450800', 1);
INSERT INTO `sys_area`
VALUES (450803, '港南区', 450800, '港南', NULL, NULL, 'G', 109.604668, 23.067516, 3, 'tr_0 tr_450000 tr_450800', 2);
INSERT INTO `sys_area`
VALUES (450804, '覃塘区', 450800, '覃塘', NULL, NULL, 'Z', 109.415695, 23.132814, 3, 'tr_0 tr_450000 tr_450800', 5);
INSERT INTO `sys_area`
VALUES (450821, '平南县', 450800, '平南', NULL, NULL, 'P', 110.397484, 23.544546, 3, 'tr_0 tr_450000 tr_450800', 4);
INSERT INTO `sys_area`
VALUES (450881, '桂平市', 450800, '桂平', NULL, NULL, 'G', 110.074669, 23.382473, 3, 'tr_0 tr_450000 tr_450800', 3);
INSERT INTO `sys_area`
VALUES (450900, '玉林市', 450000, '玉林', NULL, NULL, 'Y', 110.154396, 22.631359, 2, 'tr_0 tr_450000', 14);
INSERT INTO `sys_area`
VALUES (450902, '玉州区', 450900, '玉州', NULL, NULL, 'Y', 110.154915, 22.632132, 3, 'tr_0 tr_450000 tr_450900', 7);
INSERT INTO `sys_area`
VALUES (450903, '福绵区', 450900, '福绵', NULL, NULL, 'F', 110.051430, 22.579947, 3, 'tr_0 tr_450000 tr_450900', 3);
INSERT INTO `sys_area`
VALUES (450921, '容县', 450900, '容县', NULL, NULL, 'R', 110.552467, 22.856436, 3, 'tr_0 tr_450000 tr_450900', 5);
INSERT INTO `sys_area`
VALUES (450922, '陆川县', 450900, '陆川', NULL, NULL, 'L', 110.264839, 22.321054, 3, 'tr_0 tr_450000 tr_450900', 4);
INSERT INTO `sys_area`
VALUES (450923, '博白县', 450900, '博白', NULL, NULL, 'B', 109.980003, 22.271284, 3, 'tr_0 tr_450000 tr_450900', 2);
INSERT INTO `sys_area`
VALUES (450924, '兴业县', 450900, '兴业', NULL, NULL, 'X', 109.877769, 22.741871, 3, 'tr_0 tr_450000 tr_450900', 6);
INSERT INTO `sys_area`
VALUES (450981, '北流市', 450900, '北流', NULL, NULL, 'B', 110.348053, 22.701649, 3, 'tr_0 tr_450000 tr_450900', 1);
INSERT INTO `sys_area`
VALUES (451000, '百色市', 450000, '百色', NULL, NULL, 'B', 106.616287, 23.897741, 2, 'tr_0 tr_450000', 2);
INSERT INTO `sys_area`
VALUES (451002, '右江区', 451000, '右江', NULL, NULL, 'Y', 106.615730, 23.897675, 3, 'tr_0 tr_450000 tr_451000', 12);
INSERT INTO `sys_area`
VALUES (451021, '田阳县', 451000, '田阳', NULL, NULL, 'T', 106.904312, 23.736078, 3, 'tr_0 tr_450000 tr_451000', 10);
INSERT INTO `sys_area`
VALUES (451022, '田东县', 451000, '田东', NULL, NULL, 'T', 107.124260, 23.600445, 3, 'tr_0 tr_450000 tr_451000', 8);
INSERT INTO `sys_area`
VALUES (451023, '平果县', 451000, '平果', NULL, NULL, 'P', 107.580406, 23.320478, 3, 'tr_0 tr_450000 tr_451000', 7);
INSERT INTO `sys_area`
VALUES (451024, '德保县', 451000, '德保', NULL, NULL, 'D', 106.618164, 23.321465, 3, 'tr_0 tr_450000 tr_451000', 1);
INSERT INTO `sys_area`
VALUES (451025, '靖西县', 451000, '靖西', NULL, NULL, 'J', 106.417549, 23.134766, 3, 'tr_0 tr_450000 tr_451000', 2);
INSERT INTO `sys_area`
VALUES (451026, '那坡县', 451000, '那坡', NULL, NULL, 'N', 105.833549, 23.400785, 3, 'tr_0 tr_450000 tr_451000', 6);
INSERT INTO `sys_area`
VALUES (451027, '凌云县', 451000, '凌云', NULL, NULL, 'L', 106.564873, 24.345642, 3, 'tr_0 tr_450000 tr_451000', 4);
INSERT INTO `sys_area`
VALUES (451028, '乐业县', 451000, '乐业', NULL, NULL, 'L', 106.559639, 24.782204, 3, 'tr_0 tr_450000 tr_451000', 3);
INSERT INTO `sys_area`
VALUES (451029, '田林县', 451000, '田林', NULL, NULL, 'T', 106.235046, 24.290262, 3, 'tr_0 tr_450000 tr_451000', 9);
INSERT INTO `sys_area`
VALUES (451030, '西林县', 451000, '西林', NULL, NULL, 'X', 105.095024, 24.492041, 3, 'tr_0 tr_450000 tr_451000', 11);
INSERT INTO `sys_area`
VALUES (451031, '隆林各族自治县', 451000, '隆林', NULL, NULL, 'L', 105.342361, 24.774319, 3, 'tr_0 tr_450000 tr_451000', 5);
INSERT INTO `sys_area`
VALUES (451100, '贺州市', 450000, '贺州', NULL, NULL, 'H', 111.552055, 24.414141, 2, 'tr_0 tr_450000', 8);
INSERT INTO `sys_area`
VALUES (451102, '八步区', 451100, '八步', NULL, NULL, 'B', 111.551994, 24.412445, 3, 'tr_0 tr_450000 tr_451100', 1);
INSERT INTO `sys_area`
VALUES (451119, '平桂管理区', 451100, '平桂', NULL, NULL, 'P', 111.552055, 24.414141, 3, 'tr_0 tr_450000 tr_451100', 3);
INSERT INTO `sys_area`
VALUES (451121, '昭平县', 451100, '昭平', NULL, NULL, 'Z', 110.810867, 24.172958, 3, 'tr_0 tr_450000 tr_451100', 4);
INSERT INTO `sys_area`
VALUES (451122, '钟山县', 451100, '钟山', NULL, NULL, 'Z', 111.303627, 24.528566, 3, 'tr_0 tr_450000 tr_451100', 5);
INSERT INTO `sys_area`
VALUES (451123, '富川瑶族自治县', 451100, '富川', NULL, NULL, 'F', 111.277229, 24.818960, 3, 'tr_0 tr_450000 tr_451100', 2);
INSERT INTO `sys_area`
VALUES (451200, '河池市', 450000, '河池', NULL, NULL, 'H', 108.062103, 24.695898, 2, 'tr_0 tr_450000', 7);
INSERT INTO `sys_area`
VALUES (451202, '金城江区', 451200, '金城江', NULL, NULL, 'J', 108.062134, 24.695625, 3, 'tr_0 tr_450000 tr_451200', 7);
INSERT INTO `sys_area`
VALUES (451221, '南丹县', 451200, '南丹', NULL, NULL, 'N', 107.546608, 24.983192, 3, 'tr_0 tr_450000 tr_451200', 9);
INSERT INTO `sys_area`
VALUES (451222, '天峨县', 451200, '天峨', NULL, NULL, 'T', 107.174942, 24.985964, 3, 'tr_0 tr_450000 tr_451200', 10);
INSERT INTO `sys_area`
VALUES (451223, '凤山县', 451200, '凤山', NULL, NULL, 'F', 107.044594, 24.544561, 3, 'tr_0 tr_450000 tr_451200', 5);
INSERT INTO `sys_area`
VALUES (451224, '东兰县', 451200, '东兰', NULL, NULL, 'D', 107.373695, 24.509367, 3, 'tr_0 tr_450000 tr_451200', 3);
INSERT INTO `sys_area`
VALUES (451225, '罗城仫佬族自治县', 451200, '罗城', NULL, NULL, 'L', 108.902451, 24.779327, 3, 'tr_0 tr_450000 tr_451200', 8);
INSERT INTO `sys_area`
VALUES (451226, '环江毛南族自治县', 451200, '环江', NULL, NULL, 'H', 108.258667, 24.827627, 3, 'tr_0 tr_450000 tr_451200', 6);
INSERT INTO `sys_area`
VALUES (451227, '巴马瑶族自治县', 451200, '巴马', NULL, NULL, 'B', 107.253128, 24.139538, 3, 'tr_0 tr_450000 tr_451200', 1);
INSERT INTO `sys_area`
VALUES (451228, '都安瑶族自治县', 451200, '都安', NULL, NULL, 'D', 108.102760, 23.934963, 3, 'tr_0 tr_450000 tr_451200', 4);
INSERT INTO `sys_area`
VALUES (451229, '大化瑶族自治县', 451200, '大化', NULL, NULL, 'D', 107.994499, 23.739595, 3, 'tr_0 tr_450000 tr_451200', 2);
INSERT INTO `sys_area`
VALUES (451281, '宜州市', 451200, '宜州', NULL, NULL, 'Y', 108.653969, 24.492193, 3, 'tr_0 tr_450000 tr_451200', 11);
INSERT INTO `sys_area`
VALUES (451300, '来宾市', 450000, '来宾', NULL, NULL, 'L', 109.229774, 23.733767, 2, 'tr_0 tr_450000', 9);
INSERT INTO `sys_area`
VALUES (451302, '兴宾区', 451300, '兴宾', NULL, NULL, 'X', 109.230537, 23.732925, 3, 'tr_0 tr_450000 tr_451300', 6);
INSERT INTO `sys_area`
VALUES (451321, '忻城县', 451300, '忻城', NULL, NULL, 'X', 108.667358, 24.064779, 3, 'tr_0 tr_450000 tr_451300', 5);
INSERT INTO `sys_area`
VALUES (451322, '象州县', 451300, '象州', NULL, NULL, 'X', 109.684555, 23.959824, 3, 'tr_0 tr_450000 tr_451300', 4);
INSERT INTO `sys_area`
VALUES (451323, '武宣县', 451300, '武宣', NULL, NULL, 'W', 109.662872, 23.604162, 3, 'tr_0 tr_450000 tr_451300', 3);
INSERT INTO `sys_area`
VALUES (451324, '金秀瑶族自治县', 451300, '金秀', NULL, NULL, 'J', 110.188553, 24.134941, 3, 'tr_0 tr_450000 tr_451300', 2);
INSERT INTO `sys_area`
VALUES (451381, '合山市', 451300, '合山', NULL, NULL, 'H', 108.888580, 23.813110, 3, 'tr_0 tr_450000 tr_451300', 1);
INSERT INTO `sys_area`
VALUES (451400, '崇左市', 450000, '崇左', NULL, NULL, 'C', 107.353928, 22.404108, 2, 'tr_0 tr_450000', 3);
INSERT INTO `sys_area`
VALUES (451402, '江州区', 451400, '江州', NULL, NULL, 'J', 107.354446, 22.404690, 3, 'tr_0 tr_450000 tr_451400', 3);
INSERT INTO `sys_area`
VALUES (451421, '扶绥县', 451400, '扶绥', NULL, NULL, 'F', 107.911530, 22.635820, 3, 'tr_0 tr_450000 tr_451400', 2);
INSERT INTO `sys_area`
VALUES (451422, '宁明县', 451400, '宁明', NULL, NULL, 'N', 107.067619, 22.131353, 3, 'tr_0 tr_450000 tr_451400', 5);
INSERT INTO `sys_area`
VALUES (451423, '龙州县', 451400, '龙州', NULL, NULL, 'L', 106.857506, 22.343716, 3, 'tr_0 tr_450000 tr_451400', 4);
INSERT INTO `sys_area`
VALUES (451424, '大新县', 451400, '大新', NULL, NULL, 'D', 107.200806, 22.833368, 3, 'tr_0 tr_450000 tr_451400', 1);
INSERT INTO `sys_area`
VALUES (451425, '天等县', 451400, '天等', NULL, NULL, 'T', 107.142441, 23.082483, 3, 'tr_0 tr_450000 tr_451400', 7);
INSERT INTO `sys_area`
VALUES (451481, '凭祥市', 451400, '凭祥', NULL, NULL, 'P', 106.759041, 22.108883, 3, 'tr_0 tr_450000 tr_451400', 6);
INSERT INTO `sys_area`
VALUES (460000, '海南省', 0, '海南', NULL, NULL, 'H', 110.331192, 20.031971, 1, 'tr_0', 21);
INSERT INTO `sys_area`
VALUES (460100, '海口市', 460000, '海口', NULL, NULL, 'H', 110.331192, 20.031971, 2, 'tr_0 tr_460000', 8);
INSERT INTO `sys_area`
VALUES (460105, '秀英区', 460100, '秀英', NULL, NULL, 'X', 110.282394, 20.008144, 3, 'tr_0 tr_460000 tr_460100', 4);
INSERT INTO `sys_area`
VALUES (460106, '龙华区', 460100, '龙华', NULL, NULL, 'L', 110.330376, 20.031027, 3, 'tr_0 tr_460000 tr_460100', 1);
INSERT INTO `sys_area`
VALUES (460107, '琼山区', 460100, '琼山', NULL, NULL, 'Q', 110.354721, 20.001051, 3, 'tr_0 tr_460000 tr_460100', 3);
INSERT INTO `sys_area`
VALUES (460108, '美兰区', 460100, '美兰', NULL, NULL, 'M', 110.356567, 20.030741, 3, 'tr_0 tr_460000 tr_460100', 2);
INSERT INTO `sys_area`
VALUES (460200, '三亚市', 460000, '三亚', NULL, NULL, 'S', 109.508270, 18.247871, 2, 'tr_0 tr_460000', 15);
INSERT INTO `sys_area`
VALUES (460300, '三沙市', 460000, '三沙', NULL, NULL, 'S', 112.348824, 16.831039, 2, 'tr_0 tr_460000', 14);
INSERT INTO `sys_area`
VALUES (460321, '西沙群岛', 460300, '西沙', NULL, NULL, 'X', 111.792946, 16.204546, 3, 'tr_0 tr_460000 tr_460300', 2);
INSERT INTO `sys_area`
VALUES (460322, '南沙群岛', 460300, '南沙', NULL, NULL, 'N', 116.750000, 11.471888, 3, 'tr_0 tr_460000 tr_460300', 1);
INSERT INTO `sys_area`
VALUES (460323, '中沙群岛的岛礁及其海域', 460300, '中沙', NULL, NULL, 'Z', 117.740074, 15.112856, 3, 'tr_0 tr_460000 tr_460300', 3);
INSERT INTO `sys_area`
VALUES (469001, '五指山市', 460000, '五指山', NULL, NULL, 'W', 109.516663, 18.776920, 2, 'tr_0 tr_460000', 19);
INSERT INTO `sys_area`
VALUES (469002, '琼海市', 460000, '琼海', NULL, NULL, 'Q', 110.466782, 19.246012, 2, 'tr_0 tr_460000', 12);
INSERT INTO `sys_area`
VALUES (469003, '儋州市', 460000, '儋州', NULL, NULL, 'Z', 109.576782, 19.517487, 2, 'tr_0 tr_460000', 5);
INSERT INTO `sys_area`
VALUES (469005, '文昌市', 460000, '文昌', NULL, NULL, 'W', 110.753975, 19.612986, 2, 'tr_0 tr_460000', 18);
INSERT INTO `sys_area`
VALUES (469006, '万宁市', 460000, '万宁', NULL, NULL, 'W', 110.388794, 18.796215, 2, 'tr_0 tr_460000', 17);
INSERT INTO `sys_area`
VALUES (469007, '东方市', 460000, '东方', NULL, NULL, 'D', 108.653786, 19.101980, 2, 'tr_0 tr_460000', 7);
INSERT INTO `sys_area`
VALUES (469022, '屯昌县', 460000, '屯昌', NULL, NULL, 'T', 110.102776, 19.362917, 2, 'tr_0 tr_460000', 16);
INSERT INTO `sys_area`
VALUES (469025, '定安县', 460000, '定安', NULL, NULL, 'D', 110.349236, 19.684965, 2, 'tr_0 tr_460000', 6);
INSERT INTO `sys_area`
VALUES (469026, '昌江黎族自治县', 460000, '昌江', NULL, NULL, 'C', 109.053352, 19.260967, 2, 'tr_0 tr_460000', 3);
INSERT INTO `sys_area`
VALUES (469027, '澄迈县', 460000, '澄迈', NULL, NULL, 'C', 110.007149, 19.737095, 2, 'tr_0 tr_460000', 4);
INSERT INTO `sys_area`
VALUES (469028, '临高县', 460000, '临高', NULL, NULL, 'L', 109.687698, 19.908293, 2, 'tr_0 tr_460000', 10);
INSERT INTO `sys_area`
VALUES (469030, '白沙黎族自治县', 460000, '白沙', NULL, NULL, 'B', 109.452606, 19.224585, 2, 'tr_0 tr_460000', 1);
INSERT INTO `sys_area`
VALUES (469033, '乐东黎族自治县', 460000, '乐东', NULL, NULL, 'L', 109.175446, 18.747580, 2, 'tr_0 tr_460000', 9);
INSERT INTO `sys_area`
VALUES (469034, '陵水黎族自治县', 460000, '陵水', NULL, NULL, 'L', 110.037216, 18.505007, 2, 'tr_0 tr_460000', 11);
INSERT INTO `sys_area`
VALUES (469035, '保亭黎族苗族自治县', 460000, '保亭', NULL, NULL, 'B', 109.702454, 18.636372, 2, 'tr_0 tr_460000', 2);
INSERT INTO `sys_area`
VALUES (469036, '琼中黎族苗族自治县', 460000, '琼中', NULL, NULL, 'Q', 109.839996, 19.035570, 2, 'tr_0 tr_460000', 13);
INSERT INTO `sys_area`
VALUES (500000, '重庆', 0, '重庆', NULL, NULL, 'Z', 106.504959, 29.533155, 1, 'tr_0', 22);
INSERT INTO `sys_area`
VALUES (500100, '重庆市', 500000, '重庆', NULL, NULL, 'Z', 106.504959, 29.533155, 2, 'tr_0 tr_500000', 1);
INSERT INTO `sys_area`
VALUES (500101, '万州区', 500100, '万州', NULL, NULL, 'W', 108.380249, 30.807808, 3, 'tr_0 tr_500000 tr_500100', 28);
INSERT INTO `sys_area`
VALUES (500102, '涪陵区', 500100, '涪陵', NULL, NULL, 'F', 107.394905, 29.703651, 3, 'tr_0 tr_500000 tr_500100', 11);
INSERT INTO `sys_area`
VALUES (500103, '渝中区', 500100, '渝中', NULL, NULL, 'Y', 106.562881, 29.556742, 3, 'tr_0 tr_500000 tr_500100', 37);
INSERT INTO `sys_area`
VALUES (500104, '大渡口区', 500100, '大渡口', NULL, NULL, 'D', 106.486130, 29.481003, 3, 'tr_0 tr_500000 tr_500100', 6);
INSERT INTO `sys_area`
VALUES (500105, '江北区', 500100, '江北', NULL, NULL, 'J', 106.532845, 29.575352, 3, 'tr_0 tr_500000 tr_500100', 13);
INSERT INTO `sys_area`
VALUES (500106, '沙坪坝区', 500100, '沙坪坝', NULL, NULL, 'S', 106.454201, 29.541224, 3, 'tr_0 tr_500000 tr_500100', 24);
INSERT INTO `sys_area`
VALUES (500107, '九龙坡区', 500100, '九龙坡', NULL, NULL, 'J', 106.480988, 29.523493, 3, 'tr_0 tr_500000 tr_500100', 15);
INSERT INTO `sys_area`
VALUES (500108, '南岸区', 500100, '南岸', NULL, NULL, 'N', 106.560814, 29.523993, 3, 'tr_0 tr_500000 tr_500100', 18);
INSERT INTO `sys_area`
VALUES (500109, '北碚区', 500100, '北碚', NULL, NULL, 'B', 106.437866, 29.825430, 3, 'tr_0 tr_500000 tr_500100', 2);
INSERT INTO `sys_area`
VALUES (500112, '渝北区', 500100, '渝北', NULL, NULL, 'Y', 106.512848, 29.601452, 3, 'tr_0 tr_500000 tr_500100', 35);
INSERT INTO `sys_area`
VALUES (500113, '巴南区', 500100, '巴南', NULL, NULL, 'B', 106.519424, 29.381920, 3, 'tr_0 tr_500000 tr_500100', 1);
INSERT INTO `sys_area`
VALUES (500114, '黔江区', 500100, '黔江', NULL, NULL, 'Q', 108.782578, 29.527548, 3, 'tr_0 tr_500000 tr_500100', 21);
INSERT INTO `sys_area`
VALUES (500115, '长寿区', 500100, '长寿', NULL, NULL, 'C', 107.074852, 29.833672, 3, 'tr_0 tr_500000 tr_500100', 4);
INSERT INTO `sys_area`
VALUES (500222, '綦江区', 500100, '綦江', NULL, NULL, 'Z', 106.651421, 29.028091, 3, 'tr_0 tr_500000 tr_500100', 22);
INSERT INTO `sys_area`
VALUES (500223, '潼南县', 500100, '潼南', NULL, NULL, 'Z', 105.841820, 30.189554, 3, 'tr_0 tr_500000 tr_500100', 27);
INSERT INTO `sys_area`
VALUES (500224, '铜梁县', 500100, '铜梁', NULL, NULL, 'T', 106.054947, 29.839945, 3, 'tr_0 tr_500000 tr_500100', 26);
INSERT INTO `sys_area`
VALUES (500225, '大足区', 500100, '大足', NULL, NULL, 'D', 105.715317, 29.700499, 3, 'tr_0 tr_500000 tr_500100', 7);
INSERT INTO `sys_area`
VALUES (500226, '荣昌县', 500100, '荣昌', NULL, NULL, 'R', 105.594063, 29.403627, 3, 'tr_0 tr_500000 tr_500100', 23);
INSERT INTO `sys_area`
VALUES (500227, '璧山县', 500100, '璧山', NULL, NULL, 'Z', 106.231125, 29.593580, 3, 'tr_0 tr_500000 tr_500100', 3);
INSERT INTO `sys_area`
VALUES (500228, '梁平县', 500100, '梁平', NULL, NULL, 'L', 107.800034, 30.672169, 3, 'tr_0 tr_500000 tr_500100', 17);
INSERT INTO `sys_area`
VALUES (500229, '城口县', 500100, '城口', NULL, NULL, 'C', 108.664902, 31.946293, 3, 'tr_0 tr_500000 tr_500100', 5);
INSERT INTO `sys_area`
VALUES (500230, '丰都县', 500100, '丰都', NULL, NULL, 'F', 107.732483, 29.866425, 3, 'tr_0 tr_500000 tr_500100', 9);
INSERT INTO `sys_area`
VALUES (500231, '垫江县', 500100, '垫江', NULL, NULL, 'D', 107.348694, 30.330011, 3, 'tr_0 tr_500000 tr_500100', 8);
INSERT INTO `sys_area`
VALUES (500232, '武隆县', 500100, '武隆', NULL, NULL, 'W', 107.756554, 29.323759, 3, 'tr_0 tr_500000 tr_500100', 29);
INSERT INTO `sys_area`
VALUES (500233, '忠县', 500100, '忠县', NULL, NULL, 'Z', 108.037521, 30.291536, 3, 'tr_0 tr_500000 tr_500100', 38);
INSERT INTO `sys_area`
VALUES (500234, '开县', 500100, '开县', NULL, NULL, 'K', 108.413315, 31.167734, 3, 'tr_0 tr_500000 tr_500100', 16);
INSERT INTO `sys_area`
VALUES (500235, '云阳县', 500100, '云阳', NULL, NULL, 'Y', 108.697701, 30.930529, 3, 'tr_0 tr_500000 tr_500100', 36);
INSERT INTO `sys_area`
VALUES (500236, '奉节县', 500100, '奉节', NULL, NULL, 'F', 109.465775, 31.019966, 3, 'tr_0 tr_500000 tr_500100', 10);
INSERT INTO `sys_area`
VALUES (500237, '巫山县', 500100, '巫山', NULL, NULL, 'W', 109.878929, 31.074842, 3, 'tr_0 tr_500000 tr_500100', 30);
INSERT INTO `sys_area`
VALUES (500238, '巫溪县', 500100, '巫溪', NULL, NULL, 'W', 109.628914, 31.396601, 3, 'tr_0 tr_500000 tr_500100', 31);
INSERT INTO `sys_area`
VALUES (500240, '石柱土家族自治县', 500100, '石柱', NULL, NULL, 'S', 108.112450, 29.998529, 3, 'tr_0 tr_500000 tr_500100', 25);
INSERT INTO `sys_area`
VALUES (500241, '秀山土家族苗族自治县', 500100, '秀山', NULL, NULL, 'X', 108.996040, 28.444773, 3, 'tr_0 tr_500000 tr_500100', 32);
INSERT INTO `sys_area`
VALUES (500242, '酉阳土家族苗族自治县', 500100, '酉阳', NULL, NULL, 'Y', 108.767204, 28.839828, 3, 'tr_0 tr_500000 tr_500100', 34);
INSERT INTO `sys_area`
VALUES (500243, '彭水苗族土家族自治县', 500100, '彭水', NULL, NULL, 'P', 108.166550, 29.293856, 3, 'tr_0 tr_500000 tr_500100', 20);
INSERT INTO `sys_area`
VALUES (500381, '江津区', 500100, '江津', NULL, NULL, 'J', 106.253159, 29.283386, 3, 'tr_0 tr_500000 tr_500100', 14);
INSERT INTO `sys_area`
VALUES (500382, '合川区', 500100, '合川', NULL, NULL, 'H', 106.265556, 29.990993, 3, 'tr_0 tr_500000 tr_500100', 12);
INSERT INTO `sys_area`
VALUES (500383, '永川区', 500100, '永川', NULL, NULL, 'Y', 105.894714, 29.348747, 3, 'tr_0 tr_500000 tr_500100', 33);
INSERT INTO `sys_area`
VALUES (500384, '南川区', 500100, '南川', NULL, NULL, 'N', 107.098152, 29.156647, 3, 'tr_0 tr_500000 tr_500100', 19);
INSERT INTO `sys_area`
VALUES (510000, '四川省', 0, '四川', NULL, NULL, 'S', 104.065735, 30.659462, 1, 'tr_0', 23);
INSERT INTO `sys_area`
VALUES (510100, '成都市', 510000, '成都', NULL, NULL, 'C', 104.065735, 30.659462, 2, 'tr_0 tr_510000', 3);
INSERT INTO `sys_area`
VALUES (510104, '锦江区', 510100, '锦江', NULL, NULL, 'J', 104.080986, 30.657688, 3, 'tr_0 tr_510000 tr_510100', 5);
INSERT INTO `sys_area`
VALUES (510105, '青羊区', 510100, '青羊', NULL, NULL, 'Q', 104.055733, 30.667648, 3, 'tr_0 tr_510000 tr_510100', 13);
INSERT INTO `sys_area`
VALUES (510106, '金牛区', 510100, '金牛', NULL, NULL, 'J', 104.043488, 30.692059, 3, 'tr_0 tr_510000 tr_510100', 6);
INSERT INTO `sys_area`
VALUES (510107, '武侯区', 510100, '武侯', NULL, NULL, 'W', 104.051666, 30.630861, 3, 'tr_0 tr_510000 tr_510100', 17);
INSERT INTO `sys_area`
VALUES (510108, '成华区', 510100, '成华', NULL, NULL, 'C', 104.103081, 30.660275, 3, 'tr_0 tr_510000 tr_510100', 1);
INSERT INTO `sys_area`
VALUES (510112, '龙泉驿区', 510100, '龙泉驿', NULL, NULL, 'L', 104.269180, 30.560650, 3, 'tr_0 tr_510000 tr_510100', 8);
INSERT INTO `sys_area`
VALUES (510113, '青白江区', 510100, '青白江', NULL, NULL, 'Q', 104.254936, 30.883438, 3, 'tr_0 tr_510000 tr_510100', 12);
INSERT INTO `sys_area`
VALUES (510114, '新都区', 510100, '新都', NULL, NULL, 'X', 104.160217, 30.824223, 3, 'tr_0 tr_510000 tr_510100', 18);
INSERT INTO `sys_area`
VALUES (510115, '温江区', 510100, '温江', NULL, NULL, 'W', 103.836777, 30.697996, 3, 'tr_0 tr_510000 tr_510100', 16);
INSERT INTO `sys_area`
VALUES (510121, '金堂县', 510100, '金堂', NULL, NULL, 'J', 104.415604, 30.858418, 3, 'tr_0 tr_510000 tr_510100', 7);
INSERT INTO `sys_area`
VALUES (510122, '双流县', 510100, '双流', NULL, NULL, 'S', 103.922707, 30.573242, 3, 'tr_0 tr_510000 tr_510100', 15);
INSERT INTO `sys_area`
VALUES (510124, '郫县', 510100, '郫县', NULL, NULL, 'Z', 103.887840, 30.808752, 3, 'tr_0 tr_510000 tr_510100', 10);
INSERT INTO `sys_area`
VALUES (510129, '大邑县', 510100, '大邑', NULL, NULL, 'D', 103.522400, 30.586601, 3, 'tr_0 tr_510000 tr_510100', 3);
INSERT INTO `sys_area`
VALUES (510131, '蒲江县', 510100, '蒲江', NULL, NULL, 'P', 103.511543, 30.194359, 3, 'tr_0 tr_510000 tr_510100', 11);
INSERT INTO `sys_area`
VALUES (510132, '新津县', 510100, '新津', NULL, NULL, 'X', 103.812447, 30.414284, 3, 'tr_0 tr_510000 tr_510100', 19);
INSERT INTO `sys_area`
VALUES (510181, '都江堰市', 510100, '都江堰', NULL, NULL, 'D', 103.627899, 30.991140, 3, 'tr_0 tr_510000 tr_510100', 4);
INSERT INTO `sys_area`
VALUES (510182, '彭州市', 510100, '彭州', NULL, NULL, 'P', 103.941170, 30.985161, 3, 'tr_0 tr_510000 tr_510100', 9);
INSERT INTO `sys_area`
VALUES (510183, '邛崃市', 510100, '邛崃', NULL, NULL, 'Z', 103.461433, 30.413271, 3, 'tr_0 tr_510000 tr_510100', 14);
INSERT INTO `sys_area`
VALUES (510184, '崇州市', 510100, '崇州', NULL, NULL, 'C', 103.671051, 30.631477, 3, 'tr_0 tr_510000 tr_510100', 2);
INSERT INTO `sys_area`
VALUES (510300, '自贡市', 510000, '自贡', NULL, NULL, 'Z', 104.773445, 29.352764, 2, 'tr_0 tr_510000', 20);
INSERT INTO `sys_area`
VALUES (510302, '自流井区', 510300, '自流井', NULL, NULL, 'Z', 104.778191, 29.343231, 3, 'tr_0 tr_510000 tr_510300', 6);
INSERT INTO `sys_area`
VALUES (510303, '贡井区', 510300, '贡井', NULL, NULL, 'G', 104.714371, 29.345675, 3, 'tr_0 tr_510000 tr_510300', 3);
INSERT INTO `sys_area`
VALUES (510304, '大安区', 510300, '大安', NULL, NULL, 'D', 104.783226, 29.367136, 3, 'tr_0 tr_510000 tr_510300', 1);
INSERT INTO `sys_area`
VALUES (510311, '沿滩区', 510300, '沿滩', NULL, NULL, 'Y', 104.876419, 29.272520, 3, 'tr_0 tr_510000 tr_510300', 5);
INSERT INTO `sys_area`
VALUES (510321, '荣县', 510300, '荣县', NULL, NULL, 'R', 104.423935, 29.454851, 3, 'tr_0 tr_510000 tr_510300', 4);
INSERT INTO `sys_area`
VALUES (510322, '富顺县', 510300, '富顺', NULL, NULL, 'F', 104.984253, 29.181282, 3, 'tr_0 tr_510000 tr_510300', 2);
INSERT INTO `sys_area`
VALUES (510400, '攀枝花市', 510000, '攀枝花', NULL, NULL, 'P', 101.716003, 26.580446, 2, 'tr_0 tr_510000', 16);
INSERT INTO `sys_area`
VALUES (510402, '东区', 510400, '东区', NULL, NULL, 'D', 101.715134, 26.580887, 3, 'tr_0 tr_510000 tr_510400', 1);
INSERT INTO `sys_area`
VALUES (510403, '西区', 510400, '西区', NULL, NULL, 'X', 101.637970, 26.596775, 3, 'tr_0 tr_510000 tr_510400', 4);
INSERT INTO `sys_area`
VALUES (510411, '仁和区', 510400, '仁和', NULL, NULL, 'R', 101.737915, 26.497185, 3, 'tr_0 tr_510000 tr_510400', 3);
INSERT INTO `sys_area`
VALUES (510421, '米易县', 510400, '米易', NULL, NULL, 'M', 102.109879, 26.887474, 3, 'tr_0 tr_510000 tr_510400', 2);
INSERT INTO `sys_area`
VALUES (510422, '盐边县', 510400, '盐边', NULL, NULL, 'Y', 101.851845, 26.677620, 3, 'tr_0 tr_510000 tr_510400', 5);
INSERT INTO `sys_area`
VALUES (510500, '泸州市', 510000, '泸州', NULL, NULL, 'Z', 105.443352, 28.889137, 2, 'tr_0 tr_510000', 11);
INSERT INTO `sys_area`
VALUES (510502, '江阳区', 510500, '江阳', NULL, NULL, 'J', 105.445129, 28.882889, 3, 'tr_0 tr_510000 tr_510500', 3);
INSERT INTO `sys_area`
VALUES (510503, '纳溪区', 510500, '纳溪', NULL, NULL, 'N', 105.377213, 28.776310, 3, 'tr_0 tr_510000 tr_510500', 6);
INSERT INTO `sys_area`
VALUES (510504, '龙马潭区', 510500, '龙马潭', NULL, NULL, 'L', 105.435226, 28.897572, 3, 'tr_0 tr_510000 tr_510500', 4);
INSERT INTO `sys_area`
VALUES (510521, '泸县', 510500, '泸县', NULL, NULL, 'Z', 105.376335, 29.151287, 3, 'tr_0 tr_510000 tr_510500', 5);
INSERT INTO `sys_area`
VALUES (510522, '合江县', 510500, '合江', NULL, NULL, 'H', 105.834099, 28.810326, 3, 'tr_0 tr_510000 tr_510500', 2);
INSERT INTO `sys_area`
VALUES (510524, '叙永县', 510500, '叙永', NULL, NULL, 'X', 105.437775, 28.167919, 3, 'tr_0 tr_510000 tr_510500', 7);
INSERT INTO `sys_area`
VALUES (510525, '古蔺县', 510500, '古蔺', NULL, NULL, 'G', 105.813362, 28.039480, 3, 'tr_0 tr_510000 tr_510500', 1);
INSERT INTO `sys_area`
VALUES (510600, '德阳市', 510000, '德阳', NULL, NULL, 'D', 104.398651, 31.127991, 2, 'tr_0 tr_510000', 5);
INSERT INTO `sys_area`
VALUES (510603, '旌阳区', 510600, '旌阳', NULL, NULL, 'Z', 104.389648, 31.130428, 3, 'tr_0 tr_510000 tr_510600', 2);
INSERT INTO `sys_area`
VALUES (510623, '中江县', 510600, '中江', NULL, NULL, 'Z', 104.677834, 31.036810, 3, 'tr_0 tr_510000 tr_510600', 6);
INSERT INTO `sys_area`
VALUES (510626, '罗江县', 510600, '罗江', NULL, NULL, 'L', 104.507126, 31.303282, 3, 'tr_0 tr_510000 tr_510600', 3);
INSERT INTO `sys_area`
VALUES (510681, '广汉市', 510600, '广汉', NULL, NULL, 'G', 104.281906, 30.977150, 3, 'tr_0 tr_510000 tr_510600', 1);
INSERT INTO `sys_area`
VALUES (510682, '什邡市', 510600, '什邡', NULL, NULL, 'S', 104.173653, 31.126881, 3, 'tr_0 tr_510000 tr_510600', 5);
INSERT INTO `sys_area`
VALUES (510683, '绵竹市', 510600, '绵竹', NULL, NULL, 'M', 104.200165, 31.343084, 3, 'tr_0 tr_510000 tr_510600', 4);
INSERT INTO `sys_area`
VALUES (510700, '绵阳市', 510000, '绵阳', NULL, NULL, 'M', 104.741722, 31.464020, 2, 'tr_0 tr_510000', 13);
INSERT INTO `sys_area`
VALUES (510703, '涪城区', 510700, '涪城', NULL, NULL, 'F', 104.740974, 31.463556, 3, 'tr_0 tr_510000 tr_510700', 3);
INSERT INTO `sys_area`
VALUES (510704, '游仙区', 510700, '游仙', NULL, NULL, 'Y', 104.770004, 31.484772, 3, 'tr_0 tr_510000 tr_510700', 8);
INSERT INTO `sys_area`
VALUES (510722, '三台县', 510700, '三台', NULL, NULL, 'S', 105.090317, 31.090908, 3, 'tr_0 tr_510000 tr_510700', 6);
INSERT INTO `sys_area`
VALUES (510723, '盐亭县', 510700, '盐亭', NULL, NULL, 'Y', 105.391991, 31.223181, 3, 'tr_0 tr_510000 tr_510700', 7);
INSERT INTO `sys_area`
VALUES (510724, '安县', 510700, '安县', NULL, NULL, 'A', 104.560341, 31.538940, 3, 'tr_0 tr_510000 tr_510700', 1);
INSERT INTO `sys_area`
VALUES (510725, '梓潼县', 510700, '梓潼', NULL, NULL, 'Z', 105.163528, 31.635225, 3, 'tr_0 tr_510000 tr_510700', 9);
INSERT INTO `sys_area`
VALUES (510726, '北川羌族自治县', 510700, '北川', NULL, NULL, 'B', 104.468071, 31.615864, 3, 'tr_0 tr_510000 tr_510700', 2);
INSERT INTO `sys_area`
VALUES (510727, '平武县', 510700, '平武', NULL, NULL, 'P', 104.530556, 32.407589, 3, 'tr_0 tr_510000 tr_510700', 5);
INSERT INTO `sys_area`
VALUES (510781, '江油市', 510700, '江油', NULL, NULL, 'J', 104.744431, 31.776386, 3, 'tr_0 tr_510000 tr_510700', 4);
INSERT INTO `sys_area`
VALUES (510800, '广元市', 510000, '广元', NULL, NULL, 'G', 105.829758, 32.433666, 2, 'tr_0 tr_510000', 8);
INSERT INTO `sys_area`
VALUES (510802, '利州区', 510800, '利州', NULL, NULL, 'L', 105.826195, 32.432278, 3, 'tr_0 tr_510000 tr_510800', 4);
INSERT INTO `sys_area`
VALUES (510811, '昭化区', 510800, '昭化', NULL, NULL, 'Z', 105.964119, 32.322788, 3, 'tr_0 tr_510000 tr_510800', 7);
INSERT INTO `sys_area`
VALUES (510812, '朝天区', 510800, '朝天', NULL, NULL, 'C', 105.889168, 32.642632, 3, 'tr_0 tr_510000 tr_510800', 2);
INSERT INTO `sys_area`
VALUES (510821, '旺苍县', 510800, '旺苍', NULL, NULL, 'W', 106.290428, 32.228329, 3, 'tr_0 tr_510000 tr_510800', 6);
INSERT INTO `sys_area`
VALUES (510822, '青川县', 510800, '青川', NULL, NULL, 'Q', 105.238846, 32.585655, 3, 'tr_0 tr_510000 tr_510800', 5);
INSERT INTO `sys_area`
VALUES (510823, '剑阁县', 510800, '剑阁', NULL, NULL, 'J', 105.527039, 32.286518, 3, 'tr_0 tr_510000 tr_510800', 3);
INSERT INTO `sys_area`
VALUES (510824, '苍溪县', 510800, '苍溪', NULL, NULL, 'C', 105.939705, 31.732250, 3, 'tr_0 tr_510000 tr_510800', 1);
INSERT INTO `sys_area`
VALUES (510900, '遂宁市', 510000, '遂宁', NULL, NULL, 'S', 105.571327, 30.513311, 2, 'tr_0 tr_510000', 17);
INSERT INTO `sys_area`
VALUES (510903, '船山区', 510900, '船山', NULL, NULL, 'C', 105.582214, 30.502647, 3, 'tr_0 tr_510000 tr_510900', 2);
INSERT INTO `sys_area`
VALUES (510904, '安居区', 510900, '安居', NULL, NULL, 'A', 105.459381, 30.346121, 3, 'tr_0 tr_510000 tr_510900', 1);
INSERT INTO `sys_area`
VALUES (510921, '蓬溪县', 510900, '蓬溪', NULL, NULL, 'P', 105.713699, 30.774883, 3, 'tr_0 tr_510000 tr_510900', 4);
INSERT INTO `sys_area`
VALUES (510922, '射洪县', 510900, '射洪', NULL, NULL, 'S', 105.381851, 30.868752, 3, 'tr_0 tr_510000 tr_510900', 5);
INSERT INTO `sys_area`
VALUES (510923, '大英县', 510900, '大英', NULL, NULL, 'D', 105.252190, 30.581572, 3, 'tr_0 tr_510000 tr_510900', 3);
INSERT INTO `sys_area`
VALUES (511000, '内江市', 510000, '内江', NULL, NULL, 'N', 105.066139, 29.587080, 2, 'tr_0 tr_510000', 15);
INSERT INTO `sys_area`
VALUES (511002, '市中区', 511000, '市中', NULL, NULL, 'S', 105.065468, 29.585264, 3, 'tr_0 tr_510000 tr_511000', 3);
INSERT INTO `sys_area`
VALUES (511011, '东兴区', 511000, '东兴', NULL, NULL, 'D', 105.067200, 29.600107, 3, 'tr_0 tr_510000 tr_511000', 1);
INSERT INTO `sys_area`
VALUES (511024, '威远县', 511000, '威远', NULL, NULL, 'W', 104.668327, 29.526859, 3, 'tr_0 tr_510000 tr_511000', 4);
INSERT INTO `sys_area`
VALUES (511025, '资中县', 511000, '资中', NULL, NULL, 'Z', 104.852463, 29.775295, 3, 'tr_0 tr_510000 tr_511000', 5);
INSERT INTO `sys_area`
VALUES (511028, '隆昌县', 511000, '隆昌', NULL, NULL, 'L', 105.288071, 29.338161, 3, 'tr_0 tr_510000 tr_511000', 2);
INSERT INTO `sys_area`
VALUES (511100, '乐山市', 510000, '乐山', NULL, NULL, 'L', 103.761261, 29.582024, 2, 'tr_0 tr_510000', 9);
INSERT INTO `sys_area`
VALUES (511102, '市中区', 511100, '市中', NULL, NULL, 'S', 103.755386, 29.588327, 3, 'tr_0 tr_510000 tr_511100', 10);
INSERT INTO `sys_area`
VALUES (511111, '沙湾区', 511100, '沙湾', NULL, NULL, 'S', 103.549957, 29.416536, 3, 'tr_0 tr_510000 tr_511100', 9);
INSERT INTO `sys_area`
VALUES (511112, '五通桥区', 511100, '五通桥', NULL, NULL, 'W', 103.816833, 29.406185, 3, 'tr_0 tr_510000 tr_511100', 11);
INSERT INTO `sys_area`
VALUES (511113, '金口河区', 511100, '金口河', NULL, NULL, 'J', 103.077827, 29.246019, 3, 'tr_0 tr_510000 tr_511100', 5);
INSERT INTO `sys_area`
VALUES (511123, '犍为县', 511100, '犍为', NULL, NULL, 'Z', 103.944267, 29.209782, 3, 'tr_0 tr_510000 tr_511100', 8);
INSERT INTO `sys_area`
VALUES (511124, '井研县', 511100, '井研', NULL, NULL, 'J', 104.068848, 29.651646, 3, 'tr_0 tr_510000 tr_511100', 4);
INSERT INTO `sys_area`
VALUES (511126, '夹江县', 511100, '夹江', NULL, NULL, 'J', 103.578865, 29.741018, 3, 'tr_0 tr_510000 tr_511100', 3);
INSERT INTO `sys_area`
VALUES (511129, '沐川县', 511100, '沐川', NULL, NULL, 'Z', 103.902107, 28.956339, 3, 'tr_0 tr_510000 tr_511100', 7);
INSERT INTO `sys_area`
VALUES (511132, '峨边彝族自治县', 511100, '峨边', NULL, NULL, 'E', 103.262146, 29.230270, 3, 'tr_0 tr_510000 tr_511100', 1);
INSERT INTO `sys_area`
VALUES (511133, '马边彝族自治县', 511100, '马边', NULL, NULL, 'M', 103.546852, 28.838934, 3, 'tr_0 tr_510000 tr_511100', 6);
INSERT INTO `sys_area`
VALUES (511181, '峨眉山市', 511100, '峨眉山', NULL, NULL, 'E', 103.492485, 29.597479, 3, 'tr_0 tr_510000 tr_511100', 2);
INSERT INTO `sys_area`
VALUES (511300, '南充市', 510000, '南充', NULL, NULL, 'N', 106.082977, 30.795280, 2, 'tr_0 tr_510000', 14);
INSERT INTO `sys_area`
VALUES (511302, '顺庆区', 511300, '顺庆', NULL, NULL, 'S', 106.084091, 30.795572, 3, 'tr_0 tr_510000 tr_511300', 6);
INSERT INTO `sys_area`
VALUES (511303, '高坪区', 511300, '高坪', NULL, NULL, 'G', 106.108994, 30.781809, 3, 'tr_0 tr_510000 tr_511300', 1);
INSERT INTO `sys_area`
VALUES (511304, '嘉陵区', 511300, '嘉陵', NULL, NULL, 'J', 106.067024, 30.762976, 3, 'tr_0 tr_510000 tr_511300', 2);
INSERT INTO `sys_area`
VALUES (511321, '南部县', 511300, '南部', NULL, NULL, 'N', 106.061134, 31.349407, 3, 'tr_0 tr_510000 tr_511300', 4);
INSERT INTO `sys_area`
VALUES (511322, '营山县', 511300, '营山', NULL, NULL, 'Y', 106.564896, 31.075907, 3, 'tr_0 tr_510000 tr_511300', 9);
INSERT INTO `sys_area`
VALUES (511323, '蓬安县', 511300, '蓬安', NULL, NULL, 'P', 106.413490, 31.027979, 3, 'tr_0 tr_510000 tr_511300', 5);
INSERT INTO `sys_area`
VALUES (511324, '仪陇县', 511300, '仪陇', NULL, NULL, 'Y', 106.297081, 31.271261, 3, 'tr_0 tr_510000 tr_511300', 8);
INSERT INTO `sys_area`
VALUES (511325, '西充县', 511300, '西充', NULL, NULL, 'X', 105.893021, 30.994616, 3, 'tr_0 tr_510000 tr_511300', 7);
INSERT INTO `sys_area`
VALUES (511381, '阆中市', 511300, '阆中', NULL, NULL, 'Z', 105.975266, 31.580465, 3, 'tr_0 tr_510000 tr_511300', 3);
INSERT INTO `sys_area`
VALUES (511400, '眉山市', 510000, '眉山', NULL, NULL, 'M', 103.831787, 30.048319, 2, 'tr_0 tr_510000', 12);
INSERT INTO `sys_area`
VALUES (511402, '东坡区', 511400, '东坡', NULL, NULL, 'D', 103.831551, 30.048128, 3, 'tr_0 tr_510000 tr_511400', 2);
INSERT INTO `sys_area`
VALUES (511421, '仁寿县', 511400, '仁寿', NULL, NULL, 'R', 104.147644, 29.996721, 3, 'tr_0 tr_510000 tr_511400', 6);
INSERT INTO `sys_area`
VALUES (511422, '彭山县', 511400, '彭山', NULL, NULL, 'P', 103.870102, 30.192299, 3, 'tr_0 tr_510000 tr_511400', 4);
INSERT INTO `sys_area`
VALUES (511423, '洪雅县', 511400, '洪雅', NULL, NULL, 'H', 103.375008, 29.904867, 3, 'tr_0 tr_510000 tr_511400', 3);
INSERT INTO `sys_area`
VALUES (511424, '丹棱县', 511400, '丹棱', NULL, NULL, 'D', 103.518333, 30.012751, 3, 'tr_0 tr_510000 tr_511400', 1);
INSERT INTO `sys_area`
VALUES (511425, '青神县', 511400, '青神', NULL, NULL, 'Q', 103.846130, 29.831469, 3, 'tr_0 tr_510000 tr_511400', 5);
INSERT INTO `sys_area`
VALUES (511500, '宜宾市', 510000, '宜宾', NULL, NULL, 'Y', 104.630821, 28.760189, 2, 'tr_0 tr_510000', 19);
INSERT INTO `sys_area`
VALUES (511502, '翠屏区', 511500, '翠屏', NULL, NULL, 'C', 104.630234, 28.760180, 3, 'tr_0 tr_510000 tr_511500', 2);
INSERT INTO `sys_area`
VALUES (511521, '宜宾县', 511500, '宜宾', NULL, NULL, 'Y', 104.541489, 28.695679, 3, 'tr_0 tr_510000 tr_511500', 10);
INSERT INTO `sys_area`
VALUES (511522, '南溪区', 511500, '南溪', NULL, NULL, 'N', 104.981133, 28.839806, 3, 'tr_0 tr_510000 tr_511500', 7);
INSERT INTO `sys_area`
VALUES (511523, '江安县', 511500, '江安', NULL, NULL, 'J', 105.068695, 28.728102, 3, 'tr_0 tr_510000 tr_511500', 5);
INSERT INTO `sys_area`
VALUES (511524, '长宁县', 511500, '长宁', NULL, NULL, 'C', 104.921120, 28.577271, 3, 'tr_0 tr_510000 tr_511500', 1);
INSERT INTO `sys_area`
VALUES (511525, '高县', 511500, '高县', NULL, NULL, 'G', 104.519188, 28.435677, 3, 'tr_0 tr_510000 tr_511500', 3);
INSERT INTO `sys_area`
VALUES (511526, '珙县', 511500, '珙县', NULL, NULL, 'Z', 104.712265, 28.449041, 3, 'tr_0 tr_510000 tr_511500', 4);
INSERT INTO `sys_area`
VALUES (511527, '筠连县', 511500, '筠连', NULL, NULL, 'Z', 104.507851, 28.162018, 3, 'tr_0 tr_510000 tr_511500', 6);
INSERT INTO `sys_area`
VALUES (511528, '兴文县', 511500, '兴文', NULL, NULL, 'X', 105.236549, 28.302988, 3, 'tr_0 tr_510000 tr_511500', 9);
INSERT INTO `sys_area`
VALUES (511529, '屏山县', 511500, '屏山', NULL, NULL, 'P', 104.162621, 28.642370, 3, 'tr_0 tr_510000 tr_511500', 8);
INSERT INTO `sys_area`
VALUES (511600, '广安市', 510000, '广安', NULL, NULL, 'G', 106.633369, 30.456398, 2, 'tr_0 tr_510000', 7);
INSERT INTO `sys_area`
VALUES (511602, '广安区', 511600, '广安', NULL, NULL, 'G', 106.632904, 30.456463, 3, 'tr_0 tr_510000 tr_511600', 1);
INSERT INTO `sys_area`
VALUES (511603, '前锋区', 511600, '前锋', NULL, NULL, 'Q', 106.893280, 30.496300, 3, 'tr_0 tr_510000 tr_511600', 4);
INSERT INTO `sys_area`
VALUES (511621, '岳池县', 511600, '岳池', NULL, NULL, 'Y', 106.444450, 30.533539, 3, 'tr_0 tr_510000 tr_511600', 6);
INSERT INTO `sys_area`
VALUES (511622, '武胜县', 511600, '武胜', NULL, NULL, 'W', 106.292473, 30.344292, 3, 'tr_0 tr_510000 tr_511600', 5);
INSERT INTO `sys_area`
VALUES (511623, '邻水县', 511600, '邻水', NULL, NULL, 'L', 106.934967, 30.334324, 3, 'tr_0 tr_510000 tr_511600', 3);
INSERT INTO `sys_area`
VALUES (511681, '华蓥市', 511600, '华蓥', NULL, NULL, 'H', 106.777885, 30.380573, 3, 'tr_0 tr_510000 tr_511600', 2);
INSERT INTO `sys_area`
VALUES (511700, '达州市', 510000, '达州', NULL, NULL, 'D', 107.502258, 31.209484, 2, 'tr_0 tr_510000', 4);
INSERT INTO `sys_area`
VALUES (511702, '通川区', 511700, '通川', NULL, NULL, 'T', 107.501060, 31.213522, 3, 'tr_0 tr_510000 tr_511700', 5);
INSERT INTO `sys_area`
VALUES (511721, '达川区', 511700, '达川', NULL, NULL, 'D', 107.507927, 31.199062, 3, 'tr_0 tr_510000 tr_511700', 1);
INSERT INTO `sys_area`
VALUES (511722, '宣汉县', 511700, '宣汉', NULL, NULL, 'X', 107.722252, 31.355024, 3, 'tr_0 tr_510000 tr_511700', 7);
INSERT INTO `sys_area`
VALUES (511723, '开江县', 511700, '开江', NULL, NULL, 'K', 107.864136, 31.085537, 3, 'tr_0 tr_510000 tr_511700', 3);
INSERT INTO `sys_area`
VALUES (511724, '大竹县', 511700, '大竹', NULL, NULL, 'D', 107.207420, 30.736288, 3, 'tr_0 tr_510000 tr_511700', 2);
INSERT INTO `sys_area`
VALUES (511725, '渠县', 511700, '渠县', NULL, NULL, 'Q', 106.970749, 30.836348, 3, 'tr_0 tr_510000 tr_511700', 4);
INSERT INTO `sys_area`
VALUES (511781, '万源市', 511700, '万源', NULL, NULL, 'W', 108.037544, 32.067768, 3, 'tr_0 tr_510000 tr_511700', 6);
INSERT INTO `sys_area`
VALUES (511800, '雅安市', 510000, '雅安', NULL, NULL, 'Y', 103.001030, 29.987722, 2, 'tr_0 tr_510000', 18);
INSERT INTO `sys_area`
VALUES (511802, '雨城区', 511800, '雨城', NULL, NULL, 'Y', 103.003395, 29.981831, 3, 'tr_0 tr_510000 tr_511800', 8);
INSERT INTO `sys_area`
VALUES (511821, '名山区', 511800, '名山', NULL, NULL, 'M', 103.112213, 30.084719, 3, 'tr_0 tr_510000 tr_511800', 4);
INSERT INTO `sys_area`
VALUES (511822, '荥经县', 511800, '荥经', NULL, NULL, 'Z', 102.844673, 29.795528, 3, 'tr_0 tr_510000 tr_511800', 7);
INSERT INTO `sys_area`
VALUES (511823, '汉源县', 511800, '汉源', NULL, NULL, 'H', 102.677147, 29.349915, 3, 'tr_0 tr_510000 tr_511800', 2);
INSERT INTO `sys_area`
VALUES (511824, '石棉县', 511800, '石棉', NULL, NULL, 'S', 102.359619, 29.234062, 3, 'tr_0 tr_510000 tr_511800', 5);
INSERT INTO `sys_area`
VALUES (511825, '天全县', 511800, '天全', NULL, NULL, 'T', 102.763458, 30.059956, 3, 'tr_0 tr_510000 tr_511800', 6);
INSERT INTO `sys_area`
VALUES (511826, '芦山县', 511800, '芦山', NULL, NULL, 'L', 102.924019, 30.152906, 3, 'tr_0 tr_510000 tr_511800', 3);
INSERT INTO `sys_area`
VALUES (511827, '宝兴县', 511800, '宝兴', NULL, NULL, 'B', 102.813377, 30.369026, 3, 'tr_0 tr_510000 tr_511800', 1);
INSERT INTO `sys_area`
VALUES (511900, '巴中市', 510000, '巴中', NULL, NULL, 'B', 106.753670, 31.858809, 2, 'tr_0 tr_510000', 2);
INSERT INTO `sys_area`
VALUES (511902, '巴州区', 511900, '巴州', NULL, NULL, 'B', 106.753670, 31.858366, 3, 'tr_0 tr_510000 tr_511900', 1);
INSERT INTO `sys_area`
VALUES (511903, '恩阳区', 511900, '恩阳', NULL, NULL, 'E', 106.636078, 31.789442, 3, 'tr_0 tr_510000 tr_511900', 2);
INSERT INTO `sys_area`
VALUES (511921, '通江县', 511900, '通江', NULL, NULL, 'T', 107.247620, 31.912121, 3, 'tr_0 tr_510000 tr_511900', 5);
INSERT INTO `sys_area`
VALUES (511922, '南江县', 511900, '南江', NULL, NULL, 'N', 106.843414, 32.353165, 3, 'tr_0 tr_510000 tr_511900', 3);
INSERT INTO `sys_area`
VALUES (511923, '平昌县', 511900, '平昌', NULL, NULL, 'P', 107.101936, 31.562815, 3, 'tr_0 tr_510000 tr_511900', 4);
INSERT INTO `sys_area`
VALUES (512000, '资阳市', 510000, '资阳', NULL, NULL, 'Z', 104.641914, 30.122211, 2, 'tr_0 tr_510000', 21);
INSERT INTO `sys_area`
VALUES (512002, '雁江区', 512000, '雁江', NULL, NULL, 'Y', 104.642342, 30.121687, 3, 'tr_0 tr_510000 tr_512000', 4);
INSERT INTO `sys_area`
VALUES (512021, '安岳县', 512000, '安岳', NULL, NULL, 'A', 105.336761, 30.099207, 3, 'tr_0 tr_510000 tr_512000', 1);
INSERT INTO `sys_area`
VALUES (512022, '乐至县', 512000, '乐至', NULL, NULL, 'L', 105.031143, 30.275620, 3, 'tr_0 tr_510000 tr_512000', 3);
INSERT INTO `sys_area`
VALUES (512081, '简阳市', 512000, '简阳', NULL, NULL, 'J', 104.550339, 30.390665, 3, 'tr_0 tr_510000 tr_512000', 2);
INSERT INTO `sys_area`
VALUES (513200, '阿坝藏族羌族自治州', 510000, '阿坝', NULL, NULL, 'A', 102.221375, 31.899792, 2, 'tr_0 tr_510000', 1);
INSERT INTO `sys_area`
VALUES (513221, '汶川县', 513200, '汶川', NULL, NULL, 'Z', 103.580673, 31.474630, 3, 'tr_0 tr_510000 tr_513200', 12);
INSERT INTO `sys_area`
VALUES (513222, '理县', 513200, '理县', NULL, NULL, 'L', 103.165489, 31.436764, 3, 'tr_0 tr_510000 tr_513200', 6);
INSERT INTO `sys_area`
VALUES (513223, '茂县', 513200, '茂县', NULL, NULL, 'M', 103.850685, 31.680407, 3, 'tr_0 tr_510000 tr_513200', 8);
INSERT INTO `sys_area`
VALUES (513224, '松潘县', 513200, '松潘', NULL, NULL, 'S', 103.599174, 32.638378, 3, 'tr_0 tr_510000 tr_513200', 11);
INSERT INTO `sys_area`
VALUES (513225, '九寨沟县', 513200, '九寨沟', NULL, NULL, 'J', 104.236343, 33.262096, 3, 'tr_0 tr_510000 tr_513200', 5);
INSERT INTO `sys_area`
VALUES (513226, '金川县', 513200, '金川', NULL, NULL, 'J', 102.064644, 31.476357, 3, 'tr_0 tr_510000 tr_513200', 4);
INSERT INTO `sys_area`
VALUES (513227, '小金县', 513200, '小金', NULL, NULL, 'X', 102.363190, 30.999016, 3, 'tr_0 tr_510000 tr_513200', 13);
INSERT INTO `sys_area`
VALUES (513228, '黑水县', 513200, '黑水', NULL, NULL, 'H', 102.990807, 32.061722, 3, 'tr_0 tr_510000 tr_513200', 2);
INSERT INTO `sys_area`
VALUES (513229, '马尔康县', 513200, '马尔康', NULL, NULL, 'M', 102.221184, 31.899761, 3, 'tr_0 tr_510000 tr_513200', 7);
INSERT INTO `sys_area`
VALUES (513230, '壤塘县', 513200, '壤塘', NULL, NULL, 'R', 100.979134, 32.264889, 3, 'tr_0 tr_510000 tr_513200', 9);
INSERT INTO `sys_area`
VALUES (513231, '阿坝县', 513200, '阿坝', NULL, NULL, 'A', 101.700989, 32.904224, 3, 'tr_0 tr_510000 tr_513200', 1);
INSERT INTO `sys_area`
VALUES (513232, '若尔盖县', 513200, '若尔盖', NULL, NULL, 'R', 102.963722, 33.575935, 3, 'tr_0 tr_510000 tr_513200', 10);
INSERT INTO `sys_area`
VALUES (513233, '红原县', 513200, '红原', NULL, NULL, 'H', 102.544907, 32.793903, 3, 'tr_0 tr_510000 tr_513200', 3);
INSERT INTO `sys_area`
VALUES (513300, '甘孜藏族自治州', 510000, '甘孜', NULL, NULL, 'G', 101.963814, 30.050663, 2, 'tr_0 tr_510000', 6);
INSERT INTO `sys_area`
VALUES (513321, '康定县', 513300, '康定', NULL, NULL, 'K', 101.964058, 30.050737, 3, 'tr_0 tr_510000 tr_513300', 10);
INSERT INTO `sys_area`
VALUES (513322, '泸定县', 513300, '泸定', NULL, NULL, 'Z', 102.233223, 29.912481, 3, 'tr_0 tr_510000 tr_513300', 12);
INSERT INTO `sys_area`
VALUES (513323, '丹巴县', 513300, '丹巴', NULL, NULL, 'D', 101.886124, 30.877083, 3, 'tr_0 tr_510000 tr_513300', 3);
INSERT INTO `sys_area`
VALUES (513324, '九龙县', 513300, '九龙', NULL, NULL, 'J', 101.506943, 29.001974, 3, 'tr_0 tr_510000 tr_513300', 9);
INSERT INTO `sys_area`
VALUES (513325, '雅江县', 513300, '雅江', NULL, NULL, 'Y', 101.015732, 30.032249, 3, 'tr_0 tr_510000 tr_513300', 18);
INSERT INTO `sys_area`
VALUES (513326, '道孚县', 513300, '道孚', NULL, NULL, 'D', 101.123329, 30.978767, 3, 'tr_0 tr_510000 tr_513300', 5);
INSERT INTO `sys_area`
VALUES (513327, '炉霍县', 513300, '炉霍', NULL, NULL, 'L', 100.679497, 31.392673, 3, 'tr_0 tr_510000 tr_513300', 13);
INSERT INTO `sys_area`
VALUES (513328, '甘孜县', 513300, '甘孜', NULL, NULL, 'G', 99.991753, 31.619749, 3, 'tr_0 tr_510000 tr_513300', 8);
INSERT INTO `sys_area`
VALUES (513329, '新龙县', 513300, '新龙', NULL, NULL, 'X', 100.312096, 30.938959, 3, 'tr_0 tr_510000 tr_513300', 17);
INSERT INTO `sys_area`
VALUES (513330, '德格县', 513300, '德格', NULL, NULL, 'D', 98.579987, 31.806728, 3, 'tr_0 tr_510000 tr_513300', 6);
INSERT INTO `sys_area`
VALUES (513331, '白玉县', 513300, '白玉', NULL, NULL, 'B', 98.824341, 31.208805, 3, 'tr_0 tr_510000 tr_513300', 1);
INSERT INTO `sys_area`
VALUES (513332, '石渠县', 513300, '石渠', NULL, NULL, 'S', 98.100883, 32.975304, 3, 'tr_0 tr_510000 tr_513300', 15);
INSERT INTO `sys_area`
VALUES (513333, '色达县', 513300, '色达', NULL, NULL, 'S', 100.331657, 32.268776, 3, 'tr_0 tr_510000 tr_513300', 14);
INSERT INTO `sys_area`
VALUES (513334, '理塘县', 513300, '理塘', NULL, NULL, 'L', 100.269859, 29.991808, 3, 'tr_0 tr_510000 tr_513300', 11);
INSERT INTO `sys_area`
VALUES (513335, '巴塘县', 513300, '巴塘', NULL, NULL, 'B', 99.109039, 30.005724, 3, 'tr_0 tr_510000 tr_513300', 2);
INSERT INTO `sys_area`
VALUES (513336, '乡城县', 513300, '乡城', NULL, NULL, 'X', 99.799942, 28.930855, 3, 'tr_0 tr_510000 tr_513300', 16);
INSERT INTO `sys_area`
VALUES (513337, '稻城县', 513300, '稻城', NULL, NULL, 'D', 100.296692, 29.037544, 3, 'tr_0 tr_510000 tr_513300', 4);
INSERT INTO `sys_area`
VALUES (513338, '得荣县', 513300, '得荣', NULL, NULL, 'D', 99.288033, 28.711340, 3, 'tr_0 tr_510000 tr_513300', 7);
INSERT INTO `sys_area`
VALUES (513400, '凉山彝族自治州', 510000, '凉山', NULL, NULL, 'L', 102.258743, 27.886763, 2, 'tr_0 tr_510000', 10);
INSERT INTO `sys_area`
VALUES (513401, '西昌市', 513400, '西昌', NULL, NULL, 'X', 102.258759, 27.885786, 3, 'tr_0 tr_510000 tr_513400', 13);
INSERT INTO `sys_area`
VALUES (513422, '木里藏族自治县', 513400, '木里', NULL, NULL, 'M', 101.280182, 27.926859, 3, 'tr_0 tr_510000 tr_513400', 10);
INSERT INTO `sys_area`
VALUES (513423, '盐源县', 513400, '盐源', NULL, NULL, 'Y', 101.508911, 27.423414, 3, 'tr_0 tr_510000 tr_513400', 15);
INSERT INTO `sys_area`
VALUES (513424, '德昌县', 513400, '德昌', NULL, NULL, 'D', 102.178848, 27.403828, 3, 'tr_0 tr_510000 tr_513400', 2);
INSERT INTO `sys_area`
VALUES (513425, '会理县', 513400, '会理', NULL, NULL, 'H', 102.249550, 26.658703, 3, 'tr_0 tr_510000 tr_513400', 5);
INSERT INTO `sys_area`
VALUES (513426, '会东县', 513400, '会东', NULL, NULL, 'H', 102.578987, 26.630713, 3, 'tr_0 tr_510000 tr_513400', 4);
INSERT INTO `sys_area`
VALUES (513427, '宁南县', 513400, '宁南', NULL, NULL, 'N', 102.757378, 27.065205, 3, 'tr_0 tr_510000 tr_513400', 11);
INSERT INTO `sys_area`
VALUES (513428, '普格县', 513400, '普格', NULL, NULL, 'P', 102.541084, 27.376827, 3, 'tr_0 tr_510000 tr_513400', 12);
INSERT INTO `sys_area`
VALUES (513429, '布拖县', 513400, '布拖', NULL, NULL, 'B', 102.808800, 27.709063, 3, 'tr_0 tr_510000 tr_513400', 1);
INSERT INTO `sys_area`
VALUES (513430, '金阳县', 513400, '金阳', NULL, NULL, 'J', 103.248703, 27.695915, 3, 'tr_0 tr_510000 tr_513400', 6);
INSERT INTO `sys_area`
VALUES (513431, '昭觉县', 513400, '昭觉', NULL, NULL, 'Z', 102.843994, 28.010553, 3, 'tr_0 tr_510000 tr_513400', 17);
INSERT INTO `sys_area`
VALUES (513432, '喜德县', 513400, '喜德', NULL, NULL, 'X', 102.412338, 28.305487, 3, 'tr_0 tr_510000 tr_513400', 14);
INSERT INTO `sys_area`
VALUES (513433, '冕宁县', 513400, '冕宁', NULL, NULL, 'M', 102.170044, 28.550844, 3, 'tr_0 tr_510000 tr_513400', 9);
INSERT INTO `sys_area`
VALUES (513434, '越西县', 513400, '越西', NULL, NULL, 'Y', 102.508873, 28.639631, 3, 'tr_0 tr_510000 tr_513400', 16);
INSERT INTO `sys_area`
VALUES (513435, '甘洛县', 513400, '甘洛', NULL, NULL, 'G', 102.775925, 28.977095, 3, 'tr_0 tr_510000 tr_513400', 3);
INSERT INTO `sys_area`
VALUES (513436, '美姑县', 513400, '美姑', NULL, NULL, 'M', 103.132004, 28.327946, 3, 'tr_0 tr_510000 tr_513400', 8);
INSERT INTO `sys_area`
VALUES (513437, '雷波县', 513400, '雷波', NULL, NULL, 'L', 103.571587, 28.262945, 3, 'tr_0 tr_510000 tr_513400', 7);
INSERT INTO `sys_area`
VALUES (520000, '贵州省', 0, '贵州', NULL, NULL, 'G', 106.713478, 26.578342, 1, 'tr_0', 24);
INSERT INTO `sys_area`
VALUES (520100, '贵阳市', 520000, '贵阳', NULL, NULL, 'G', 106.713478, 26.578342, 2, 'tr_0 tr_520000', 3);
INSERT INTO `sys_area`
VALUES (520102, '南明区', 520100, '南明', NULL, NULL, 'N', 106.715965, 26.573744, 3, 'tr_0 tr_520000 tr_520100', 5);
INSERT INTO `sys_area`
VALUES (520103, '云岩区', 520100, '云岩', NULL, NULL, 'Y', 106.713394, 26.583010, 3, 'tr_0 tr_520000 tr_520100', 10);
INSERT INTO `sys_area`
VALUES (520111, '花溪区', 520100, '花溪', NULL, NULL, 'H', 106.670792, 26.410463, 3, 'tr_0 tr_520000 tr_520100', 3);
INSERT INTO `sys_area`
VALUES (520112, '乌当区', 520100, '乌当', NULL, NULL, 'W', 106.762123, 26.630928, 3, 'tr_0 tr_520000 tr_520100', 7);
INSERT INTO `sys_area`
VALUES (520113, '白云区', 520100, '白云', NULL, NULL, 'B', 106.633034, 26.676849, 3, 'tr_0 tr_520000 tr_520100', 1);
INSERT INTO `sys_area`
VALUES (520121, '开阳县', 520100, '开阳', NULL, NULL, 'K', 106.969437, 27.056793, 3, 'tr_0 tr_520000 tr_520100', 4);
INSERT INTO `sys_area`
VALUES (520122, '息烽县', 520100, '息烽', NULL, NULL, 'X', 106.737694, 27.092665, 3, 'tr_0 tr_520000 tr_520100', 8);
INSERT INTO `sys_area`
VALUES (520123, '修文县', 520100, '修文', NULL, NULL, 'X', 106.599220, 26.840672, 3, 'tr_0 tr_520000 tr_520100', 9);
INSERT INTO `sys_area`
VALUES (520151, '观山湖区', 520100, '观山湖', NULL, NULL, 'G', 106.713478, 26.578342, 3, 'tr_0 tr_520000 tr_520100', 2);
INSERT INTO `sys_area`
VALUES (520181, '清镇市', 520100, '清镇', NULL, NULL, 'Q', 106.470276, 26.551289, 3, 'tr_0 tr_520000 tr_520100', 6);
INSERT INTO `sys_area`
VALUES (520200, '六盘水市', 520000, '六盘水', NULL, NULL, 'L', 104.846741, 26.584642, 2, 'tr_0 tr_520000', 4);
INSERT INTO `sys_area`
VALUES (520201, '钟山区', 520200, '钟山', NULL, NULL, 'Z', 104.846245, 26.584805, 3, 'tr_0 tr_520000 tr_520200', 4);
INSERT INTO `sys_area`
VALUES (520203, '六枝特区', 520200, '六枝特', NULL, NULL, 'L', 105.474236, 26.210663, 3, 'tr_0 tr_520000 tr_520200', 1);
INSERT INTO `sys_area`
VALUES (520221, '水城县', 520200, '水城', NULL, NULL, 'S', 104.956848, 26.540478, 3, 'tr_0 tr_520000 tr_520200', 3);
INSERT INTO `sys_area`
VALUES (520222, '盘县', 520200, '盘县', NULL, NULL, 'P', 104.468369, 25.706966, 3, 'tr_0 tr_520000 tr_520200', 2);
INSERT INTO `sys_area`
VALUES (520300, '遵义市', 520000, '遵义', NULL, NULL, 'Z', 106.937263, 27.706627, 2, 'tr_0 tr_520000', 9);
INSERT INTO `sys_area`
VALUES (520302, '红花岗区', 520300, '红花岗', NULL, NULL, 'H', 106.943787, 27.694395, 3, 'tr_0 tr_520000 tr_520300', 4);
INSERT INTO `sys_area`
VALUES (520303, '汇川区', 520300, '汇川', NULL, NULL, 'H', 106.937263, 27.706627, 3, 'tr_0 tr_520000 tr_520300', 5);
INSERT INTO `sys_area`
VALUES (520321, '遵义县', 520300, '遵义', NULL, NULL, 'Z', 106.831665, 27.535288, 3, 'tr_0 tr_520000 tr_520300', 14);
INSERT INTO `sys_area`
VALUES (520322, '桐梓县', 520300, '桐梓', NULL, NULL, 'T', 106.826591, 28.131559, 3, 'tr_0 tr_520000 tr_520300', 9);
INSERT INTO `sys_area`
VALUES (520323, '绥阳县', 520300, '绥阳', NULL, NULL, 'S', 107.191025, 27.951342, 3, 'tr_0 tr_520000 tr_520300', 8);
INSERT INTO `sys_area`
VALUES (520324, '正安县', 520300, '正安', NULL, NULL, 'Z', 107.441872, 28.550337, 3, 'tr_0 tr_520000 tr_520300', 13);
INSERT INTO `sys_area`
VALUES (520325, '道真仡佬族苗族自治县', 520300, '道真', NULL, NULL, 'D', 107.605339, 28.880089, 3, 'tr_0 tr_520000 tr_520300', 2);
INSERT INTO `sys_area`
VALUES (520326, '务川仡佬族苗族自治县', 520300, '务川', NULL, NULL, 'W', 107.887856, 28.521566, 3, 'tr_0 tr_520000 tr_520300', 10);
INSERT INTO `sys_area`
VALUES (520327, '凤冈县', 520300, '凤冈', NULL, NULL, 'F', 107.722023, 27.960857, 3, 'tr_0 tr_520000 tr_520300', 3);
INSERT INTO `sys_area`
VALUES (520328, '湄潭县', 520300, '湄潭', NULL, NULL, 'Z', 107.485725, 27.765839, 3, 'tr_0 tr_520000 tr_520300', 6);
INSERT INTO `sys_area`
VALUES (520329, '余庆县', 520300, '余庆', NULL, NULL, 'Y', 107.892563, 27.221552, 3, 'tr_0 tr_520000 tr_520300', 12);
INSERT INTO `sys_area`
VALUES (520330, '习水县', 520300, '习水', NULL, NULL, 'X', 106.200951, 28.327826, 3, 'tr_0 tr_520000 tr_520300', 11);
INSERT INTO `sys_area`
VALUES (520381, '赤水市', 520300, '赤水', NULL, NULL, 'C', 105.698112, 28.587057, 3, 'tr_0 tr_520000 tr_520300', 1);
INSERT INTO `sys_area`
VALUES (520382, '仁怀市', 520300, '仁怀', NULL, NULL, 'R', 106.412476, 27.803377, 3, 'tr_0 tr_520000 tr_520300', 7);
INSERT INTO `sys_area`
VALUES (520400, '安顺市', 520000, '安顺', NULL, NULL, 'A', 105.932190, 26.245544, 2, 'tr_0 tr_520000', 1);
INSERT INTO `sys_area`
VALUES (520402, '西秀区', 520400, '西秀', NULL, NULL, 'X', 105.946167, 26.248323, 3, 'tr_0 tr_520000 tr_520400', 4);
INSERT INTO `sys_area`
VALUES (520421, '平坝县', 520400, '平坝', NULL, NULL, 'P', 106.259941, 26.406080, 3, 'tr_0 tr_520000 tr_520400', 2);
INSERT INTO `sys_area`
VALUES (520422, '普定县', 520400, '普定', NULL, NULL, 'P', 105.745605, 26.305794, 3, 'tr_0 tr_520000 tr_520400', 3);
INSERT INTO `sys_area`
VALUES (520423, '镇宁布依族苗族自治县', 520400, '镇宁', NULL, NULL, 'Z', 105.768654, 26.056095, 3, 'tr_0 tr_520000 tr_520400', 5);
INSERT INTO `sys_area`
VALUES (520424, '关岭布依族苗族自治县', 520400, '关岭', NULL, NULL, 'G', 105.618454, 25.944248, 3, 'tr_0 tr_520000 tr_520400', 1);
INSERT INTO `sys_area`
VALUES (520425, '紫云苗族布依族自治县', 520400, '紫云', NULL, NULL, 'Z', 106.084518, 25.751568, 3, 'tr_0 tr_520000 tr_520400', 6);
INSERT INTO `sys_area`
VALUES (522200, '铜仁市', 520000, '铜仁', NULL, NULL, 'T', 109.191551, 27.718346, 2, 'tr_0 tr_520000', 8);
INSERT INTO `sys_area`
VALUES (522201, '碧江区', 522200, '碧江', NULL, NULL, 'B', 109.192116, 27.718744, 3, 'tr_0 tr_520000 tr_522200', 1);
INSERT INTO `sys_area`
VALUES (522222, '江口县', 522200, '江口', NULL, NULL, 'J', 108.848427, 27.691904, 3, 'tr_0 tr_520000 tr_522200', 3);
INSERT INTO `sys_area`
VALUES (522223, '玉屏侗族自治县', 522200, '玉屏', NULL, NULL, 'Y', 108.917885, 27.238024, 3, 'tr_0 tr_520000 tr_522200', 10);
INSERT INTO `sys_area`
VALUES (522224, '石阡县', 522200, '石阡', NULL, NULL, 'S', 108.229851, 27.519386, 3, 'tr_0 tr_520000 tr_522200', 4);
INSERT INTO `sys_area`
VALUES (522225, '思南县', 522200, '思南', NULL, NULL, 'S', 108.255829, 27.941332, 3, 'tr_0 tr_520000 tr_522200', 5);
INSERT INTO `sys_area`
VALUES (522226, '印江土家族苗族自治县', 522200, '印江', NULL, NULL, 'Y', 108.405518, 27.997976, 3, 'tr_0 tr_520000 tr_522200', 9);
INSERT INTO `sys_area`
VALUES (522227, '德江县', 522200, '德江', NULL, NULL, 'D', 108.117317, 28.260941, 3, 'tr_0 tr_520000 tr_522200', 2);
INSERT INTO `sys_area`
VALUES (522228, '沿河土家族自治县', 522200, '沿河', NULL, NULL, 'Y', 108.495743, 28.560488, 3, 'tr_0 tr_520000 tr_522200', 8);
INSERT INTO `sys_area`
VALUES (522229, '松桃苗族自治县', 522200, '松桃', NULL, NULL, 'S', 109.202629, 28.165419, 3, 'tr_0 tr_520000 tr_522200', 6);
INSERT INTO `sys_area`
VALUES (522230, '万山区', 522200, '万山', NULL, NULL, 'W', 109.211990, 27.519030, 3, 'tr_0 tr_520000 tr_522200', 7);
INSERT INTO `sys_area`
VALUES (522300, '黔西南布依族苗族自治州', 520000, '黔西南', NULL, NULL, 'Q', 104.897972, 25.088120, 2, 'tr_0 tr_520000', 7);
INSERT INTO `sys_area`
VALUES (522301, '兴义市', 522300, '兴义', NULL, NULL, 'X', 104.897980, 25.088598, 3, 'tr_0 tr_520000 tr_522300', 7);
INSERT INTO `sys_area`
VALUES (522322, '兴仁县', 522300, '兴仁', NULL, NULL, 'X', 105.192780, 25.431377, 3, 'tr_0 tr_520000 tr_522300', 6);
INSERT INTO `sys_area`
VALUES (522323, '普安县', 522300, '普安', NULL, NULL, 'P', 104.955345, 25.786404, 3, 'tr_0 tr_520000 tr_522300', 3);
INSERT INTO `sys_area`
VALUES (522324, '晴隆县', 522300, '晴隆', NULL, NULL, 'Q', 105.218773, 25.832882, 3, 'tr_0 tr_520000 tr_522300', 4);
INSERT INTO `sys_area`
VALUES (522325, '贞丰县', 522300, '贞丰', NULL, NULL, 'Z', 105.650131, 25.385752, 3, 'tr_0 tr_520000 tr_522300', 8);
INSERT INTO `sys_area`
VALUES (522326, '望谟县', 522300, '望谟', NULL, NULL, 'W', 106.091560, 25.166668, 3, 'tr_0 tr_520000 tr_522300', 5);
INSERT INTO `sys_area`
VALUES (522327, '册亨县', 522300, '册亨', NULL, NULL, 'C', 105.812408, 24.983337, 3, 'tr_0 tr_520000 tr_522300', 2);
INSERT INTO `sys_area`
VALUES (522328, '安龙县', 522300, '安龙', NULL, NULL, 'A', 105.471497, 25.108959, 3, 'tr_0 tr_520000 tr_522300', 1);
INSERT INTO `sys_area`
VALUES (522400, '毕节市', 520000, '毕节', NULL, NULL, 'B', 105.285011, 27.301693, 2, 'tr_0 tr_520000', 2);
INSERT INTO `sys_area`
VALUES (522401, '七星关区', 522400, '七星关', NULL, NULL, 'Q', 105.284851, 27.302086, 3, 'tr_0 tr_520000 tr_522400', 6);
INSERT INTO `sys_area`
VALUES (522422, '大方县', 522400, '大方', NULL, NULL, 'D', 105.609253, 27.143520, 3, 'tr_0 tr_520000 tr_522400', 1);
INSERT INTO `sys_area`
VALUES (522423, '黔西县', 522400, '黔西', NULL, NULL, 'Q', 106.038300, 27.024923, 3, 'tr_0 tr_520000 tr_522400', 5);
INSERT INTO `sys_area`
VALUES (522424, '金沙县', 522400, '金沙', NULL, NULL, 'J', 106.222099, 27.459694, 3, 'tr_0 tr_520000 tr_522400', 3);
INSERT INTO `sys_area`
VALUES (522425, '织金县', 522400, '织金', NULL, NULL, 'Z', 105.768997, 26.668497, 3, 'tr_0 tr_520000 tr_522400', 8);
INSERT INTO `sys_area`
VALUES (522426, '纳雍县', 522400, '纳雍', NULL, NULL, 'N', 105.375320, 26.769875, 3, 'tr_0 tr_520000 tr_522400', 4);
INSERT INTO `sys_area`
VALUES (522427, '威宁彝族回族苗族自治县', 522400, '威宁', NULL, NULL, 'W', 104.286522, 26.859098, 3, 'tr_0 tr_520000 tr_522400', 7);
INSERT INTO `sys_area`
VALUES (522428, '赫章县', 522400, '赫章', NULL, NULL, 'H', 104.726440, 27.119244, 3, 'tr_0 tr_520000 tr_522400', 2);
INSERT INTO `sys_area`
VALUES (522600, '黔东南苗族侗族自治州', 520000, '黔东南', NULL, NULL, 'Q', 107.977486, 26.583351, 2, 'tr_0 tr_520000', 5);
INSERT INTO `sys_area`
VALUES (522601, '凯里市', 522600, '凯里', NULL, NULL, 'K', 107.977539, 26.582964, 3, 'tr_0 tr_520000 tr_522600', 7);
INSERT INTO `sys_area`
VALUES (522622, '黄平县', 522600, '黄平', NULL, NULL, 'H', 107.901337, 26.896973, 3, 'tr_0 tr_520000 tr_522600', 4);
INSERT INTO `sys_area`
VALUES (522623, '施秉县', 522600, '施秉', NULL, NULL, 'S', 108.126778, 27.034657, 3, 'tr_0 tr_520000 tr_522600', 13);
INSERT INTO `sys_area`
VALUES (522624, '三穗县', 522600, '三穗', NULL, NULL, 'S', 108.681122, 26.959885, 3, 'tr_0 tr_520000 tr_522600', 12);
INSERT INTO `sys_area`
VALUES (522625, '镇远县', 522600, '镇远', NULL, NULL, 'Z', 108.423653, 27.050234, 3, 'tr_0 tr_520000 tr_522600', 16);
INSERT INTO `sys_area`
VALUES (522626, '岑巩县', 522600, '岑巩', NULL, NULL, 'Z', 108.816460, 27.173244, 3, 'tr_0 tr_520000 tr_522600', 1);
INSERT INTO `sys_area`
VALUES (522627, '天柱县', 522600, '天柱', NULL, NULL, 'T', 109.212799, 26.909683, 3, 'tr_0 tr_520000 tr_522600', 15);
INSERT INTO `sys_area`
VALUES (522628, '锦屏县', 522600, '锦屏', NULL, NULL, 'J', 109.202522, 26.680626, 3, 'tr_0 tr_520000 tr_522600', 6);
INSERT INTO `sys_area`
VALUES (522629, '剑河县', 522600, '剑河', NULL, NULL, 'J', 108.440498, 26.727348, 3, 'tr_0 tr_520000 tr_522600', 5);
INSERT INTO `sys_area`
VALUES (522630, '台江县', 522600, '台江', NULL, NULL, 'T', 108.314636, 26.669138, 3, 'tr_0 tr_520000 tr_522600', 14);
INSERT INTO `sys_area`
VALUES (522631, '黎平县', 522600, '黎平', NULL, NULL, 'L', 109.136505, 26.230637, 3, 'tr_0 tr_520000 tr_522600', 9);
INSERT INTO `sys_area`
VALUES (522632, '榕江县', 522600, '榕江', NULL, NULL, 'Z', 108.521027, 25.931086, 3, 'tr_0 tr_520000 tr_522600', 11);
INSERT INTO `sys_area`
VALUES (522633, '从江县', 522600, '从江', NULL, NULL, 'C', 108.912651, 25.747059, 3, 'tr_0 tr_520000 tr_522600', 2);
INSERT INTO `sys_area`
VALUES (522634, '雷山县', 522600, '雷山', NULL, NULL, 'L', 108.079613, 26.381027, 3, 'tr_0 tr_520000 tr_522600', 8);
INSERT INTO `sys_area`
VALUES (522635, '麻江县', 522600, '麻江', NULL, NULL, 'M', 107.593170, 26.494802, 3, 'tr_0 tr_520000 tr_522600', 10);
INSERT INTO `sys_area`
VALUES (522636, '丹寨县', 522600, '丹寨', NULL, NULL, 'D', 107.794807, 26.199497, 3, 'tr_0 tr_520000 tr_522600', 3);
INSERT INTO `sys_area`
VALUES (522700, '黔南布依族苗族自治州', 520000, '黔南', NULL, NULL, 'Q', 107.517159, 26.258219, 2, 'tr_0 tr_520000', 6);
INSERT INTO `sys_area`
VALUES (522701, '都匀市', 522700, '都匀', NULL, NULL, 'D', 107.517021, 26.258205, 3, 'tr_0 tr_520000 tr_522700', 3);
INSERT INTO `sys_area`
VALUES (522702, '福泉市', 522700, '福泉', NULL, NULL, 'F', 107.513512, 26.702509, 3, 'tr_0 tr_520000 tr_522700', 4);
INSERT INTO `sys_area`
VALUES (522722, '荔波县', 522700, '荔波', NULL, NULL, 'L', 107.883797, 25.412239, 3, 'tr_0 tr_520000 tr_522700', 7);
INSERT INTO `sys_area`
VALUES (522723, '贵定县', 522700, '贵定', NULL, NULL, 'G', 107.233589, 26.580807, 3, 'tr_0 tr_520000 tr_522700', 5);
INSERT INTO `sys_area`
VALUES (522725, '瓮安县', 522700, '瓮安', NULL, NULL, 'W', 107.478416, 27.066339, 3, 'tr_0 tr_520000 tr_522700', 12);
INSERT INTO `sys_area`
VALUES (522726, '独山县', 522700, '独山', NULL, NULL, 'D', 107.542755, 25.826283, 3, 'tr_0 tr_520000 tr_522700', 2);
INSERT INTO `sys_area`
VALUES (522727, '平塘县', 522700, '平塘', NULL, NULL, 'P', 107.324051, 25.831802, 3, 'tr_0 tr_520000 tr_522700', 10);
INSERT INTO `sys_area`
VALUES (522728, '罗甸县', 522700, '罗甸', NULL, NULL, 'L', 106.750008, 25.429893, 3, 'tr_0 tr_520000 tr_522700', 9);
INSERT INTO `sys_area`
VALUES (522729, '长顺县', 522700, '长顺', NULL, NULL, 'C', 106.447372, 26.022116, 3, 'tr_0 tr_520000 tr_522700', 1);
INSERT INTO `sys_area`
VALUES (522730, '龙里县', 522700, '龙里', NULL, NULL, 'L', 106.977730, 26.448809, 3, 'tr_0 tr_520000 tr_522700', 8);
INSERT INTO `sys_area`
VALUES (522731, '惠水县', 522700, '惠水', NULL, NULL, 'H', 106.657845, 26.128637, 3, 'tr_0 tr_520000 tr_522700', 6);
INSERT INTO `sys_area`
VALUES (522732, '三都水族自治县', 522700, '三都', NULL, NULL, 'S', 107.877472, 25.985184, 3, 'tr_0 tr_520000 tr_522700', 11);
INSERT INTO `sys_area`
VALUES (530000, '云南省', 0, '云南', NULL, NULL, 'Y', 102.712250, 25.040609, 1, 'tr_0', 25);
INSERT INTO `sys_area`
VALUES (530100, '昆明市', 530000, '昆明', NULL, NULL, 'K', 102.712250, 25.040609, 2, 'tr_0 tr_530000', 7);
INSERT INTO `sys_area`
VALUES (530102, '五华区', 530100, '五华', NULL, NULL, 'W', 102.704414, 25.042166, 3, 'tr_0 tr_530000 tr_530100', 11);
INSERT INTO `sys_area`
VALUES (530103, '盘龙区', 530100, '盘龙', NULL, NULL, 'P', 102.729042, 25.070238, 3, 'tr_0 tr_530000 tr_530100', 8);
INSERT INTO `sys_area`
VALUES (530111, '官渡区', 530100, '官渡', NULL, NULL, 'G', 102.723434, 25.021212, 3, 'tr_0 tr_530000 tr_530100', 5);
INSERT INTO `sys_area`
VALUES (530112, '西山区', 530100, '西山', NULL, NULL, 'X', 102.705902, 25.024361, 3, 'tr_0 tr_530000 tr_530100', 12);
INSERT INTO `sys_area`
VALUES (530113, '东川区', 530100, '东川', NULL, NULL, 'D', 103.181999, 26.083490, 3, 'tr_0 tr_530000 tr_530100', 3);
INSERT INTO `sys_area`
VALUES (530121, '呈贡区', 530100, '呈贡', NULL, NULL, 'C', 102.801384, 24.889275, 3, 'tr_0 tr_530000 tr_530100', 2);
INSERT INTO `sys_area`
VALUES (530122, '晋宁县', 530100, '晋宁', NULL, NULL, 'J', 102.594986, 24.666945, 3, 'tr_0 tr_530000 tr_530100', 6);
INSERT INTO `sys_area`
VALUES (530124, '富民县', 530100, '富民', NULL, NULL, 'F', 102.497887, 25.219667, 3, 'tr_0 tr_530000 tr_530100', 4);
INSERT INTO `sys_area`
VALUES (530125, '宜良县', 530100, '宜良', NULL, NULL, 'Y', 103.145988, 24.918215, 3, 'tr_0 tr_530000 tr_530100', 14);
INSERT INTO `sys_area`
VALUES (530126, '石林彝族自治县', 530100, '石林', NULL, NULL, 'S', 103.271965, 24.754545, 3, 'tr_0 tr_530000 tr_530100', 9);
INSERT INTO `sys_area`
VALUES (530127, '嵩明县', 530100, '嵩明', NULL, NULL, 'Z', 103.038780, 25.335087, 3, 'tr_0 tr_530000 tr_530100', 10);
INSERT INTO `sys_area`
VALUES (530128, '禄劝彝族苗族自治县', 530100, '禄劝', NULL, NULL, 'L', 102.469048, 25.556534, 3, 'tr_0 tr_530000 tr_530100', 7);
INSERT INTO `sys_area`
VALUES (530129, '寻甸回族彝族自治县', 530100, '寻甸', NULL, NULL, 'X', 103.257591, 25.559475, 3, 'tr_0 tr_530000 tr_530100', 13);
INSERT INTO `sys_area`
VALUES (530181, '安宁市', 530100, '安宁', NULL, NULL, 'A', 102.485542, 24.921785, 3, 'tr_0 tr_530000 tr_530100', 1);
INSERT INTO `sys_area`
VALUES (530300, '曲靖市', 530000, '曲靖', NULL, NULL, 'Q', 103.797852, 25.501556, 2, 'tr_0 tr_530000', 12);
INSERT INTO `sys_area`
VALUES (530302, '麒麟区', 530300, '麒麟', NULL, NULL, 'Z', 103.798058, 25.501268, 3, 'tr_0 tr_530000 tr_530300', 6);
INSERT INTO `sys_area`
VALUES (530321, '马龙县', 530300, '马龙', NULL, NULL, 'M', 103.578758, 25.429451, 3, 'tr_0 tr_530000 tr_530300', 5);
INSERT INTO `sys_area`
VALUES (530322, '陆良县', 530300, '陆良', NULL, NULL, 'L', 103.655235, 25.022879, 3, 'tr_0 tr_530000 tr_530300', 3);
INSERT INTO `sys_area`
VALUES (530323, '师宗县', 530300, '师宗', NULL, NULL, 'S', 103.993805, 24.825682, 3, 'tr_0 tr_530000 tr_530300', 7);
INSERT INTO `sys_area`
VALUES (530324, '罗平县', 530300, '罗平', NULL, NULL, 'L', 104.309265, 24.885708, 3, 'tr_0 tr_530000 tr_530300', 4);
INSERT INTO `sys_area`
VALUES (530325, '富源县', 530300, '富源', NULL, NULL, 'F', 104.256920, 25.670641, 3, 'tr_0 tr_530000 tr_530300', 1);
INSERT INTO `sys_area`
VALUES (530326, '会泽县', 530300, '会泽', NULL, NULL, 'H', 103.300041, 26.412861, 3, 'tr_0 tr_530000 tr_530300', 2);
INSERT INTO `sys_area`
VALUES (530328, '沾益县', 530300, '沾益', NULL, NULL, 'Z', 103.819260, 25.600878, 3, 'tr_0 tr_530000 tr_530300', 9);
INSERT INTO `sys_area`
VALUES (530381, '宣威市', 530300, '宣威', NULL, NULL, 'X', 104.095543, 26.227777, 3, 'tr_0 tr_530000 tr_530300', 8);
INSERT INTO `sys_area`
VALUES (530400, '玉溪市', 530000, '玉溪', NULL, NULL, 'Y', 102.543907, 24.350460, 2, 'tr_0 tr_530000', 15);
INSERT INTO `sys_area`
VALUES (530402, '红塔区', 530400, '红塔', NULL, NULL, 'H', 102.543465, 24.350754, 3, 'tr_0 tr_530000 tr_530400', 3);
INSERT INTO `sys_area`
VALUES (530421, '江川县', 530400, '江川', NULL, NULL, 'J', 102.749840, 24.291006, 3, 'tr_0 tr_530000 tr_530400', 5);
INSERT INTO `sys_area`
VALUES (530422, '澄江县', 530400, '澄江', NULL, NULL, 'C', 102.916649, 24.669680, 3, 'tr_0 tr_530000 tr_530400', 1);
INSERT INTO `sys_area`
VALUES (530423, '通海县', 530400, '通海', NULL, NULL, 'T', 102.760040, 24.112206, 3, 'tr_0 tr_530000 tr_530400', 6);
INSERT INTO `sys_area`
VALUES (530424, '华宁县', 530400, '华宁', NULL, NULL, 'H', 102.928986, 24.189808, 3, 'tr_0 tr_530000 tr_530400', 4);
INSERT INTO `sys_area`
VALUES (530425, '易门县', 530400, '易门', NULL, NULL, 'Y', 102.162109, 24.669598, 3, 'tr_0 tr_530000 tr_530400', 8);
INSERT INTO `sys_area`
VALUES (530426, '峨山彝族自治县', 530400, '峨山', NULL, NULL, 'E', 102.404358, 24.173256, 3, 'tr_0 tr_530000 tr_530400', 2);
INSERT INTO `sys_area`
VALUES (530427, '新平彝族傣族自治县', 530400, '新平', NULL, NULL, 'X', 101.990906, 24.066401, 3, 'tr_0 tr_530000 tr_530400', 7);
INSERT INTO `sys_area`
VALUES (530428, '元江哈尼族彝族傣族自治县', 530400, '元江', NULL, NULL, 'Y', 101.999657, 23.597618, 3, 'tr_0 tr_530000 tr_530400', 9);
INSERT INTO `sys_area`
VALUES (530500, '保山市', 530000, '保山', NULL, NULL, 'B', 99.167130, 25.111801, 2, 'tr_0 tr_530000', 1);
INSERT INTO `sys_area`
VALUES (530502, '隆阳区', 530500, '隆阳', NULL, NULL, 'L', 99.165825, 25.112144, 3, 'tr_0 tr_530000 tr_530500', 3);
INSERT INTO `sys_area`
VALUES (530521, '施甸县', 530500, '施甸', NULL, NULL, 'S', 99.183762, 24.730846, 3, 'tr_0 tr_530000 tr_530500', 4);
INSERT INTO `sys_area`
VALUES (530522, '腾冲县', 530500, '腾冲', NULL, NULL, 'T', 98.497292, 25.017570, 3, 'tr_0 tr_530000 tr_530500', 5);
INSERT INTO `sys_area`
VALUES (530523, '龙陵县', 530500, '龙陵', NULL, NULL, 'L', 98.693565, 24.591911, 3, 'tr_0 tr_530000 tr_530500', 2);
INSERT INTO `sys_area`
VALUES (530524, '昌宁县', 530500, '昌宁', NULL, NULL, 'C', 99.612343, 24.823662, 3, 'tr_0 tr_530000 tr_530500', 1);
INSERT INTO `sys_area`
VALUES (530600, '昭通市', 530000, '昭通', NULL, NULL, 'Z', 103.717216, 27.337000, 2, 'tr_0 tr_530000', 16);
INSERT INTO `sys_area`
VALUES (530602, '昭阳区', 530600, '昭阳', NULL, NULL, 'Z', 103.717270, 27.336636, 3, 'tr_0 tr_530000 tr_530600', 10);
INSERT INTO `sys_area`
VALUES (530621, '鲁甸县', 530600, '鲁甸', NULL, NULL, 'L', 103.549332, 27.191637, 3, 'tr_0 tr_530000 tr_530600', 2);
INSERT INTO `sys_area`
VALUES (530622, '巧家县', 530600, '巧家', NULL, NULL, 'Q', 102.929283, 26.911699, 3, 'tr_0 tr_530000 tr_530600', 3);
INSERT INTO `sys_area`
VALUES (530623, '盐津县', 530600, '盐津', NULL, NULL, 'Y', 104.235062, 28.106922, 3, 'tr_0 tr_530000 tr_530600', 7);
INSERT INTO `sys_area`
VALUES (530624, '大关县', 530600, '大关', NULL, NULL, 'D', 103.891609, 27.747114, 3, 'tr_0 tr_530000 tr_530600', 1);
INSERT INTO `sys_area`
VALUES (530625, '永善县', 530600, '永善', NULL, NULL, 'Y', 103.637321, 28.231525, 3, 'tr_0 tr_530000 tr_530600', 9);
INSERT INTO `sys_area`
VALUES (530626, '绥江县', 530600, '绥江', NULL, NULL, 'S', 103.961098, 28.599953, 3, 'tr_0 tr_530000 tr_530600', 5);
INSERT INTO `sys_area`
VALUES (530627, '镇雄县', 530600, '镇雄', NULL, NULL, 'Z', 104.873055, 27.436268, 3, 'tr_0 tr_530000 tr_530600', 11);
INSERT INTO `sys_area`
VALUES (530628, '彝良县', 530600, '彝良', NULL, NULL, 'Y', 104.048492, 27.627424, 3, 'tr_0 tr_530000 tr_530600', 8);
INSERT INTO `sys_area`
VALUES (530629, '威信县', 530600, '威信', NULL, NULL, 'W', 105.048691, 27.843382, 3, 'tr_0 tr_530000 tr_530600', 6);
INSERT INTO `sys_area`
VALUES (530630, '水富县', 530600, '水富', NULL, NULL, 'S', 104.415375, 28.629688, 3, 'tr_0 tr_530000 tr_530600', 4);
INSERT INTO `sys_area`
VALUES (530700, '丽江市', 530000, '丽江', NULL, NULL, 'L', 100.233025, 26.872108, 2, 'tr_0 tr_530000', 8);
INSERT INTO `sys_area`
VALUES (530702, '古城区', 530700, '古城', NULL, NULL, 'G', 100.234413, 26.872229, 3, 'tr_0 tr_530000 tr_530700', 1);
INSERT INTO `sys_area`
VALUES (530721, '玉龙纳西族自治县', 530700, '玉龙', NULL, NULL, 'Y', 100.238312, 26.830593, 3, 'tr_0 tr_530000 tr_530700', 5);
INSERT INTO `sys_area`
VALUES (530722, '永胜县', 530700, '永胜', NULL, NULL, 'Y', 100.750900, 26.685623, 3, 'tr_0 tr_530000 tr_530700', 4);
INSERT INTO `sys_area`
VALUES (530723, '华坪县', 530700, '华坪', NULL, NULL, 'H', 101.267799, 26.628834, 3, 'tr_0 tr_530000 tr_530700', 2);
INSERT INTO `sys_area`
VALUES (530724, '宁蒗彝族自治县', 530700, '宁蒗', NULL, NULL, 'N', 100.852425, 27.281109, 3, 'tr_0 tr_530000 tr_530700', 3);
INSERT INTO `sys_area`
VALUES (530800, '普洱市', 530000, '普洱', NULL, NULL, 'P', 100.972343, 22.777321, 2, 'tr_0 tr_530000', 11);
INSERT INTO `sys_area`
VALUES (530802, '思茅区', 530800, '思茅', NULL, NULL, 'S', 100.973228, 22.776594, 3, 'tr_0 tr_530000 tr_530800', 8);
INSERT INTO `sys_area`
VALUES (530821, '宁洱哈尼族彝族自治县', 530800, '宁洱', NULL, NULL, 'N', 101.045242, 23.062508, 3, 'tr_0 tr_530000 tr_530800', 7);
INSERT INTO `sys_area`
VALUES (530822, '墨江哈尼族自治县', 530800, '墨江', NULL, NULL, 'M', 101.687607, 23.428165, 3, 'tr_0 tr_530000 tr_530800', 6);
INSERT INTO `sys_area`
VALUES (530823, '景东彝族自治县', 530800, '景东', NULL, NULL, 'J', 100.840012, 24.448523, 3, 'tr_0 tr_530000 tr_530800', 2);
INSERT INTO `sys_area`
VALUES (530824, '景谷傣族彝族自治县', 530800, '景谷', NULL, NULL, 'J', 100.701424, 23.500278, 3, 'tr_0 tr_530000 tr_530800', 3);
INSERT INTO `sys_area`
VALUES (530825, '镇沅彝族哈尼族拉祜族自治县', 530800, '镇沅', NULL, NULL, 'Z', 101.108513, 24.005713, 3, 'tr_0 tr_530000 tr_530800', 10);
INSERT INTO `sys_area`
VALUES (530826, '江城哈尼族彝族自治县', 530800, '江城', NULL, NULL, 'J', 101.859146, 22.583361, 3, 'tr_0 tr_530000 tr_530800', 1);
INSERT INTO `sys_area`
VALUES (530827, '孟连傣族拉祜族佤族自治县', 530800, '孟连', NULL, NULL, 'M', 99.585403, 22.325924, 3, 'tr_0 tr_530000 tr_530800', 5);
INSERT INTO `sys_area`
VALUES (530828, '澜沧拉祜族自治县', 530800, '澜沧', NULL, NULL, 'L', 99.931198, 22.553083, 3, 'tr_0 tr_530000 tr_530800', 4);
INSERT INTO `sys_area`
VALUES (530829, '西盟佤族自治县', 530800, '西盟', NULL, NULL, 'X', 99.594376, 22.644423, 3, 'tr_0 tr_530000 tr_530800', 9);
INSERT INTO `sys_area`
VALUES (530900, '临沧市', 530000, '临沧', NULL, NULL, 'L', 100.086967, 23.886566, 2, 'tr_0 tr_530000', 9);
INSERT INTO `sys_area`
VALUES (530902, '临翔区', 530900, '临翔', NULL, NULL, 'L', 100.086487, 23.886562, 3, 'tr_0 tr_530000 tr_530900', 4);
INSERT INTO `sys_area`
VALUES (530921, '凤庆县', 530900, '凤庆', NULL, NULL, 'F', 99.918709, 24.592737, 3, 'tr_0 tr_530000 tr_530900', 2);
INSERT INTO `sys_area`
VALUES (530922, '云县', 530900, '云县', NULL, NULL, 'Y', 100.125633, 24.439026, 3, 'tr_0 tr_530000 tr_530900', 7);
INSERT INTO `sys_area`
VALUES (530923, '永德县', 530900, '永德', NULL, NULL, 'Y', 99.253677, 24.028158, 3, 'tr_0 tr_530000 tr_530900', 6);
INSERT INTO `sys_area`
VALUES (530924, '镇康县', 530900, '镇康', NULL, NULL, 'Z', 98.827431, 23.761415, 3, 'tr_0 tr_530000 tr_530900', 8);
INSERT INTO `sys_area`
VALUES (530925, '双江拉祜族佤族布朗族傣族自治县', 530900, '双江', NULL, NULL, 'S', 99.824417, 23.477476, 3, 'tr_0 tr_530000 tr_530900', 5);
INSERT INTO `sys_area`
VALUES (530926, '耿马傣族佤族自治县', 530900, '耿马', NULL, NULL, 'G', 99.402496, 23.534578, 3, 'tr_0 tr_530000 tr_530900', 3);
INSERT INTO `sys_area`
VALUES (530927, '沧源佤族自治县', 530900, '沧源', NULL, NULL, 'C', 99.247398, 23.146887, 3, 'tr_0 tr_530000 tr_530900', 1);
INSERT INTO `sys_area`
VALUES (532300, '楚雄彝族自治州', 530000, '楚雄', NULL, NULL, 'C', 101.546043, 25.041988, 2, 'tr_0 tr_530000', 2);
INSERT INTO `sys_area`
VALUES (532301, '楚雄市', 532300, '楚雄', NULL, NULL, 'C', 101.546143, 25.040913, 3, 'tr_0 tr_530000 tr_532300', 1);
INSERT INTO `sys_area`
VALUES (532322, '双柏县', 532300, '双柏', NULL, NULL, 'S', 101.638237, 24.685095, 3, 'tr_0 tr_530000 tr_532300', 6);
INSERT INTO `sys_area`
VALUES (532323, '牟定县', 532300, '牟定', NULL, NULL, 'M', 101.543045, 25.312111, 3, 'tr_0 tr_530000 tr_532300', 4);
INSERT INTO `sys_area`
VALUES (532324, '南华县', 532300, '南华', NULL, NULL, 'N', 101.274994, 25.192408, 3, 'tr_0 tr_530000 tr_532300', 5);
INSERT INTO `sys_area`
VALUES (532325, '姚安县', 532300, '姚安', NULL, NULL, 'Y', 101.238396, 25.505404, 3, 'tr_0 tr_530000 tr_532300', 8);
INSERT INTO `sys_area`
VALUES (532326, '大姚县', 532300, '大姚', NULL, NULL, 'D', 101.323601, 25.722347, 3, 'tr_0 tr_530000 tr_532300', 2);
INSERT INTO `sys_area`
VALUES (532327, '永仁县', 532300, '永仁', NULL, NULL, 'Y', 101.671173, 26.056316, 3, 'tr_0 tr_530000 tr_532300', 9);
INSERT INTO `sys_area`
VALUES (532328, '元谋县', 532300, '元谋', NULL, NULL, 'Y', 101.870834, 25.703314, 3, 'tr_0 tr_530000 tr_532300', 10);
INSERT INTO `sys_area`
VALUES (532329, '武定县', 532300, '武定', NULL, NULL, 'W', 102.406784, 25.530100, 3, 'tr_0 tr_530000 tr_532300', 7);
INSERT INTO `sys_area`
VALUES (532331, '禄丰县', 532300, '禄丰', NULL, NULL, 'L', 102.075691, 25.143270, 3, 'tr_0 tr_530000 tr_532300', 3);
INSERT INTO `sys_area`
VALUES (532500, '红河哈尼族彝族自治州', 530000, '红河', NULL, NULL, 'H', 103.384186, 23.366776, 2, 'tr_0 tr_530000', 6);
INSERT INTO `sys_area`
VALUES (532501, '个旧市', 532500, '个旧', NULL, NULL, 'G', 103.154755, 23.360382, 3, 'tr_0 tr_530000 tr_532500', 1);
INSERT INTO `sys_area`
VALUES (532502, '开远市', 532500, '开远', NULL, NULL, 'K', 103.258682, 23.713833, 3, 'tr_0 tr_530000 tr_532500', 6);
INSERT INTO `sys_area`
VALUES (532522, '蒙自市', 532500, '蒙自', NULL, NULL, 'M', 103.385002, 23.366842, 3, 'tr_0 tr_530000 tr_532500', 9);
INSERT INTO `sys_area`
VALUES (532523, '屏边苗族自治县', 532500, '屏边', NULL, NULL, 'P', 103.687225, 22.987013, 3, 'tr_0 tr_530000 tr_532500', 11);
INSERT INTO `sys_area`
VALUES (532524, '建水县', 532500, '建水', NULL, NULL, 'J', 102.820496, 23.618387, 3, 'tr_0 tr_530000 tr_532500', 4);
INSERT INTO `sys_area`
VALUES (532525, '石屏县', 532500, '石屏', NULL, NULL, 'S', 102.484467, 23.712568, 3, 'tr_0 tr_530000 tr_532500', 12);
INSERT INTO `sys_area`
VALUES (532526, '弥勒市', 532500, '弥勒', NULL, NULL, 'M', 103.436989, 24.408369, 3, 'tr_0 tr_530000 tr_532500', 10);
INSERT INTO `sys_area`
VALUES (532527, '泸西县', 532500, '泸西', NULL, NULL, 'Z', 103.759621, 24.532368, 3, 'tr_0 tr_530000 tr_532500', 7);
INSERT INTO `sys_area`
VALUES (532528, '元阳县', 532500, '元阳', NULL, NULL, 'Y', 102.837059, 23.219772, 3, 'tr_0 tr_530000 tr_532500', 13);
INSERT INTO `sys_area`
VALUES (532529, '红河县', 532500, '红河', NULL, NULL, 'H', 102.421211, 23.369190, 3, 'tr_0 tr_530000 tr_532500', 3);
INSERT INTO `sys_area`
VALUES (532530, '金平苗族瑶族傣族自治县', 532500, '金平', NULL, NULL, 'J', 103.228355, 22.779982, 3, 'tr_0 tr_530000 tr_532500', 5);
INSERT INTO `sys_area`
VALUES (532531, '绿春县', 532500, '绿春', NULL, NULL, 'L', 102.392860, 22.993521, 3, 'tr_0 tr_530000 tr_532500', 8);
INSERT INTO `sys_area`
VALUES (532532, '河口瑶族自治县', 532500, '河口', NULL, NULL, 'H', 103.961594, 22.507563, 3, 'tr_0 tr_530000 tr_532500', 2);
INSERT INTO `sys_area`
VALUES (532600, '文山壮族苗族自治州', 530000, '文山', NULL, NULL, 'W', 104.244011, 23.369511, 2, 'tr_0 tr_530000', 13);
INSERT INTO `sys_area`
VALUES (532621, '文山市', 532600, '文山', NULL, NULL, 'W', 104.244278, 23.369217, 3, 'tr_0 tr_530000 tr_532600', 6);
INSERT INTO `sys_area`
VALUES (532622, '砚山县', 532600, '砚山', NULL, NULL, 'Y', 104.343987, 23.612301, 3, 'tr_0 tr_530000 tr_532600', 8);
INSERT INTO `sys_area`
VALUES (532623, '西畴县', 532600, '西畴', NULL, NULL, 'X', 104.675713, 23.437439, 3, 'tr_0 tr_530000 tr_532600', 7);
INSERT INTO `sys_area`
VALUES (532624, '麻栗坡县', 532600, '麻栗坡', NULL, NULL, 'M', 104.701897, 23.124203, 3, 'tr_0 tr_530000 tr_532600', 4);
INSERT INTO `sys_area`
VALUES (532625, '马关县', 532600, '马关', NULL, NULL, 'M', 104.398621, 23.011723, 3, 'tr_0 tr_530000 tr_532600', 3);
INSERT INTO `sys_area`
VALUES (532626, '丘北县', 532600, '丘北', NULL, NULL, 'Q', 104.194366, 24.040981, 3, 'tr_0 tr_530000 tr_532600', 5);
INSERT INTO `sys_area`
VALUES (532627, '广南县', 532600, '广南', NULL, NULL, 'G', 105.056686, 24.050272, 3, 'tr_0 tr_530000 tr_532600', 2);
INSERT INTO `sys_area`
VALUES (532628, '富宁县', 532600, '富宁', NULL, NULL, 'F', 105.628563, 23.626493, 3, 'tr_0 tr_530000 tr_532600', 1);
INSERT INTO `sys_area`
VALUES (532800, '西双版纳傣族自治州', 530000, '西双版纳', NULL, NULL, 'X', 100.797943, 22.001724, 2, 'tr_0 tr_530000', 14);
INSERT INTO `sys_area`
VALUES (532801, '景洪市', 532800, '景洪', NULL, NULL, 'J', 100.797951, 22.002087, 3, 'tr_0 tr_530000 tr_532800', 1);
INSERT INTO `sys_area`
VALUES (532822, '勐海县', 532800, '勐海', NULL, NULL, 'Z', 100.448288, 21.955866, 3, 'tr_0 tr_530000 tr_532800', 2);
INSERT INTO `sys_area`
VALUES (532823, '勐腊县', 532800, '勐腊', NULL, NULL, 'Z', 101.567055, 21.479448, 3, 'tr_0 tr_530000 tr_532800', 3);
INSERT INTO `sys_area`
VALUES (532900, '大理白族自治州', 530000, '大理', NULL, NULL, 'D', 100.225670, 25.589449, 2, 'tr_0 tr_530000', 3);
INSERT INTO `sys_area`
VALUES (532901, '大理市', 532900, '大理', NULL, NULL, 'D', 100.241371, 25.593067, 3, 'tr_0 tr_530000 tr_532900', 2);
INSERT INTO `sys_area`
VALUES (532922, '漾濞彝族自治县', 532900, '漾濞', NULL, NULL, 'Y', 99.957970, 25.669542, 3, 'tr_0 tr_530000 tr_532900', 10);
INSERT INTO `sys_area`
VALUES (532923, '祥云县', 532900, '祥云', NULL, NULL, 'X', 100.554024, 25.477072, 3, 'tr_0 tr_530000 tr_532900', 9);
INSERT INTO `sys_area`
VALUES (532924, '宾川县', 532900, '宾川', NULL, NULL, 'B', 100.578957, 25.825905, 3, 'tr_0 tr_530000 tr_532900', 1);
INSERT INTO `sys_area`
VALUES (532925, '弥渡县', 532900, '弥渡', NULL, NULL, 'M', 100.490669, 25.342594, 3, 'tr_0 tr_530000 tr_532900', 6);
INSERT INTO `sys_area`
VALUES (532926, '南涧彝族自治县', 532900, '南涧', NULL, NULL, 'N', 100.518684, 25.041279, 3, 'tr_0 tr_530000 tr_532900', 7);
INSERT INTO `sys_area`
VALUES (532927, '巍山彝族回族自治县', 532900, '巍山', NULL, NULL, 'W', 100.307930, 25.230909, 3, 'tr_0 tr_530000 tr_532900', 8);
INSERT INTO `sys_area`
VALUES (532928, '永平县', 532900, '永平', NULL, NULL, 'Y', 99.533539, 25.461281, 3, 'tr_0 tr_530000 tr_532900', 11);
INSERT INTO `sys_area`
VALUES (532929, '云龙县', 532900, '云龙', NULL, NULL, 'Y', 99.369400, 25.884954, 3, 'tr_0 tr_530000 tr_532900', 12);
INSERT INTO `sys_area`
VALUES (532930, '洱源县', 532900, '洱源', NULL, NULL, 'E', 99.951706, 26.111183, 3, 'tr_0 tr_530000 tr_532900', 3);
INSERT INTO `sys_area`
VALUES (532931, '剑川县', 532900, '剑川', NULL, NULL, 'J', 99.905884, 26.530066, 3, 'tr_0 tr_530000 tr_532900', 5);
INSERT INTO `sys_area`
VALUES (532932, '鹤庆县', 532900, '鹤庆', NULL, NULL, 'H', 100.173378, 26.558390, 3, 'tr_0 tr_530000 tr_532900', 4);
INSERT INTO `sys_area`
VALUES (533100, '德宏傣族景颇族自治州', 530000, '德宏', NULL, NULL, 'D', 98.578362, 24.436693, 2, 'tr_0 tr_530000', 4);
INSERT INTO `sys_area`
VALUES (533102, '瑞丽市', 533100, '瑞丽', NULL, NULL, 'R', 97.855881, 24.010735, 3, 'tr_0 tr_530000 tr_533100', 4);
INSERT INTO `sys_area`
VALUES (533103, '芒市', 533100, '芒市', NULL, NULL, 'M', 98.577606, 24.436699, 3, 'tr_0 tr_530000 tr_533100', 3);
INSERT INTO `sys_area`
VALUES (533122, '梁河县', 533100, '梁河', NULL, NULL, 'L', 98.298195, 24.807421, 3, 'tr_0 tr_530000 tr_533100', 1);
INSERT INTO `sys_area`
VALUES (533123, '盈江县', 533100, '盈江', NULL, NULL, 'Y', 97.933929, 24.709541, 3, 'tr_0 tr_530000 tr_533100', 5);
INSERT INTO `sys_area`
VALUES (533124, '陇川县', 533100, '陇川', NULL, NULL, 'L', 97.794441, 24.184065, 3, 'tr_0 tr_530000 tr_533100', 2);
INSERT INTO `sys_area`
VALUES (533300, '怒江傈僳族自治州', 530000, '怒江', NULL, NULL, 'N', 98.854301, 25.850948, 2, 'tr_0 tr_530000', 10);
INSERT INTO `sys_area`
VALUES (533321, '泸水县', 533300, '泸水', NULL, NULL, 'Z', 98.854065, 25.851143, 3, 'tr_0 tr_530000 tr_533300', 4);
INSERT INTO `sys_area`
VALUES (533323, '福贡县', 533300, '福贡', NULL, NULL, 'F', 98.867416, 26.902739, 3, 'tr_0 tr_530000 tr_533300', 1);
INSERT INTO `sys_area`
VALUES (533324, '贡山独龙族怒族自治县', 533300, '贡山', NULL, NULL, 'G', 98.666138, 27.738054, 3, 'tr_0 tr_530000 tr_533300', 2);
INSERT INTO `sys_area`
VALUES (533325, '兰坪白族普米族自治县', 533300, '兰坪', NULL, NULL, 'L', 99.421379, 26.453838, 3, 'tr_0 tr_530000 tr_533300', 3);
INSERT INTO `sys_area`
VALUES (533400, '迪庆藏族自治州', 530000, '迪庆', NULL, NULL, 'D', 99.706467, 27.826853, 2, 'tr_0 tr_530000', 5);
INSERT INTO `sys_area`
VALUES (533421, '香格里拉县', 533400, '香格里拉', NULL, NULL, 'X', 99.708664, 27.825804, 3, 'tr_0 tr_530000 tr_533400', 3);
INSERT INTO `sys_area`
VALUES (533422, '德钦县', 533400, '德钦', NULL, NULL, 'D', 98.915062, 28.483273, 3, 'tr_0 tr_530000 tr_533400', 1);
INSERT INTO `sys_area`
VALUES (533423, '维西傈僳族自治县', 533400, '维西', NULL, NULL, 'W', 99.286354, 27.180948, 3, 'tr_0 tr_530000 tr_533400', 2);
INSERT INTO `sys_area`
VALUES (540000, '西藏自治区', 0, '西藏', NULL, NULL, 'X', 91.132210, 29.660360, 1, 'tr_0', 26);
INSERT INTO `sys_area`
VALUES (540100, '拉萨市', 540000, '拉萨', NULL, NULL, 'L', 91.132210, 29.660360, 2, 'tr_0 tr_540000', 3);
INSERT INTO `sys_area`
VALUES (540102, '城关区', 540100, '城关', NULL, NULL, 'C', 91.132912, 29.659472, 3, 'tr_0 tr_540000 tr_540100', 1);
INSERT INTO `sys_area`
VALUES (540121, '林周县', 540100, '林周', NULL, NULL, 'L', 91.261841, 29.895754, 3, 'tr_0 tr_540000 tr_540100', 5);
INSERT INTO `sys_area`
VALUES (540122, '当雄县', 540100, '当雄', NULL, NULL, 'D', 91.103554, 30.474819, 3, 'tr_0 tr_540000 tr_540100', 2);
INSERT INTO `sys_area`
VALUES (540123, '尼木县', 540100, '尼木', NULL, NULL, 'N', 90.165543, 29.431347, 3, 'tr_0 tr_540000 tr_540100', 7);
INSERT INTO `sys_area`
VALUES (540124, '曲水县', 540100, '曲水', NULL, NULL, 'Q', 90.738052, 29.349895, 3, 'tr_0 tr_540000 tr_540100', 8);
INSERT INTO `sys_area`
VALUES (540125, '堆龙德庆县', 540100, '堆龙德庆', NULL, NULL, 'D', 91.002823, 29.647346, 3, 'tr_0 tr_540000 tr_540100', 4);
INSERT INTO `sys_area`
VALUES (540126, '达孜县', 540100, '达孜', NULL, NULL, 'D', 91.350975, 29.670315, 3, 'tr_0 tr_540000 tr_540100', 3);
INSERT INTO `sys_area`
VALUES (540127, '墨竹工卡县', 540100, '墨竹工卡', NULL, NULL, 'M', 91.731155, 29.834658, 3, 'tr_0 tr_540000 tr_540100', 6);
INSERT INTO `sys_area`
VALUES (542100, '昌都地区', 540000, '昌都', NULL, NULL, 'C', 97.178452, 31.136875, 2, 'tr_0 tr_540000', 2);
INSERT INTO `sys_area`
VALUES (542121, '昌都县', 542100, '昌都', NULL, NULL, 'C', 97.178253, 31.137035, 3, 'tr_0 tr_540000 tr_542100', 3);
INSERT INTO `sys_area`
VALUES (542122, '江达县', 542100, '江达', NULL, NULL, 'J', 98.218353, 31.499535, 3, 'tr_0 tr_540000 tr_542100', 7);
INSERT INTO `sys_area`
VALUES (542123, '贡觉县', 542100, '贡觉', NULL, NULL, 'G', 98.271194, 30.859205, 3, 'tr_0 tr_540000 tr_542100', 6);
INSERT INTO `sys_area`
VALUES (542124, '类乌齐县', 542100, '类乌齐', NULL, NULL, 'L', 96.601257, 31.213049, 3, 'tr_0 tr_540000 tr_542100', 8);
INSERT INTO `sys_area`
VALUES (542125, '丁青县', 542100, '丁青', NULL, NULL, 'D', 95.597748, 31.410681, 3, 'tr_0 tr_540000 tr_542100', 5);
INSERT INTO `sys_area`
VALUES (542126, '察雅县', 542100, '察雅', NULL, NULL, 'C', 97.565704, 30.653038, 3, 'tr_0 tr_540000 tr_542100', 4);
INSERT INTO `sys_area`
VALUES (542127, '八宿县', 542100, '八宿', NULL, NULL, 'B', 96.917892, 30.053408, 3, 'tr_0 tr_540000 tr_542100', 1);
INSERT INTO `sys_area`
VALUES (542128, '左贡县', 542100, '左贡', NULL, NULL, 'Z', 97.840530, 29.671335, 3, 'tr_0 tr_540000 tr_542100', 11);
INSERT INTO `sys_area`
VALUES (542129, '芒康县', 542100, '芒康', NULL, NULL, 'M', 98.596443, 29.686615, 3, 'tr_0 tr_540000 tr_542100', 10);
INSERT INTO `sys_area`
VALUES (542132, '洛隆县', 542100, '洛隆', NULL, NULL, 'L', 95.823418, 30.741947, 3, 'tr_0 tr_540000 tr_542100', 9);
INSERT INTO `sys_area`
VALUES (542133, '边坝县', 542100, '边坝', NULL, NULL, 'B', 94.707504, 30.933849, 3, 'tr_0 tr_540000 tr_542100', 2);
INSERT INTO `sys_area`
VALUES (542200, '山南地区', 540000, '山南', NULL, NULL, 'S', 91.766525, 29.236023, 2, 'tr_0 tr_540000', 7);
INSERT INTO `sys_area`
VALUES (542221, '乃东县', 542200, '乃东', NULL, NULL, 'N', 91.765251, 29.236107, 3, 'tr_0 tr_540000 tr_542200', 8);
INSERT INTO `sys_area`
VALUES (542222, '扎囊县', 542200, '扎囊', NULL, NULL, 'Z', 91.337997, 29.246475, 3, 'tr_0 tr_540000 tr_542200', 12);
INSERT INTO `sys_area`
VALUES (542223, '贡嘎县', 542200, '贡嘎', NULL, NULL, 'G', 90.985268, 29.289078, 3, 'tr_0 tr_540000 tr_542200', 3);
INSERT INTO `sys_area`
VALUES (542224, '桑日县', 542200, '桑日', NULL, NULL, 'S', 92.015732, 29.259773, 3, 'tr_0 tr_540000 tr_542200', 11);
INSERT INTO `sys_area`
VALUES (542225, '琼结县', 542200, '琼结', NULL, NULL, 'Q', 91.683754, 29.025242, 3, 'tr_0 tr_540000 tr_542200', 9);
INSERT INTO `sys_area`
VALUES (542226, '曲松县', 542200, '曲松', NULL, NULL, 'Q', 92.201065, 29.063656, 3, 'tr_0 tr_540000 tr_542200', 10);
INSERT INTO `sys_area`
VALUES (542227, '措美县', 542200, '措美', NULL, NULL, 'C', 91.432350, 28.437353, 3, 'tr_0 tr_540000 tr_542200', 1);
INSERT INTO `sys_area`
VALUES (542228, '洛扎县', 542200, '洛扎', NULL, NULL, 'L', 90.858246, 28.385765, 3, 'tr_0 tr_540000 tr_542200', 7);
INSERT INTO `sys_area`
VALUES (542229, '加查县', 542200, '加查', NULL, NULL, 'J', 92.591042, 29.140921, 3, 'tr_0 tr_540000 tr_542200', 4);
INSERT INTO `sys_area`
VALUES (542231, '隆子县', 542200, '隆子', NULL, NULL, 'L', 92.463310, 28.408548, 3, 'tr_0 tr_540000 tr_542200', 6);
INSERT INTO `sys_area`
VALUES (542232, '错那县', 542200, '错那', NULL, NULL, 'C', 91.960129, 27.991707, 3, 'tr_0 tr_540000 tr_542200', 2);
INSERT INTO `sys_area`
VALUES (542233, '浪卡子县', 542200, '浪卡子', NULL, NULL, 'L', 90.398750, 28.968361, 3, 'tr_0 tr_540000 tr_542200', 5);
INSERT INTO `sys_area`
VALUES (542300, '日喀则地区', 540000, '日喀则', NULL, NULL, 'R', 88.885147, 29.267519, 2, 'tr_0 tr_540000', 6);
INSERT INTO `sys_area`
VALUES (542301, '日喀则市', 542300, '日喀则', NULL, NULL, 'R', 88.886673, 29.267002, 3, 'tr_0 tr_540000 tr_542300', 13);
INSERT INTO `sys_area`
VALUES (542322, '南木林县', 542300, '南木林', NULL, NULL, 'N', 89.099434, 29.680458, 3, 'tr_0 tr_540000 tr_542300', 10);
INSERT INTO `sys_area`
VALUES (542323, '江孜县', 542300, '江孜', NULL, NULL, 'J', 89.605042, 28.908846, 3, 'tr_0 tr_540000 tr_542300', 6);
INSERT INTO `sys_area`
VALUES (542324, '定日县', 542300, '定日', NULL, NULL, 'D', 87.123886, 28.656668, 3, 'tr_0 tr_540000 tr_542300', 4);
INSERT INTO `sys_area`
VALUES (542325, '萨迦县', 542300, '萨迦', NULL, NULL, 'S', 88.023010, 28.901077, 3, 'tr_0 tr_540000 tr_542300', 15);
INSERT INTO `sys_area`
VALUES (542326, '拉孜县', 542300, '拉孜', NULL, NULL, 'L', 87.637428, 29.085136, 3, 'tr_0 tr_540000 tr_542300', 9);
INSERT INTO `sys_area`
VALUES (542327, '昂仁县', 542300, '昂仁', NULL, NULL, 'A', 87.235779, 29.294758, 3, 'tr_0 tr_540000 tr_542300', 1);
INSERT INTO `sys_area`
VALUES (542328, '谢通门县', 542300, '谢通门', NULL, NULL, 'X', 88.260513, 29.431597, 3, 'tr_0 tr_540000 tr_542300', 16);
INSERT INTO `sys_area`
VALUES (542329, '白朗县', 542300, '白朗', NULL, NULL, 'B', 89.263618, 29.106627, 3, 'tr_0 tr_540000 tr_542300', 2);
INSERT INTO `sys_area`
VALUES (542330, '仁布县', 542300, '仁布', NULL, NULL, 'R', 89.843208, 29.230299, 3, 'tr_0 tr_540000 tr_542300', 12);
INSERT INTO `sys_area`
VALUES (542331, '康马县', 542300, '康马', NULL, NULL, 'K', 89.683403, 28.554720, 3, 'tr_0 tr_540000 tr_542300', 8);
INSERT INTO `sys_area`
VALUES (542332, '定结县', 542300, '定结', NULL, NULL, 'D', 87.767723, 28.364090, 3, 'tr_0 tr_540000 tr_542300', 3);
INSERT INTO `sys_area`
VALUES (542333, '仲巴县', 542300, '仲巴', NULL, NULL, 'Z', 84.032829, 29.768335, 3, 'tr_0 tr_540000 tr_542300', 18);
INSERT INTO `sys_area`
VALUES (542334, '亚东县', 542300, '亚东', NULL, NULL, 'Y', 88.906807, 27.482773, 3, 'tr_0 tr_540000 tr_542300', 17);
INSERT INTO `sys_area`
VALUES (542335, '吉隆县', 542300, '吉隆', NULL, NULL, 'J', 85.298347, 28.852415, 3, 'tr_0 tr_540000 tr_542300', 7);
INSERT INTO `sys_area`
VALUES (542336, '聂拉木县', 542300, '聂拉木', NULL, NULL, 'N', 85.981956, 28.155951, 3, 'tr_0 tr_540000 tr_542300', 11);
INSERT INTO `sys_area`
VALUES (542337, '萨嘎县', 542300, '萨嘎', NULL, NULL, 'S', 85.234619, 29.328194, 3, 'tr_0 tr_540000 tr_542300', 14);
INSERT INTO `sys_area`
VALUES (542338, '岗巴县', 542300, '岗巴', NULL, NULL, 'G', 88.518906, 28.274370, 3, 'tr_0 tr_540000 tr_542300', 5);
INSERT INTO `sys_area`
VALUES (542400, '那曲地区', 540000, '那曲', NULL, NULL, 'N', 92.060211, 31.476004, 2, 'tr_0 tr_540000', 5);
INSERT INTO `sys_area`
VALUES (542421, '那曲县', 542400, '那曲', NULL, NULL, 'N', 92.061859, 31.475756, 3, 'tr_0 tr_540000 tr_542400', 6);
INSERT INTO `sys_area`
VALUES (542422, '嘉黎县', 542400, '嘉黎', NULL, NULL, 'J', 93.232910, 30.640846, 3, 'tr_0 tr_540000 tr_542400', 5);
INSERT INTO `sys_area`
VALUES (542423, '比如县', 542400, '比如', NULL, NULL, 'B', 93.680443, 31.479918, 3, 'tr_0 tr_540000 tr_542400', 4);
INSERT INTO `sys_area`
VALUES (542424, '聂荣县', 542400, '聂荣', NULL, NULL, 'N', 92.303658, 32.107857, 3, 'tr_0 tr_540000 tr_542400', 7);
INSERT INTO `sys_area`
VALUES (542425, '安多县', 542400, '安多', NULL, NULL, 'A', 91.681877, 32.260300, 3, 'tr_0 tr_540000 tr_542400', 1);
INSERT INTO `sys_area`
VALUES (542426, '申扎县', 542400, '申扎', NULL, NULL, 'S', 88.709778, 30.929056, 3, 'tr_0 tr_540000 tr_542400', 9);
INSERT INTO `sys_area`
VALUES (542427, '索县', 542400, '索县', NULL, NULL, 'S', 93.784966, 31.886173, 3, 'tr_0 tr_540000 tr_542400', 11);
INSERT INTO `sys_area`
VALUES (542428, '班戈县', 542400, '班戈', NULL, NULL, 'B', 90.011826, 31.394579, 3, 'tr_0 tr_540000 tr_542400', 2);
INSERT INTO `sys_area`
VALUES (542429, '巴青县', 542400, '巴青', NULL, NULL, 'B', 94.054047, 31.918692, 3, 'tr_0 tr_540000 tr_542400', 3);
INSERT INTO `sys_area`
VALUES (542430, '尼玛县', 542400, '尼玛', NULL, NULL, 'N', 87.236649, 31.784979, 3, 'tr_0 tr_540000 tr_542400', 8);
INSERT INTO `sys_area`
VALUES (542432, '双湖县', 542400, '双湖', NULL, NULL, 'S', 88.838577, 33.186981, 3, 'tr_0 tr_540000 tr_542400', 10);
INSERT INTO `sys_area`
VALUES (542500, '阿里地区', 540000, '阿里', NULL, NULL, 'A', 80.105499, 32.503185, 2, 'tr_0 tr_540000', 1);
INSERT INTO `sys_area`
VALUES (542521, '普兰县', 542500, '普兰', NULL, NULL, 'P', 81.177589, 30.291897, 3, 'tr_0 tr_540000 tr_542500', 5);
INSERT INTO `sys_area`
VALUES (542522, '札达县', 542500, '札达', NULL, NULL, 'Z', 79.803192, 31.478586, 3, 'tr_0 tr_540000 tr_542500', 7);
INSERT INTO `sys_area`
VALUES (542523, '噶尔县', 542500, '噶尔', NULL, NULL, 'G', 80.105003, 32.503372, 3, 'tr_0 tr_540000 tr_542500', 2);
INSERT INTO `sys_area`
VALUES (542524, '日土县', 542500, '日土', NULL, NULL, 'R', 79.731934, 33.382454, 3, 'tr_0 tr_540000 tr_542500', 6);
INSERT INTO `sys_area`
VALUES (542525, '革吉县', 542500, '革吉', NULL, NULL, 'G', 81.142899, 32.389191, 3, 'tr_0 tr_540000 tr_542500', 4);
INSERT INTO `sys_area`
VALUES (542526, '改则县', 542500, '改则', NULL, NULL, 'G', 84.062386, 32.302074, 3, 'tr_0 tr_540000 tr_542500', 3);
INSERT INTO `sys_area`
VALUES (542527, '措勤县', 542500, '措勤', NULL, NULL, 'C', 85.159256, 31.016773, 3, 'tr_0 tr_540000 tr_542500', 1);
INSERT INTO `sys_area`
VALUES (542600, '林芝地区', 540000, '林芝', NULL, NULL, 'L', 94.362350, 29.654694, 2, 'tr_0 tr_540000', 4);
INSERT INTO `sys_area`
VALUES (542621, '林芝县', 542600, '林芝', NULL, NULL, 'L', 94.360985, 29.653732, 3, 'tr_0 tr_540000 tr_542600', 5);
INSERT INTO `sys_area`
VALUES (542622, '工布江达县', 542600, '工布江达', NULL, NULL, 'G', 93.246513, 29.884470, 3, 'tr_0 tr_540000 tr_542600', 3);
INSERT INTO `sys_area`
VALUES (542623, '米林县', 542600, '米林', NULL, NULL, 'M', 94.213676, 29.213812, 3, 'tr_0 tr_540000 tr_542600', 6);
INSERT INTO `sys_area`
VALUES (542624, '墨脱县', 542600, '墨脱', NULL, NULL, 'M', 95.332245, 29.325729, 3, 'tr_0 tr_540000 tr_542600', 7);
INSERT INTO `sys_area`
VALUES (542625, '波密县', 542600, '波密', NULL, NULL, 'B', 95.768150, 29.858770, 3, 'tr_0 tr_540000 tr_542600', 1);
INSERT INTO `sys_area`
VALUES (542626, '察隅县', 542600, '察隅', NULL, NULL, 'C', 97.465004, 28.660244, 3, 'tr_0 tr_540000 tr_542600', 2);
INSERT INTO `sys_area`
VALUES (542627, '朗县', 542600, '朗县', NULL, NULL, 'L', 93.073425, 29.044600, 3, 'tr_0 tr_540000 tr_542600', 4);
INSERT INTO `sys_area`
VALUES (610000, '陕西省', 0, '陕西', NULL, NULL, 'S', 108.948021, 34.263161, 1, 'tr_0', 27);
INSERT INTO `sys_area`
VALUES (610100, '西安市', 610000, '西安', NULL, NULL, 'X', 108.948021, 34.263161, 2, 'tr_0 tr_610000', 7);
INSERT INTO `sys_area`
VALUES (610102, '新城区', 610100, '新城', NULL, NULL, 'X', 108.959900, 34.269272, 3, 'tr_0 tr_610000 tr_610100', 10);
INSERT INTO `sys_area`
VALUES (610103, '碑林区', 610100, '碑林', NULL, NULL, 'B', 108.946991, 34.251060, 3, 'tr_0 tr_610000 tr_610100', 2);
INSERT INTO `sys_area`
VALUES (610104, '莲湖区', 610100, '莲湖', NULL, NULL, 'L', 108.933197, 34.265598, 3, 'tr_0 tr_610000 tr_610100', 7);
INSERT INTO `sys_area`
VALUES (610111, '灞桥区', 610100, '灞桥', NULL, NULL, 'Z', 109.067261, 34.267452, 3, 'tr_0 tr_610000 tr_610100', 1);
INSERT INTO `sys_area`
VALUES (610112, '未央区', 610100, '未央', NULL, NULL, 'W', 108.946022, 34.308231, 3, 'tr_0 tr_610000 tr_610100', 9);
INSERT INTO `sys_area`
VALUES (610113, '雁塔区', 610100, '雁塔', NULL, NULL, 'Y', 108.926590, 34.213390, 3, 'tr_0 tr_610000 tr_610100', 12);
INSERT INTO `sys_area`
VALUES (610114, '阎良区', 610100, '阎良', NULL, NULL, 'Y', 109.228020, 34.662140, 3, 'tr_0 tr_610000 tr_610100', 11);
INSERT INTO `sys_area`
VALUES (610115, '临潼区', 610100, '临潼', NULL, NULL, 'L', 109.213989, 34.372066, 3, 'tr_0 tr_610000 tr_610100', 8);
INSERT INTO `sys_area`
VALUES (610116, '长安区', 610100, '长安', NULL, NULL, 'C', 108.941582, 34.157097, 3, 'tr_0 tr_610000 tr_610100', 3);
INSERT INTO `sys_area`
VALUES (610122, '蓝田县', 610100, '蓝田', NULL, NULL, 'L', 109.317635, 34.156189, 3, 'tr_0 tr_610000 tr_610100', 6);
INSERT INTO `sys_area`
VALUES (610124, '周至县', 610100, '周至', NULL, NULL, 'Z', 108.216469, 34.161533, 3, 'tr_0 tr_610000 tr_610100', 13);
INSERT INTO `sys_area`
VALUES (610125, '户县', 610100, '户县', NULL, NULL, 'H', 108.607384, 34.108669, 3, 'tr_0 tr_610000 tr_610100', 5);
INSERT INTO `sys_area`
VALUES (610126, '高陵县', 610100, '高陵', NULL, NULL, 'G', 109.088898, 34.535065, 3, 'tr_0 tr_610000 tr_610100', 4);
INSERT INTO `sys_area`
VALUES (610200, '铜川市', 610000, '铜川', NULL, NULL, 'T', 108.979607, 34.916580, 2, 'tr_0 tr_610000', 5);
INSERT INTO `sys_area`
VALUES (610202, '王益区', 610200, '王益', NULL, NULL, 'W', 109.075859, 35.069099, 3, 'tr_0 tr_610000 tr_610200', 1);
INSERT INTO `sys_area`
VALUES (610203, '印台区', 610200, '印台', NULL, NULL, 'Y', 109.100815, 35.111927, 3, 'tr_0 tr_610000 tr_610200', 4);
INSERT INTO `sys_area`
VALUES (610204, '耀州区', 610200, '耀州', NULL, NULL, 'Y', 108.962540, 34.910206, 3, 'tr_0 tr_610000 tr_610200', 2);
INSERT INTO `sys_area`
VALUES (610222, '宜君县', 610200, '宜君', NULL, NULL, 'Y', 109.118279, 35.398766, 3, 'tr_0 tr_610000 tr_610200', 3);
INSERT INTO `sys_area`
VALUES (610300, '宝鸡市', 610000, '宝鸡', NULL, NULL, 'B', 107.144867, 34.369316, 2, 'tr_0 tr_610000', 2);
INSERT INTO `sys_area`
VALUES (610302, '渭滨区', 610300, '渭滨', NULL, NULL, 'W', 107.144470, 34.371010, 3, 'tr_0 tr_610000 tr_610300', 12);
INSERT INTO `sys_area`
VALUES (610303, '金台区', 610300, '金台', NULL, NULL, 'J', 107.149940, 34.375191, 3, 'tr_0 tr_610000 tr_610300', 5);
INSERT INTO `sys_area`
VALUES (610304, '陈仓区', 610300, '陈仓', NULL, NULL, 'C', 107.383644, 34.352749, 3, 'tr_0 tr_610000 tr_610300', 1);
INSERT INTO `sys_area`
VALUES (610322, '凤翔县', 610300, '凤翔', NULL, NULL, 'F', 107.400574, 34.521667, 3, 'tr_0 tr_610000 tr_610300', 3);
INSERT INTO `sys_area`
VALUES (610323, '岐山县', 610300, '岐山', NULL, NULL, 'Z', 107.624466, 34.442959, 3, 'tr_0 tr_610000 tr_610300', 10);
INSERT INTO `sys_area`
VALUES (610324, '扶风县', 610300, '扶风', NULL, NULL, 'F', 107.891418, 34.375496, 3, 'tr_0 tr_610000 tr_610300', 4);
INSERT INTO `sys_area`
VALUES (610326, '眉县', 610300, '眉县', NULL, NULL, 'M', 107.752373, 34.272137, 3, 'tr_0 tr_610000 tr_610300', 8);
INSERT INTO `sys_area`
VALUES (610327, '陇县', 610300, '陇县', NULL, NULL, 'L', 106.857063, 34.893261, 3, 'tr_0 tr_610000 tr_610300', 7);
INSERT INTO `sys_area`
VALUES (610328, '千阳县', 610300, '千阳', NULL, NULL, 'Q', 107.132988, 34.642586, 3, 'tr_0 tr_610000 tr_610300', 9);
INSERT INTO `sys_area`
VALUES (610329, '麟游县', 610300, '麟游', NULL, NULL, 'Z', 107.796608, 34.677715, 3, 'tr_0 tr_610000 tr_610300', 6);
INSERT INTO `sys_area`
VALUES (610330, '凤县', 610300, '凤县', NULL, NULL, 'F', 106.525215, 33.912464, 3, 'tr_0 tr_610000 tr_610300', 2);
INSERT INTO `sys_area`
VALUES (610331, '太白县', 610300, '太白', NULL, NULL, 'T', 107.316536, 34.059216, 3, 'tr_0 tr_610000 tr_610300', 11);
INSERT INTO `sys_area`
VALUES (610400, '咸阳市', 610000, '咸阳', NULL, NULL, 'X', 108.705116, 34.333439, 2, 'tr_0 tr_610000', 8);
INSERT INTO `sys_area`
VALUES (610402, '秦都区', 610400, '秦都', NULL, NULL, 'Q', 108.698639, 34.329800, 3, 'tr_0 tr_610000 tr_610400', 7);
INSERT INTO `sys_area`
VALUES (610403, '杨陵区', 610400, '杨陵', NULL, NULL, 'Y', 108.086349, 34.271351, 3, 'tr_0 tr_610000 tr_610400', 13);
INSERT INTO `sys_area`
VALUES (610404, '渭城区', 610400, '渭城', NULL, NULL, 'W', 108.730957, 34.336845, 3, 'tr_0 tr_610000 tr_610400', 9);
INSERT INTO `sys_area`
VALUES (610422, '三原县', 610400, '三原', NULL, NULL, 'S', 108.943481, 34.613995, 3, 'tr_0 tr_610000 tr_610400', 8);
INSERT INTO `sys_area`
VALUES (610423, '泾阳县', 610400, '泾阳', NULL, NULL, 'Z', 108.837837, 34.528492, 3, 'tr_0 tr_610000 tr_610400', 4);
INSERT INTO `sys_area`
VALUES (610424, '乾县', 610400, '乾县', NULL, NULL, 'Q', 108.247406, 34.527260, 3, 'tr_0 tr_610000 tr_610400', 6);
INSERT INTO `sys_area`
VALUES (610425, '礼泉县', 610400, '礼泉', NULL, NULL, 'L', 108.428314, 34.482582, 3, 'tr_0 tr_610000 tr_610400', 5);
INSERT INTO `sys_area`
VALUES (610426, '永寿县', 610400, '永寿', NULL, NULL, 'Y', 108.143127, 34.692619, 3, 'tr_0 tr_610000 tr_610400', 14);
INSERT INTO `sys_area`
VALUES (610427, '彬县', 610400, '彬县', NULL, NULL, 'B', 108.083672, 35.034233, 3, 'tr_0 tr_610000 tr_610400', 1);
INSERT INTO `sys_area`
VALUES (610428, '长武县', 610400, '长武', NULL, NULL, 'C', 107.795837, 35.206123, 3, 'tr_0 tr_610000 tr_610400', 2);
INSERT INTO `sys_area`
VALUES (610429, '旬邑县', 610400, '旬邑', NULL, NULL, 'X', 108.337234, 35.112232, 3, 'tr_0 tr_610000 tr_610400', 12);
INSERT INTO `sys_area`
VALUES (610430, '淳化县', 610400, '淳化', NULL, NULL, 'C', 108.581177, 34.797970, 3, 'tr_0 tr_610000 tr_610400', 3);
INSERT INTO `sys_area`
VALUES (610431, '武功县', 610400, '武功', NULL, NULL, 'W', 108.212860, 34.259731, 3, 'tr_0 tr_610000 tr_610400', 10);
INSERT INTO `sys_area`
VALUES (610481, '兴平市', 610400, '兴平', NULL, NULL, 'X', 108.488495, 34.297134, 3, 'tr_0 tr_610000 tr_610400', 11);
INSERT INTO `sys_area`
VALUES (610500, '渭南市', 610000, '渭南', NULL, NULL, 'W', 109.502884, 34.499382, 2, 'tr_0 tr_610000', 6);
INSERT INTO `sys_area`
VALUES (610502, '临渭区', 610500, '临渭', NULL, NULL, 'L', 109.503296, 34.501270, 3, 'tr_0 tr_610000 tr_610500', 9);
INSERT INTO `sys_area`
VALUES (610521, '华县', 610500, '华县', NULL, NULL, 'H', 109.761414, 34.511959, 3, 'tr_0 tr_610000 tr_610500', 7);
INSERT INTO `sys_area`
VALUES (610522, '潼关县', 610500, '潼关', NULL, NULL, 'Z', 110.247261, 34.544514, 3, 'tr_0 tr_610000 tr_610500', 11);
INSERT INTO `sys_area`
VALUES (610523, '大荔县', 610500, '大荔', NULL, NULL, 'D', 109.943123, 34.795010, 3, 'tr_0 tr_610000 tr_610500', 3);
INSERT INTO `sys_area`
VALUES (610524, '合阳县', 610500, '合阳', NULL, NULL, 'H', 110.147980, 35.237099, 3, 'tr_0 tr_610000 tr_610500', 6);
INSERT INTO `sys_area`
VALUES (610525, '澄城县', 610500, '澄城', NULL, NULL, 'C', 109.937607, 35.183998, 3, 'tr_0 tr_610000 tr_610500', 2);
INSERT INTO `sys_area`
VALUES (610526, '蒲城县', 610500, '蒲城', NULL, NULL, 'P', 109.589653, 34.956036, 3, 'tr_0 tr_610000 tr_610500', 10);
INSERT INTO `sys_area`
VALUES (610527, '白水县', 610500, '白水', NULL, NULL, 'B', 109.594307, 35.177292, 3, 'tr_0 tr_610000 tr_610500', 1);
INSERT INTO `sys_area`
VALUES (610528, '富平县', 610500, '富平', NULL, NULL, 'F', 109.187172, 34.746677, 3, 'tr_0 tr_610000 tr_610500', 4);
INSERT INTO `sys_area`
VALUES (610581, '韩城市', 610500, '韩城', NULL, NULL, 'H', 110.452393, 35.475239, 3, 'tr_0 tr_610000 tr_610500', 5);
INSERT INTO `sys_area`
VALUES (610582, '华阴市', 610500, '华阴', NULL, NULL, 'H', 110.089523, 34.565357, 3, 'tr_0 tr_610000 tr_610500', 8);
INSERT INTO `sys_area`
VALUES (610600, '延安市', 610000, '延安', NULL, NULL, 'Y', 109.490807, 36.596539, 2, 'tr_0 tr_610000', 9);
INSERT INTO `sys_area`
VALUES (610602, '宝塔区', 610600, '宝塔', NULL, NULL, 'B', 109.490692, 36.596291, 3, 'tr_0 tr_610000 tr_610600', 2);
INSERT INTO `sys_area`
VALUES (610621, '延长县', 610600, '延长', NULL, NULL, 'Y', 110.012962, 36.578304, 3, 'tr_0 tr_610000 tr_610600', 9);
INSERT INTO `sys_area`
VALUES (610622, '延川县', 610600, '延川', NULL, NULL, 'Y', 110.190315, 36.882065, 3, 'tr_0 tr_610000 tr_610600', 10);
INSERT INTO `sys_area`
VALUES (610623, '子长县', 610600, '子长', NULL, NULL, 'Z', 109.675964, 37.142071, 3, 'tr_0 tr_610000 tr_610600', 13);
INSERT INTO `sys_area`
VALUES (610624, '安塞县', 610600, '安塞', NULL, NULL, 'A', 109.325340, 36.864410, 3, 'tr_0 tr_610000 tr_610600', 1);
INSERT INTO `sys_area`
VALUES (610625, '志丹县', 610600, '志丹', NULL, NULL, 'Z', 108.768898, 36.823032, 3, 'tr_0 tr_610000 tr_610600', 12);
INSERT INTO `sys_area`
VALUES (610626, '吴起县', 610600, '吴起', NULL, NULL, 'W', 108.176979, 36.924850, 3, 'tr_0 tr_610000 tr_610600', 8);
INSERT INTO `sys_area`
VALUES (610627, '甘泉县', 610600, '甘泉', NULL, NULL, 'G', 109.349609, 36.277729, 3, 'tr_0 tr_610000 tr_610600', 4);
INSERT INTO `sys_area`
VALUES (610628, '富县', 610600, '富县', NULL, NULL, 'F', 109.384132, 35.996494, 3, 'tr_0 tr_610000 tr_610600', 3);
INSERT INTO `sys_area`
VALUES (610629, '洛川县', 610600, '洛川', NULL, NULL, 'L', 109.435715, 35.762135, 3, 'tr_0 tr_610000 tr_610600', 7);
INSERT INTO `sys_area`
VALUES (610630, '宜川县', 610600, '宜川', NULL, NULL, 'Y', 110.175537, 36.050392, 3, 'tr_0 tr_610000 tr_610600', 11);
INSERT INTO `sys_area`
VALUES (610631, '黄龙县', 610600, '黄龙', NULL, NULL, 'H', 109.835022, 35.583275, 3, 'tr_0 tr_610000 tr_610600', 6);
INSERT INTO `sys_area`
VALUES (610632, '黄陵县', 610600, '黄陵', NULL, NULL, 'H', 109.262466, 35.580166, 3, 'tr_0 tr_610000 tr_610600', 5);
INSERT INTO `sys_area`
VALUES (610700, '汉中市', 610000, '汉中', NULL, NULL, 'H', 107.028618, 33.077667, 2, 'tr_0 tr_610000', 3);
INSERT INTO `sys_area`
VALUES (610702, '汉台区', 610700, '汉台', NULL, NULL, 'H', 107.028236, 33.077675, 3, 'tr_0 tr_610000 tr_610700', 3);
INSERT INTO `sys_area`
VALUES (610721, '南郑县', 610700, '南郑', NULL, NULL, 'N', 106.942390, 33.003342, 3, 'tr_0 tr_610000 tr_610700', 7);
INSERT INTO `sys_area`
VALUES (610722, '城固县', 610700, '城固', NULL, NULL, 'C', 107.329887, 33.153099, 3, 'tr_0 tr_610000 tr_610700', 1);
INSERT INTO `sys_area`
VALUES (610723, '洋县', 610700, '洋县', NULL, NULL, 'Y', 107.549965, 33.223282, 3, 'tr_0 tr_610000 tr_610700', 10);
INSERT INTO `sys_area`
VALUES (610724, '西乡县', 610700, '西乡', NULL, NULL, 'X', 107.765862, 32.987961, 3, 'tr_0 tr_610000 tr_610700', 9);
INSERT INTO `sys_area`
VALUES (610725, '勉县', 610700, '勉县', NULL, NULL, 'M', 106.680176, 33.155617, 3, 'tr_0 tr_610000 tr_610700', 6);
INSERT INTO `sys_area`
VALUES (610726, '宁强县', 610700, '宁强', NULL, NULL, 'N', 106.257393, 32.830807, 3, 'tr_0 tr_610000 tr_610700', 8);
INSERT INTO `sys_area`
VALUES (610727, '略阳县', 610700, '略阳', NULL, NULL, 'L', 106.153900, 33.329639, 3, 'tr_0 tr_610000 tr_610700', 5);
INSERT INTO `sys_area`
VALUES (610728, '镇巴县', 610700, '镇巴', NULL, NULL, 'Z', 107.895309, 32.535854, 3, 'tr_0 tr_610000 tr_610700', 11);
INSERT INTO `sys_area`
VALUES (610729, '留坝县', 610700, '留坝', NULL, NULL, 'L', 106.924377, 33.613338, 3, 'tr_0 tr_610000 tr_610700', 4);
INSERT INTO `sys_area`
VALUES (610730, '佛坪县', 610700, '佛坪', NULL, NULL, 'F', 107.988579, 33.520744, 3, 'tr_0 tr_610000 tr_610700', 2);
INSERT INTO `sys_area`
VALUES (610800, '榆林市', 610000, '榆林', NULL, NULL, 'Y', 109.741196, 38.290161, 2, 'tr_0 tr_610000', 10);
INSERT INTO `sys_area`
VALUES (610802, '榆阳区', 610800, '榆阳', NULL, NULL, 'Y', 109.747910, 38.299267, 3, 'tr_0 tr_610000 tr_610800', 11);
INSERT INTO `sys_area`
VALUES (610821, '神木县', 610800, '神木', NULL, NULL, 'S', 110.497002, 38.835640, 3, 'tr_0 tr_610000 tr_610800', 8);
INSERT INTO `sys_area`
VALUES (610822, '府谷县', 610800, '府谷', NULL, NULL, 'F', 111.069649, 39.029243, 3, 'tr_0 tr_610000 tr_610800', 2);
INSERT INTO `sys_area`
VALUES (610823, '横山县', 610800, '横山', NULL, NULL, 'H', 109.292595, 37.964046, 3, 'tr_0 tr_610000 tr_610800', 3);
INSERT INTO `sys_area`
VALUES (610824, '靖边县', 610800, '靖边', NULL, NULL, 'J', 108.805672, 37.596085, 3, 'tr_0 tr_610000 tr_610800', 5);
INSERT INTO `sys_area`
VALUES (610825, '定边县', 610800, '定边', NULL, NULL, 'D', 107.601280, 37.595230, 3, 'tr_0 tr_610000 tr_610800', 1);
INSERT INTO `sys_area`
VALUES (610826, '绥德县', 610800, '绥德', NULL, NULL, 'S', 110.265373, 37.507702, 3, 'tr_0 tr_610000 tr_610800', 9);
INSERT INTO `sys_area`
VALUES (610827, '米脂县', 610800, '米脂', NULL, NULL, 'M', 110.178680, 37.759083, 3, 'tr_0 tr_610000 tr_610800', 6);
INSERT INTO `sys_area`
VALUES (610828, '佳县', 610800, '佳县', NULL, NULL, 'J', 110.493370, 38.021599, 3, 'tr_0 tr_610000 tr_610800', 4);
INSERT INTO `sys_area`
VALUES (610829, '吴堡县', 610800, '吴堡', NULL, NULL, 'W', 110.739311, 37.451923, 3, 'tr_0 tr_610000 tr_610800', 10);
INSERT INTO `sys_area`
VALUES (610830, '清涧县', 610800, '清涧', NULL, NULL, 'Q', 110.121460, 37.087704, 3, 'tr_0 tr_610000 tr_610800', 7);
INSERT INTO `sys_area`
VALUES (610831, '子洲县', 610800, '子洲', NULL, NULL, 'Z', 110.034569, 37.611572, 3, 'tr_0 tr_610000 tr_610800', 12);
INSERT INTO `sys_area`
VALUES (610900, '安康市', 610000, '安康', NULL, NULL, 'A', 109.029274, 32.690300, 2, 'tr_0 tr_610000', 1);
INSERT INTO `sys_area`
VALUES (610902, '汉滨区', 610900, '汉滨', NULL, NULL, 'H', 109.029099, 32.690819, 3, 'tr_0 tr_610000 tr_610900', 2);
INSERT INTO `sys_area`
VALUES (610921, '汉阴县', 610900, '汉阴', NULL, NULL, 'H', 108.510948, 32.891121, 3, 'tr_0 tr_610000 tr_610900', 3);
INSERT INTO `sys_area`
VALUES (610922, '石泉县', 610900, '石泉', NULL, NULL, 'S', 108.250511, 33.038513, 3, 'tr_0 tr_610000 tr_610900', 7);
INSERT INTO `sys_area`
VALUES (610923, '宁陕县', 610900, '宁陕', NULL, NULL, 'N', 108.313713, 33.312183, 3, 'tr_0 tr_610000 tr_610900', 5);
INSERT INTO `sys_area`
VALUES (610924, '紫阳县', 610900, '紫阳', NULL, NULL, 'Z', 108.537788, 32.520176, 3, 'tr_0 tr_610000 tr_610900', 10);
INSERT INTO `sys_area`
VALUES (610925, '岚皋县', 610900, '岚皋', NULL, NULL, 'Z', 108.900665, 32.310692, 3, 'tr_0 tr_610000 tr_610900', 4);
INSERT INTO `sys_area`
VALUES (610926, '平利县', 610900, '平利', NULL, NULL, 'P', 109.361862, 32.387932, 3, 'tr_0 tr_610000 tr_610900', 6);
INSERT INTO `sys_area`
VALUES (610927, '镇坪县', 610900, '镇坪', NULL, NULL, 'Z', 109.526436, 31.883394, 3, 'tr_0 tr_610000 tr_610900', 9);
INSERT INTO `sys_area`
VALUES (610928, '旬阳县', 610900, '旬阳', NULL, NULL, 'X', 109.368149, 32.833569, 3, 'tr_0 tr_610000 tr_610900', 8);
INSERT INTO `sys_area`
VALUES (610929, '白河县', 610900, '白河', NULL, NULL, 'B', 110.114189, 32.809483, 3, 'tr_0 tr_610000 tr_610900', 1);
INSERT INTO `sys_area`
VALUES (611000, '商洛市', 610000, '商洛', NULL, NULL, 'S', 109.939774, 33.868320, 2, 'tr_0 tr_610000', 4);
INSERT INTO `sys_area`
VALUES (611002, '商州区', 611000, '商州', NULL, NULL, 'S', 109.937683, 33.869209, 3, 'tr_0 tr_610000 tr_611000', 4);
INSERT INTO `sys_area`
VALUES (611021, '洛南县', 611000, '洛南', NULL, NULL, 'L', 110.145714, 34.088501, 3, 'tr_0 tr_610000 tr_611000', 2);
INSERT INTO `sys_area`
VALUES (611022, '丹凤县', 611000, '丹凤', NULL, NULL, 'D', 110.331909, 33.694710, 3, 'tr_0 tr_610000 tr_611000', 1);
INSERT INTO `sys_area`
VALUES (611023, '商南县', 611000, '商南', NULL, NULL, 'S', 110.885437, 33.526367, 3, 'tr_0 tr_610000 tr_611000', 3);
INSERT INTO `sys_area`
VALUES (611024, '山阳县', 611000, '山阳', NULL, NULL, 'S', 109.880432, 33.530411, 3, 'tr_0 tr_610000 tr_611000', 5);
INSERT INTO `sys_area`
VALUES (611025, '镇安县', 611000, '镇安', NULL, NULL, 'Z', 109.151077, 33.423981, 3, 'tr_0 tr_610000 tr_611000', 7);
INSERT INTO `sys_area`
VALUES (611026, '柞水县', 611000, '柞水', NULL, NULL, 'Z', 109.111252, 33.682774, 3, 'tr_0 tr_610000 tr_611000', 6);
INSERT INTO `sys_area`
VALUES (620000, '甘肃省', 0, '甘肃', NULL, NULL, 'G', 103.823555, 36.058041, 1, 'tr_0', 28);
INSERT INTO `sys_area`
VALUES (620100, '兰州市', 620000, '兰州', NULL, NULL, 'L', 103.823555, 36.058041, 2, 'tr_0 tr_620000', 7);
INSERT INTO `sys_area`
VALUES (620102, '城关区', 620100, '城关', NULL, NULL, 'C', 103.841034, 36.049114, 3, 'tr_0 tr_620000 tr_620100', 2);
INSERT INTO `sys_area`
VALUES (620103, '七里河区', 620100, '七里河', NULL, NULL, 'Q', 103.784325, 36.066730, 3, 'tr_0 tr_620000 tr_620100', 5);
INSERT INTO `sys_area`
VALUES (620104, '西固区', 620100, '西固', NULL, NULL, 'X', 103.622330, 36.100368, 3, 'tr_0 tr_620000 tr_620100', 6);
INSERT INTO `sys_area`
VALUES (620105, '安宁区', 620100, '安宁', NULL, NULL, 'A', 103.724037, 36.103291, 3, 'tr_0 tr_620000 tr_620100', 1);
INSERT INTO `sys_area`
VALUES (620111, '红古区', 620100, '红古', NULL, NULL, 'H', 102.861816, 36.344177, 3, 'tr_0 tr_620000 tr_620100', 4);
INSERT INTO `sys_area`
VALUES (620121, '永登县', 620100, '永登', NULL, NULL, 'Y', 103.262199, 36.734428, 3, 'tr_0 tr_620000 tr_620100', 7);
INSERT INTO `sys_area`
VALUES (620122, '皋兰县', 620100, '皋兰', NULL, NULL, 'G', 103.949333, 36.331253, 3, 'tr_0 tr_620000 tr_620100', 3);
INSERT INTO `sys_area`
VALUES (620123, '榆中县', 620100, '榆中', NULL, NULL, 'Y', 104.114975, 35.844429, 3, 'tr_0 tr_620000 tr_620100', 8);
INSERT INTO `sys_area`
VALUES (620200, '嘉峪关市', 620000, '嘉峪关', NULL, NULL, 'J', 98.277306, 39.786530, 2, 'tr_0 tr_620000', 4);
INSERT INTO `sys_area`
VALUES (620300, '金昌市', 620000, '金昌', NULL, NULL, 'J', 102.187889, 38.514236, 2, 'tr_0 tr_620000', 5);
INSERT INTO `sys_area`
VALUES (620302, '金川区', 620300, '金川', NULL, NULL, 'J', 102.187683, 38.513794, 3, 'tr_0 tr_620000 tr_620300', 1);
INSERT INTO `sys_area`
VALUES (620321, '永昌县', 620300, '永昌', NULL, NULL, 'Y', 101.971954, 38.247353, 3, 'tr_0 tr_620000 tr_620300', 2);
INSERT INTO `sys_area`
VALUES (620400, '白银市', 620000, '白银', NULL, NULL, 'B', 104.173607, 36.545681, 2, 'tr_0 tr_620000', 1);
INSERT INTO `sys_area`
VALUES (620402, '白银区', 620400, '白银', NULL, NULL, 'B', 104.174248, 36.545650, 3, 'tr_0 tr_620000 tr_620400', 1);
INSERT INTO `sys_area`
VALUES (620403, '平川区', 620400, '平川', NULL, NULL, 'P', 104.819206, 36.729210, 3, 'tr_0 tr_620000 tr_620400', 5);
INSERT INTO `sys_area`
VALUES (620421, '靖远县', 620400, '靖远', NULL, NULL, 'J', 104.686974, 36.561424, 3, 'tr_0 tr_620000 tr_620400', 4);
INSERT INTO `sys_area`
VALUES (620422, '会宁县', 620400, '会宁', NULL, NULL, 'H', 105.054337, 35.692486, 3, 'tr_0 tr_620000 tr_620400', 2);
INSERT INTO `sys_area`
VALUES (620423, '景泰县', 620400, '景泰', NULL, NULL, 'J', 104.066391, 37.193520, 3, 'tr_0 tr_620000 tr_620400', 3);
INSERT INTO `sys_area`
VALUES (620500, '天水市', 620000, '天水', NULL, NULL, 'T', 105.724998, 34.578529, 2, 'tr_0 tr_620000', 12);
INSERT INTO `sys_area`
VALUES (620502, '秦州区', 620500, '秦州', NULL, NULL, 'Q', 105.724480, 34.578644, 3, 'tr_0 tr_620000 tr_620500', 5);
INSERT INTO `sys_area`
VALUES (620503, '麦积区', 620500, '麦积', NULL, NULL, 'M', 105.897629, 34.563503, 3, 'tr_0 tr_620000 tr_620500', 2);
INSERT INTO `sys_area`
VALUES (620521, '清水县', 620500, '清水', NULL, NULL, 'Q', 106.139877, 34.752869, 3, 'tr_0 tr_620000 tr_620500', 4);
INSERT INTO `sys_area`
VALUES (620522, '秦安县', 620500, '秦安', NULL, NULL, 'Q', 105.673302, 34.862354, 3, 'tr_0 tr_620000 tr_620500', 3);
INSERT INTO `sys_area`
VALUES (620523, '甘谷县', 620500, '甘谷', NULL, NULL, 'G', 105.332344, 34.747326, 3, 'tr_0 tr_620000 tr_620500', 1);
INSERT INTO `sys_area`
VALUES (620524, '武山县', 620500, '武山', NULL, NULL, 'W', 104.891693, 34.721954, 3, 'tr_0 tr_620000 tr_620500', 6);
INSERT INTO `sys_area`
VALUES (620525, '张家川回族自治县', 620500, '张家川', NULL, NULL, 'Z', 106.212418, 34.993237, 3, 'tr_0 tr_620000 tr_620500', 7);
INSERT INTO `sys_area`
VALUES (620600, '武威市', 620000, '武威', NULL, NULL, 'W', 102.634697, 37.929996, 2, 'tr_0 tr_620000', 13);
INSERT INTO `sys_area`
VALUES (620602, '凉州区', 620600, '凉州', NULL, NULL, 'L', 102.634491, 37.930248, 3, 'tr_0 tr_620000 tr_620600', 2);
INSERT INTO `sys_area`
VALUES (620621, '民勤县', 620600, '民勤', NULL, NULL, 'M', 103.090652, 38.624622, 3, 'tr_0 tr_620000 tr_620600', 3);
INSERT INTO `sys_area`
VALUES (620622, '古浪县', 620600, '古浪', NULL, NULL, 'G', 102.898048, 37.470570, 3, 'tr_0 tr_620000 tr_620600', 1);
INSERT INTO `sys_area`
VALUES (620623, '天祝藏族自治县', 620600, '天祝', NULL, NULL, 'T', 103.142036, 36.971680, 3, 'tr_0 tr_620000 tr_620600', 4);
INSERT INTO `sys_area`
VALUES (620700, '张掖市', 620000, '张掖', NULL, NULL, 'Z', 100.455475, 38.932896, 2, 'tr_0 tr_620000', 14);
INSERT INTO `sys_area`
VALUES (620702, '甘州区', 620700, '甘州', NULL, NULL, 'G', 100.454865, 38.931774, 3, 'tr_0 tr_620000 tr_620700', 1);
INSERT INTO `sys_area`
VALUES (620721, '肃南裕固族自治县', 620700, '肃南', NULL, NULL, 'S', 99.617088, 38.837269, 3, 'tr_0 tr_620000 tr_620700', 6);
INSERT INTO `sys_area`
VALUES (620722, '民乐县', 620700, '民乐', NULL, NULL, 'M', 100.816620, 38.434456, 3, 'tr_0 tr_620000 tr_620700', 4);
INSERT INTO `sys_area`
VALUES (620723, '临泽县', 620700, '临泽', NULL, NULL, 'L', 100.166336, 39.152149, 3, 'tr_0 tr_620000 tr_620700', 3);
INSERT INTO `sys_area`
VALUES (620724, '高台县', 620700, '高台', NULL, NULL, 'G', 99.816650, 39.376308, 3, 'tr_0 tr_620000 tr_620700', 2);
INSERT INTO `sys_area`
VALUES (620725, '山丹县', 620700, '山丹', NULL, NULL, 'S', 101.088440, 38.784840, 3, 'tr_0 tr_620000 tr_620700', 5);
INSERT INTO `sys_area`
VALUES (620800, '平凉市', 620000, '平凉', NULL, NULL, 'P', 106.684692, 35.542789, 2, 'tr_0 tr_620000', 10);
INSERT INTO `sys_area`
VALUES (620802, '崆峒区', 620800, '崆峒', NULL, NULL, 'Z', 106.684219, 35.541729, 3, 'tr_0 tr_620000 tr_620800', 5);
INSERT INTO `sys_area`
VALUES (620821, '泾川县', 620800, '泾川', NULL, NULL, 'Z', 107.365219, 35.335281, 3, 'tr_0 tr_620000 tr_620800', 3);
INSERT INTO `sys_area`
VALUES (620822, '灵台县', 620800, '灵台', NULL, NULL, 'L', 107.620590, 35.064011, 3, 'tr_0 tr_620000 tr_620800', 6);
INSERT INTO `sys_area`
VALUES (620823, '崇信县', 620800, '崇信', NULL, NULL, 'C', 107.031250, 35.304531, 3, 'tr_0 tr_620000 tr_620800', 1);
INSERT INTO `sys_area`
VALUES (620824, '华亭县', 620800, '华亭', NULL, NULL, 'H', 106.649307, 35.215343, 3, 'tr_0 tr_620000 tr_620800', 2);
INSERT INTO `sys_area`
VALUES (620825, '庄浪县', 620800, '庄浪', NULL, NULL, 'Z', 106.041977, 35.203426, 3, 'tr_0 tr_620000 tr_620800', 7);
INSERT INTO `sys_area`
VALUES (620826, '静宁县', 620800, '静宁', NULL, NULL, 'J', 105.733490, 35.525242, 3, 'tr_0 tr_620000 tr_620800', 4);
INSERT INTO `sys_area`
VALUES (620900, '酒泉市', 620000, '酒泉', NULL, NULL, 'J', 98.510796, 39.744022, 2, 'tr_0 tr_620000', 6);
INSERT INTO `sys_area`
VALUES (620902, '肃州区', 620900, '肃州', NULL, NULL, 'S', 98.511154, 39.743858, 3, 'tr_0 tr_620000 tr_620900', 6);
INSERT INTO `sys_area`
VALUES (620921, '金塔县', 620900, '金塔', NULL, NULL, 'J', 98.902962, 39.983036, 3, 'tr_0 tr_620000 tr_620900', 4);
INSERT INTO `sys_area`
VALUES (620922, '瓜州县', 620900, '瓜州', NULL, NULL, 'G', 95.780594, 40.516525, 3, 'tr_0 tr_620000 tr_620900', 3);
INSERT INTO `sys_area`
VALUES (620923, '肃北蒙古族自治县', 620900, '肃北', NULL, NULL, 'S', 94.877281, 39.512241, 3, 'tr_0 tr_620000 tr_620900', 5);
INSERT INTO `sys_area`
VALUES (620924, '阿克塞哈萨克族自治县', 620900, '阿克塞', NULL, NULL, 'A', 94.337639, 39.631641, 3, 'tr_0 tr_620000 tr_620900', 1);
INSERT INTO `sys_area`
VALUES (620981, '玉门市', 620900, '玉门', NULL, NULL, 'Y', 97.037209, 40.286819, 3, 'tr_0 tr_620000 tr_620900', 7);
INSERT INTO `sys_area`
VALUES (620982, '敦煌市', 620900, '敦煌', NULL, NULL, 'D', 94.664276, 40.141117, 3, 'tr_0 tr_620000 tr_620900', 2);
INSERT INTO `sys_area`
VALUES (621000, '庆阳市', 620000, '庆阳', NULL, NULL, 'Q', 107.638374, 35.734219, 2, 'tr_0 tr_620000', 11);
INSERT INTO `sys_area`
VALUES (621002, '西峰区', 621000, '西峰', NULL, NULL, 'X', 107.638824, 35.733711, 3, 'tr_0 tr_620000 tr_621000', 6);
INSERT INTO `sys_area`
VALUES (621021, '庆城县', 621000, '庆城', NULL, NULL, 'Q', 107.885666, 36.013504, 3, 'tr_0 tr_620000 tr_621000', 5);
INSERT INTO `sys_area`
VALUES (621022, '环县', 621000, '环县', NULL, NULL, 'H', 107.308754, 36.569321, 3, 'tr_0 tr_620000 tr_621000', 3);
INSERT INTO `sys_area`
VALUES (621023, '华池县', 621000, '华池', NULL, NULL, 'H', 107.986290, 36.457302, 3, 'tr_0 tr_620000 tr_621000', 2);
INSERT INTO `sys_area`
VALUES (621024, '合水县', 621000, '合水', NULL, NULL, 'H', 108.019867, 35.819004, 3, 'tr_0 tr_620000 tr_621000', 1);
INSERT INTO `sys_area`
VALUES (621025, '正宁县', 621000, '正宁', NULL, NULL, 'Z', 108.361069, 35.490643, 3, 'tr_0 tr_620000 tr_621000', 7);
INSERT INTO `sys_area`
VALUES (621026, '宁县', 621000, '宁县', NULL, NULL, 'N', 107.921181, 35.502010, 3, 'tr_0 tr_620000 tr_621000', 4);
INSERT INTO `sys_area`
VALUES (621027, '镇原县', 621000, '镇原', NULL, NULL, 'Z', 107.195709, 35.677807, 3, 'tr_0 tr_620000 tr_621000', 8);
INSERT INTO `sys_area`
VALUES (621100, '定西市', 620000, '定西', NULL, NULL, 'D', 104.626297, 35.579578, 2, 'tr_0 tr_620000', 2);
INSERT INTO `sys_area`
VALUES (621102, '安定区', 621100, '安定', NULL, NULL, 'A', 104.625771, 35.579765, 3, 'tr_0 tr_620000 tr_621100', 1);
INSERT INTO `sys_area`
VALUES (621121, '通渭县', 621100, '通渭', NULL, NULL, 'T', 105.250099, 35.208923, 3, 'tr_0 tr_620000 tr_621100', 5);
INSERT INTO `sys_area`
VALUES (621122, '陇西县', 621100, '陇西', NULL, NULL, 'L', 104.637550, 35.003410, 3, 'tr_0 tr_620000 tr_621100', 3);
INSERT INTO `sys_area`
VALUES (621123, '渭源县', 621100, '渭源', NULL, NULL, 'W', 104.211739, 35.133022, 3, 'tr_0 tr_620000 tr_621100', 6);
INSERT INTO `sys_area`
VALUES (621124, '临洮县', 621100, '临洮', NULL, NULL, 'L', 103.862183, 35.376232, 3, 'tr_0 tr_620000 tr_621100', 2);
INSERT INTO `sys_area`
VALUES (621125, '漳县', 621100, '漳县', NULL, NULL, 'Z', 104.466759, 34.848640, 3, 'tr_0 tr_620000 tr_621100', 7);
INSERT INTO `sys_area`
VALUES (621126, '岷县', 621100, '岷县', NULL, NULL, 'Z', 104.039879, 34.439106, 3, 'tr_0 tr_620000 tr_621100', 4);
INSERT INTO `sys_area`
VALUES (621200, '陇南市', 620000, '陇南', NULL, NULL, 'L', 104.929382, 33.388599, 2, 'tr_0 tr_620000', 9);
INSERT INTO `sys_area`
VALUES (621202, '武都区', 621200, '武都', NULL, NULL, 'W', 104.929863, 33.388157, 3, 'tr_0 tr_620000 tr_621200', 8);
INSERT INTO `sys_area`
VALUES (621221, '成县', 621200, '成县', NULL, NULL, 'C', 105.734436, 33.739864, 3, 'tr_0 tr_620000 tr_621200', 1);
INSERT INTO `sys_area`
VALUES (621222, '文县', 621200, '文县', NULL, NULL, 'W', 104.682449, 32.942169, 3, 'tr_0 tr_620000 tr_621200', 7);
INSERT INTO `sys_area`
VALUES (621223, '宕昌县', 621200, '宕昌', NULL, NULL, 'Z', 104.394478, 34.042656, 3, 'tr_0 tr_620000 tr_621200', 2);
INSERT INTO `sys_area`
VALUES (621224, '康县', 621200, '康县', NULL, NULL, 'K', 105.609535, 33.328266, 3, 'tr_0 tr_620000 tr_621200', 4);
INSERT INTO `sys_area`
VALUES (621225, '西和县', 621200, '西和', NULL, NULL, 'X', 105.299736, 34.013718, 3, 'tr_0 tr_620000 tr_621200', 9);
INSERT INTO `sys_area`
VALUES (621226, '礼县', 621200, '礼县', NULL, NULL, 'L', 105.181618, 34.189388, 3, 'tr_0 tr_620000 tr_621200', 6);
INSERT INTO `sys_area`
VALUES (621227, '徽县', 621200, '徽县', NULL, NULL, 'H', 106.085632, 33.767784, 3, 'tr_0 tr_620000 tr_621200', 3);
INSERT INTO `sys_area`
VALUES (621228, '两当县', 621200, '两当', NULL, NULL, 'L', 106.306961, 33.910728, 3, 'tr_0 tr_620000 tr_621200', 5);
INSERT INTO `sys_area`
VALUES (622900, '临夏回族自治州', 620000, '临夏', NULL, NULL, 'L', 103.212006, 35.599445, 2, 'tr_0 tr_620000', 8);
INSERT INTO `sys_area`
VALUES (622901, '临夏市', 622900, '临夏市', NULL, NULL, 'L', 103.211632, 35.599411, 3, 'tr_0 tr_620000 tr_622900', 6);
INSERT INTO `sys_area`
VALUES (622921, '临夏县', 622900, '临夏县', NULL, NULL, 'L', 102.993874, 35.492359, 3, 'tr_0 tr_620000 tr_622900', 7);
INSERT INTO `sys_area`
VALUES (622922, '康乐县', 622900, '康乐', NULL, NULL, 'K', 103.709854, 35.371906, 3, 'tr_0 tr_620000 tr_622900', 5);
INSERT INTO `sys_area`
VALUES (622923, '永靖县', 622900, '永靖', NULL, NULL, 'Y', 103.319870, 35.938934, 3, 'tr_0 tr_620000 tr_622900', 8);
INSERT INTO `sys_area`
VALUES (622924, '广河县', 622900, '广河', NULL, NULL, 'G', 103.576187, 35.481689, 3, 'tr_0 tr_620000 tr_622900', 2);
INSERT INTO `sys_area`
VALUES (622925, '和政县', 622900, '和政', NULL, NULL, 'H', 103.350357, 35.425972, 3, 'tr_0 tr_620000 tr_622900', 3);
INSERT INTO `sys_area`
VALUES (622926, '东乡族自治县', 622900, '东乡', NULL, NULL, 'D', 103.389565, 35.663830, 3, 'tr_0 tr_620000 tr_622900', 1);
INSERT INTO `sys_area`
VALUES (622927, '积石山保安族东乡族撒拉族自治县', 622900, '积石山', NULL, NULL, 'J', 102.877472, 35.712906, 3, 'tr_0 tr_620000 tr_622900', 4);
INSERT INTO `sys_area`
VALUES (623000, '甘南藏族自治州', 620000, '甘南', NULL, NULL, 'G', 102.911011, 34.986355, 2, 'tr_0 tr_620000', 3);
INSERT INTO `sys_area`
VALUES (623001, '合作市', 623000, '合作', NULL, NULL, 'H', 102.911491, 34.985973, 3, 'tr_0 tr_620000 tr_623000', 2);
INSERT INTO `sys_area`
VALUES (623021, '临潭县', 623000, '临潭', NULL, NULL, 'L', 103.353050, 34.691639, 3, 'tr_0 tr_620000 tr_623000', 3);
INSERT INTO `sys_area`
VALUES (623022, '卓尼县', 623000, '卓尼', NULL, NULL, 'Z', 103.508507, 34.588165, 3, 'tr_0 tr_620000 tr_623000', 8);
INSERT INTO `sys_area`
VALUES (623023, '舟曲县', 623000, '舟曲', NULL, NULL, 'Z', 104.370270, 33.782963, 3, 'tr_0 tr_620000 tr_623000', 7);
INSERT INTO `sys_area`
VALUES (623024, '迭部县', 623000, '迭部', NULL, NULL, 'D', 103.221008, 34.055347, 3, 'tr_0 tr_620000 tr_623000', 1);
INSERT INTO `sys_area`
VALUES (623025, '玛曲县', 623000, '玛曲', NULL, NULL, 'M', 102.075768, 33.998070, 3, 'tr_0 tr_620000 tr_623000', 5);
INSERT INTO `sys_area`
VALUES (623026, '碌曲县', 623000, '碌曲', NULL, NULL, 'L', 102.488495, 34.589592, 3, 'tr_0 tr_620000 tr_623000', 4);
INSERT INTO `sys_area`
VALUES (623027, '夏河县', 623000, '夏河', NULL, NULL, 'X', 102.520744, 35.200851, 3, 'tr_0 tr_620000 tr_623000', 6);
INSERT INTO `sys_area`
VALUES (630000, '青海省', 0, '青海', NULL, NULL, 'Q', 101.778915, 36.623177, 1, 'tr_0', 29);
INSERT INTO `sys_area`
VALUES (630100, '西宁市', 630000, '西宁', NULL, NULL, 'X', 101.778915, 36.623177, 2, 'tr_0 tr_630000', 7);
INSERT INTO `sys_area`
VALUES (630102, '城东区', 630100, '城东', NULL, NULL, 'C', 101.796097, 36.616043, 3, 'tr_0 tr_630000 tr_630100', 2);
INSERT INTO `sys_area`
VALUES (630103, '城中区', 630100, '城中', NULL, NULL, 'C', 101.784554, 36.621181, 3, 'tr_0 tr_630000 tr_630100', 4);
INSERT INTO `sys_area`
VALUES (630104, '城西区', 630100, '城西', NULL, NULL, 'C', 101.763649, 36.628323, 3, 'tr_0 tr_630000 tr_630100', 3);
INSERT INTO `sys_area`
VALUES (630105, '城北区', 630100, '城北', NULL, NULL, 'C', 101.761299, 36.648449, 3, 'tr_0 tr_630000 tr_630100', 1);
INSERT INTO `sys_area`
VALUES (630121, '大通回族土族自治县', 630100, '大通', NULL, NULL, 'D', 101.684181, 36.931343, 3, 'tr_0 tr_630000 tr_630100', 5);
INSERT INTO `sys_area`
VALUES (630122, '湟中县', 630100, '湟中', NULL, NULL, 'Z', 101.569473, 36.500420, 3, 'tr_0 tr_630000 tr_630100', 7);
INSERT INTO `sys_area`
VALUES (630123, '湟源县', 630100, '湟源', NULL, NULL, 'Z', 101.263435, 36.684818, 3, 'tr_0 tr_630000 tr_630100', 6);
INSERT INTO `sys_area`
VALUES (632100, '海东市', 630000, '海东', NULL, NULL, 'H', 102.103271, 36.502914, 2, 'tr_0 tr_630000', 3);
INSERT INTO `sys_area`
VALUES (632121, '平安县', 632100, '平安', NULL, NULL, 'P', 102.104294, 36.502712, 3, 'tr_0 tr_630000 tr_632100', 5);
INSERT INTO `sys_area`
VALUES (632122, '民和回族土族自治县', 632100, '民和', NULL, NULL, 'M', 102.804207, 36.329453, 3, 'tr_0 tr_630000 tr_632100', 4);
INSERT INTO `sys_area`
VALUES (632123, '乐都区', 632100, '乐都', NULL, NULL, 'L', 102.402428, 36.480289, 3, 'tr_0 tr_630000 tr_632100', 3);
INSERT INTO `sys_area`
VALUES (632126, '互助土族自治县', 632100, '互助', NULL, NULL, 'H', 101.956734, 36.839939, 3, 'tr_0 tr_630000 tr_632100', 2);
INSERT INTO `sys_area`
VALUES (632127, '化隆回族自治县', 632100, '化隆', NULL, NULL, 'H', 102.262329, 36.098324, 3, 'tr_0 tr_630000 tr_632100', 1);
INSERT INTO `sys_area`
VALUES (632128, '循化撒拉族自治县', 632100, '循化', NULL, NULL, 'X', 102.486534, 35.847248, 3, 'tr_0 tr_630000 tr_632100', 6);
INSERT INTO `sys_area`
VALUES (632200, '海北藏族自治州', 630000, '海北', NULL, NULL, 'H', 100.901062, 36.959435, 2, 'tr_0 tr_630000', 2);
INSERT INTO `sys_area`
VALUES (632221, '门源回族自治县', 632200, '门源', NULL, NULL, 'M', 101.618462, 37.376629, 3, 'tr_0 tr_630000 tr_632200', 3);
INSERT INTO `sys_area`
VALUES (632222, '祁连县', 632200, '祁连', NULL, NULL, 'Q', 100.249779, 38.175407, 3, 'tr_0 tr_630000 tr_632200', 4);
INSERT INTO `sys_area`
VALUES (632223, '海晏县', 632200, '海晏', NULL, NULL, 'H', 100.900490, 36.959541, 3, 'tr_0 tr_630000 tr_632200', 2);
INSERT INTO `sys_area`
VALUES (632224, '刚察县', 632200, '刚察', NULL, NULL, 'G', 100.138420, 37.326263, 3, 'tr_0 tr_630000 tr_632200', 1);
INSERT INTO `sys_area`
VALUES (632300, '黄南藏族自治州', 630000, '黄南', NULL, NULL, 'H', 102.019989, 35.517742, 2, 'tr_0 tr_630000', 6);
INSERT INTO `sys_area`
VALUES (632321, '同仁县', 632300, '同仁', NULL, NULL, 'T', 102.017601, 35.516338, 3, 'tr_0 tr_630000 tr_632300', 3);
INSERT INTO `sys_area`
VALUES (632322, '尖扎县', 632300, '尖扎', NULL, NULL, 'J', 102.031952, 35.938206, 3, 'tr_0 tr_630000 tr_632300', 2);
INSERT INTO `sys_area`
VALUES (632323, '泽库县', 632300, '泽库', NULL, NULL, 'Z', 101.469345, 35.036842, 3, 'tr_0 tr_630000 tr_632300', 4);
INSERT INTO `sys_area`
VALUES (632324, '河南蒙古族自治县', 632300, '河南', NULL, NULL, 'H', 101.611877, 34.734524, 3, 'tr_0 tr_630000 tr_632300', 1);
INSERT INTO `sys_area`
VALUES (632500, '海南藏族自治州', 630000, '海南藏族', NULL, NULL, 'H', 100.619545, 36.280354, 2, 'tr_0 tr_630000', 4);
INSERT INTO `sys_area`
VALUES (632521, '共和县', 632500, '共和', NULL, NULL, 'G', 100.619598, 36.280285, 3, 'tr_0 tr_630000 tr_632500', 1);
INSERT INTO `sys_area`
VALUES (632522, '同德县', 632500, '同德', NULL, NULL, 'T', 100.579468, 35.254494, 3, 'tr_0 tr_630000 tr_632500', 4);
INSERT INTO `sys_area`
VALUES (632523, '贵德县', 632500, '贵德', NULL, NULL, 'G', 101.431854, 36.040455, 3, 'tr_0 tr_630000 tr_632500', 2);
INSERT INTO `sys_area`
VALUES (632524, '兴海县', 632500, '兴海', NULL, NULL, 'X', 99.986961, 35.589088, 3, 'tr_0 tr_630000 tr_632500', 5);
INSERT INTO `sys_area`
VALUES (632525, '贵南县', 632500, '贵南', NULL, NULL, 'G', 100.747917, 35.587086, 3, 'tr_0 tr_630000 tr_632500', 3);
INSERT INTO `sys_area`
VALUES (632600, '果洛藏族自治州', 630000, '果洛', NULL, NULL, 'G', 100.242142, 34.473598, 2, 'tr_0 tr_630000', 1);
INSERT INTO `sys_area`
VALUES (632621, '玛沁县', 632600, '玛沁', NULL, NULL, 'M', 100.243530, 34.473385, 3, 'tr_0 tr_630000 tr_632600', 6);
INSERT INTO `sys_area`
VALUES (632622, '班玛县', 632600, '班玛', NULL, NULL, 'B', 100.737953, 32.931587, 3, 'tr_0 tr_630000 tr_632600', 1);
INSERT INTO `sys_area`
VALUES (632623, '甘德县', 632600, '甘德', NULL, NULL, 'G', 99.902588, 33.966988, 3, 'tr_0 tr_630000 tr_632600', 3);
INSERT INTO `sys_area`
VALUES (632624, '达日县', 632600, '达日', NULL, NULL, 'D', 99.651718, 33.753258, 3, 'tr_0 tr_630000 tr_632600', 2);
INSERT INTO `sys_area`
VALUES (632625, '久治县', 632600, '久治', NULL, NULL, 'J', 101.484886, 33.430218, 3, 'tr_0 tr_630000 tr_632600', 4);
INSERT INTO `sys_area`
VALUES (632626, '玛多县', 632600, '玛多', NULL, NULL, 'M', 98.211342, 34.915279, 3, 'tr_0 tr_630000 tr_632600', 5);
INSERT INTO `sys_area`
VALUES (632700, '玉树藏族自治州', 630000, '玉树', NULL, NULL, 'Y', 97.008522, 33.004047, 2, 'tr_0 tr_630000', 8);
INSERT INTO `sys_area`
VALUES (632721, '玉树市', 632700, '玉树', NULL, NULL, 'Y', 97.008759, 33.003929, 3, 'tr_0 tr_630000 tr_632700', 4);
INSERT INTO `sys_area`
VALUES (632722, '杂多县', 632700, '杂多', NULL, NULL, 'Z', 95.293427, 32.891888, 3, 'tr_0 tr_630000 tr_632700', 5);
INSERT INTO `sys_area`
VALUES (632723, '称多县', 632700, '称多', NULL, NULL, 'C', 97.110893, 33.367886, 3, 'tr_0 tr_630000 tr_632700', 1);
INSERT INTO `sys_area`
VALUES (632724, '治多县', 632700, '治多', NULL, NULL, 'Z', 95.616844, 33.852322, 3, 'tr_0 tr_630000 tr_632700', 6);
INSERT INTO `sys_area`
VALUES (632725, '囊谦县', 632700, '囊谦', NULL, NULL, 'N', 96.479797, 32.203205, 3, 'tr_0 tr_630000 tr_632700', 2);
INSERT INTO `sys_area`
VALUES (632726, '曲麻莱县', 632700, '曲麻莱', NULL, NULL, 'Q', 95.800674, 34.126541, 3, 'tr_0 tr_630000 tr_632700', 3);
INSERT INTO `sys_area`
VALUES (632800, '海西蒙古族藏族自治州', 630000, '海西', NULL, NULL, 'H', 97.370789, 37.374664, 2, 'tr_0 tr_630000', 5);
INSERT INTO `sys_area`
VALUES (632801, '格尔木市', 632800, '格尔木', NULL, NULL, 'G', 94.905777, 36.401543, 3, 'tr_0 tr_630000 tr_632800', 3);
INSERT INTO `sys_area`
VALUES (632802, '德令哈市', 632800, '德令哈', NULL, NULL, 'D', 97.370140, 37.374554, 3, 'tr_0 tr_630000 tr_632800', 1);
INSERT INTO `sys_area`
VALUES (632821, '乌兰县', 632800, '乌兰', NULL, NULL, 'W', 98.479851, 36.930389, 3, 'tr_0 tr_630000 tr_632800', 5);
INSERT INTO `sys_area`
VALUES (632822, '都兰县', 632800, '都兰', NULL, NULL, 'D', 98.089165, 36.298553, 3, 'tr_0 tr_630000 tr_632800', 2);
INSERT INTO `sys_area`
VALUES (632823, '天峻县', 632800, '天峻', NULL, NULL, 'T', 99.020782, 37.299061, 3, 'tr_0 tr_630000 tr_632800', 4);
INSERT INTO `sys_area`
VALUES (640000, '宁夏回族自治区', 0, '宁夏', NULL, NULL, 'N', 106.278175, 38.466370, 1, 'tr_0', 30);
INSERT INTO `sys_area`
VALUES (640100, '银川市', 640000, '银川', NULL, NULL, 'Y', 106.278175, 38.466370, 2, 'tr_0 tr_640000', 4);
INSERT INTO `sys_area`
VALUES (640104, '兴庆区', 640100, '兴庆', NULL, NULL, 'X', 106.278397, 38.467468, 3, 'tr_0 tr_640000 tr_640100', 4);
INSERT INTO `sys_area`
VALUES (640105, '西夏区', 640100, '西夏', NULL, NULL, 'X', 106.132118, 38.492424, 3, 'tr_0 tr_640000 tr_640100', 5);
INSERT INTO `sys_area`
VALUES (640106, '金凤区', 640100, '金凤', NULL, NULL, 'J', 106.228485, 38.477352, 3, 'tr_0 tr_640000 tr_640100', 2);
INSERT INTO `sys_area`
VALUES (640121, '永宁县', 640100, '永宁', NULL, NULL, 'Y', 106.253784, 38.280430, 3, 'tr_0 tr_640000 tr_640100', 6);
INSERT INTO `sys_area`
VALUES (640122, '贺兰县', 640100, '贺兰', NULL, NULL, 'H', 106.345901, 38.554562, 3, 'tr_0 tr_640000 tr_640100', 1);
INSERT INTO `sys_area`
VALUES (640181, '灵武市', 640100, '灵武', NULL, NULL, 'L', 106.334702, 38.094059, 3, 'tr_0 tr_640000 tr_640100', 3);
INSERT INTO `sys_area`
VALUES (640200, '石嘴山市', 640000, '石嘴山', NULL, NULL, 'S', 106.376175, 39.013329, 2, 'tr_0 tr_640000', 2);
INSERT INTO `sys_area`
VALUES (640202, '大武口区', 640200, '大武口', NULL, NULL, 'D', 106.376648, 39.014156, 3, 'tr_0 tr_640000 tr_640200', 1);
INSERT INTO `sys_area`
VALUES (640205, '惠农区', 640200, '惠农', NULL, NULL, 'H', 106.775513, 39.230095, 3, 'tr_0 tr_640000 tr_640200', 2);
INSERT INTO `sys_area`
VALUES (640221, '平罗县', 640200, '平罗', NULL, NULL, 'P', 106.544891, 38.906738, 3, 'tr_0 tr_640000 tr_640200', 3);
INSERT INTO `sys_area`
VALUES (640300, '吴忠市', 640000, '吴忠', NULL, NULL, 'W', 106.199409, 37.986164, 2, 'tr_0 tr_640000', 3);
INSERT INTO `sys_area`
VALUES (640302, '利通区', 640300, '利通', NULL, NULL, 'L', 106.199417, 37.985966, 3, 'tr_0 tr_640000 tr_640300', 2);
INSERT INTO `sys_area`
VALUES (640303, '红寺堡区', 640300, '红寺堡', NULL, NULL, 'H', 106.067314, 37.421616, 3, 'tr_0 tr_640000 tr_640300', 1);
INSERT INTO `sys_area`
VALUES (640323, '盐池县', 640300, '盐池', NULL, NULL, 'Y', 107.405411, 37.784222, 3, 'tr_0 tr_640000 tr_640300', 5);
INSERT INTO `sys_area`
VALUES (640324, '同心县', 640300, '同心', NULL, NULL, 'T', 105.914764, 36.982899, 3, 'tr_0 tr_640000 tr_640300', 4);
INSERT INTO `sys_area`
VALUES (640381, '青铜峡市', 640300, '青铜峡', NULL, NULL, 'Q', 106.075394, 38.021507, 3, 'tr_0 tr_640000 tr_640300', 3);
INSERT INTO `sys_area`
VALUES (640400, '固原市', 640000, '固原', NULL, NULL, 'G', 106.285240, 36.004562, 2, 'tr_0 tr_640000', 1);
INSERT INTO `sys_area`
VALUES (640402, '原州区', 640400, '原州', NULL, NULL, 'Y', 106.284767, 36.005337, 3, 'tr_0 tr_640000 tr_640400', 5);
INSERT INTO `sys_area`
VALUES (640422, '西吉县', 640400, '西吉', NULL, NULL, 'X', 105.731804, 35.965385, 3, 'tr_0 tr_640000 tr_640400', 4);
INSERT INTO `sys_area`
VALUES (640423, '隆德县', 640400, '隆德', NULL, NULL, 'L', 106.123444, 35.618233, 3, 'tr_0 tr_640000 tr_640400', 2);
INSERT INTO `sys_area`
VALUES (640424, '泾源县', 640400, '泾源', NULL, NULL, 'Z', 106.338676, 35.493439, 3, 'tr_0 tr_640000 tr_640400', 1);
INSERT INTO `sys_area`
VALUES (640425, '彭阳县', 640400, '彭阳', NULL, NULL, 'P', 106.641510, 35.849976, 3, 'tr_0 tr_640000 tr_640400', 3);
INSERT INTO `sys_area`
VALUES (640500, '中卫市', 640000, '中卫', NULL, NULL, 'Z', 105.189568, 37.514950, 2, 'tr_0 tr_640000', 5);
INSERT INTO `sys_area`
VALUES (640502, '沙坡头区', 640500, '沙坡头', NULL, NULL, 'S', 105.190536, 37.514565, 3, 'tr_0 tr_640000 tr_640500', 2);
INSERT INTO `sys_area`
VALUES (640521, '中宁县', 640500, '中宁', NULL, NULL, 'Z', 105.675781, 37.489735, 3, 'tr_0 tr_640000 tr_640500', 3);
INSERT INTO `sys_area`
VALUES (640522, '海原县', 640500, '海原', NULL, NULL, 'H', 105.647324, 36.562008, 3, 'tr_0 tr_640000 tr_640500', 1);
INSERT INTO `sys_area`
VALUES (650000, '新疆维吾尔自治区', 0, '新疆', NULL, NULL, 'X', 87.617729, 43.792816, 1, 'tr_0', 31);
INSERT INTO `sys_area`
VALUES (650100, '乌鲁木齐市', 650000, '乌鲁木齐', NULL, NULL, 'W', 87.617729, 43.792816, 2, 'tr_0 tr_650000', 17);
INSERT INTO `sys_area`
VALUES (650102, '天山区', 650100, '天山', NULL, NULL, 'T', 87.620117, 43.796429, 3, 'tr_0 tr_650000 tr_650100', 5);
INSERT INTO `sys_area`
VALUES (650103, '沙依巴克区', 650100, '沙依巴克', NULL, NULL, 'S', 87.596642, 43.788872, 3, 'tr_0 tr_650000 tr_650100', 3);
INSERT INTO `sys_area`
VALUES (650104, '新市区', 650100, '新市', NULL, NULL, 'X', 87.560654, 43.870880, 3, 'tr_0 tr_650000 tr_650100', 8);
INSERT INTO `sys_area`
VALUES (650105, '水磨沟区', 650100, '水磨沟', NULL, NULL, 'S', 87.613091, 43.816746, 3, 'tr_0 tr_650000 tr_650100', 4);
INSERT INTO `sys_area`
VALUES (650106, '头屯河区', 650100, '头屯河', NULL, NULL, 'T', 87.425819, 43.876053, 3, 'tr_0 tr_650000 tr_650100', 6);
INSERT INTO `sys_area`
VALUES (650107, '达坂城区', 650100, '达坂城', NULL, NULL, 'D', 88.309937, 43.361809, 3, 'tr_0 tr_650000 tr_650100', 1);
INSERT INTO `sys_area`
VALUES (650109, '米东区', 650100, '米东', NULL, NULL, 'M', 87.691803, 43.960983, 3, 'tr_0 tr_650000 tr_650100', 2);
INSERT INTO `sys_area`
VALUES (650121, '乌鲁木齐县', 650100, '乌鲁木齐', NULL, NULL, 'W', 1.000000, 0.000000, 3, 'tr_0 tr_650000 tr_650100', 7);
INSERT INTO `sys_area`
VALUES (650200, '克拉玛依市', 650000, '克拉玛依', NULL, NULL, 'K', 84.873947, 45.595886, 2, 'tr_0 tr_650000', 10);
INSERT INTO `sys_area`
VALUES (650202, '独山子区', 650200, '独山子', NULL, NULL, 'D', 84.882271, 44.327206, 3, 'tr_0 tr_650000 tr_650200', 2);
INSERT INTO `sys_area`
VALUES (650203, '克拉玛依区', 650200, '克拉玛依', NULL, NULL, 'K', 84.868919, 45.600475, 3, 'tr_0 tr_650000 tr_650200', 3);
INSERT INTO `sys_area`
VALUES (650204, '白碱滩区', 650200, '白碱滩', NULL, NULL, 'B', 85.129883, 45.689022, 3, 'tr_0 tr_650000 tr_650200', 1);
INSERT INTO `sys_area`
VALUES (650205, '乌尔禾区', 650200, '乌尔禾', NULL, NULL, 'W', 85.697769, 46.087761, 3, 'tr_0 tr_650000 tr_650200', 4);
INSERT INTO `sys_area`
VALUES (652100, '吐鲁番地区', 650000, '吐鲁番', NULL, NULL, 'T', 89.184074, 42.947613, 2, 'tr_0 tr_650000', 14);
INSERT INTO `sys_area`
VALUES (652101, '吐鲁番市', 652100, '吐鲁番', NULL, NULL, 'T', 89.182327, 42.947628, 3, 'tr_0 tr_650000 tr_652100', 2);
INSERT INTO `sys_area`
VALUES (652122, '鄯善县', 652100, '鄯善', NULL, NULL, 'Z', 90.212692, 42.865501, 3, 'tr_0 tr_650000 tr_652100', 1);
INSERT INTO `sys_area`
VALUES (652123, '托克逊县', 652100, '托克逊', NULL, NULL, 'T', 88.655769, 42.793537, 3, 'tr_0 tr_650000 tr_652100', 3);
INSERT INTO `sys_area`
VALUES (652200, '哈密地区', 650000, '哈密', NULL, NULL, 'H', 93.513161, 42.833248, 2, 'tr_0 tr_650000', 7);
INSERT INTO `sys_area`
VALUES (652201, '哈密市', 652200, '哈密', NULL, NULL, 'H', 93.509171, 42.833889, 3, 'tr_0 tr_650000 tr_652200', 2);
INSERT INTO `sys_area`
VALUES (652222, '巴里坤哈萨克自治县', 652200, '巴里坤', NULL, NULL, 'B', 93.021797, 43.599033, 3, 'tr_0 tr_650000 tr_652200', 1);
INSERT INTO `sys_area`
VALUES (652223, '伊吾县', 652200, '伊吾', NULL, NULL, 'Y', 94.692772, 43.252010, 3, 'tr_0 tr_650000 tr_652200', 3);
INSERT INTO `sys_area`
VALUES (652300, '昌吉回族自治州', 650000, '昌吉', NULL, NULL, 'C', 87.304008, 44.014576, 2, 'tr_0 tr_650000', 6);
INSERT INTO `sys_area`
VALUES (652301, '昌吉市', 652300, '昌吉', NULL, NULL, 'C', 87.304115, 44.013184, 3, 'tr_0 tr_650000 tr_652300', 1);
INSERT INTO `sys_area`
VALUES (652302, '阜康市', 652300, '阜康', NULL, NULL, 'F', 87.983841, 44.152153, 3, 'tr_0 tr_650000 tr_652300', 2);
INSERT INTO `sys_area`
VALUES (652323, '呼图壁县', 652300, '呼图壁', NULL, NULL, 'H', 86.888611, 44.189342, 3, 'tr_0 tr_650000 tr_652300', 3);
INSERT INTO `sys_area`
VALUES (652324, '玛纳斯县', 652300, '玛纳斯', NULL, NULL, 'M', 86.217690, 44.305626, 3, 'tr_0 tr_650000 tr_652300', 5);
INSERT INTO `sys_area`
VALUES (652325, '奇台县', 652300, '奇台', NULL, NULL, 'Q', 89.591438, 44.021996, 3, 'tr_0 tr_650000 tr_652300', 7);
INSERT INTO `sys_area`
VALUES (652327, '吉木萨尔县', 652300, '吉木萨尔', NULL, NULL, 'J', 89.181290, 43.997162, 3, 'tr_0 tr_650000 tr_652300', 4);
INSERT INTO `sys_area`
VALUES (652328, '木垒哈萨克自治县', 652300, '木垒', NULL, NULL, 'M', 90.282829, 43.832443, 3, 'tr_0 tr_650000 tr_652300', 6);
INSERT INTO `sys_area`
VALUES (652700, '博尔塔拉蒙古自治州', 650000, '博尔塔拉', NULL, NULL, 'B', 82.074776, 44.903259, 2, 'tr_0 tr_650000', 5);
INSERT INTO `sys_area`
VALUES (652701, '博乐市', 652700, '博乐', NULL, NULL, 'B', 82.072235, 44.903088, 3, 'tr_0 tr_650000 tr_652700', 2);
INSERT INTO `sys_area`
VALUES (652702, '阿拉山口市', 652700, '阿拉山口', NULL, NULL, 'A', 82.074776, 44.903259, 3, 'tr_0 tr_650000 tr_652700', 1);
INSERT INTO `sys_area`
VALUES (652722, '精河县', 652700, '精河', NULL, NULL, 'J', 82.892937, 44.605644, 3, 'tr_0 tr_650000 tr_652700', 3);
INSERT INTO `sys_area`
VALUES (652723, '温泉县', 652700, '温泉', NULL, NULL, 'W', 81.030991, 44.973751, 3, 'tr_0 tr_650000 tr_652700', 4);
INSERT INTO `sys_area`
VALUES (652800, '巴音郭楞蒙古自治州', 650000, '巴音郭楞', NULL, NULL, 'B', 86.150970, 41.768551, 2, 'tr_0 tr_650000', 4);
INSERT INTO `sys_area`
VALUES (652801, '库尔勒市', 652800, '库尔勒', NULL, NULL, 'K', 86.145950, 41.763123, 3, 'tr_0 tr_650000 tr_652800', 5);
INSERT INTO `sys_area`
VALUES (652822, '轮台县', 652800, '轮台', NULL, NULL, 'L', 84.248543, 41.781265, 3, 'tr_0 tr_650000 tr_652800', 6);
INSERT INTO `sys_area`
VALUES (652823, '尉犁县', 652800, '尉犁', NULL, NULL, 'W', 86.263412, 41.337429, 3, 'tr_0 tr_650000 tr_652800', 9);
INSERT INTO `sys_area`
VALUES (652824, '若羌县', 652800, '若羌', NULL, NULL, 'R', 88.168808, 39.023808, 3, 'tr_0 tr_650000 tr_652800', 7);
INSERT INTO `sys_area`
VALUES (652825, '且末县', 652800, '且末', NULL, NULL, 'Q', 85.532631, 38.138561, 3, 'tr_0 tr_650000 tr_652800', 4);
INSERT INTO `sys_area`
VALUES (652826, '焉耆回族自治县', 652800, '焉耆', NULL, NULL, 'Y', 86.569801, 42.064350, 3, 'tr_0 tr_650000 tr_652800', 8);
INSERT INTO `sys_area`
VALUES (652827, '和静县', 652800, '和静', NULL, NULL, 'H', 86.391068, 42.317162, 3, 'tr_0 tr_650000 tr_652800', 2);
INSERT INTO `sys_area`
VALUES (652828, '和硕县', 652800, '和硕', NULL, NULL, 'H', 86.864944, 42.268864, 3, 'tr_0 tr_650000 tr_652800', 3);
INSERT INTO `sys_area`
VALUES (652829, '博湖县', 652800, '博湖', NULL, NULL, 'B', 86.631577, 41.980167, 3, 'tr_0 tr_650000 tr_652800', 1);
INSERT INTO `sys_area`
VALUES (652900, '阿克苏地区', 650000, '阿克苏', NULL, NULL, 'A', 80.265068, 41.170712, 2, 'tr_0 tr_650000', 1);
INSERT INTO `sys_area`
VALUES (652901, '阿克苏市', 652900, '阿克苏', NULL, NULL, 'A', 80.262901, 41.171272, 3, 'tr_0 tr_650000 tr_652900', 1);
INSERT INTO `sys_area`
VALUES (652922, '温宿县', 652900, '温宿', NULL, NULL, 'W', 80.243271, 41.272995, 3, 'tr_0 tr_650000 tr_652900', 7);
INSERT INTO `sys_area`
VALUES (652923, '库车县', 652900, '库车', NULL, NULL, 'K', 82.963043, 41.717140, 3, 'tr_0 tr_650000 tr_652900', 5);
INSERT INTO `sys_area`
VALUES (652924, '沙雅县', 652900, '沙雅', NULL, NULL, 'S', 82.780769, 41.226269, 3, 'tr_0 tr_650000 tr_652900', 6);
INSERT INTO `sys_area`
VALUES (652925, '新和县', 652900, '新和', NULL, NULL, 'X', 82.610825, 41.551174, 3, 'tr_0 tr_650000 tr_652900', 9);
INSERT INTO `sys_area`
VALUES (652926, '拜城县', 652900, '拜城', NULL, NULL, 'B', 81.869881, 41.796101, 3, 'tr_0 tr_650000 tr_652900', 3);
INSERT INTO `sys_area`
VALUES (652927, '乌什县', 652900, '乌什', NULL, NULL, 'W', 79.230804, 41.215870, 3, 'tr_0 tr_650000 tr_652900', 8);
INSERT INTO `sys_area`
VALUES (652928, '阿瓦提县', 652900, '阿瓦提', NULL, NULL, 'A', 80.378426, 40.638420, 3, 'tr_0 tr_650000 tr_652900', 2);
INSERT INTO `sys_area`
VALUES (652929, '柯坪县', 652900, '柯坪', NULL, NULL, 'K', 79.047852, 40.506241, 3, 'tr_0 tr_650000 tr_652900', 4);
INSERT INTO `sys_area`
VALUES (653000, '克孜勒苏柯尔克孜自治州', 650000, '克孜勒苏柯尔克孜', NULL, NULL, 'K', 76.172829, 39.713432, 2, 'tr_0 tr_650000', 11);
INSERT INTO `sys_area`
VALUES (653001, '阿图什市', 653000, '阿图什', NULL, NULL, 'A', 76.173943, 39.712898, 3, 'tr_0 tr_650000 tr_653000', 3);
INSERT INTO `sys_area`
VALUES (653022, '阿克陶县', 653000, '阿克陶', NULL, NULL, 'A', 75.945160, 39.147079, 3, 'tr_0 tr_650000 tr_653000', 2);
INSERT INTO `sys_area`
VALUES (653023, '阿合奇县', 653000, '阿合奇', NULL, NULL, 'A', 78.450165, 40.937569, 3, 'tr_0 tr_650000 tr_653000', 1);
INSERT INTO `sys_area`
VALUES (653024, '乌恰县', 653000, '乌恰', NULL, NULL, 'W', 75.259689, 39.716633, 3, 'tr_0 tr_650000 tr_653000', 4);
INSERT INTO `sys_area`
VALUES (653100, '喀什地区', 650000, '喀什', NULL, NULL, 'K', 75.989136, 39.467663, 2, 'tr_0 tr_650000', 9);
INSERT INTO `sys_area`
VALUES (653101, '喀什市', 653100, '喀什', NULL, NULL, 'K', 75.988380, 39.467861, 3, 'tr_0 tr_650000 tr_653100', 3);
INSERT INTO `sys_area`
VALUES (653121, '疏附县', 653100, '疏附', NULL, NULL, 'S', 75.863075, 39.378307, 3, 'tr_0 tr_650000 tr_653100', 6);
INSERT INTO `sys_area`
VALUES (653122, '疏勒县', 653100, '疏勒', NULL, NULL, 'S', 76.053650, 39.399460, 3, 'tr_0 tr_650000 tr_653100', 7);
INSERT INTO `sys_area`
VALUES (653123, '英吉沙县', 653100, '英吉沙', NULL, NULL, 'Y', 76.174294, 38.929840, 3, 'tr_0 tr_650000 tr_653100', 10);
INSERT INTO `sys_area`
VALUES (653124, '泽普县', 653100, '泽普', NULL, NULL, 'Z', 77.273590, 38.191216, 3, 'tr_0 tr_650000 tr_653100', 12);
INSERT INTO `sys_area`
VALUES (653125, '莎车县', 653100, '莎车', NULL, NULL, 'S', 77.248886, 38.414497, 3, 'tr_0 tr_650000 tr_653100', 5);
INSERT INTO `sys_area`
VALUES (653126, '叶城县', 653100, '叶城', NULL, NULL, 'Y', 77.420357, 37.884678, 3, 'tr_0 tr_650000 tr_653100', 9);
INSERT INTO `sys_area`
VALUES (653127, '麦盖提县', 653100, '麦盖提', NULL, NULL, 'M', 77.651535, 38.903385, 3, 'tr_0 tr_650000 tr_653100', 4);
INSERT INTO `sys_area`
VALUES (653128, '岳普湖县', 653100, '岳普湖', NULL, NULL, 'Y', 76.772400, 39.235249, 3, 'tr_0 tr_650000 tr_653100', 11);
INSERT INTO `sys_area`
VALUES (653129, '伽师县', 653100, '伽师', NULL, NULL, 'Z', 76.741982, 39.494324, 3, 'tr_0 tr_650000 tr_653100', 2);
INSERT INTO `sys_area`
VALUES (653130, '巴楚县', 653100, '巴楚', NULL, NULL, 'B', 78.550407, 39.783478, 3, 'tr_0 tr_650000 tr_653100', 1);
INSERT INTO `sys_area`
VALUES (653131, '塔什库尔干塔吉克自治县', 653100, '塔什库尔干', NULL, NULL, 'T', 75.228065, 37.775436, 3, 'tr_0 tr_650000 tr_653100', 8);
INSERT INTO `sys_area`
VALUES (653200, '和田地区', 650000, '和田', NULL, NULL, 'H', 79.925331, 37.110687, 2, 'tr_0 tr_650000', 8);
INSERT INTO `sys_area`
VALUES (653201, '和田市', 653200, '和田市', NULL, NULL, 'H', 79.927544, 37.108944, 3, 'tr_0 tr_650000 tr_653200', 2);
INSERT INTO `sys_area`
VALUES (653221, '和田县', 653200, '和田县', NULL, NULL, 'H', 79.819069, 37.120029, 3, 'tr_0 tr_650000 tr_653200', 3);
INSERT INTO `sys_area`
VALUES (653222, '墨玉县', 653200, '墨玉', NULL, NULL, 'M', 79.736626, 37.271511, 3, 'tr_0 tr_650000 tr_653200', 6);
INSERT INTO `sys_area`
VALUES (653223, '皮山县', 653200, '皮山', NULL, NULL, 'P', 78.282303, 37.616333, 3, 'tr_0 tr_650000 tr_653200', 7);
INSERT INTO `sys_area`
VALUES (653224, '洛浦县', 653200, '洛浦', NULL, NULL, 'L', 80.184036, 37.074375, 3, 'tr_0 tr_650000 tr_653200', 4);
INSERT INTO `sys_area`
VALUES (653225, '策勒县', 653200, '策勒', NULL, NULL, 'C', 80.803574, 37.001671, 3, 'tr_0 tr_650000 tr_653200', 1);
INSERT INTO `sys_area`
VALUES (653226, '于田县', 653200, '于田', NULL, NULL, 'Y', 81.667847, 36.854630, 3, 'tr_0 tr_650000 tr_653200', 8);
INSERT INTO `sys_area`
VALUES (653227, '民丰县', 653200, '民丰', NULL, NULL, 'M', 82.692352, 37.064911, 3, 'tr_0 tr_650000 tr_653200', 5);
INSERT INTO `sys_area`
VALUES (654000, '伊犁哈萨克自治州', 650000, '伊犁', NULL, NULL, 'Y', 81.317947, 43.921860, 2, 'tr_0 tr_650000', 18);
INSERT INTO `sys_area`
VALUES (654002, '伊宁市', 654000, '伊宁市', NULL, NULL, 'Y', 81.316345, 43.922211, 3, 'tr_0 tr_650000 tr_654000', 8);
INSERT INTO `sys_area`
VALUES (654003, '奎屯市', 654000, '奎屯', NULL, NULL, 'K', 84.901604, 44.423447, 3, 'tr_0 tr_650000 tr_654000', 4);
INSERT INTO `sys_area`
VALUES (654021, '伊宁县', 654000, '伊宁县', NULL, NULL, 'Y', 81.524673, 43.977875, 3, 'tr_0 tr_650000 tr_654000', 9);
INSERT INTO `sys_area`
VALUES (654022, '察布查尔锡伯自治县', 654000, '察布查尔', NULL, NULL, 'C', 81.150871, 43.838882, 3, 'tr_0 tr_650000 tr_654000', 1);
INSERT INTO `sys_area`
VALUES (654023, '霍城县', 654000, '霍城', NULL, NULL, 'H', 80.872505, 44.049911, 3, 'tr_0 tr_650000 tr_654000', 3);
INSERT INTO `sys_area`
VALUES (654024, '巩留县', 654000, '巩留', NULL, NULL, 'G', 82.227043, 43.481617, 3, 'tr_0 tr_650000 tr_654000', 2);
INSERT INTO `sys_area`
VALUES (654025, '新源县', 654000, '新源', NULL, NULL, 'X', 83.258492, 43.434250, 3, 'tr_0 tr_650000 tr_654000', 7);
INSERT INTO `sys_area`
VALUES (654026, '昭苏县', 654000, '昭苏', NULL, NULL, 'Z', 81.126030, 43.157764, 3, 'tr_0 tr_650000 tr_654000', 10);
INSERT INTO `sys_area`
VALUES (654027, '特克斯县', 654000, '特克斯', NULL, NULL, 'T', 81.840057, 43.214863, 3, 'tr_0 tr_650000 tr_654000', 6);
INSERT INTO `sys_area`
VALUES (654028, '尼勒克县', 654000, '尼勒克', NULL, NULL, 'N', 82.504120, 43.789738, 3, 'tr_0 tr_650000 tr_654000', 5);
INSERT INTO `sys_area`
VALUES (654200, '塔城地区', 650000, '塔城', NULL, NULL, 'T', 82.985733, 46.746300, 2, 'tr_0 tr_650000', 13);
INSERT INTO `sys_area`
VALUES (654201, '塔城市', 654200, '塔城', NULL, NULL, 'T', 82.983986, 46.746281, 3, 'tr_0 tr_650000 tr_654200', 4);
INSERT INTO `sys_area`
VALUES (654202, '乌苏市', 654200, '乌苏', NULL, NULL, 'W', 84.677628, 44.430115, 3, 'tr_0 tr_650000 tr_654200', 6);
INSERT INTO `sys_area`
VALUES (654221, '额敏县', 654200, '额敏', NULL, NULL, 'E', 83.622116, 46.522556, 3, 'tr_0 tr_650000 tr_654200', 1);
INSERT INTO `sys_area`
VALUES (654223, '沙湾县', 654200, '沙湾', NULL, NULL, 'S', 85.622505, 44.329544, 3, 'tr_0 tr_650000 tr_654200', 3);
INSERT INTO `sys_area`
VALUES (654224, '托里县', 654200, '托里', NULL, NULL, 'T', 83.604691, 45.935863, 3, 'tr_0 tr_650000 tr_654200', 5);
INSERT INTO `sys_area`
VALUES (654225, '裕民县', 654200, '裕民', NULL, NULL, 'Y', 82.982155, 46.202782, 3, 'tr_0 tr_650000 tr_654200', 7);
INSERT INTO `sys_area`
VALUES (654226, '和布克赛尔蒙古自治县', 654200, '和布克赛尔', NULL, NULL, 'H', 85.733551, 46.792999, 3, 'tr_0 tr_650000 tr_654200', 2);
INSERT INTO `sys_area`
VALUES (654300, '阿勒泰地区', 650000, '阿勒泰', NULL, NULL, 'A', 88.139633, 47.848392, 2, 'tr_0 tr_650000', 3);
INSERT INTO `sys_area`
VALUES (654301, '阿勒泰市', 654300, '阿勒泰', NULL, NULL, 'A', 88.138741, 47.848911, 3, 'tr_0 tr_650000 tr_654300', 1);
INSERT INTO `sys_area`
VALUES (654321, '布尔津县', 654300, '布尔津', NULL, NULL, 'B', 86.861862, 47.704529, 3, 'tr_0 tr_650000 tr_654300', 2);
INSERT INTO `sys_area`
VALUES (654322, '富蕴县', 654300, '富蕴', NULL, NULL, 'F', 89.524994, 46.993107, 3, 'tr_0 tr_650000 tr_654300', 4);
INSERT INTO `sys_area`
VALUES (654323, '福海县', 654300, '福海', NULL, NULL, 'F', 87.494568, 47.113129, 3, 'tr_0 tr_650000 tr_654300', 3);
INSERT INTO `sys_area`
VALUES (654324, '哈巴河县', 654300, '哈巴河', NULL, NULL, 'H', 86.418961, 48.059284, 3, 'tr_0 tr_650000 tr_654300', 5);
INSERT INTO `sys_area`
VALUES (654325, '青河县', 654300, '青河', NULL, NULL, 'Q', 90.381561, 46.672447, 3, 'tr_0 tr_650000 tr_654300', 7);
INSERT INTO `sys_area`
VALUES (654326, '吉木乃县', 654300, '吉木乃', NULL, NULL, 'J', 85.876060, 47.434631, 3, 'tr_0 tr_650000 tr_654300', 6);
INSERT INTO `sys_area`
VALUES (659001, '石河子市', 650000, '石河子', NULL, NULL, 'S', 86.041077, 44.305885, 2, 'tr_0 tr_650000', 12);
INSERT INTO `sys_area`
VALUES (659002, '阿拉尔市', 650000, '阿拉尔', NULL, NULL, 'A', 81.285881, 40.541916, 2, 'tr_0 tr_650000', 2);
INSERT INTO `sys_area`
VALUES (659003, '图木舒克市', 650000, '图木舒克', NULL, NULL, 'T', 79.077980, 39.867317, 2, 'tr_0 tr_650000', 15);
INSERT INTO `sys_area`
VALUES (659004, '五家渠市', 650000, '五家渠', NULL, NULL, 'W', 87.526886, 44.167400, 2, 'tr_0 tr_650000', 16);
INSERT INTO `sys_area`
VALUES (710000, '台湾', 0, '台湾', NULL, NULL, 'T', 121.509064, 25.044333, 1, 'tr_0', 34);
INSERT INTO `sys_area`
VALUES (710100, '台北市', 710000, '台北', NULL, NULL, 'T', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 12);
INSERT INTO `sys_area`
VALUES (710101, '中正区', 710100, '中正', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 12);
INSERT INTO `sys_area`
VALUES (710102, '大同区', 710100, '大同', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 3);
INSERT INTO `sys_area`
VALUES (710103, '中山区', 710100, '中山', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 11);
INSERT INTO `sys_area`
VALUES (710104, '松山区', 710100, '松山', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 8);
INSERT INTO `sys_area`
VALUES (710105, '大安区', 710100, '大安', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 2);
INSERT INTO `sys_area`
VALUES (710106, '万华区', 710100, '万华', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 9);
INSERT INTO `sys_area`
VALUES (710107, '信义区', 710100, '信义', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 6);
INSERT INTO `sys_area`
VALUES (710108, '士林区', 710100, '士林', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 7);
INSERT INTO `sys_area`
VALUES (710109, '北投区', 710100, '北投', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 1);
INSERT INTO `sys_area`
VALUES (710110, '内湖区', 710100, '内湖', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 5);
INSERT INTO `sys_area`
VALUES (710111, '南港区', 710100, '南港', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 4);
INSERT INTO `sys_area`
VALUES (710112, '文山区', 710100, '文山', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710100', 10);
INSERT INTO `sys_area`
VALUES (710200, '高雄市', 710000, '高雄', NULL, NULL, 'G', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 1);
INSERT INTO `sys_area`
VALUES (710201, '新兴区', 710200, '新兴', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 34);
INSERT INTO `sys_area`
VALUES (710202, '前金区', 710200, '前金', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 21);
INSERT INTO `sys_area`
VALUES (710203, '芩雅区', 710200, '芩雅', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 26);
INSERT INTO `sys_area`
VALUES (710204, '盐埕区', 710200, '盐埕', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 36);
INSERT INTO `sys_area`
VALUES (710205, '鼓山区', 710200, '鼓山', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 7);
INSERT INTO `sys_area`
VALUES (710206, '旗津区', 710200, '旗津', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 25);
INSERT INTO `sys_area`
VALUES (710207, '前镇区', 710200, '前镇', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 22);
INSERT INTO `sys_area`
VALUES (710208, '三民区', 710200, '三民', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 29);
INSERT INTO `sys_area`
VALUES (710209, '左营区', 710200, '左营', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 39);
INSERT INTO `sys_area`
VALUES (710210, '楠梓区', 710200, '楠梓', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 18);
INSERT INTO `sys_area`
VALUES (710211, '小港区', 710200, '小港', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 33);
INSERT INTO `sys_area`
VALUES (710241, '苓雅区', 710200, '苓雅', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 10);
INSERT INTO `sys_area`
VALUES (710242, '仁武区', 710200, '仁武', NULL, NULL, 'R', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 28);
INSERT INTO `sys_area`
VALUES (710243, '大社区', 710200, '大社', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 3);
INSERT INTO `sys_area`
VALUES (710244, '冈山区', 710200, '冈山', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 6);
INSERT INTO `sys_area`
VALUES (710245, '路竹区', 710200, '路竹', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 13);
INSERT INTO `sys_area`
VALUES (710246, '阿莲区', 710200, '阿莲', NULL, NULL, 'A', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 1);
INSERT INTO `sys_area`
VALUES (710247, '田寮区', 710200, '田寮', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 32);
INSERT INTO `sys_area`
VALUES (710248, '燕巢区', 710200, '燕巢', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 35);
INSERT INTO `sys_area`
VALUES (710249, '桥头区', 710200, '桥头', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 23);
INSERT INTO `sys_area`
VALUES (710250, '梓官区', 710200, '梓官', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 38);
INSERT INTO `sys_area`
VALUES (710251, '弥陀区', 710200, '弥陀', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 16);
INSERT INTO `sys_area`
VALUES (710252, '永安区', 710200, '永安', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 37);
INSERT INTO `sys_area`
VALUES (710253, '湖内区', 710200, '湖内', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 8);
INSERT INTO `sys_area`
VALUES (710254, '凤山区', 710200, '凤山', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 5);
INSERT INTO `sys_area`
VALUES (710255, '大寮区', 710200, '大寮', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 2);
INSERT INTO `sys_area`
VALUES (710256, '林园区', 710200, '林园', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 11);
INSERT INTO `sys_area`
VALUES (710257, '鸟松区', 710200, '鸟松', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 20);
INSERT INTO `sys_area`
VALUES (710258, '大树区', 710200, '大树', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 4);
INSERT INTO `sys_area`
VALUES (710259, '旗山区', 710200, '旗山', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 27);
INSERT INTO `sys_area`
VALUES (710260, '美浓区', 710200, '美浓', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 15);
INSERT INTO `sys_area`
VALUES (710261, '六龟区', 710200, '六龟', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 12);
INSERT INTO `sys_area`
VALUES (710262, '内门区', 710200, '内门', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 19);
INSERT INTO `sys_area`
VALUES (710263, '杉林区', 710200, '杉林', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 30);
INSERT INTO `sys_area`
VALUES (710264, '甲仙区', 710200, '甲仙', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 9);
INSERT INTO `sys_area`
VALUES (710265, '桃源区', 710200, '桃源', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 31);
INSERT INTO `sys_area`
VALUES (710266, '那玛夏区', 710200, '那玛夏', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 17);
INSERT INTO `sys_area`
VALUES (710267, '茂林区', 710200, '茂林', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 14);
INSERT INTO `sys_area`
VALUES (710268, '茄萣区', 710200, '茄萣', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710200', 24);
INSERT INTO `sys_area`
VALUES (710300, '台南市', 710000, '台南', NULL, NULL, 'T', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 14);
INSERT INTO `sys_area`
VALUES (710301, '中西区', 710300, '中西', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 36);
INSERT INTO `sys_area`
VALUES (710302, '东区', 710300, '东区', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 8);
INSERT INTO `sys_area`
VALUES (710303, '南区', 710300, '南区', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 21);
INSERT INTO `sys_area`
VALUES (710304, '北区', 710300, '北区', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 6);
INSERT INTO `sys_area`
VALUES (710305, '安平区', 710300, '安平', NULL, NULL, 'A', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 3);
INSERT INTO `sys_area`
VALUES (710306, '安南区', 710300, '安南', NULL, NULL, 'A', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 2);
INSERT INTO `sys_area`
VALUES (710339, '永康区', 710300, '永康', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 34);
INSERT INTO `sys_area`
VALUES (710340, '归仁区', 710300, '归仁', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 12);
INSERT INTO `sys_area`
VALUES (710341, '新化区', 710300, '新化', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 29);
INSERT INTO `sys_area`
VALUES (710342, '左镇区', 710300, '左镇', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 37);
INSERT INTO `sys_area`
VALUES (710343, '玉井区', 710300, '玉井', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 35);
INSERT INTO `sys_area`
VALUES (710344, '楠西区', 710300, '楠西', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 22);
INSERT INTO `sys_area`
VALUES (710345, '南化区', 710300, '南化', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 20);
INSERT INTO `sys_area`
VALUES (710346, '仁德区', 710300, '仁德', NULL, NULL, 'R', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 24);
INSERT INTO `sys_area`
VALUES (710347, '关庙区', 710300, '关庙', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 10);
INSERT INTO `sys_area`
VALUES (710348, '龙崎区', 710300, '龙崎', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 18);
INSERT INTO `sys_area`
VALUES (710349, '官田区', 710300, '官田', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 11);
INSERT INTO `sys_area`
VALUES (710350, '麻豆区', 710300, '麻豆', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 19);
INSERT INTO `sys_area`
VALUES (710351, '佳里区', 710300, '佳里', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 14);
INSERT INTO `sys_area`
VALUES (710352, '西港区', 710300, '西港', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 28);
INSERT INTO `sys_area`
VALUES (710353, '七股区', 710300, '七股', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 23);
INSERT INTO `sys_area`
VALUES (710354, '将军区', 710300, '将军', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 15);
INSERT INTO `sys_area`
VALUES (710355, '学甲区', 710300, '学甲', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 32);
INSERT INTO `sys_area`
VALUES (710356, '北门区', 710300, '北门', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 5);
INSERT INTO `sys_area`
VALUES (710357, '新营区', 710300, '新营', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 31);
INSERT INTO `sys_area`
VALUES (710358, '后壁区', 710300, '后壁', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 13);
INSERT INTO `sys_area`
VALUES (710359, '白河区', 710300, '白河', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 4);
INSERT INTO `sys_area`
VALUES (710360, '东山区', 710300, '东山', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 9);
INSERT INTO `sys_area`
VALUES (710361, '六甲区', 710300, '六甲', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 16);
INSERT INTO `sys_area`
VALUES (710362, '下营区', 710300, '下营', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 27);
INSERT INTO `sys_area`
VALUES (710363, '柳营区', 710300, '柳营', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 17);
INSERT INTO `sys_area`
VALUES (710364, '盐水区', 710300, '盐水', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 33);
INSERT INTO `sys_area`
VALUES (710365, '善化区', 710300, '善化', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 25);
INSERT INTO `sys_area`
VALUES (710366, '大内区', 710300, '大内', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 7);
INSERT INTO `sys_area`
VALUES (710367, '山上区', 710300, '山上', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 26);
INSERT INTO `sys_area`
VALUES (710368, '新市区', 710300, '新市', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 30);
INSERT INTO `sys_area`
VALUES (710369, '安定区', 710300, '安定', NULL, NULL, 'A', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710300', 1);
INSERT INTO `sys_area`
VALUES (710400, '台中市', 710000, '台中', NULL, NULL, 'T', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 15);
INSERT INTO `sys_area`
VALUES (710401, '中区', 710400, '中区', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 29);
INSERT INTO `sys_area`
VALUES (710402, '东区', 710400, '东区', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 8);
INSERT INTO `sys_area`
VALUES (710403, '南区', 710400, '南区', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 14);
INSERT INTO `sys_area`
VALUES (710404, '西区', 710400, '西区', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 27);
INSERT INTO `sys_area`
VALUES (710405, '北区', 710400, '北区', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 1);
INSERT INTO `sys_area`
VALUES (710406, '北屯区', 710400, '北屯', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 2);
INSERT INTO `sys_area`
VALUES (710407, '西屯区', 710400, '西屯', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 28);
INSERT INTO `sys_area`
VALUES (710408, '南屯区', 710400, '南屯', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 15);
INSERT INTO `sys_area`
VALUES (710431, '太平区', 710400, '太平', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 20);
INSERT INTO `sys_area`
VALUES (710432, '大里区', 710400, '大里', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 6);
INSERT INTO `sys_area`
VALUES (710433, '雾峰区', 710400, '雾峰', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 23);
INSERT INTO `sys_area`
VALUES (710434, '乌日区', 710400, '乌日', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 25);
INSERT INTO `sys_area`
VALUES (710435, '丰原区', 710400, '丰原', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 10);
INSERT INTO `sys_area`
VALUES (710436, '后里区', 710400, '后里', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 12);
INSERT INTO `sys_area`
VALUES (710437, '石冈区', 710400, '石冈', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 19);
INSERT INTO `sys_area`
VALUES (710438, '东势区', 710400, '东势', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 9);
INSERT INTO `sys_area`
VALUES (710439, '和平区', 710400, '和平', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 11);
INSERT INTO `sys_area`
VALUES (710440, '新社区', 710400, '新社', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 26);
INSERT INTO `sys_area`
VALUES (710441, '潭子区', 710400, '潭子', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 21);
INSERT INTO `sys_area`
VALUES (710442, '大雅区', 710400, '大雅', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 7);
INSERT INTO `sys_area`
VALUES (710443, '神冈区', 710400, '神冈', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 18);
INSERT INTO `sys_area`
VALUES (710444, '大肚区', 710400, '大肚', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 4);
INSERT INTO `sys_area`
VALUES (710445, '沙鹿区', 710400, '沙鹿', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 17);
INSERT INTO `sys_area`
VALUES (710446, '龙井区', 710400, '龙井', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 13);
INSERT INTO `sys_area`
VALUES (710447, '梧栖区', 710400, '梧栖', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 24);
INSERT INTO `sys_area`
VALUES (710448, '清水区', 710400, '清水', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 16);
INSERT INTO `sys_area`
VALUES (710449, '大甲区', 710400, '大甲', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 5);
INSERT INTO `sys_area`
VALUES (710450, '外埔区', 710400, '外埔', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 22);
INSERT INTO `sys_area`
VALUES (710451, '大安区', 710400, '大安', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710400', 3);
INSERT INTO `sys_area`
VALUES (710500, '金门县', 710000, '金门', NULL, NULL, 'J', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 6);
INSERT INTO `sys_area`
VALUES (710507, '金沙镇', 710500, '金沙', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710500', 4);
INSERT INTO `sys_area`
VALUES (710508, '金湖镇', 710500, '金湖', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710500', 2);
INSERT INTO `sys_area`
VALUES (710509, '金宁乡', 710500, '金宁', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710500', 3);
INSERT INTO `sys_area`
VALUES (710510, '金城镇', 710500, '金城', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710500', 1);
INSERT INTO `sys_area`
VALUES (710511, '烈屿乡', 710500, '烈屿', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710500', 5);
INSERT INTO `sys_area`
VALUES (710512, '乌坵乡', 710500, '乌坵', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710500', 6);
INSERT INTO `sys_area`
VALUES (710600, '南投县', 710000, '南投', NULL, NULL, 'N', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 9);
INSERT INTO `sys_area`
VALUES (710614, '南投市', 710600, '南投', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 8);
INSERT INTO `sys_area`
VALUES (710615, '中寮乡', 710600, '中寮', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 3);
INSERT INTO `sys_area`
VALUES (710616, '草屯镇', 710600, '草屯', NULL, NULL, 'C', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 1);
INSERT INTO `sys_area`
VALUES (710617, '国姓乡', 710600, '国姓', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 2);
INSERT INTO `sys_area`
VALUES (710618, '埔里镇', 710600, '埔里', NULL, NULL, 'P', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 9);
INSERT INTO `sys_area`
VALUES (710619, '仁爱乡', 710600, '仁爱', NULL, NULL, 'R', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 10);
INSERT INTO `sys_area`
VALUES (710620, '名间乡', 710600, '名间', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 7);
INSERT INTO `sys_area`
VALUES (710621, '集集镇', 710600, '集集', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 5);
INSERT INTO `sys_area`
VALUES (710622, '水里乡', 710600, '水里', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 11);
INSERT INTO `sys_area`
VALUES (710623, '鱼池乡', 710600, '鱼池', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 13);
INSERT INTO `sys_area`
VALUES (710624, '信义乡', 710600, '信义', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 12);
INSERT INTO `sys_area`
VALUES (710625, '竹山镇', 710600, '竹山', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 4);
INSERT INTO `sys_area`
VALUES (710626, '鹿谷乡', 710600, '鹿谷', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710600', 6);
INSERT INTO `sys_area`
VALUES (710700, '基隆市', 710000, '基隆', NULL, NULL, 'J', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 5);
INSERT INTO `sys_area`
VALUES (710701, '仁爱区', 710700, '仁爱', NULL, NULL, 'R', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710700', 4);
INSERT INTO `sys_area`
VALUES (710702, '信义区', 710700, '信义', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710700', 5);
INSERT INTO `sys_area`
VALUES (710703, '中正区', 710700, '中正', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710700', 7);
INSERT INTO `sys_area`
VALUES (710704, '中山区', 710700, '中山', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710700', 6);
INSERT INTO `sys_area`
VALUES (710705, '安乐区', 710700, '安乐', NULL, NULL, 'A', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710700', 1);
INSERT INTO `sys_area`
VALUES (710706, '暖暖区', 710700, '暖暖', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710700', 2);
INSERT INTO `sys_area`
VALUES (710707, '七堵区', 710700, '七堵', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710700', 3);
INSERT INTO `sys_area`
VALUES (710800, '新竹市', 710000, '新竹', NULL, NULL, 'X', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 18);
INSERT INTO `sys_area`
VALUES (710801, '东区', 710800, '东区', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710800', 2);
INSERT INTO `sys_area`
VALUES (710802, '北区', 710800, '北区', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710800', 1);
INSERT INTO `sys_area`
VALUES (710803, '香山区', 710800, '香山', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710800', 3);
INSERT INTO `sys_area`
VALUES (710900, '嘉义市', 710000, '嘉义', NULL, NULL, 'J', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 3);
INSERT INTO `sys_area`
VALUES (710901, '东区', 710900, '东区', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710900', 1);
INSERT INTO `sys_area`
VALUES (710902, '西区', 710900, '西区', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_710900', 2);
INSERT INTO `sys_area`
VALUES (711100, '新北市', 710000, '新北', NULL, NULL, 'X', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 17);
INSERT INTO `sys_area`
VALUES (711130, '万里区', 711100, '万里', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 25);
INSERT INTO `sys_area`
VALUES (711131, '金山区', 711100, '金山', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 6);
INSERT INTO `sys_area`
VALUES (711132, '板桥区', 711100, '板桥', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 2);
INSERT INTO `sys_area`
VALUES (711133, '汐止区', 711100, '汐止', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 20);
INSERT INTO `sys_area`
VALUES (711134, '深坑区', 711100, '深坑', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 15);
INSERT INTO `sys_area`
VALUES (711135, '石碇区', 711100, '石碇', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 16);
INSERT INTO `sys_area`
VALUES (711136, '瑞芳区', 711100, '瑞芳', NULL, NULL, 'R', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 11);
INSERT INTO `sys_area`
VALUES (711137, '平溪区', 711100, '平溪', NULL, NULL, 'P', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 10);
INSERT INTO `sys_area`
VALUES (711138, '双溪区', 711100, '双溪', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 18);
INSERT INTO `sys_area`
VALUES (711139, '贡寮区', 711100, '贡寮', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 4);
INSERT INTO `sys_area`
VALUES (711140, '新店区', 711100, '新店', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 21);
INSERT INTO `sys_area`
VALUES (711141, '坪林区', 711100, '坪林', NULL, NULL, 'P', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 9);
INSERT INTO `sys_area`
VALUES (711142, '乌来区', 711100, '乌来', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 27);
INSERT INTO `sys_area`
VALUES (711143, '永和区', 711100, '永和', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 29);
INSERT INTO `sys_area`
VALUES (711144, '中和区', 711100, '中和', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 5);
INSERT INTO `sys_area`
VALUES (711145, '土城区', 711100, '土城', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 24);
INSERT INTO `sys_area`
VALUES (711146, '三峡区', 711100, '三峡', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 14);
INSERT INTO `sys_area`
VALUES (711147, '树林区', 711100, '树林', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 19);
INSERT INTO `sys_area`
VALUES (711148, '莺歌区', 711100, '莺歌', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 28);
INSERT INTO `sys_area`
VALUES (711149, '三重区', 711100, '三重', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 12);
INSERT INTO `sys_area`
VALUES (711150, '新庄区', 711100, '新庄', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 22);
INSERT INTO `sys_area`
VALUES (711151, '泰山区', 711100, '泰山', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 23);
INSERT INTO `sys_area`
VALUES (711152, '林口区', 711100, '林口', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 7);
INSERT INTO `sys_area`
VALUES (711153, '芦洲区', 711100, '芦洲', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 8);
INSERT INTO `sys_area`
VALUES (711154, '五股区', 711100, '五股', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 26);
INSERT INTO `sys_area`
VALUES (711155, '八里区', 711100, '八里', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 1);
INSERT INTO `sys_area`
VALUES (711156, '淡水区', 711100, '淡水', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 3);
INSERT INTO `sys_area`
VALUES (711157, '三芝区', 711100, '三芝', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 13);
INSERT INTO `sys_area`
VALUES (711158, '石门区', 711100, '石门', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711100', 17);
INSERT INTO `sys_area`
VALUES (711200, '宜兰县', 710000, '宜兰', NULL, NULL, 'Y', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 20);
INSERT INTO `sys_area`
VALUES (711214, '宜兰市', 711200, '宜兰', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 12);
INSERT INTO `sys_area`
VALUES (711215, '头城镇', 711200, '头城', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 10);
INSERT INTO `sys_area`
VALUES (711216, '礁溪乡', 711200, '礁溪', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 5);
INSERT INTO `sys_area`
VALUES (711217, '壮围乡', 711200, '壮围', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 4);
INSERT INTO `sys_area`
VALUES (711218, '员山乡', 711200, '员山', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 13);
INSERT INTO `sys_area`
VALUES (711219, '罗东镇', 711200, '罗东', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 6);
INSERT INTO `sys_area`
VALUES (711220, '三星乡', 711200, '三星', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 8);
INSERT INTO `sys_area`
VALUES (711221, '大同乡', 711200, '大同', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 1);
INSERT INTO `sys_area`
VALUES (711222, '五结乡', 711200, '五结', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 11);
INSERT INTO `sys_area`
VALUES (711223, '冬山乡', 711200, '冬山', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 3);
INSERT INTO `sys_area`
VALUES (711224, '苏澳镇', 711200, '苏澳', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 9);
INSERT INTO `sys_area`
VALUES (711225, '南澳乡', 711200, '南澳', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 7);
INSERT INTO `sys_area`
VALUES (711226, '钓鱼台', 711200, '钓鱼', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711200', 2);
INSERT INTO `sys_area`
VALUES (711300, '新竹县', 710000, '新竹', NULL, NULL, 'X', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 19);
INSERT INTO `sys_area`
VALUES (711314, '竹北市', 711300, '竹北', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 8);
INSERT INTO `sys_area`
VALUES (711315, '湖口乡', 711300, '湖口', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 7);
INSERT INTO `sys_area`
VALUES (711316, '新丰乡', 711300, '新丰', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 11);
INSERT INTO `sys_area`
VALUES (711317, '新埔镇', 711300, '新埔', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 12);
INSERT INTO `sys_area`
VALUES (711318, '关西镇', 711300, '关西', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 5);
INSERT INTO `sys_area`
VALUES (711319, '芎林乡', 711300, '芎林', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 3);
INSERT INTO `sys_area`
VALUES (711320, '宝山乡', 711300, '宝山', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 1);
INSERT INTO `sys_area`
VALUES (711321, '竹东镇', 711300, '竹东', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 9);
INSERT INTO `sys_area`
VALUES (711322, '五峰乡', 711300, '五峰', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 13);
INSERT INTO `sys_area`
VALUES (711323, '横山乡', 711300, '横山', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 6);
INSERT INTO `sys_area`
VALUES (711324, '尖石乡', 711300, '尖石', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 10);
INSERT INTO `sys_area`
VALUES (711325, '北埔乡', 711300, '北埔', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 2);
INSERT INTO `sys_area`
VALUES (711326, '峨眉乡', 711300, '峨眉', NULL, NULL, 'E', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711300', 4);
INSERT INTO `sys_area`
VALUES (711400, '桃园县', 710000, '桃园', NULL, NULL, 'T', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 16);
INSERT INTO `sys_area`
VALUES (711414, '中坜市', 711400, '中坜', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 7);
INSERT INTO `sys_area`
VALUES (711415, '平镇市', 711400, '平镇', NULL, NULL, 'P', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 10);
INSERT INTO `sys_area`
VALUES (711416, '龙潭乡', 711400, '龙潭', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 8);
INSERT INTO `sys_area`
VALUES (711417, '杨梅市', 711400, '杨梅', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 13);
INSERT INTO `sys_area`
VALUES (711418, '新屋乡', 711400, '新屋', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 11);
INSERT INTO `sys_area`
VALUES (711419, '观音乡', 711400, '观音', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 5);
INSERT INTO `sys_area`
VALUES (711420, '桃园市', 711400, '桃园', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 12);
INSERT INTO `sys_area`
VALUES (711421, '龟山乡', 711400, '龟山', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 6);
INSERT INTO `sys_area`
VALUES (711422, '八德市', 711400, '八德', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 1);
INSERT INTO `sys_area`
VALUES (711423, '大溪镇', 711400, '大溪', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 2);
INSERT INTO `sys_area`
VALUES (711424, '复兴乡', 711400, '复兴', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 4);
INSERT INTO `sys_area`
VALUES (711425, '大园乡', 711400, '大园', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 3);
INSERT INTO `sys_area`
VALUES (711426, '芦竹乡', 711400, '芦竹', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711400', 9);
INSERT INTO `sys_area`
VALUES (711500, '苗栗县', 710000, '苗栗', NULL, NULL, 'M', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 8);
INSERT INTO `sys_area`
VALUES (711519, '竹南镇', 711500, '竹南', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 4);
INSERT INTO `sys_area`
VALUES (711520, '头份镇', 711500, '头份', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 15);
INSERT INTO `sys_area`
VALUES (711521, '三湾乡', 711500, '三湾', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 8);
INSERT INTO `sys_area`
VALUES (711522, '南庄乡', 711500, '南庄', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 7);
INSERT INTO `sys_area`
VALUES (711523, '狮潭乡', 711500, '狮潭', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 10);
INSERT INTO `sys_area`
VALUES (711524, '后龙镇', 711500, '后龙', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 3);
INSERT INTO `sys_area`
VALUES (711525, '通霄镇', 711500, '通霄', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 14);
INSERT INTO `sys_area`
VALUES (711526, '苑里镇', 711500, '苑里', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 17);
INSERT INTO `sys_area`
VALUES (711527, '苗栗市', 711500, '苗栗', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 6);
INSERT INTO `sys_area`
VALUES (711528, '造桥乡', 711500, '造桥', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 18);
INSERT INTO `sys_area`
VALUES (711529, '头屋乡', 711500, '头屋', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 16);
INSERT INTO `sys_area`
VALUES (711530, '公馆乡', 711500, '公馆', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 2);
INSERT INTO `sys_area`
VALUES (711531, '大湖乡', 711500, '大湖', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 1);
INSERT INTO `sys_area`
VALUES (711532, '泰安乡', 711500, '泰安', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 12);
INSERT INTO `sys_area`
VALUES (711533, '铜锣乡', 711500, '铜锣', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 13);
INSERT INTO `sys_area`
VALUES (711534, '三义乡', 711500, '三义', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 9);
INSERT INTO `sys_area`
VALUES (711535, '西湖乡', 711500, '西湖', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 11);
INSERT INTO `sys_area`
VALUES (711536, '卓兰镇', 711500, '卓兰', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711500', 5);
INSERT INTO `sys_area`
VALUES (711700, '彰化县', 710000, '彰化', NULL, NULL, 'Z', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 22);
INSERT INTO `sys_area`
VALUES (711727, '彰化市', 711700, '彰化', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 11);
INSERT INTO `sys_area`
VALUES (711728, '芬园乡', 711700, '芬园', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 7);
INSERT INTO `sys_area`
VALUES (711729, '花坛乡', 711700, '花坛', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 10);
INSERT INTO `sys_area`
VALUES (711730, '秀水乡', 711700, '秀水', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 22);
INSERT INTO `sys_area`
VALUES (711731, '鹿港镇', 711700, '鹿港', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 13);
INSERT INTO `sys_area`
VALUES (711732, '福兴乡', 711700, '福兴', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 8);
INSERT INTO `sys_area`
VALUES (711733, '线西乡', 711700, '线西', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 19);
INSERT INTO `sys_area`
VALUES (711734, '和美镇', 711700, '和美', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 9);
INSERT INTO `sys_area`
VALUES (711735, '伸港乡', 711700, '伸港', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 17);
INSERT INTO `sys_area`
VALUES (711736, '员林镇', 711700, '员林', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 26);
INSERT INTO `sys_area`
VALUES (711737, '社头乡', 711700, '社头', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 18);
INSERT INTO `sys_area`
VALUES (711738, '永靖乡', 711700, '永靖', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 25);
INSERT INTO `sys_area`
VALUES (711739, '埔心乡', 711700, '埔心', NULL, NULL, 'P', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 15);
INSERT INTO `sys_area`
VALUES (711740, '溪湖镇', 711700, '溪湖', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 20);
INSERT INTO `sys_area`
VALUES (711741, '大村乡', 711700, '大村', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 3);
INSERT INTO `sys_area`
VALUES (711742, '埔盐乡', 711700, '埔盐', NULL, NULL, 'P', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 16);
INSERT INTO `sys_area`
VALUES (711743, '田中镇', 711700, '田中', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 23);
INSERT INTO `sys_area`
VALUES (711744, '北斗镇', 711700, '北斗', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 1);
INSERT INTO `sys_area`
VALUES (711745, '田尾乡', 711700, '田尾', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 24);
INSERT INTO `sys_area`
VALUES (711746, '埤头乡', 711700, '埤头', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 14);
INSERT INTO `sys_area`
VALUES (711747, '溪州乡', 711700, '溪州', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 21);
INSERT INTO `sys_area`
VALUES (711748, '竹塘乡', 711700, '竹塘', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 12);
INSERT INTO `sys_area`
VALUES (711749, '二林镇', 711700, '二林', NULL, NULL, 'E', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 4);
INSERT INTO `sys_area`
VALUES (711750, '大城乡', 711700, '大城', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 2);
INSERT INTO `sys_area`
VALUES (711751, '芳苑乡', 711700, '芳苑', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 6);
INSERT INTO `sys_area`
VALUES (711752, '二水乡', 711700, '二水', NULL, NULL, 'E', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711700', 5);
INSERT INTO `sys_area`
VALUES (711900, '嘉义县', 710000, '嘉义', NULL, NULL, 'J', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 4);
INSERT INTO `sys_area`
VALUES (711919, '番路乡', 711900, '番路', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 7);
INSERT INTO `sys_area`
VALUES (711920, '梅山乡', 711900, '梅山', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 11);
INSERT INTO `sys_area`
VALUES (711921, '竹崎乡', 711900, '竹崎', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 9);
INSERT INTO `sys_area`
VALUES (711922, '阿里山乡', 711900, '阿里山', NULL, NULL, 'A', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 1);
INSERT INTO `sys_area`
VALUES (711923, '中埔乡', 711900, '中埔', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 8);
INSERT INTO `sys_area`
VALUES (711924, '大埔乡', 711900, '大埔', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 5);
INSERT INTO `sys_area`
VALUES (711925, '水上乡', 711900, '水上', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 14);
INSERT INTO `sys_area`
VALUES (711926, '鹿草乡', 711900, '鹿草', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 2);
INSERT INTO `sys_area`
VALUES (711927, '太保市', 711900, '太保', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 17);
INSERT INTO `sys_area`
VALUES (711928, '朴子市', 711900, '朴子', NULL, NULL, 'P', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 13);
INSERT INTO `sys_area`
VALUES (711929, '东石乡', 711900, '东石', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 6);
INSERT INTO `sys_area`
VALUES (711930, '六脚乡', 711900, '六脚', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 10);
INSERT INTO `sys_area`
VALUES (711931, '新港乡', 711900, '新港', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 16);
INSERT INTO `sys_area`
VALUES (711932, '民雄乡', 711900, '民雄', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 12);
INSERT INTO `sys_area`
VALUES (711933, '大林镇', 711900, '大林', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 4);
INSERT INTO `sys_area`
VALUES (711934, '溪口乡', 711900, '溪口', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 15);
INSERT INTO `sys_area`
VALUES (711935, '义竹乡', 711900, '义竹', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 18);
INSERT INTO `sys_area`
VALUES (711936, '布袋镇', 711900, '布袋', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_711900', 3);
INSERT INTO `sys_area`
VALUES (712100, '云林县', 710000, '云林', NULL, NULL, 'Y', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 21);
INSERT INTO `sys_area`
VALUES (712121, '斗南镇', 712100, '斗南', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 7);
INSERT INTO `sys_area`
VALUES (712122, '大埤乡', 712100, '大埤', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 4);
INSERT INTO `sys_area`
VALUES (712123, '虎尾镇', 712100, '虎尾', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 10);
INSERT INTO `sys_area`
VALUES (712124, '土库镇', 712100, '土库', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 19);
INSERT INTO `sys_area`
VALUES (712125, '褒忠乡', 712100, '褒忠', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 1);
INSERT INTO `sys_area`
VALUES (712126, '东势乡', 712100, '东势', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 5);
INSERT INTO `sys_area`
VALUES (712127, '台西乡', 712100, '台西', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 18);
INSERT INTO `sys_area`
VALUES (712128, '仑背乡', 712100, '仑背', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 13);
INSERT INTO `sys_area`
VALUES (712129, '麦寮乡', 712100, '麦寮', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 14);
INSERT INTO `sys_area`
VALUES (712130, '斗六市', 712100, '斗六', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 6);
INSERT INTO `sys_area`
VALUES (712131, '林内乡', 712100, '林内', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 12);
INSERT INTO `sys_area`
VALUES (712132, '古坑乡', 712100, '古坑', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 9);
INSERT INTO `sys_area`
VALUES (712133, '莿桐乡', 712100, '莿桐', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 3);
INSERT INTO `sys_area`
VALUES (712134, '西螺镇', 712100, '西螺', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 17);
INSERT INTO `sys_area`
VALUES (712135, '二仑乡', 712100, '二仑', NULL, NULL, 'E', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 8);
INSERT INTO `sys_area`
VALUES (712136, '北港镇', 712100, '北港', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 2);
INSERT INTO `sys_area`
VALUES (712137, '水林乡', 712100, '水林', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 15);
INSERT INTO `sys_area`
VALUES (712138, '口湖乡', 712100, '口湖', NULL, NULL, 'K', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 11);
INSERT INTO `sys_area`
VALUES (712139, '四湖乡', 712100, '四湖', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 16);
INSERT INTO `sys_area`
VALUES (712140, '元长乡', 712100, '元长', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712100', 20);
INSERT INTO `sys_area`
VALUES (712400, '屏东县', 710000, '屏东', NULL, NULL, 'P', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 11);
INSERT INTO `sys_area`
VALUES (712434, '屏东市', 712400, '屏东', NULL, NULL, 'P', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 24);
INSERT INTO `sys_area`
VALUES (712435, '三地门乡', 712400, '三地门', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 25);
INSERT INTO `sys_area`
VALUES (712436, '雾台乡', 712400, '雾台', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 32);
INSERT INTO `sys_area`
VALUES (712437, '玛家乡', 712400, '玛家', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 19);
INSERT INTO `sys_area`
VALUES (712438, '九如乡', 712400, '九如', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 12);
INSERT INTO `sys_area`
VALUES (712439, '里港乡', 712400, '里港', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 15);
INSERT INTO `sys_area`
VALUES (712440, '高树乡', 712400, '高树', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 8);
INSERT INTO `sys_area`
VALUES (712441, '盐埔乡', 712400, '盐埔', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 33);
INSERT INTO `sys_area`
VALUES (712442, '长治乡', 712400, '长治', NULL, NULL, 'C', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 1);
INSERT INTO `sys_area`
VALUES (712443, '麟洛乡', 712400, '麟洛', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 17);
INSERT INTO `sys_area`
VALUES (712444, '竹田乡', 712400, '竹田', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 10);
INSERT INTO `sys_area`
VALUES (712445, '内埔乡', 712400, '内埔', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 23);
INSERT INTO `sys_area`
VALUES (712446, '万丹乡', 712400, '万丹', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 30);
INSERT INTO `sys_area`
VALUES (712447, '潮州镇', 712400, '潮州', NULL, NULL, 'C', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 2);
INSERT INTO `sys_area`
VALUES (712448, '泰武乡', 712400, '泰武', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 29);
INSERT INTO `sys_area`
VALUES (712449, '来义乡', 712400, '来义', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 14);
INSERT INTO `sys_area`
VALUES (712450, '万峦乡', 712400, '万峦', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 31);
INSERT INTO `sys_area`
VALUES (712451, '崁顶乡', 712400, '崁顶', NULL, NULL, '崁', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 13);
INSERT INTO `sys_area`
VALUES (712452, '新埤乡', 712400, '新埤', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 27);
INSERT INTO `sys_area`
VALUES (712453, '南州乡', 712400, '南州', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 22);
INSERT INTO `sys_area`
VALUES (712454, '林边乡', 712400, '林边', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 16);
INSERT INTO `sys_area`
VALUES (712455, '东港镇', 712400, '东港', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 5);
INSERT INTO `sys_area`
VALUES (712456, '琉球乡', 712400, '琉球', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 18);
INSERT INTO `sys_area`
VALUES (712457, '佳冬乡', 712400, '佳冬', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 11);
INSERT INTO `sys_area`
VALUES (712458, '新园乡', 712400, '新园', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 28);
INSERT INTO `sys_area`
VALUES (712459, '枋寮乡', 712400, '枋寮', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 6);
INSERT INTO `sys_area`
VALUES (712460, '枋山乡', 712400, '枋山', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 7);
INSERT INTO `sys_area`
VALUES (712461, '春日乡', 712400, '春日', NULL, NULL, 'C', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 4);
INSERT INTO `sys_area`
VALUES (712462, '狮子乡', 712400, '狮子', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 26);
INSERT INTO `sys_area`
VALUES (712463, '车城乡', 712400, '车城', NULL, NULL, 'C', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 3);
INSERT INTO `sys_area`
VALUES (712464, '牡丹乡', 712400, '牡丹', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 21);
INSERT INTO `sys_area`
VALUES (712465, '恒春镇', 712400, '恒春', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 9);
INSERT INTO `sys_area`
VALUES (712466, '满州乡', 712400, '满州', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712400', 20);
INSERT INTO `sys_area`
VALUES (712500, '台东县', 710000, '台东', NULL, NULL, 'T', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 13);
INSERT INTO `sys_area`
VALUES (712517, '台东市', 712500, '台东', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 14);
INSERT INTO `sys_area`
VALUES (712518, '绿岛乡', 712500, '绿岛', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 13);
INSERT INTO `sys_area`
VALUES (712519, '兰屿乡', 712500, '兰屿', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 11);
INSERT INTO `sys_area`
VALUES (712520, '延平乡', 712500, '延平', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 16);
INSERT INTO `sys_area`
VALUES (712521, '卑南乡', 712500, '卑南', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 1);
INSERT INTO `sys_area`
VALUES (712522, '鹿野乡', 712500, '鹿野', NULL, NULL, 'L', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 12);
INSERT INTO `sys_area`
VALUES (712523, '关山镇', 712500, '关山', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 8);
INSERT INTO `sys_area`
VALUES (712524, '海端乡', 712500, '海端', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 9);
INSERT INTO `sys_area`
VALUES (712525, '池上乡', 712500, '池上', NULL, NULL, 'C', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 4);
INSERT INTO `sys_area`
VALUES (712526, '东河乡', 712500, '东河', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 7);
INSERT INTO `sys_area`
VALUES (712527, '成功镇', 712500, '成功', NULL, NULL, 'C', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 3);
INSERT INTO `sys_area`
VALUES (712528, '长滨乡', 712500, '长滨', NULL, NULL, 'C', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 2);
INSERT INTO `sys_area`
VALUES (712529, '金峰乡', 712500, '金峰', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 10);
INSERT INTO `sys_area`
VALUES (712530, '大武乡', 712500, '大武', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 6);
INSERT INTO `sys_area`
VALUES (712531, '达仁乡', 712500, '达仁', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 5);
INSERT INTO `sys_area`
VALUES (712532, '太麻里乡', 712500, '太麻里', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712500', 15);
INSERT INTO `sys_area`
VALUES (712600, '花莲县', 710000, '花莲', NULL, NULL, 'H', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 2);
INSERT INTO `sys_area`
VALUES (712615, '花莲市', 712600, '花莲', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 5);
INSERT INTO `sys_area`
VALUES (712616, '新城乡', 712600, '新城', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 10);
INSERT INTO `sys_area`
VALUES (712617, '太鲁阁', 712600, '太鲁', NULL, NULL, 'T', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 12);
INSERT INTO `sys_area`
VALUES (712618, '秀林乡', 712600, '秀林', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 11);
INSERT INTO `sys_area`
VALUES (712619, '吉安乡', 712600, '吉安', NULL, NULL, 'J', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 7);
INSERT INTO `sys_area`
VALUES (712620, '寿丰乡', 712600, '寿丰', NULL, NULL, 'S', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 9);
INSERT INTO `sys_area`
VALUES (712621, '凤林镇', 712600, '凤林', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 2);
INSERT INTO `sys_area`
VALUES (712622, '光复乡', 712600, '光复', NULL, NULL, 'G', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 4);
INSERT INTO `sys_area`
VALUES (712623, '丰滨乡', 712600, '丰滨', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 1);
INSERT INTO `sys_area`
VALUES (712624, '瑞穗乡', 712600, '瑞穗', NULL, NULL, 'R', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 8);
INSERT INTO `sys_area`
VALUES (712625, '万荣乡', 712600, '万荣', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 13);
INSERT INTO `sys_area`
VALUES (712626, '玉里镇', 712600, '玉里', NULL, NULL, 'Y', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 14);
INSERT INTO `sys_area`
VALUES (712627, '卓溪乡', 712600, '卓溪', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 6);
INSERT INTO `sys_area`
VALUES (712628, '富里乡', 712600, '富里', NULL, NULL, 'F', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712600', 3);
INSERT INTO `sys_area`
VALUES (712700, '澎湖县', 710000, '澎湖', NULL, NULL, 'P', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 10);
INSERT INTO `sys_area`
VALUES (712707, '马公市', 712700, '马公', NULL, NULL, 'M', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712700', 4);
INSERT INTO `sys_area`
VALUES (712708, '西屿乡', 712700, '西屿', NULL, NULL, 'X', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712700', 5);
INSERT INTO `sys_area`
VALUES (712709, '望安乡', 712700, '望安', NULL, NULL, 'W', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712700', 6);
INSERT INTO `sys_area`
VALUES (712710, '七美乡', 712700, '七美', NULL, NULL, 'Q', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712700', 2);
INSERT INTO `sys_area`
VALUES (712711, '白沙乡', 712700, '白沙', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712700', 1);
INSERT INTO `sys_area`
VALUES (712712, '湖西乡', 712700, '湖西', NULL, NULL, 'H', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712700', 3);
INSERT INTO `sys_area`
VALUES (712800, '连江县', 710000, '连江', NULL, NULL, 'L', 121.509064, 25.044333, 2, 'tr_0 tr_710000', 7);
INSERT INTO `sys_area`
VALUES (712805, '南竿乡', 712800, '南竿', NULL, NULL, 'N', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712800', 4);
INSERT INTO `sys_area`
VALUES (712806, '北竿乡', 712800, '北竿', NULL, NULL, 'B', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712800', 1);
INSERT INTO `sys_area`
VALUES (712807, '莒光乡', 712800, '莒光', NULL, NULL, 'Z', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712800', 3);
INSERT INTO `sys_area`
VALUES (712808, '东引乡', 712800, '东引', NULL, NULL, 'D', 121.509064, 25.044333, 3, 'tr_0 tr_710000 tr_712800', 2);
INSERT INTO `sys_area`
VALUES (810000, '香港特别行政区', 0, '香港', NULL, NULL, 'X', 114.173355, 22.320047, 1, 'tr_0', 32);
INSERT INTO `sys_area`
VALUES (810100, '香港岛', 810000, '香港岛', NULL, NULL, 'X', 114.173355, 22.320047, 2, 'tr_0 tr_810000', 2);
INSERT INTO `sys_area`
VALUES (810101, '中西区', 810100, '中西', NULL, NULL, 'Z', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810100', 4);
INSERT INTO `sys_area`
VALUES (810102, '湾仔', 810100, '湾仔', NULL, NULL, 'W', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810100', 3);
INSERT INTO `sys_area`
VALUES (810103, '东区', 810100, '东区', NULL, NULL, 'D', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810100', 1);
INSERT INTO `sys_area`
VALUES (810104, '南区', 810100, '南区', NULL, NULL, 'N', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810100', 2);
INSERT INTO `sys_area`
VALUES (810200, '九龙', 810000, '九龙', NULL, NULL, 'J', 114.173355, 22.320047, 2, 'tr_0 tr_810000', 1);
INSERT INTO `sys_area`
VALUES (810201, '九龙城区', 810200, '九龙城', NULL, NULL, 'J', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810200', 3);
INSERT INTO `sys_area`
VALUES (810202, '油尖旺区', 810200, '油尖旺', NULL, NULL, 'Y', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810200', 5);
INSERT INTO `sys_area`
VALUES (810203, '深水埗区', 810200, '深水埗', NULL, NULL, 'S', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810200', 4);
INSERT INTO `sys_area`
VALUES (810204, '黄大仙区', 810200, '黄大仙', NULL, NULL, 'H', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810200', 2);
INSERT INTO `sys_area`
VALUES (810205, '观塘区', 810200, '观塘', NULL, NULL, 'G', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810200', 1);
INSERT INTO `sys_area`
VALUES (810300, '新界', 810000, '新界', NULL, NULL, 'X', 114.173355, 22.320047, 2, 'tr_0 tr_810000', 3);
INSERT INTO `sys_area`
VALUES (810301, '北区', 810300, '北区', NULL, NULL, 'B', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 1);
INSERT INTO `sys_area`
VALUES (810302, '大埔区', 810300, '大埔', NULL, NULL, 'D', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 2);
INSERT INTO `sys_area`
VALUES (810303, '沙田区', 810300, '沙田', NULL, NULL, 'S', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 6);
INSERT INTO `sys_area`
VALUES (810304, '西贡区', 810300, '西贡', NULL, NULL, 'X', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 8);
INSERT INTO `sys_area`
VALUES (810305, '元朗区', 810300, '元朗', NULL, NULL, 'Y', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 9);
INSERT INTO `sys_area`
VALUES (810306, '屯门区', 810300, '屯门', NULL, NULL, 'T', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 7);
INSERT INTO `sys_area`
VALUES (810307, '荃湾区', 810300, '荃湾', NULL, NULL, 'Z', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 5);
INSERT INTO `sys_area`
VALUES (810308, '葵青区', 810300, '葵青', NULL, NULL, 'K', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 3);
INSERT INTO `sys_area`
VALUES (810309, '离岛区', 810300, '离岛', NULL, NULL, 'L', 114.173355, 22.320047, 3, 'tr_0 tr_810000 tr_810300', 4);
INSERT INTO `sys_area`
VALUES (820000, '澳门特别行政区', 0, '澳门', NULL, NULL, 'A', 113.549088, 22.198952, 1, 'tr_0', 33);
INSERT INTO `sys_area`
VALUES (820100, '澳门半岛', 820000, '澳门半岛', NULL, NULL, 'A', 113.549133, 22.198751, 2, 'tr_0 tr_820000', 1);
INSERT INTO `sys_area`
VALUES (820200, '离岛', 820000, '离岛', NULL, NULL, 'L', 113.549088, 22.198952, 2, 'tr_0 tr_820000', 2);

-- ----------------------------
-- Table structure for sys_banner
-- ----------------------------
DROP TABLE IF EXISTS `sys_banner`;
CREATE TABLE `sys_banner`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT,
    `banner_img_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'banner图片url',
    `banner_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'banner名称',
    `banner_status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态;1-可用，0-不可用',
    `sort_num`       int(11) NULL DEFAULT NULL COMMENT '排序号,越小越靠前',
    `create_time`    datetime NULL DEFAULT NULL,
    `update_time`    datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统banner表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_banner
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `dict_type`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
    `dict_label`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典标签',
    `dict_value`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典键值',
    `sort_num`    int(20) NULL DEFAULT 0 COMMENT '排序字段',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 305 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, '1', '国有土地所有权', '10', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (2, '1', '集体土地所有权', '30', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (3, '1', '村民小组', '31', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (4, '1', '村级集体经济组织', '32', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (5, '1', '乡级集体经济组织', '33', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (6, '1', '其他农民集体经济组织', '34', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (7, '2', '承包地块', '10', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (8, '2', '自留地', '21', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (9, '2', '机动地', '22', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (10, '2', '开荒地', '23', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (11, '2', '其他集体土地', '99', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (12, '3', '一等地', '01', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (13, '3', '二等地', '02', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (14, '3', '三等地', '03', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (15, '3', '四等地', '04', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (16, '3', '五等地', '05', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (17, '3', '六等地', '06', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (18, '3', '七等地', '07', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (19, '3', '八等地', '08', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (20, '3', '九等地', '09', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (21, '3', '十等地', '10', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (22, '4', '种植业', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (23, '4', '林业', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (24, '4', '畜牧业', '3', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (25, '4', '渔业', '4', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (26, '4', '非农业用途', '5', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (27, '5', '承包', '100', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (28, '5', '家庭承包', '110', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (29, '5', '其他方式承包', '120', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (30, '5', '招标', '121', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (31, '5', '拍卖', '122', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (32, '5', '公开协商', '123', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (33, '5', '其他方式', '129', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (34, '5', '转让', '200', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (35, '5', '互换', '300', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (36, '5', '其他方式', '900', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (64, '6', '居民身份证', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (65, '6', '军官证', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (66, '6', '行政、企事业单位机构代码证或法人代码证', '3', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (67, '6', '户口簿', '4', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (68, '6', '护照', '5', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (69, '6', '其他证件', '9', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (70, '7', '农户', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (71, '7', '个人', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (72, '7', '单位', '3', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (73, '8', '男', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (74, '8', '女', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (75, '9', '外嫁女', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (76, '9', '入赘男', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (77, '9', '在校大学生', '3', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (78, '9', '国家公职人员', '4', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (79, '9', '军人（军官、士兵）', '5', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (80, '9', '新生儿', '6', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (81, '9', '去世', '7', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (82, '9', '其他备注', '9', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (102, '10', '本人', '01', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (103, '10', '户主', '02', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (104, '10', '配偶', '10', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (105, '10', '夫', '11', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (106, '10', '妻', '12', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (107, '10', '子', '20', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (108, '10', '独生子', '21', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (109, '10', '长子', '22', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (110, '10', '次子', '23', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (111, '10', '三子', '24', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (112, '10', '四子', '25', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (113, '10', '五子', '26', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (114, '10', '养子或继子', '27', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (115, '10', '女婿', '28', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (116, '10', '其他儿子', '29', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (117, '10', '女', '30', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (118, '10', '独生女', '31', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (119, '10', '长女', '32', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (120, '10', '次女', '33', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (121, '10', '三女', '34', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (122, '10', '四女', '35', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (123, '10', '五女', '36', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (124, '10', '养女或继女', '37', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (125, '10', '儿媳', '38', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (126, '10', '其他女儿', '39', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (127, '10', '孙子、孙女、外孙子、外孙女', '40', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (128, '10', '孙子 ', '41', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (129, '10', '孙女', '42', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (130, '10', '外孙子', '43', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (131, '10', '外孙女', '44', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (132, '10', '孙媳妇或外孙媳妇', '45', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (133, '10', '孙女婿或外孙女婿', '46', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (134, '10', '曾孙子或外曾孙子', '47', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (135, '10', '曾孙女或外曾孙女', '48', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (136, '10', '其他孙子、孙女、外孙子、外孙女', '49', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (137, '10', '父母', '50', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (138, '10', '父亲', '51', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (139, '10', '母亲', '52', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (140, '10', '公公', '53', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (141, '10', '婆婆', '54', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (142, '10', '岳父', '55', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (143, '10', '岳母', '56', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (144, '10', '继父或养父', '57', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (145, '10', '继母或养母', '58', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (146, '10', '其他父母关系', '59', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (147, '10', '祖父母 外祖父母', '60', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (148, '10', '祖父', '61', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (149, '10', '祖母', '62', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (150, '10', '外祖父', '63', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (151, '10', '外祖母', '64', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (152, '10', '配偶的祖父母 外祖父母', '65', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (153, '10', '曾祖父', '66', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (154, '10', '曾祖母', '67', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (155, '10', '配偶的曾祖父母 外曾祖父母', '68', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (156, '10', '其他祖父母或外租父母关系', '69', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (157, '10', '兄、弟、姐、妹', '70', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (158, '10', '兄', '71', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (159, '10', '嫂', '72', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (160, '10', '弟', '73', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (161, '10', '弟媳', '74', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (162, '10', '姐姐', '75', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (163, '10', '姐夫', '76', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (164, '10', '妹妹', '77', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (165, '10', '妹夫', '78', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (166, '10', '其他兄弟姐妹', '79', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (167, '10', '其他', '80', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (168, '10', '伯父', '81', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (169, '10', '伯母', '82', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (170, '10', '叔父', '83', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (171, '10', '婶母', '84', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (172, '10', '舅父', '85', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (173, '10', '舅母', '86', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (174, '10', '姨夫', '87', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (175, '10', '姨母', '88', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (176, '10', '姑父', '89', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (177, '10', '姑母', '90', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (178, '10', '堂兄弟、堂姐妹', '91', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (179, '10', '表兄弟、表姐妹', '92', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (180, '10', '侄子', '93', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (181, '10', '侄女', '94', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (182, '10', '外甥', '95', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (183, '10', '外甥女', '96', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (184, '10', '其他亲属', '97', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (186, '10', '非亲属', '99', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (187, '12', '图片', '1', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (188, '12', '视频', '2', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (189, '12', '音频', '3', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (190, '12', '文档', '4', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (191, '12', '其他', '0', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (192, '16', '否', '0', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (193, '16', '是', '1', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (194, '17', '正常', '0', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (195, '17', '已注销', '1', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (196, '18', '草稿', '1', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (197, '18', '待审核', '2', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (198, '18', '已通过', '3', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (199, '18', '被驳回', '4', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (200, '19', '保存草稿', '1', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (201, '19', '提交申请', '2', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (202, '19', '撤回', '3', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (203, '19', '通过', '4', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (204, '19', '驳回', '5', 0, '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_data`
VALUES (205, '20', '已领取', '1', 0, '2022-03-14 10:18:41', NULL);
INSERT INTO `sys_dict_data`
VALUES (206, '20', '未领取', '2', 0, '2022-03-14 10:18:41', NULL);
INSERT INTO `sys_dict_data`
VALUES (207, '11', '初始登记', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (208, '11', '其他方式登记', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (209, '11', '变更户主登记', '7', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (215, '21', '土地承包经营农户消亡', '1', 0, '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (216, '21', '丧失土地承包经营资格', '2', 0, '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (217, '21', '权利人放弃权利', '3', 0, '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (218, '21', '因人民法院、仲裁委员会的生效法律文书等导致土地承包经营权注销', '4', 0, '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (219, '22', '高拍仪', '1', 0, '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (220, '22', '身份证读卡器', '2', 0, '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (221, '22', '打印机', '3', 0, '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (222, '11', '互换登记', '3', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (223, '11', '转让登记', '4', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (224, '11', '分户登记', '5', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (225, '11', '合户登记', '6', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (226, '11', '注销登记', '9', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (227, '23', '未处理', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (228, '23', '待复核', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (229, '23', '待审核', '3', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (230, '23', '审核通过', '5', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (231, '23', '审核驳回', '4', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (232, '24', 'AI识别', '0', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (233, '24', '录入需要复核', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (234, '24', '录入无需复核', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (235, '24', '筛查需要复核', '3', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (236, '24', '筛查无需复核', '4', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (237, '24', '复核', '5', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (238, '24', '审核驳回', '6', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (239, '24', '审核通过', '7', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (240, '24', '重新复核', '8', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (241, '25', '其他', '0', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (242, '25', '建筑物', '1', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (243, '25', '水体', '2', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (244, '25', '林地', '3', 0, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (245, '26', '确权', '1', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (246, '26', '三调', '2', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (247, '26', '两区地块', '3', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (248, '26', '两区片块', '4', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (249, '26', '两区点状物', '5', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (250, '26', '两区标志牌', '6', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (251, '26', '主体', '7', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (252, '26', '主体监管', '8', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (253, '26', '养殖业主体', '9', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (254, '26', '区轮廓', '10', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (255, '26', '轮廓', '11', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (256, '26', '高标准农田', '12', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (257, '26', '影像', '13', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (258, '26', '市轮廓', '14', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (259, '26', '宅基地', '15', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (260, '26', '耕地类别划分', '16', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (261, '26', '耕地质量等级', '17', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (262, '27', 'SF', '施肥', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (263, '27', 'FG', '翻耕', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (264, '27', 'QL', '起垄（整畦）', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (265, '27', 'GG', '灌溉', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (266, '27', 'YY', '用药', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (267, '27', 'ZF', '追肥', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (268, '27', 'TRCZ', '土壤操作', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (269, '27', 'YM', '育苗', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (270, '27', 'CC', '除草', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (271, '27', 'QZ', '浸种', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (272, '27', 'YZ', '移栽', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (273, '27', 'BZ', '拌种', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (274, '27', 'BZ', '播种', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (275, '27', 'CS', '采收', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (276, '27', 'FM', '覆膜', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (277, '28', '待接受', '1', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (278, '28', '关闭', '2', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (279, '28', '仓储处理中', '3', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (280, '28', '待执行', '4', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (281, '28', '执行完毕', '5', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (282, '28', '完成', '6', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (283, '28', '待处理', '11', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (284, '28', '已处理', '12', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (285, '28', '待出库', '21', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (286, '28', '已出库', '22', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (287, '29', '创建', '1', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (288, '29', '修改', '2', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (289, '29', '撤回', '3', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (290, '29', '拒绝', '4', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (291, '29', '删除', '5', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (292, '29', '接受', '6', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (293, '29', '出库完成', '7', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (294, '29', '领用完成', '8', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (295, '29', '提交任务信息', '9', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (296, '29', '确认完成', '10', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (297, '29', '领用', '11', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (298, '29', '删除农机出入记录', '12', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (299, '29', '出库', '21', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (300, '29', '删除农资出入库记录', '22', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (301, '27', 'KSYZ', '开始养殖', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (302, '27', 'CL', '出栏', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (303, '27', 'TM', '投苗', 0, '2022-07-05 10:48:42', NULL);
INSERT INTO `sys_dict_data`
VALUES (304, '27', 'BL', '捕捞', 0, '2022-07-05 10:48:42', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `dict_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名称',
    `dict_type`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_dict_type`(`dict_type`) USING BTREE COMMENT '字典类型唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '所有权性质', '1', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (2, '地块类别', '2', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (3, '地力等级', '3', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (4, '土地用途', '4', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (5, '承包经营权取得方式', '5', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (6, '证件类型', '6', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (7, '承包方类型', '7', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (8, '性别', '8', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (9, '成员备注', '9', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (10, '与户主关系', '10', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (11, '登记类型', '11', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (12, '文件类型', '12', '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_type`
VALUES (13, '是否生成登记簿', '16', '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_type`
VALUES (14, '承包状态', '17', '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_type`
VALUES (15, '审核流程状态', '18', '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_type`
VALUES (16, '流程行为历史状态', '19', '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_type`
VALUES (17, '承包权证是否领取', '20', '2022-03-14 10:18:41', NULL);
INSERT INTO `sys_dict_type`
VALUES (18, '注销登记类型', '21', '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_type`
VALUES (19, '外设类型', '22', '2022-05-09 10:48:42', NULL);
INSERT INTO `sys_dict_type`
VALUES (21, '耕地占用物状态', '23', '2022-03-04 15:20:11', NULL);
INSERT INTO `sys_dict_type`
VALUES (22, '耕地占用物行为历史状态', '24', '2022-03-14 10:18:41', NULL);
INSERT INTO `sys_dict_type`
VALUES (23, '耕地占用物类型', '25', '2022-03-14 10:18:41', NULL);
INSERT INTO `sys_dict_type`
VALUES (24, 'gis服务类型', '26', '2022-03-14 10:18:41', NULL);
INSERT INTO `sys_dict_type`
VALUES (25, '农事任务代码', '27', '2022-03-14 10:18:41', NULL);
INSERT INTO `sys_dict_type`
VALUES (26, '农事任务状态', '28', '2022-03-14 10:18:41', NULL);
INSERT INTO `sys_dict_type`
VALUES (27, '农事任务动作', '29', '2022-03-14 10:18:41', NULL);

-- ----------------------------
-- Table structure for tbl_area_local
-- ----------------------------
DROP TABLE IF EXISTS `tbl_area_local`;
CREATE TABLE `tbl_area_local`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '镇id，自增',
    `parent_id`          bigint(20) NULL DEFAULT NULL COMMENT '父级id,level为4，对应的是区域id；level为5，对应的是镇id',
    `name`               varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '镇/村名称',
    `sort_num`           int(11) NULL DEFAULT NULL COMMENT '排序字段，数字越小越靠前',
    `level`              int(11) NULL DEFAULT NULL COMMENT '等级 4：镇  5：村',
    `create_time`        datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime NULL DEFAULT NULL COMMENT '更新时间',
    `county_center_lat`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域中心点维度值',
    `county_center_lng`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域中心点经度值',
    `sh_town_center_lat` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上海镇中心点维度值',
    `sh_town_center_lng` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上海镇中心点经度值',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2001015 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地方区域表（镇村）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_area_local
-- ----------------------------
INSERT INTO `tbl_area_local`
VALUES (1000001, 310112, '浦江镇', NULL, 4, '2020-11-11 18:26:30', '2020-11-11 18:26:30', '31.071693012304394', '121.41592563798372', '31.039228747678962',
        '121.51928563637303');
INSERT INTO `tbl_area_local`
VALUES (1000002, 310112, '马桥镇', NULL, 4, '2020-11-11 18:26:30', '2020-11-11 18:26:30', '31.071693012304394', '121.41592563798372', '31.021964863771046',
        '121.33703705828128');
INSERT INTO `tbl_area_local`
VALUES (1000003, 310112, '浦锦街道', NULL, 4, '2020-11-11 18:26:30', '2020-11-11 18:26:30', '31.071693012304394', '121.41592563798372',
        '31.09425904329376', '121.47710609202937');
INSERT INTO `tbl_area_local`
VALUES (1000004, 310112, '吴泾镇', NULL, 4, '2020-11-11 18:26:30', '2020-11-11 18:26:30', '31.071693012304394', '121.41592563798372', '31.047910471516417',
        '121.45599174266414');
INSERT INTO `tbl_area_local`
VALUES (1000005, 310112, '颛桥镇', NULL, 4, '2020-11-11 18:26:30', '2020-11-11 18:26:30', '31.071693012304394', '121.41592563798372', '31.05306031282501',
        '121.40912818675594');
INSERT INTO `tbl_area_local`
VALUES (1000006, 310112, '华漕镇', NULL, 4, '2020-11-11 18:26:30', '2020-11-11 18:26:30', '31.071693012304394', '121.41592563798372', '31.238953136864808',
        '121.27392959660551');
INSERT INTO `tbl_area_local`
VALUES (1000007, 310112, '梅陇镇', NULL, 4, '2020-11-11 18:26:30', '2020-11-11 18:26:30', '31.071693012304394', '121.41592563798372', '31.10525634443121',
        '121.41723248972266');
INSERT INTO `tbl_area_local`
VALUES (1000008, 310112, '七宝镇', NULL, 4, '2020-11-11 18:26:30', '2020-11-11 18:26:30', '31.071693012304394', '121.41592563798372', '31.293348948610245',
        '121.42594243778038');
INSERT INTO `tbl_area_local`
VALUES (1000009, 310116, '枫泾镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017', '30.88208777945465',
        '121.05408131927743');
INSERT INTO `tbl_area_local`
VALUES (1000010, 310116, '漕泾镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017', '30.80621345084137',
        '121.39397084564462');
INSERT INTO `tbl_area_local`
VALUES (1000011, 310116, '金山工业区', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017',
        '30.844322276524963', '121.33629262298837');
INSERT INTO `tbl_area_local`
VALUES (1000012, 310116, '金山卫镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017',
        '30.767074656896057', '121.2944072470118');
INSERT INTO `tbl_area_local`
VALUES (1000013, 310116, '廊下镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017', '30.8189163927359',
        '121.1457484945704');
INSERT INTO `tbl_area_local`
VALUES (1000014, 310116, '吕巷镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017', '30.852562022618713',
        '121.24016225189462');
INSERT INTO `tbl_area_local`
VALUES (1000015, 310116, '山阳镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017', '30.77631175668901',
        '121.37191863239462');
INSERT INTO `tbl_area_local`
VALUES (1000016, 310116, '张堰镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017', '30.806180836278855',
        '121.27098174274619');
INSERT INTO `tbl_area_local`
VALUES (1000017, 310116, '朱泾镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017', '30.89922130258745',
        '121.19098754108603');
INSERT INTO `tbl_area_local`
VALUES (1000018, 310116, '亭林镇', NULL, 4, '2020-11-13 11:42:50', '2020-11-13 11:42:50', '30.876797259312582', '121.25748518818017', '30.888578297216355',
        '121.238709403879');
INSERT INTO `tbl_area_local`
VALUES (1000019, 310230, '新村乡', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.81181510378326', '121.38512063233208');
INSERT INTO `tbl_area_local`
VALUES (1000020, 310230, '绿华镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.750703653587948', '121.21929574219536');
INSERT INTO `tbl_area_local`
VALUES (1000021, 310230, '长兴镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.420477068479556', '121.65778929825007');
INSERT INTO `tbl_area_local`
VALUES (1000022, 310230, '陈家镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.53720680480768', '121.79992491836725');
INSERT INTO `tbl_area_local`
VALUES (1000023, 310230, '城桥镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.634710466917056', '121.45042235489069');
INSERT INTO `tbl_area_local`
VALUES (1000024, 310230, '三星镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.763777831380423', '121.2991331064415');
INSERT INTO `tbl_area_local`
VALUES (1000025, 310230, '中兴镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.547555842627986', '121.77593855864853');
INSERT INTO `tbl_area_local`
VALUES (1000026, 310230, '港西镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.700495545646532', '121.40574788637502');
INSERT INTO `tbl_area_local`
VALUES (1000027, 310230, '横沙乡', NULL, 4, NULL, '2021-06-18 09:52:47', NULL, NULL, '31.345807013233955', '121.8389059479181');
INSERT INTO `tbl_area_local`
VALUES (1000028, 310230, '庙镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.720715460499576', '121.35138763737122');
INSERT INTO `tbl_area_local`
VALUES (1000029, 310230, '新河镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.6067323062027', '121.50244964908997');
INSERT INTO `tbl_area_local`
VALUES (1000030, 310230, '建设镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.65896452759526', '121.46589352703916');
INSERT INTO `tbl_area_local`
VALUES (1000031, 310230, '堡镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.548267542224636', '121.6447482715626');
INSERT INTO `tbl_area_local`
VALUES (1000032, 310230, '港沿镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.599550919698288', '121.6876164115157');
INSERT INTO `tbl_area_local`
VALUES (1000033, 310230, '竖新镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.583071427510788', '121.5667668021407');
INSERT INTO `tbl_area_local`
VALUES (1000034, 310230, '向化镇', NULL, 4, NULL, NULL, '31.538672836536282', '121.77009185285468', '31.56177513055586', '121.75228941885825');
INSERT INTO `tbl_area_local`
VALUES (1000035, 310230, '旅投公司', NULL, 4, NULL, '2021-07-12 12:27:18', NULL, NULL, '31.7387507745821', '121.25053998097428');
INSERT INTO `tbl_area_local`
VALUES (1000036, 310120, '奉城镇', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.93079419306548', '121.65144691836724');
INSERT INTO `tbl_area_local`
VALUES (1000037, 310120, '海湾旅游区', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.859673027396042', '121.5154839384532');
INSERT INTO `tbl_area_local`
VALUES (1000038, 310120, '海湾镇', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.874779228567917', '121.60680779099226');
INSERT INTO `tbl_area_local`
VALUES (1000039, 310120, '金汇镇', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.985995467081096', '121.52167793614848');
INSERT INTO `tbl_area_local`
VALUES (1000040, 310120, '南桥镇', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.86767531480885', '121.45051430542975');
INSERT INTO `tbl_area_local`
VALUES (1000041, 310120, '青村镇', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.911620633529793', '121.54939125855475');
INSERT INTO `tbl_area_local`
VALUES (1000042, 310120, '四团镇', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.93119003017503', '121.73959206421881');
INSERT INTO `tbl_area_local`
VALUES (1000043, 310120, '头桥集团', NULL, 4, NULL, '2021-12-15 13:41:11', NULL, NULL, '30.971702123894403', '121.65822457154303');
INSERT INTO `tbl_area_local`
VALUES (1000044, 310120, '西渡街道', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.991614834207695', '121.4587540515235');
INSERT INTO `tbl_area_local`
VALUES (1000045, 310120, '柘林镇', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.855971382582652', '121.4601968201797');
INSERT INTO `tbl_area_local`
VALUES (1000046, 310120, '庄行镇', NULL, 4, NULL, NULL, '30.98260545641088', '121.45383299630305', '30.930969977943732', '121.38580719049224');
INSERT INTO `tbl_area_local`
VALUES (1000047, 310114, '南翔镇', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.324628308827016', '121.30342922860945');
INSERT INTO `tbl_area_local`
VALUES (1000048, 310114, '徐行镇', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.428655105879955', '121.29896603280866');
INSERT INTO `tbl_area_local`
VALUES (1000049, 310114, '马陆镇', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.377278039500254', '121.30516291965631');
INSERT INTO `tbl_area_local`
VALUES (1000050, 310114, '华亭镇', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.468945214793223', '121.26774073948053');
INSERT INTO `tbl_area_local`
VALUES (1000051, 310114, '外冈镇', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.37659139399244', '121.17710353244928');
INSERT INTO `tbl_area_local`
VALUES (1000052, 310114, '工业区', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.413792524349304', '121.17824240278134');
INSERT INTO `tbl_area_local`
VALUES (1000053, 310114, '安亭镇', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.30255598089647', '121.22287436078915');
INSERT INTO `tbl_area_local`
VALUES (1000054, 310114, '菊园新区', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.363931648260632', '121.20923873130477');
INSERT INTO `tbl_area_local`
VALUES (1000055, 310114, '江桥镇', NULL, 4, NULL, NULL, '31.38911844427517', '121.30463656000006', '31.2791309228071', '121.28030654136336');
INSERT INTO `tbl_area_local`
VALUES (1000056, 310117, '车墩', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '30.991045253000806', '121.26462795895713');
INSERT INTO `tbl_area_local`
VALUES (1000057, 310117, '永丰街道', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '30.985895411692212', '121.21724941891807');
INSERT INTO `tbl_area_local`
VALUES (1000058, 310117, '佘山镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '31.08851813350543', '121.16563674155867');
INSERT INTO `tbl_area_local`
VALUES (1000059, 310117, '叶榭镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '30.935005636782762', '121.30611498974224');
INSERT INTO `tbl_area_local`
VALUES (1000060, 310117, '新浜镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '30.942902060122606', '121.06475909374615');
INSERT INTO `tbl_area_local`
VALUES (1000061, 310117, '泖港镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '30.948738546939012', '121.16260607860943');
INSERT INTO `tbl_area_local`
VALUES (1000062, 310117, '石湖荡', NULL, 4, NULL, NULL, '31.062375022132272', '121.1822013363606', '30.99408180554029', '121.16205831093357');
INSERT INTO `tbl_area_local`
VALUES (1000063, 310117, '洞泾镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '31.088052507286676', '121.24049832280474');
INSERT INTO `tbl_area_local`
VALUES (1000064, 310117, '泗泾镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '31.1168916186148', '121.2875335400899');
INSERT INTO `tbl_area_local`
VALUES (1000065, 310117, '新桥镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '31.084619279747614', '121.31328274663286');
INSERT INTO `tbl_area_local`
VALUES (1000066, 310117, '小昆山镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '31.042968328189033', '121.10954055794542');
INSERT INTO `tbl_area_local`
VALUES (1000067, 310117, '经开区镇', NULL, 4, NULL, NULL, '31.062375022132272', '121.18220133636066', '31.056952463594104', '121.31823911010696');
INSERT INTO `tbl_area_local`
VALUES (1000068, 310113, '罗店镇', NULL, 4, NULL, NULL, '31.42763684145129', '121.37726137093864', '31.425681101289417', '121.36836423217727');
INSERT INTO `tbl_area_local`
VALUES (1000069, 310113, '罗泾镇', NULL, 4, NULL, NULL, '31.42763684145129', '121.37726137093864', '31.476836191621448', '121.33986844360305');
INSERT INTO `tbl_area_local`
VALUES (1000070, 310113, '月浦镇', NULL, 4, NULL, NULL, '31.42763684145129', '121.37726137093864', '31.421217905488636', '121.4334238940425');
INSERT INTO `tbl_area_local`
VALUES (1000071, 310113, '顾村镇', NULL, 4, NULL, NULL, '31.42763684145129', '121.37726137093864', '31.369033014044504', '121.38213436241023');
INSERT INTO `tbl_area_local`
VALUES (1000074, 310118, '白鹤镇', NULL, 4, '2020-12-31 12:10:08', '2020-12-31 12:10:08', '31.214849197008732', '121.14387573041807', '31.255693744016853',
        '121.10094686073826 ');
INSERT INTO `tbl_area_local`
VALUES (1000075, 310118, '夏阳街道', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.12429135271637', '121.11470634743756 ');
INSERT INTO `tbl_area_local`
VALUES (1000076, 310118, '金泽镇', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.056859884323302', '120.99631839857034');
INSERT INTO `tbl_area_local`
VALUES (1000077, 310118, '香花桥', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.19230627580228', '121.13234303037893 ');
INSERT INTO `tbl_area_local`
VALUES (1000078, 310118, '练塘镇', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '30.992708514524665', '121.04876180214451 ');
INSERT INTO `tbl_area_local`
VALUES (1000079, 310118, '重固镇', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.23028786022779', '121.16480489296482 ');
INSERT INTO `tbl_area_local`
VALUES (1000080, 310118, '朱家角', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.098081241595253', '121.08239728312509 ');
INSERT INTO `tbl_area_local`
VALUES (1000081, 310118, '华新镇', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.214810977923378', '121.22212964396493 ');
INSERT INTO `tbl_area_local`
VALUES (1000082, 310118, '盈浦街道', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.16649542962577', '121.07637072373637 ');
INSERT INTO `tbl_area_local`
VALUES (1000083, 310118, '农业园区', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '30.95911717540355', '120.98894604294247 ');
INSERT INTO `tbl_area_local`
VALUES (1000084, 310118, '徐泾镇', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.150226464759328', '121.26850465446881 ');
INSERT INTO `tbl_area_local`
VALUES (1000085, 310118, '赵巷镇', NULL, 4, NULL, NULL, '31.214849197008732', '121.14387573041807', '31.172199121009328', '121.20910981804303 ');
INSERT INTO `tbl_area_local`
VALUES (1000086, 310230, '农业园区', NULL, 4, '2021-04-02 10:01:26', '2021-07-12 10:08:10', NULL, NULL, '31.589458976628947', '121.8376923814796');
INSERT INTO `tbl_area_local`
VALUES (1000087, 310230, '东平镇', NULL, 4, '2021-04-02 11:04:04', '2021-07-12 10:16:59', NULL, NULL, '31.67381985874959', '121.53215046986588');
INSERT INTO `tbl_area_local`
VALUES (1000088, 310117, '方松街道', NULL, 4, '2021-05-11 16:18:08', '2021-07-12 10:54:58', NULL, NULL, '31.04042779134261', '121.21887597811497');
INSERT INTO `tbl_area_local`
VALUES (1000089, 310117, '广富林街道', NULL, 4, '2021-06-10 13:49:28', '2021-07-12 10:51:51', NULL, NULL, '31.06179116386332', '121.18164414575398');
INSERT INTO `tbl_area_local`
VALUES (1000090, 310230, '新海镇', NULL, 4, '2021-07-15 11:15:03', '2021-07-15 11:15:03', NULL, NULL, '31.818614314390388', '121.28739613953053');
INSERT INTO `tbl_area_local`
VALUES (1000091, 510603, '和新镇', NULL, 4, '2021-09-17 15:59:55', '2021-09-17 18:08:16', NULL, NULL, '31.0511939573', '104.4734210283');
INSERT INTO `tbl_area_local`
VALUES (1000092, 510603, '双东镇', NULL, 4, '2021-09-17 16:01:19', '2021-09-17 18:10:06', NULL, NULL, '31.1712837633', '104.4857180969');
INSERT INTO `tbl_area_local`
VALUES (1000093, 510603, '新中镇', NULL, 4, '2021-09-17 16:05:49', '2021-09-17 18:10:42', NULL, NULL, '31.1227307855', '104.5350103092');
INSERT INTO `tbl_area_local`
VALUES (1000094, 510603, '孝感街道', NULL, 4, '2021-09-17 16:06:57', '2021-09-17 18:12:40', NULL, NULL, '31.1227307855', '104.5350103092');
INSERT INTO `tbl_area_local`
VALUES (1000095, 510603, '黄许镇', NULL, 4, '2021-09-17 16:11:59', '2021-09-17 18:13:31', NULL, NULL, '31.2322670872', '104.4143341435');
INSERT INTO `tbl_area_local`
VALUES (1000096, 510603, '东湖街道', NULL, 4, '2021-09-17 16:16:37', '2021-09-17 18:15:00', NULL, NULL, '31.2322670872', '104.4143341435');
INSERT INTO `tbl_area_local`
VALUES (1000097, 510603, '德新镇', NULL, 4, '2021-09-17 16:23:55', '2021-09-17 18:15:30', NULL, NULL, '31.2479827586', '104.3610945754');
INSERT INTO `tbl_area_local`
VALUES (1000098, 510603, '天元街道', NULL, 4, '2021-09-17 16:25:23', '2021-09-17 18:16:25', NULL, NULL, '31.1284093202', '104.3353541865');
INSERT INTO `tbl_area_local`
VALUES (1000099, 510603, '柏隆镇', NULL, 4, '2021-09-17 16:28:18', '2021-09-17 18:17:11', NULL, NULL, '31.2986855871', '104.3328771779');
INSERT INTO `tbl_area_local`
VALUES (1000100, 510603, '旌阳街道', NULL, 4, '2021-09-17 16:29:18', '2021-09-17 18:18:01', NULL, NULL, '31.1310368375', '104.3937099411');
INSERT INTO `tbl_area_local`
VALUES (1000101, 510603, '孝泉镇', NULL, 4, '2021-09-17 16:32:09', '2021-09-17 18:18:38', NULL, NULL, '31.2421095784', '104.2817706098');
INSERT INTO `tbl_area_local`
VALUES (1000102, 510603, '旌东街道', NULL, 4, '2021-09-17 16:33:33', '2021-09-17 18:19:33', NULL, NULL, '31.1134156620', '104.4175533558');
INSERT INTO `tbl_area_local`
VALUES (1000103, 510603, '八角井街道', NULL, 4, '2021-09-17 16:34:33', '2021-09-17 18:20:16', NULL, NULL, '31.0659847292', '104.3888663962');
INSERT INTO `tbl_area_local`
VALUES (1000104, 310115, '航头镇', NULL, 4, '2021-12-27 15:04:00', '2021-12-27 15:04:00', '31.214849197008732', '121.14387573041807', '', '');
INSERT INTO `tbl_area_local`
VALUES (1000105, 310115, '合庆镇', NULL, 4, '2021-11-15 09:37:09', '2021-11-15 09:37:09', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000106, 310115, '惠南镇', NULL, 4, '2021-11-15 09:37:20', '2021-11-15 09:37:20', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000107, 310115, '康桥镇', NULL, 4, '2021-11-15 09:37:31', '2021-11-15 09:37:31', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000108, 310115, '老港镇', NULL, 4, '2021-11-15 09:37:40', '2021-11-15 09:37:40', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000109, 310115, '南汇新城镇', NULL, 4, '2021-11-15 09:37:56', '2021-11-15 09:37:56', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000110, 310115, '泥城镇', NULL, 4, '2021-11-15 09:38:07', '2021-11-15 09:38:07', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000112, 310115, '曹路镇', NULL, 4, '2021-11-15 09:54:59', '2021-11-15 09:54:59', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000113, 310115, '川沙新镇', NULL, 4, '2021-11-15 09:55:11', '2021-11-15 09:55:11', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000114, 310115, '大团镇', NULL, 4, '2021-11-15 09:55:19', '2021-11-15 09:55:19', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000115, 310115, '高东镇', NULL, 4, '2021-11-15 09:55:31', '2021-11-15 09:55:31', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000116, 310115, '高桥镇', NULL, 4, '2021-11-15 09:55:43', '2021-11-15 09:55:43', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000117, 310115, '宣桥镇', NULL, 4, '2021-11-15 10:07:48', '2021-11-15 10:16:08', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000118, 310115, '万祥镇', NULL, 4, '2021-11-15 10:25:58', '2021-11-15 10:25:58', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000119, 310115, '新场镇', NULL, 4, '2021-11-15 10:43:59', '2021-11-15 10:43:59', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000121, 310115, '书院镇', NULL, 4, '2021-11-16 08:58:47', '2021-11-16 08:58:47', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000122, 310115, '唐镇', NULL, 4, '2021-11-16 09:01:46', '2021-11-16 09:01:46', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000123, 310115, '张江镇', NULL, 4, '2021-11-16 09:34:11', '2021-11-16 09:34:11', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000124, 310115, '周浦镇', NULL, 4, '2021-11-16 09:36:35', '2021-11-16 09:36:35', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000125, 310115, '祝桥镇', NULL, 4, '2021-11-16 09:37:14', '2021-11-16 09:37:14', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000126, 371102, '测试镇1', NULL, 4, '2022-01-19 17:28:51', '2022-01-19 17:28:51', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000127, 371102, '测试镇2', NULL, 4, '2022-01-19 17:28:58', '2022-01-19 17:28:58', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000128, 340104, '测试镇1', NULL, 4, '2022-01-20 15:44:35', '2022-01-20 15:44:35', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000129, 340104, '测试镇2', NULL, 4, '2022-01-20 15:44:52', '2022-01-20 15:44:52', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (1000130, 0, 'string', NULL, 4, '2022-05-27 10:26:36', '2022-05-27 10:26:36', NULL, NULL, 'string', 'string');
INSERT INTO `tbl_area_local`
VALUES (1000135, 361102, '水南街道', NULL, 4, '2022-06-14 15:34:04', '2022-06-14 15:34:04', NULL, NULL, '28.4297517661', '117.9649957718');
INSERT INTO `tbl_area_local`
VALUES (1000136, 361102, '东市街道', NULL, 4, '2022-06-14 15:35:03', '2022-06-14 15:35:03', NULL, NULL, '28.4559600219', '117.9810482295');
INSERT INTO `tbl_area_local`
VALUES (1000137, 361102, '西市街道', NULL, 4, '2022-06-14 15:35:34', '2022-06-14 15:35:34', NULL, NULL, '28.4570891956', '117.9601123411');
INSERT INTO `tbl_area_local`
VALUES (1000138, 361102, '北门街道', NULL, 4, '2022-06-14 15:36:12', '2022-06-14 15:36:12', NULL, NULL, '28.4551693438', '117.9726140233');
INSERT INTO `tbl_area_local`
VALUES (1000139, 361102, '茅家岭街道', NULL, 4, '2022-06-14 15:36:41', '2022-06-14 15:36:41', NULL, NULL, '28.4225304631', '117.9617498834');
INSERT INTO `tbl_area_local`
VALUES (1000140, 361102, '灵溪镇', NULL, 4, '2022-06-14 15:37:12', '2022-06-14 15:37:12', NULL, NULL, '28.4937107052', '118.0471630552');
INSERT INTO `tbl_area_local`
VALUES (1000141, 361102, '沙溪镇', NULL, 4, '2022-06-14 15:37:41', '2022-06-14 15:37:41', NULL, NULL, '28.5713621774', '118.1045970466');
INSERT INTO `tbl_area_local`
VALUES (1000142, 361102, '秦峰镇', NULL, 4, '2022-06-14 15:38:13', '2022-06-14 15:38:13', NULL, NULL, '28.5305197589', '118.1169359178');
INSERT INTO `tbl_area_local`
VALUES (1000143, 361102, '朝阳镇', NULL, 4, '2022-06-14 15:38:43', '2022-06-14 15:38:43', NULL, NULL, '28.4143551775', '118.0158318074');
INSERT INTO `tbl_area_local`
VALUES (2000001, 1000001, '东风村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000002, 1000001, '革新村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000003, 1000001, '北徐村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000004, 1000001, '汇北村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000005, 1000001, '光继村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000006, 1000001, '汇东村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000007, 1000001, '汇红村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000008, 1000001, '汇中村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000009, 1000001, '汇南村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000010, 1000001, '建东村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000011, 1000001, '建中村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000012, 1000001, '建新村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000013, 1000001, '联民村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000014, 1000001, '联胜村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000015, 1000001, '立民村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000016, 1000001, '勤劳村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000017, 1000001, '苏民村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000018, 1000001, '联星村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000019, 1000001, '永丰村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000020, 1000001, '新风村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000021, 1000001, '先进村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000022, 1000001, '张行村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000023, 1000001, '永胜村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000024, 1000001, '跃进村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000025, 1000001, '镇北村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000026, 1000001, '正义村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000027, 1000001, '胜利村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000028, 1000001, '永建村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000029, 1000001, '汇西村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000030, 1000001, '知新村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000031, 1000001, '永新村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000032, 1000002, '民主村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000033, 1000002, '彭渡村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000034, 1000002, '金星村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000035, 1000002, '吴会村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000036, 1000002, '同心村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000037, 1000003, '丁连村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000038, 1000003, '近浦村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000039, 1000003, '芦胜村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000040, 1000003, '跃农村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000041, 1000003, '塘口村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000042, 1000003, '浦江村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000043, 1000003, '勤俭村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000044, 1000004, '星火村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000045, 1000004, '友爱村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000046, 1000004, '共和村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000047, 1000004, '和平村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000048, 1000004, '新建村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000049, 1000004, '塘湾村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000050, 1000005, '光明村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000051, 1000005, '向阳村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000052, 1000005, '灯塔村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000053, 1000006, '纪王村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000054, 1000006, '纪东村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000055, 1000006, '红卫村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000056, 1000006, '纪西村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000057, 1000006, '鹫山村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000058, 1000006, '卫星村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000059, 1000006, '赵家村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000060, 1000007, '许泾村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000061, 1000008, '联明村', NULL, 5, '2020-11-11 18:26:30', '2020-11-11 18:26:30', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000062, 1000019, '新浜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000063, 1000019, '新乐村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000064, 1000019, '新国村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000065, 1000019, '新卫村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000066, 1000019, '新庄村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000067, 1000019, '新洲村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000068, 1000019, '新中村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000069, 1000020, '绿港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000070, 1000020, '绿园村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000071, 1000020, '华西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000072, 1000020, '绿湖村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000073, 1000020, '东安村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000074, 1000020, '邻江村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000075, 1000020, '育新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000076, 1000020, '育新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000077, 1000021, '先丰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000078, 1000021, '北兴村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000079, 1000021, '丰产村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000080, 1000021, '庆丰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000081, 1000021, '石沙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000082, 1000021, '潘石村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000083, 1000021, '长征村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000084, 1000021, '长明村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000085, 1000021, '建新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000086, 1000021, '红星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000087, 1000021, '兴胜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000088, 1000021, '永胜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000089, 1000021, '公平村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000090, 1000021, '民东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000091, 1000021, '惠丰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000092, 1000021, '兴隆村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000093, 1000021, '增产村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000094, 1000021, '东兴村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000095, 1000021, '丰乐村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000096, 1000022, '陈西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000097, 1000022, '八滧村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000098, 1000022, '瀛东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000099, 1000023, '长兴村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000100, 1000023, '马桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000101, 1000023, '元六村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000102, 1000023, '聚训村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000103, 1000023, '侯南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000104, 1000023, '利民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000105, 1000024, '育德村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000106, 1000024, '东安村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000107, 1000024, '海中海', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000108, 1000024, '邻江村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000109, 1000024, '永安村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000110, 1000024, '洪海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000111, 1000024, '南桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000112, 1000024, '大平村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000113, 1000024, '育新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000114, 1000024, '海滨村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000115, 1000024, '平安村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000116, 1000024, '纯阳村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000117, 1000025, '富圩村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000118, 1000025, '北港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000119, 1000025, '北兴村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000120, 1000026, '团结村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000121, 1000026, '北双村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000122, 1000026, '双津村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000123, 1000026, '协西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000124, 1000026, '盘西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000125, 1000026, '静南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000126, 1000026, '协北村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000127, 1000027, '丰乐村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000128, 1000027, '江海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000129, 1000027, '新永村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000130, 1000027, '民星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000131, 1000027, '民永村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000132, 1000027, '增产村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000133, 1000027, '民生村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000134, 1000027, '永发村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000135, 1000028, '保东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000136, 1000028, '保安村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000137, 1000028, '万北村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000138, 1000028, '民华村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000139, 1000028, '窑桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000140, 1000028, '庙港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000141, 1000028, '庙南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000142, 1000028, '米洪村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000143, 1000028, '周河村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000144, 1000028, '南星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000145, 1000028, '猛东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000146, 1000028, '小竖村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000147, 1000028, '和平村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000148, 1000028, '庙中村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000149, 1000028, '庙西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000150, 1000028, '永乐村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000151, 1000028, '万安村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000152, 1000028, '白港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000153, 1000028, '鸽龙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000154, 1000028, '启瀛村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000155, 1000029, '民生村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000156, 1000029, '强民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000157, 1000029, '群英村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000158, 1000029, '新光村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000159, 1000029, '天新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000160, 1000029, '金桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000161, 1000029, '新建村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000162, 1000029, '民建村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000163, 1000030, '盘西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000164, 1000030, '蟠南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000165, 1000030, '浜东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000166, 1000030, '界东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000167, 1000030, '效东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000168, 1000030, '白钥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000169, 1000030, '大同村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000170, 1000030, '浜西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000171, 1000030, '运南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000172, 1000030, '三星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000173, 1000030, '建设村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000174, 1000030, '建垦村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000175, 1000030, '虹桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000176, 1000031, '桃源村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000177, 1000031, '小漾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000178, 1000031, '彷徨村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000179, 1000031, '堡北村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000180, 1000031, '米行村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000181, 1000031, '财贸村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000182, 1000031, '花园村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000183, 1000031, '营房村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000184, 1000031, '四滧村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000185, 1000031, '五滧村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000186, 1000031, '永和村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000187, 1000031, '堡港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000188, 1000031, '瀛南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000189, 1000031, '南海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000190, 1000031, '堡闸村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000191, 1000032, '惠军村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000192, 1000032, '富国村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000193, 1000032, '建中村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000194, 1000032, '骏马村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000195, 1000032, '梅园村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000196, 1000032, '跃马村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000197, 1000032, '齐成村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000198, 1000032, '惠中村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000199, 1000032, '富强村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000200, 1000032, '合兴村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000201, 1000032, '合东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000202, 1000032, '同心村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000203, 1000032, '港沿村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000204, 1000032, '齐力村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000205, 1000032, '园艺村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000206, 1000032, '鲁东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000207, 1000033, '响哃村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000208, 1000033, '椿南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000209, 1000033, '堡西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000210, 1000033, '大东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000211, 1000033, '春风村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000212, 1000033, '跃进村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000213, 1000033, '竖西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000214, 1000033, '竖南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000215, 1000033, '竖河村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000216, 1000033, '明强村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000217, 1000033, '大椿村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000218, 1000033, '油桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000219, 1000033, '永兴村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000220, 1000033, '前卫村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000221, 1000033, '前哨村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000222, 1000033, '永丰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000223, 1000033, '仙桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000224, 1000033, '时桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000225, 1000033, '响同村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000226, 1000034, '卫星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000228, 1000036, '永民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000229, 1000036, '洪北村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000230, 1000036, '大门村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000231, 1000036, '奉城村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000232, 1000036, '久茂村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000233, 1000036, '路口村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000234, 1000036, '城东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000235, 1000036, '朱墩村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000236, 1000036, '联民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000237, 1000036, '洪东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000238, 1000036, '爱民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000239, 1000036, '新民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000240, 1000036, '东门村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000241, 1000036, '洪西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000242, 1000036, '盐行村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000243, 1000036, '北门村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000244, 1000036, '陈桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000245, 1000036, '朱新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000246, 1000036, '白衣聚村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000247, 1000036, '洪庙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000248, 1000036, '协新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000249, 1000036, '灯民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000250, 1000036, '八字村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000251, 1000036, '集贤村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000252, 1000036, '护民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000253, 1000036, '洪南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000254, 1000036, '高桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000255, 1000036, '塘外村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000256, 1000036, '南街村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000257, 1000036, '卫季村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000258, 1000037, '新港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000260, 1000039, '金汇村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000261, 1000039, '金星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000262, 1000039, '东星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000263, 1000039, '新强村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000264, 1000039, '南行村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000265, 1000039, '百曲村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000266, 1000039, '白沙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000267, 1000039, '行前村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000268, 1000039, '明星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000269, 1000039, '光辉村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000270, 1000039, '南陈村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000271, 1000039, '乐善村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000272, 1000039, '北丁村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000273, 1000039, '梅园村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000274, 1000039, '资福村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000275, 1000039, '梁典村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000276, 1000039, '周家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000277, 1000039, '墩头村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000278, 1000040, '江海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000279, 1000040, '六墩村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000280, 1000040, '吴塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000281, 1000040, '杨王村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000282, 1000040, '华严村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000283, 1000040, '灵芝村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000284, 1000040, '沈陆村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000285, 1000041, '申隆二村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000286, 1000041, '陶宅村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000287, 1000041, '姚家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000288, 1000041, '元通村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000289, 1000041, '石海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000290, 1000041, '朱店村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000291, 1000041, '钟家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000292, 1000041, '申隆一村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000293, 1000041, '张弄村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000294, 1000041, '金王村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000295, 1000041, '钱忠村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000296, 1000041, '解放村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000297, 1000041, '桃园村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000298, 1000041, '花角村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000299, 1000041, '新张村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000300, 1000041, '北唐村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000301, 1000041, '西吴村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000302, 1000041, '工农村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000303, 1000041, '和中村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000304, 1000041, '李窑村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000305, 1000041, '岳和村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000306, 1000041, '湾张村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000307, 1000041, '南星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000308, 1000041, '吴房村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000309, 1000042, '镇西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000310, 1000042, '团南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000311, 1000042, '大桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000312, 1000042, '新桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000313, 1000042, '四团村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000314, 1000042, '长堰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000315, 1000042, '小荡村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000316, 1000042, '渔墩村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000317, 1000042, '夏家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000318, 1000042, '拾村村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000319, 1000042, '三坎村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000320, 1000042, '平海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000321, 1000042, '渔洋村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000322, 1000042, '向阳村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000323, 1000042, '五四村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000324, 1000042, '三团港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000325, 1000042, '杨家宅村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000326, 1000042, '横桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000327, 1000042, '农展村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000328, 1000042, '平南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000329, 1000042, '民福村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000330, 1000042, '红庄村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000331, 1000042, '邵靴村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000332, 1000042, '龙尖村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000333, 1000043, '分水墩村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000334, 1000043, '北宋村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000335, 1000043, '红旗村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000336, 1000043, '东新市村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000337, 1000043, '蔡家桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000338, 1000043, '二桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000339, 1000043, '幸福村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000340, 1000043, '冯家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000341, 1000043, '戴家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000342, 1000043, '南宋村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000343, 1000043, '陆家桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000344, 1000044, '灯塔村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000345, 1000044, '南渡村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000346, 1000044, '发展村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000347, 1000044, '金港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000348, 1000044, '益民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000349, 1000044, '五宅村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000350, 1000044, '北新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000351, 1000044, '关港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000352, 1000045, '冯桥居委会', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000353, 1000045, '临海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000354, 1000045, '三桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000355, 1000045, '夹路村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000356, 1000045, '王家圩村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000357, 1000045, '华亭村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000358, 1000045, '金海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000359, 1000045, '新寺村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000360, 1000045, '胡桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000361, 1000045, '迎龙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000362, 1000045, '新塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000363, 1000045, '营房村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000364, 1000045, '南胜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000365, 1000045, '海湾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000366, 1000045, '兴园村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000367, 1000045, '柘林村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000368, 1000045, '法华村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000369, 1000045, '目华居委会', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000370, 1000046, '汇安村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000371, 1000046, '张塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000372, 1000046, '长浜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000373, 1000046, '西校村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000374, 1000046, '杨溇村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000375, 1000046, '长堤村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000376, 1000046, '吕桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000377, 1000046, '东风村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000378, 1000046, '芦泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000379, 1000046, '潘垫村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000380, 1000046, '存古村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000381, 1000046, '马路村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000382, 1000046, '浦秀村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000383, 1000046, '渔沥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000384, 1000046, '新叶村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000385, 1000046, '新华村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000386, 1000047, '新丰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000387, 1000047, '永丰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000388, 1000047, '浏翔村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000389, 1000047, '红翔村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000390, 1000047, '曙光村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000391, 1000047, '新裕村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000392, 1000048, '大石皮村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000393, 1000048, '曹王村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000394, 1000048, '伏虎村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000395, 1000048, '和桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000396, 1000048, '红星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000397, 1000048, '劳动村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000398, 1000048, '钱桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000399, 1000048, '徐行村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000400, 1000048, '小庙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000402, 1000049, '陈村村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000403, 1000049, '北管村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000404, 1000049, '包桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000405, 1000049, '大裕村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000406, 1000049, '戬浜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000407, 1000049, '大宏村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000408, 1000049, '新联村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000409, 1000049, '立新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000410, 1000049, '李家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000411, 1000049, '仓场村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000412, 1000049, '樊家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000413, 1000049, '彭赵村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000414, 1000049, '马陆村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000415, 1000049, '安新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000416, 1000049, '戬滨村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000417, 1000050, '金吕村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000418, 1000050, '北新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000419, 1000050, '华亭村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000420, 1000050, '联华村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000421, 1000050, '连俊村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000422, 1000050, '联三村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000423, 1000050, '联一村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000424, 1000050, '双塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000425, 1000050, '唐行村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000426, 1000050, '塔桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000427, 1000050, '工业区', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000428, 1000050, '毛桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000429, 1000051, '陈周村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000430, 1000051, '大陆村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000431, 1000051, '北龚村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000432, 1000051, '甘柏村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000433, 1000051, '葛隆村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000435, 1000051, '管家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000436, 1000051, '古塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000437, 1000051, '巨门村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000438, 1000051, '施晋村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000439, 1000051, '泉泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000440, 1000051, '马门村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000441, 1000051, '俆秦村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000442, 1000051, '望新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000443, 1000051, '杨甸村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000444, 1000051, '中泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000445, 1000051, '长泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000446, 1000051, '周泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000447, 1000051, '徐秦村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000449, 1000052, '灯塔村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000450, 1000052, '白墙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000451, 1000052, '草庵村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000452, 1000052, '泾河村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000453, 1000052, '黎明村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000454, 1000052, '娄东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000455, 1000052, '娄塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000456, 1000052, '三里村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000457, 1000052, '陆渡村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000458, 1000052, '旺泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000459, 1000052, '现龙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000460, 1000052, '雨化村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000461, 1000052, '竹桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000462, 1000052, '虬桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000463, 1000052, '朱家桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000464, 1000052, '赵厅村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000465, 1000053, '顾家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000466, 1000053, '龚闵村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000467, 1000053, '邓家角村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000468, 1000053, '火炬村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000469, 1000053, '横河村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000470, 1000053, '讴思村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000471, 1000053, '塔庙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000472, 1000053, '前进村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000473, 1000053, '西元村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000474, 1000053, '向阳村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000475, 1000053, '赵巷村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000476, 1000053, '星光村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000477, 1000053, '先锋村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000478, 1000053, '邓家角', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000479, 1000053, '方泰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000480, 1000053, '东街村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000481, 1000053, '黄沈村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000482, 1000053, '老宅村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000483, 1000053, '兰塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000484, 1000053, '联群村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000485, 1000053, '联西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000486, 1000053, '林家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000487, 1000053, '罗家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000488, 1000053, '南安村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000489, 1000053, '泥岗村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000490, 1000053, '新泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000491, 1000053, '星明村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000492, 1000053, '星塔村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000493, 1000053, '朱家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000494, 1000054, '青冈村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000495, 1000054, '六里村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000496, 1000054, '永胜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000497, 1000055, '火线村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000498, 1000055, '年丰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000499, 1000055, '新华村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000500, 1000055, '新江村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000501, 1000055, '增建村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000502, 1000055, '红光村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000503, 1000076, '爱国村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000504, 1000077, '爱星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000505, 1000074, '白鹤镇村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000506, 1000081, '白马塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000507, 1000078, '北埭村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000508, 1000081, '北新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000509, 1000077, '曹泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000510, 1000077, '朝阳村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000511, 1000076, '陈东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000512, 1000075, '城南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000513, 1000085, '垂姚村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000514, 1000077, '大联村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000515, 1000083, '大新', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000516, 1000078, '大新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000517, 1000080, '淀峰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000518, 1000076, '淀西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000519, 1000077, '东方村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000520, 1000078, '东泖村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000521, 1000083, '东淇', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000522, 1000078, '东淇村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000523, 1000083, '东厍', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000524, 1000078, '东田村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000525, 1000083, '东团', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000526, 1000076, '东西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000527, 1000077, '东斜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000528, 1000076, '东星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000529, 1000078, '东庄村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000530, 1000074, '杜村村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000531, 1000085, '方夏村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000532, 1000075, '枫泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000533, 1000079, '福泉山村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000534, 1000076, '龚都村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000535, 1000079, '顾建国', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000536, 1000085, '和睦村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000537, 1000076, '河祝村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000538, 1000074, '鹤联村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000539, 1000074, '红旗', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000540, 1000074, '红旗村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000541, 1000081, '华益村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000542, 1000081, '淮海村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000543, 1000079, '回龙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000544, 1000081, '火星村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000545, 1000079, '郏店村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000546, 1000081, '坚强村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000547, 1000076, '建国村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000548, 1000080, '建新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000549, 1000074, '江南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000550, 1000080, '角里公司', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000551, 1000075, '金家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000552, 1000084, '金联村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000553, 1000077, '金米村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000554, 1000078, '金前村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000555, 1000074, '金项', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000556, 1000074, '金项村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000557, 1000076, '金姚村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000558, 1000084, '金云村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000559, 1000083, '泾花', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000560, 1000077, '泾阳村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000561, 1000078, '泾珠村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000562, 1000080, '李庄村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000563, 1000076, '莲湖村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000564, 1000084, '联民村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000565, 1000078, '联农村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000566, 1000078, '练东村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000567, 1000080, '林家村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000568, 1000084, '陆家角村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000569, 1000081, '陆象村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000570, 1000081, '马阳村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000571, 1000079, '毛家角村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000572, 1000078, '泖甸村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000573, 1000074, '梅桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000574, 1000082, '南厍村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000575, 1000085, '南崧村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000576, 1000074, '南巷村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000577, 1000076, '南新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000578, 1000084, '前明村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000579, 1000076, '钱盛村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000580, 1000074, '青龙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000581, 1000076, '任屯村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000582, 1000076, '三塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000583, 1000076, '沙港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000584, 1000080, '山海桥', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000585, 1000076, '商居', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000586, 1000085, '沈泾塘村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000587, 1000074, '沈联', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000588, 1000074, '沈联村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000589, 1000080, '沈巷村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000590, 1000074, '胜新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000591, 1000077, '石西村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000592, 1000074, '曙光村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000593, 1000083, '双菱', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000594, 1000076, '双祥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000595, 1000085, '崧泽村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000596, 1000081, '嵩山村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000597, 1000075, '塔湾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000598, 1000078, '太北村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000599, 1000075, '太来村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000600, 1000074, '太平村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000601, 1000074, '塘湾', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000602, 1000074, '塘湾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000603, 1000075, '塘郁村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000605, 1000076, '田山庄村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000606, 1000080, '万隆村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000607, 1000076, '王港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000608, 1000080, '王金村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000609, 1000074, '王泾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000610, 1000075, '王仙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000611, 1000074, '五里村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000612, 1000076, '西岑村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000613, 1000080, '先锋村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000614, 1000077, '香花居委会', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000615, 1000074, '响新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000616, 1000077, '向阳村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000617, 1000080, '小江村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000618, 1000076, '新池村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000619, 1000079, '新丰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000620, 1000076, '新港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000621, 1000074, '新江村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000622, 1000079, '新联村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000623, 1000077, '新桥村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000624, 1000080, '新胜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000625, 1000075, '新阳村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000626, 1000081, '新谊村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000627, 1000085, '新镇居委会', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000628, 1000078, '星浜村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000629, 1000081, '秀龙村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000630, 1000078, '徐练村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000631, 1000079, '徐姚村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000632, 1000081, '叙南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000633, 1000081, '叙中村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000634, 1000080, '薛间村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000635, 1000076, '雪米村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000636, 1000077, '燕南村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000637, 1000078, '杨桂明', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000638, 1000081, '杨家庄村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000639, 1000076, '杨湾村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000640, 1000078, '叶港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000641, 1000082, '俞家埭村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000642, 1000076, '育田村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000643, 1000078, '张联村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000644, 1000080, '张马村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000645, 1000080, '张巷村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000646, 1000079, '章堰村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000647, 1000083, '长河', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000648, 1000078, '长河村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000649, 1000074, '赵屯村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000650, 1000083, '蒸浦', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000651, 1000078, '蒸浦村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000652, 1000078, '蒸夏村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000653, 1000085, '中步村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000654, 1000079, '中新村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000655, 1000080, '周荡村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000656, 1000080, '周家港村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000657, 1000074, '朱浦村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000658, 1000078, '朱庄村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000659, 1000078, '芦潼村', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_area_local`
VALUES (2000660, 1000076, '金溪居委会', NULL, 5, '2021-03-04 14:01:54', '2021-03-04 14:01:54', NULL, NULL, '31.053519811475752', '120.92292008432719');
INSERT INTO `tbl_area_local`
VALUES (2000661, 1000017, '待泾村', NULL, 5, '2021-03-08 09:54:27', '2021-03-08 09:54:27', NULL, NULL, '30.87656389530639', '121.11897628324397');
INSERT INTO `tbl_area_local`
VALUES (2000662, 1000017, '牡丹村	', NULL, 5, '2021-03-08 10:03:55', '2021-03-08 10:03:55', NULL, NULL, '30.883208156760617', '121.19245813529596');
INSERT INTO `tbl_area_local`
VALUES (2000663, 1000009, '亭东村', NULL, 5, '2021-03-08 10:06:03', '2021-03-08 10:06:03', NULL, NULL, ' 30.891209594071086', '121.33763406021984');
INSERT INTO `tbl_area_local`
VALUES (2000664, 1000017, '民主村	', NULL, 5, '2021-03-08 10:07:09', '2021-03-08 10:07:09', NULL, NULL, '30.883208156760617', '121.19245813529596');
INSERT INTO `tbl_area_local`
VALUES (2000665, 1000018, '亭东村', NULL, 5, '2021-03-08 10:07:24', '2021-03-08 10:07:24', NULL, NULL, '30.891209594071086', '121.33763406021984');
INSERT INTO `tbl_area_local`
VALUES (2000666, 1000009, '新春村', NULL, 5, '2021-03-08 10:08:14', '2021-03-08 10:08:14', NULL, NULL, '30.897594274151032', '120.99642399661383');
INSERT INTO `tbl_area_local`
VALUES (2000667, 1000018, '周栅村', NULL, 5, '2021-03-08 10:10:25', '2021-03-08 10:10:25', NULL, NULL, '30.878877148032018', '121.25787431685069');
INSERT INTO `tbl_area_local`
VALUES (2000668, 1000017, '大茫村', NULL, 5, '2021-03-08 10:10:26', '2021-03-08 10:10:26', NULL, NULL, '30.883208156760617', '121.19245813529596');
INSERT INTO `tbl_area_local`
VALUES (2000669, 1000009, '农兴村', NULL, 5, '2021-03-08 10:11:40', '2021-03-08 10:11:40', NULL, NULL, '30.906993231501506', '121.02699356586432');
INSERT INTO `tbl_area_local`
VALUES (2000670, 1000018, '新巷村', NULL, 5, '2021-03-08 10:13:28', '2021-03-08 10:13:28', NULL, NULL, '30.860509380698034', '121.30336458174327 ');
INSERT INTO `tbl_area_local`
VALUES (2000671, 1000017, '秀州村', NULL, 5, '2021-03-08 10:13:29', '2021-03-08 10:13:29', NULL, NULL, '30.911797190303787', '121.16618696656553');
INSERT INTO `tbl_area_local`
VALUES (2000672, 1000009, '盛新村', NULL, 5, '2021-03-08 10:13:39', '2021-03-08 10:13:39', NULL, NULL, '30.88086002491084', '121.05969955208894');
INSERT INTO `tbl_area_local`
VALUES (2000673, 1000018, '亭北村', NULL, 5, '2021-03-08 10:15:37', '2021-03-08 10:15:37', NULL, NULL, '30.90034606433869', '121.29231325047954 ');
INSERT INTO `tbl_area_local`
VALUES (2000674, 1000009, '卫星村', NULL, 5, '2021-03-08 10:16:01', '2021-03-08 10:16:01', NULL, NULL, '30.89767229985918', '121.08138941086924');
INSERT INTO `tbl_area_local`
VALUES (2000675, 1000018, '浩光村', NULL, 5, '2021-03-08 10:18:30', '2021-03-08 10:18:30', NULL, NULL, '30.92214705921174', '121.23360505956157 ');
INSERT INTO `tbl_area_local`
VALUES (2000676, 1000017, '万联村', NULL, 5, '2021-03-08 10:18:59', '2021-03-08 10:18:59', NULL, NULL, '30.90338683472723', '121.13879570201766');
INSERT INTO `tbl_area_local`
VALUES (2000677, 1000018, '金门村', NULL, 5, '2021-03-08 10:19:28', '2021-03-08 10:19:28', NULL, NULL, '30.88948730050933', '121.2777815285333 ');
INSERT INTO `tbl_area_local`
VALUES (2000678, 1000017, '长浜村', NULL, 5, '2021-03-08 10:19:48', '2021-03-08 10:19:48', NULL, NULL, '30.902528527842463', '121.20334037975204');
INSERT INTO `tbl_area_local`
VALUES (2000679, 1000018, '亭西村', NULL, 5, '2021-03-08 10:20:48', '2021-03-08 10:20:48', NULL, NULL, '30.876966750943183', '121.29658975662016 ');
INSERT INTO `tbl_area_local`
VALUES (2000680, 1000018, '金明村', NULL, 5, '2021-03-08 10:23:26', '2021-03-08 10:23:26', NULL, NULL, '30.876742043283475', '121.29648366405465 ');
INSERT INTO `tbl_area_local`
VALUES (2000681, 1000017, '新泾村', NULL, 5, '2021-03-08 10:26:35', '2021-03-08 10:26:35', NULL, NULL, '30.879491475295964', '121.1358511666964');
INSERT INTO `tbl_area_local`
VALUES (2000682, 1000018, '南星村', NULL, 5, '2021-03-08 10:26:46', '2021-03-08 10:26:46', NULL, NULL, '30.88693253784563', '121.2419501537238 ');
INSERT INTO `tbl_area_local`
VALUES (2000683, 1000017, '温河村', NULL, 5, '2021-03-08 10:28:14', '2021-03-08 10:28:14', NULL, NULL, '30.879491475295964', '121.1358511666964');
INSERT INTO `tbl_area_local`
VALUES (2000684, 1000018, '红阳村', NULL, 5, '2021-03-08 10:30:31', '2021-03-08 10:30:31', NULL, NULL, ' 30.907844575817194', '121.33057496223546');
INSERT INTO `tbl_area_local`
VALUES (2000685, 1000009, '新新村', NULL, 5, '2021-03-08 10:31:05', '2021-03-08 10:31:05', NULL, NULL, '30.83823709153691', '121.02880546221053');
INSERT INTO `tbl_area_local`
VALUES (2000686, 1000018, '驳岸村', NULL, 5, '2021-03-08 10:31:37', '2021-03-08 10:31:37', NULL, NULL, '30.86647418397149', '121.24113938484288 ');
INSERT INTO `tbl_area_local`
VALUES (2000687, 1000017, '五龙村', NULL, 5, '2021-03-08 10:31:42', '2021-03-08 10:31:42', NULL, NULL, '30.8760582477569', '121.21687533661827');
INSERT INTO `tbl_area_local`
VALUES (2000688, 1000009, '五一村', NULL, 5, '2021-03-08 10:33:03', '2021-03-08 10:33:03', NULL, NULL, '30.882885560748978', '121.07366784623359');
INSERT INTO `tbl_area_local`
VALUES (2000689, 1000018, '后岗村', NULL, 5, '2021-03-08 10:33:17', '2021-03-08 10:33:17', NULL, NULL, '30.852955850536432', '121.25894925270177 ');
INSERT INTO `tbl_area_local`
VALUES (2000690, 1000011, '新街村', NULL, 5, '2021-03-08 10:33:50', '2021-03-08 10:33:50', NULL, NULL, '30.7973916163904', '121.32657678793538');
INSERT INTO `tbl_area_local`
VALUES (2000691, 1000018, '油车村', NULL, 5, '2021-03-08 10:34:03', '2021-03-08 10:34:03', NULL, NULL, ' 30.86047257064581', '121.28224963786431');
INSERT INTO `tbl_area_local`
VALUES (2000692, 1000018, '龙泉村', NULL, 5, '2021-03-08 10:34:59', '2021-03-08 10:34:59', NULL, NULL, ' 30.901935589997862', '121.35190435304696');
INSERT INTO `tbl_area_local`
VALUES (2000693, 1000011, '红光村', NULL, 5, '2021-03-08 10:35:37', '2021-03-08 10:35:37', NULL, NULL, '30.862451325161004', '121.35931414108893');
INSERT INTO `tbl_area_local`
VALUES (2000694, 1000018, '东新村', NULL, 5, '2021-03-08 10:35:53', '2021-03-08 10:35:53', NULL, NULL, '30.870195743906567', '121.30512662782725 ');
INSERT INTO `tbl_area_local`
VALUES (2000695, 1000009, ' 新义村', NULL, 5, '2021-03-08 10:36:37', '2021-03-08 10:36:37', NULL, NULL, '30.856869630033486', '121.03301029686628');
INSERT INTO `tbl_area_local`
VALUES (2000696, 1000011, '立新村', NULL, 5, '2021-03-08 10:36:55', '2021-03-08 10:36:55', NULL, NULL, '30.860034179730803', '121.34313875660263');
INSERT INTO `tbl_area_local`
VALUES (2000697, 1000014, '太平村', NULL, 5, '2021-03-08 10:37:10', '2021-03-08 10:37:10', NULL, NULL, '30.85079918472053', '121.18924324032719 ');
INSERT INTO `tbl_area_local`
VALUES (2000698, 1000009, '韩坞村', NULL, 5, '2021-03-08 10:37:18', '2021-03-08 10:37:18', NULL, NULL, '30.91650265586847', '121.09995441437701');
INSERT INTO `tbl_area_local`
VALUES (2000699, 1000011, '高楼村', NULL, 5, '2021-03-08 10:37:39', '2021-03-08 10:37:39', NULL, NULL, '30.85955340208909', '121.31818893983592');
INSERT INTO `tbl_area_local`
VALUES (2000700, 1000014, '夹漏村', NULL, 5, '2021-03-08 10:37:57', '2021-03-08 10:37:57', NULL, NULL, '30.846082132211986', '121.13243583140535 ');
INSERT INTO `tbl_area_local`
VALUES (2000701, 1000011, '保卫村', NULL, 5, '2021-03-08 10:38:23', '2021-03-08 10:38:23', NULL, NULL, '30.817320810961377', '121.30843070516363');
INSERT INTO `tbl_area_local`
VALUES (2000702, 1000014, '蔷薇村', NULL, 5, '2021-03-08 10:38:47', '2021-03-08 10:38:47', NULL, NULL, ' 30.838920772563103', '121.14370564032869');
INSERT INTO `tbl_area_local`
VALUES (2000703, 1000011, '欢兴村', NULL, 5, '2021-03-08 10:39:07', '2021-03-08 10:39:07', NULL, NULL, '30.86433908741492', '121.3709426964424');
INSERT INTO `tbl_area_local`
VALUES (2000704, 1000014, '姚家村', NULL, 5, '2021-03-08 10:39:43', '2021-03-08 10:39:43', NULL, NULL, '30.863319964310847', '121.1667160950982 ');
INSERT INTO `tbl_area_local`
VALUES (2000705, 1000009, '俞汇村', NULL, 5, '2021-03-08 10:40:14', '2021-03-08 10:40:14', NULL, NULL, '30.910306084365086', '121.00015913489409');
INSERT INTO `tbl_area_local`
VALUES (2000706, 1000011, '合兴村', NULL, 5, '2021-03-08 10:40:20', '2021-03-08 10:40:20', NULL, NULL, '30.82932016651648', '121.31927262197951');
INSERT INTO `tbl_area_local`
VALUES (2000707, 1000014, '龙跃村', NULL, 5, '2021-03-08 10:40:39', '2021-03-08 10:40:39', NULL, NULL, ' 30.82035778836817', '121.23987781270935');
INSERT INTO `tbl_area_local`
VALUES (2000708, 1000011, '运河村', NULL, 5, '2021-03-08 10:41:11', '2021-03-08 10:41:11', NULL, NULL, '30.84030649464148', '121.34725342642287');
INSERT INTO `tbl_area_local`
VALUES (2000709, 1000014, '和平村', NULL, 5, '2021-03-08 10:41:37', '2021-03-08 10:41:37', NULL, NULL, '30.840755429344494', '121.20925288890898 ');
INSERT INTO `tbl_area_local`
VALUES (2000710, 1000011, '胥浦村', NULL, 5, '2021-03-08 10:41:54', '2021-03-08 10:41:54', NULL, NULL, '30.829823280519008', '121.29643683221343');
INSERT INTO `tbl_area_local`
VALUES (2000711, 1000009, '泖桥村', NULL, 5, '2021-03-08 10:42:05', '2021-03-08 10:42:05', NULL, NULL, '30.89936345238982', '121.09695979930376');
INSERT INTO `tbl_area_local`
VALUES (2000712, 1000009, '新黎村', NULL, 5, '2021-03-08 10:46:13', '2021-03-08 10:46:13', NULL, NULL, '30.86308568095717', '121.0770470795772');
INSERT INTO `tbl_area_local`
VALUES (2000713, 1000009, '钱明村', NULL, 5, '2021-03-08 10:47:41', '2021-03-08 10:47:41', NULL, NULL, '30.892588348038373', '121.04597579731939');
INSERT INTO `tbl_area_local`
VALUES (2000714, 1000009, '五星村', NULL, 5, '2021-03-08 10:48:15', '2021-03-08 10:48:15', NULL, NULL, '30.844094009049115', '121.04185592427251');
INSERT INTO `tbl_area_local`
VALUES (2000715, 1000009, '双庙村', NULL, 5, '2021-03-08 10:51:00', '2021-03-08 10:51:00', NULL, NULL, '30.85059356640927', '121.05339105030293');
INSERT INTO `tbl_area_local`
VALUES (2000716, 1000016, '建农村', NULL, 5, '2021-03-08 10:51:58', '2021-03-08 10:51:58', NULL, NULL, '30.778498314537984', '121.2879264851885');
INSERT INTO `tbl_area_local`
VALUES (2000717, 1000009, '中洪村', NULL, 5, '2021-03-08 10:52:24', '2021-03-08 10:52:24', NULL, NULL, '30.928070067001', '121.00798661609883');
INSERT INTO `tbl_area_local`
VALUES (2000718, 1000016, '旧港村', NULL, 5, '2021-03-08 10:52:39', '2021-03-08 10:52:39', NULL, NULL, '30.78038658968447', '121.31968383992483');
INSERT INTO `tbl_area_local`
VALUES (2000719, 1000009, '兴塔村', NULL, 5, '2021-03-08 10:53:00', '2021-03-08 10:53:00', NULL, NULL, '30.870105742486384', '121.05708176990743');
INSERT INTO `tbl_area_local`
VALUES (2000720, 1000016, '百家村', NULL, 5, '2021-03-08 10:53:14', '2021-03-08 10:53:14', NULL, NULL, '30.8205553518915', '121.27985840047171');
INSERT INTO `tbl_area_local`
VALUES (2000721, 1000016, '鲁堰村', NULL, 5, '2021-03-08 10:53:48', '2021-03-08 10:53:48', NULL, NULL, '30.808367394127828', '121.29908447469046');
INSERT INTO `tbl_area_local`
VALUES (2000722, 1000016, '桑园村', NULL, 5, '2021-03-08 10:54:24', '2021-03-08 10:54:24', NULL, NULL, '30.79635109774111', '121.30595092976858');
INSERT INTO `tbl_area_local`
VALUES (2000723, 1000009, '新元村', NULL, 5, '2021-03-08 10:54:33', '2021-03-08 10:54:33', NULL, NULL, '30.947314340541713', '121.00428020490193');
INSERT INTO `tbl_area_local`
VALUES (2000724, 1000016, '秦山村', NULL, 5, '2021-03-08 10:55:04', '2021-03-08 10:55:04', NULL, NULL, '30.79429116121767', '121.27333526814749');
INSERT INTO `tbl_area_local`
VALUES (2000725, 1000016, '秦望村', NULL, 5, '2021-03-08 10:55:47', '2021-03-08 10:55:47', NULL, NULL, '30.808367394127828', '121.25153427327444 ');
INSERT INTO `tbl_area_local`
VALUES (2000726, 1000016, '甪里村', NULL, 5, '2021-03-08 10:56:20', '2021-03-08 10:56:20', NULL, NULL, '30.788454674401265', '121.2956512471514 ');
INSERT INTO `tbl_area_local`
VALUES (2000727, 1000016, '秦阳村', NULL, 5, '2021-03-08 10:56:50', '2021-03-08 10:56:50', NULL, NULL, '30.784163139977437', '121.26509552205374 ');
INSERT INTO `tbl_area_local`
VALUES (2000728, 1000010, '蒋庄村', NULL, 5, '2021-03-08 10:58:01', '2021-03-08 10:58:01', NULL, NULL, '30.828108452477437', '121.3586509724932 ');
INSERT INTO `tbl_area_local`
VALUES (2000729, 1000010, '阮巷村', NULL, 5, '2021-03-08 10:58:44', '2021-03-08 10:58:44', NULL, NULL, '30.822100304284078', '121.37495880330374 ');
INSERT INTO `tbl_area_local`
VALUES (2000730, 1000014, '白漾村', NULL, 5, '2021-03-08 10:58:49', '2021-03-08 10:58:49', NULL, NULL, '30.84814427459657', '121.23362761389502 ');
INSERT INTO `tbl_area_local`
VALUES (2000731, 1000010, '护塘村', NULL, 5, '2021-03-08 10:59:18', '2021-03-08 10:59:18', NULL, NULL, '30.80304589144228', '121.37418632710745 ');
INSERT INTO `tbl_area_local`
VALUES (2000732, 1000010, '营房村', NULL, 5, '2021-03-08 10:59:52', '2021-03-08 10:59:52', NULL, NULL, '30.805875237250234', '121.40281411717217 ');
INSERT INTO `tbl_area_local`
VALUES (2000733, 1000014, '荡田村', NULL, 5, '2021-03-08 10:59:52', '2021-03-08 10:59:52', NULL, NULL, '30.83266790493389', '121.18614830753336 ');
INSERT INTO `tbl_area_local`
VALUES (2000734, 1000010, '水库村', NULL, 5, '2021-03-08 11:00:24', '2021-03-08 11:00:24', NULL, NULL, '30.82296049016884', '121.3880376798848 ');
INSERT INTO `tbl_area_local`
VALUES (2000735, 1000014, '颜圩村', NULL, 5, '2021-03-08 11:00:59', '2021-03-08 11:00:59', NULL, NULL, '30.838593889064754', '121.27178229657329 ');
INSERT INTO `tbl_area_local`
VALUES (2000736, 1000010, '沙积村', NULL, 5, '2021-03-08 11:01:09', '2021-03-08 11:01:09', NULL, NULL, '30.812606373653182', '121.42102908839263 ');
INSERT INTO `tbl_area_local`
VALUES (2000737, 1000010, '增丰村', NULL, 5, '2021-03-08 11:01:39', '2021-03-08 11:01:39', NULL, NULL, '30.77423554522312', '121.3977015876402 ');
INSERT INTO `tbl_area_local`
VALUES (2000738, 1000014, '马新村', NULL, 5, '2021-03-08 11:02:08', '2021-03-08 11:02:08', NULL, NULL, '30.83769001766217', '121.15890332902495 ');
INSERT INTO `tbl_area_local`
VALUES (2000739, 1000010, '东海村', NULL, 5, '2021-03-08 11:02:11', '2021-03-08 11:02:11', NULL, NULL, '30.78087579395691', '121.40394637437697 ');
INSERT INTO `tbl_area_local`
VALUES (2000740, 1000010, '金光村', NULL, 5, '2021-03-08 11:03:10', '2021-03-08 11:03:10', NULL, NULL, '30.799834229642446', '121.38711890152496 ');
INSERT INTO `tbl_area_local`
VALUES (2000741, 1000015, '华新村', NULL, 5, '2021-03-08 11:03:23', '2021-03-08 11:03:23', NULL, NULL, '30.799392016431312', '121.34687417815313 ');
INSERT INTO `tbl_area_local`
VALUES (2000742, 1000010, '海涯村', NULL, 5, '2021-03-08 11:04:18', '2021-03-08 11:04:18', NULL, NULL, '30.801076717729188', '121.44214429466119 ');
INSERT INTO `tbl_area_local`
VALUES (2000743, 1000015, '九龙村', NULL, 5, '2021-03-08 11:04:19', '2021-03-08 11:04:19', NULL, NULL, '30.771781141390793', '121.37890706461864 ');
INSERT INTO `tbl_area_local`
VALUES (2000744, 1000015, '长兴村', NULL, 5, '2021-03-08 11:05:18', '2021-03-08 11:05:18', NULL, NULL, '30.78903538613727', '121.33521811713877 ');
INSERT INTO `tbl_area_local`
VALUES (2000745, 1000009, '新华村', NULL, 5, '2021-03-08 11:16:09', '2021-03-08 11:16:09', NULL, NULL, '30.94731434054171', '121.00428020490193 ');
INSERT INTO `tbl_area_local`
VALUES (2000746, 1000015, '向阳村', NULL, 5, '2021-03-08 11:26:46', '2021-03-08 11:26:46', NULL, NULL, '30.77053727621839', '121.36047088646978');
INSERT INTO `tbl_area_local`
VALUES (2000747, 1000015, '东方村', NULL, 5, '2021-03-08 11:27:16', '2021-03-08 11:27:16', NULL, NULL, '30.767899857932974', '121.34361921563203');
INSERT INTO `tbl_area_local`
VALUES (2000748, 1000015, '中兴村', NULL, 5, '2021-03-08 11:27:58', '2021-03-08 11:27:58', NULL, NULL, '30.775020197945395', '121.33492043541122 ');
INSERT INTO `tbl_area_local`
VALUES (2000749, 1000015, '新江村', NULL, 5, '2021-03-08 11:28:49', '2021-03-08 11:28:49', NULL, NULL, '30.744067026862155', '121.37075705262015 ');
INSERT INTO `tbl_area_local`
VALUES (2000750, 1000015, '渔业村', NULL, 5, '2021-03-08 11:29:46', '2021-03-08 11:29:46', NULL, NULL, '30.79890766787463', '121.31242288249068 ');
INSERT INTO `tbl_area_local`
VALUES (2000751, 1000009, '下坊村', NULL, 5, '2021-03-08 12:52:55', '2021-03-08 12:52:55', NULL, NULL, '30.862212511539838', '121.10879999862163');
INSERT INTO `tbl_area_local`
VALUES (2000752, 1000009, '团新村', NULL, 5, '2021-03-08 12:54:09', '2021-03-08 12:54:09', NULL, NULL, '30.83740893290425', '120.99568790853637');
INSERT INTO `tbl_area_local`
VALUES (2000753, 1000009, '贵泾村', NULL, 5, '2021-03-08 12:55:22', '2021-03-08 12:55:22', NULL, NULL, '30.87123228051624', '121.09799225336138');
INSERT INTO `tbl_area_local`
VALUES (2000754, 1000009, '长征村', NULL, 5, '2021-03-08 12:57:10', '2021-03-08 12:57:10', NULL, NULL, '30.898539023136067', '121.06739228398663');
INSERT INTO `tbl_area_local`
VALUES (2000755, 1000009, '菖梧村', NULL, 5, '2021-03-08 12:58:42', '2021-03-08 12:58:42', NULL, NULL, '30.850266410057003', '121.00663880257389');
INSERT INTO `tbl_area_local`
VALUES (2000756, 1000012, '永久村', NULL, 5, '2021-03-08 13:08:48', '2021-03-08 13:08:48', NULL, NULL, '30.709428111741715', '121.27827794739261');
INSERT INTO `tbl_area_local`
VALUES (2000757, 1000012, '永联村', NULL, 5, '2021-03-08 13:09:48', '2021-03-08 13:09:48', NULL, NULL, '30.728550025509776', '121.27487891455917');
INSERT INTO `tbl_area_local`
VALUES (2000758, 1000012, '农建村', NULL, 5, '2021-03-08 13:13:22', '2021-03-08 13:13:22', NULL, NULL, '30.75064772793783', '121.30534303946104');
INSERT INTO `tbl_area_local`
VALUES (2000759, 1000012, '八一村', NULL, 5, '2021-03-08 13:14:17', '2021-03-08 13:14:17', NULL, NULL, '30.746172501583004', '121.27885185134721');
INSERT INTO `tbl_area_local`
VALUES (2000760, 1000012, '塔港村', NULL, 5, '2021-03-08 13:17:41', '2021-03-08 13:17:41', NULL, NULL, '30.78353607420752', '121.22931156376183');
INSERT INTO `tbl_area_local`
VALUES (2000761, 1000012, '横浦村', NULL, 5, '2021-03-08 13:18:16', '2021-03-08 13:18:16', NULL, NULL, '30.749432291157518', '121.29487640219492');
INSERT INTO `tbl_area_local`
VALUES (2000762, 1000012, '卫通村', NULL, 5, '2021-03-08 13:19:12', '2021-03-08 13:19:12', NULL, NULL, '30.768807543601582', '121.31183954361529');
INSERT INTO `tbl_area_local`
VALUES (2000763, 1000012, '星火村', NULL, 5, '2021-03-08 13:26:54', '2021-03-08 13:26:54', NULL, NULL, '30.78271686916551', '121.24947552434725');
INSERT INTO `tbl_area_local`
VALUES (2000764, 1000012, '横召村', NULL, 5, '2021-03-08 13:37:36', '2021-03-08 13:37:36', NULL, NULL, '30.768645379057887', '121.24029471118854');
INSERT INTO `tbl_area_local`
VALUES (2000765, 1000012, '八字村', NULL, 5, '2021-03-08 13:40:43', '2021-03-08 13:40:43', NULL, NULL, '30.766312043920152', '121.27145227224617');
INSERT INTO `tbl_area_local`
VALUES (2000766, 1000012, '张桥村', NULL, 5, '2021-03-08 13:41:18', '2021-03-08 13:41:18', NULL, NULL, '30.752001597223142', '121.2546183564532');
INSERT INTO `tbl_area_local`
VALUES (2000767, 1000013, '南陆村', NULL, 5, '2021-03-08 13:42:57', '2021-03-08 13:42:57', NULL, NULL, '30.804611814599866', '121.1587033320655');
INSERT INTO `tbl_area_local`
VALUES (2000768, 1000013, '万春村', NULL, 5, '2021-03-08 13:43:37', '2021-03-08 13:43:37', NULL, NULL, '30.797939258752905', '121.21158703038287');
INSERT INTO `tbl_area_local`
VALUES (2000769, 1000013, '山塘村', NULL, 5, '2021-03-08 13:44:13', '2021-03-08 13:44:13', NULL, NULL, '30.788412052332006', '121.16300686070514');
INSERT INTO `tbl_area_local`
VALUES (2000770, 1000013, '友好村', NULL, 5, '2021-03-08 13:46:29', '2021-03-08 13:46:29', NULL, NULL, '30.814199852346206', '121.1460266932462');
INSERT INTO `tbl_area_local`
VALUES (2000771, 1000013, '光明村', NULL, 5, '2021-03-08 13:57:18', '2021-03-08 13:57:18', NULL, NULL, '30.809760189260686', '121.22232284015831');
INSERT INTO `tbl_area_local`
VALUES (2000772, 1000013, '景阳村', NULL, 5, '2021-03-08 13:57:56', '2021-03-08 13:57:56', NULL, NULL, '30.789561363746742', '121.18232573932823');
INSERT INTO `tbl_area_local`
VALUES (2000773, 1000013, '勇敢村', NULL, 5, '2021-03-08 13:58:33', '2021-03-08 13:58:33', NULL, NULL, '30.800833797659124', '121.1945136970919');
INSERT INTO `tbl_area_local`
VALUES (2000774, 1000013, '中联村', NULL, 5, '2021-03-08 13:59:05', '2021-03-08 13:59:05', NULL, NULL, '30.816969967092717', '121.13005485004601');
INSERT INTO `tbl_area_local`
VALUES (2000775, 1000013, '中丰村', NULL, 5, '2021-03-08 13:59:39', '2021-03-08 13:59:39', NULL, NULL, '30.792622660048636', '121.12670745319542');
INSERT INTO `tbl_area_local`
VALUES (2000776, 1000013, '中民村', NULL, 5, '2021-03-08 14:00:45', '2021-03-08 14:00:45', NULL, NULL, '30.80571111277118', '121.14025043352021');
INSERT INTO `tbl_area_local`
VALUES (2000777, 1000013, '中华村', NULL, 5, '2021-03-08 14:01:26', '2021-03-08 14:01:26', NULL, NULL, '30.789454855280553', '121.13887600442678');
INSERT INTO `tbl_area_local`
VALUES (2000778, 1000013, '南塘村', NULL, 5, '2021-03-08 14:02:00', '2021-03-08 14:02:00', NULL, NULL, '30.81620978880713', '121.17973314290532');
INSERT INTO `tbl_area_local`
VALUES (2000779, 1000017, '慧农村', NULL, 5, '2021-03-26 09:36:06', '2021-03-26 09:36:06', NULL, NULL, '30.876019298487478', '121.21451035407478');
INSERT INTO `tbl_area_local`
VALUES (2000780, 1000034, '六滧村', NULL, 5, '2021-04-02 10:06:22', '2021-04-02 10:06:22', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000781, 1000034, '花仓村', NULL, 5, '2021-04-02 10:06:33', '2021-04-02 10:06:33', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000782, 1000034, '春光村', NULL, 5, '2021-04-02 10:06:45', '2021-04-02 10:06:45', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000783, 1000034, '阜康村', NULL, 5, '2021-04-02 10:06:56', '2021-04-02 10:06:56', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000784, 1000034, '南江村', NULL, 5, '2021-04-02 10:07:10', '2021-04-02 10:07:10', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000785, 1000034, '向化村', NULL, 5, '2021-04-02 10:07:21', '2021-04-02 10:07:21', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000786, 1000034, '米新村', NULL, 5, '2021-04-02 10:07:41', '2021-04-02 10:07:41', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000787, 1000034, '齐南村', NULL, 5, '2021-04-02 10:07:53', '2021-04-02 10:07:53', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000788, 1000034, '北港村', NULL, 5, '2021-04-02 10:08:02', '2021-04-02 10:08:02', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000789, 1000082, '天恩桥村', NULL, 5, '2021-04-14 10:04:33', '2021-04-14 10:04:33', NULL, NULL, '31.164564670624998', '121.07578884962948');
INSERT INTO `tbl_area_local`
VALUES (2000790, 1000061, '黄桥村', NULL, 5, '2021-04-16 12:22:37', '2021-04-16 12:22:37', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000791, 1000061, '田黄村', NULL, 5, '2021-04-16 16:23:06', '2021-04-16 16:23:06', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000792, 1000061, '曹家浜村', NULL, 5, '2021-04-16 16:23:30', '2021-04-16 16:23:30', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000793, 1000059, '徐姚村', NULL, 5, '2021-04-26 17:48:57', '2021-04-26 17:48:57', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000794, 1000059, '兴达村', NULL, 5, '2021-04-26 17:49:10', '2021-04-26 17:49:10', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000795, 1000059, '团结村', NULL, 5, '2021-04-26 17:49:21', '2021-04-26 17:49:21', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000796, 1000025, '永隆村', NULL, 5, '2021-04-28 15:44:14', '2021-04-28 15:44:14', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000797, 1000059, '四村村', NULL, 5, '2021-04-29 14:37:39', '2021-04-29 14:37:39', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000798, 1000062, '新姚村', NULL, 5, '2021-04-29 16:49:35', '2021-04-29 16:49:35', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000799, 1000020, '华荣村', NULL, 5, '2021-05-07 09:21:47', '2021-05-07 09:21:47', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000800, 1000076, '徐李村', NULL, 5, '2021-05-07 14:01:49', '2021-05-07 14:01:49', NULL, NULL, '31.02441089635559', '120.93415305666849');
INSERT INTO `tbl_area_local`
VALUES (2000801, 1000080, '山湾村', NULL, 5, '2021-05-07 14:35:03', '2021-05-07 14:35:03', NULL, NULL, '31.098612554229902', '121.00937918369635');
INSERT INTO `tbl_area_local`
VALUES (2000802, 1000080, ' 河祝村', NULL, 5, '2021-05-07 14:41:54', '2021-05-07 14:41:54', NULL, NULL, '31.081038620309528', '120.98956244707512');
INSERT INTO `tbl_area_local`
VALUES (2000803, 1000080, ' 西洋淀村', NULL, 5, '2021-05-07 14:55:15', '2021-05-07 14:55:15', NULL, NULL, '31.13779931018709', '121.03988241876249');
INSERT INTO `tbl_area_local`
VALUES (2000804, 1000076, '东天村', NULL, 5, '2021-05-07 15:33:37', '2021-05-07 15:33:37', NULL, NULL, '31.049061343444123', '120.98025784440972');
INSERT INTO `tbl_area_local`
VALUES (2000805, 1000028, '镇东村', NULL, 5, '2021-05-20 10:36:46', '2021-05-20 10:36:46', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000807, 1000051, ' 泉泾村', NULL, 5, '2021-06-03 20:08:50', '2021-06-03 20:08:50', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000808, 1000051, '冈峰村', NULL, 5, '2021-06-03 20:18:35', '2021-06-03 20:18:35', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000809, 1000048, '安新村', NULL, 5, '2021-06-05 16:40:41', '2021-06-05 16:40:41', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000810, 1000027, '东兴村', NULL, 5, '2021-06-18 09:52:27', '2021-06-18 09:52:27', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000811, 1000027, '新春村', NULL, 5, '2021-06-18 10:04:28', '2021-06-18 10:04:28', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000812, 1000027, '惠丰村', NULL, 5, '2021-06-18 10:04:40', '2021-06-18 10:04:40', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000813, 1000080, '安庄村', NULL, 5, '2021-06-28 15:23:57', '2021-06-28 15:23:57', NULL, NULL, '31.07395029877853', '121.02084909656064');
INSERT INTO `tbl_area_local`
VALUES (2000814, 1000060, '南杨村', NULL, 5, '2021-06-30 15:53:28', '2021-06-30 15:53:28', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000815, 1000033, '育才村', NULL, 5, '2021-07-01 09:58:54', '2021-07-01 09:58:54', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000816, 1000066, '农发公司', NULL, 5, '2021-07-05 10:24:08', '2021-07-05 10:24:08', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000817, 1000066, '荡湾村', NULL, 5, '2021-07-05 10:24:50', '2021-07-05 10:24:50', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000818, 1000066, '泾德村', NULL, 5, '2021-07-05 10:25:02', '2021-07-05 10:25:02', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000819, 1000066, '陆家埭村', NULL, 5, '2021-07-05 10:25:13', '2021-07-05 10:25:13', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000820, 1000066, '汤村村', NULL, 5, '2021-07-05 10:25:23', '2021-07-05 10:25:23', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000821, 1000066, '永丰村', NULL, 5, '2021-07-05 10:25:32', '2021-07-05 10:25:32', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000822, 1000066, '周家浜村', NULL, 5, '2021-07-05 10:25:41', '2021-07-05 10:25:41', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000823, 1000058, '新镇村', NULL, 5, '2021-07-12 12:08:16', '2021-07-12 12:08:16', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000824, 1000058, '刘家山村', NULL, 5, '2021-07-12 12:08:30', '2021-07-12 12:08:30', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000825, 1000058, '张朴村', NULL, 5, '2021-07-12 12:08:40', '2021-07-12 12:08:40', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000826, 1000060, '赵王村', NULL, 5, '2021-07-15 09:30:59', '2021-07-15 09:30:59', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000827, 1000078, ' 双菱村', NULL, 5, '2021-07-19 16:39:35', '2021-07-19 16:39:35', NULL, NULL, '30.978730432483076', '121.017344721129');
INSERT INTO `tbl_area_local`
VALUES (2000828, 1000061, '兴旺村', NULL, 5, '2021-08-02 10:37:00', '2021-08-02 10:37:00', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000829, 1000058, '江秋村', NULL, 5, '2021-08-24 10:55:57', '2021-08-24 10:55:57', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000830, 1000050, '华旺社区', NULL, 5, '2021-08-31 12:22:03', '2021-08-31 12:22:03', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000831, 1000076, '岑卜村', NULL, 5, '2021-09-06 10:04:01', '2021-09-06 10:04:01', NULL, NULL, '31.059225210918925', '120.93569494120419');
INSERT INTO `tbl_area_local`
VALUES (2000832, 1000078, '东厍村', NULL, 5, '2021-09-06 11:03:16', '2021-09-06 11:03:16', NULL, NULL, '30.968530363208117', '121.02918778272272');
INSERT INTO `tbl_area_local`
VALUES (2000833, 1000061, '茹塘村', NULL, 5, '2021-09-14 16:23:21', '2021-09-14 16:23:21', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000834, 1000055, ' 太平村', NULL, 5, '2021-09-17 09:04:20', '2021-09-17 09:04:20', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2000835, 1000091, '长寿村', NULL, 5, '2021-09-17 16:00:02', '2021-09-17 18:26:14', NULL, NULL, '31.0414620380', '104.4374313472  ');
INSERT INTO `tbl_area_local`
VALUES (2000836, 1000091, '福兴村', NULL, 5, '2021-09-17 16:00:10', '2021-09-17 18:36:39', NULL, NULL, '31.0855432372', '104.4503654491');
INSERT INTO `tbl_area_local`
VALUES (2000837, 1000091, '高治村', NULL, 5, '2021-09-17 16:00:18', '2021-09-17 18:37:14', NULL, NULL, '31.0419234994', '104.4590594160');
INSERT INTO `tbl_area_local`
VALUES (2000838, 1000091, '永兴村', NULL, 5, '2021-09-17 16:00:24', '2021-09-17 18:37:45', NULL, NULL, '31.0563672136', '104.4556259706');
INSERT INTO `tbl_area_local`
VALUES (2000839, 1000091, '白蜡村', NULL, 5, '2021-09-17 16:00:31', '2021-09-17 18:38:11', NULL, NULL, '31.0884385578', '104.4717802295');
INSERT INTO `tbl_area_local`
VALUES (2000840, 1000091, '英雄岭村', NULL, 5, '2021-09-17 16:00:48', '2021-09-17 18:38:45', NULL, NULL, '31.0511985531', '104.4732131571');
INSERT INTO `tbl_area_local`
VALUES (2000841, 1000091, '河坝湾社区', NULL, 5, '2021-09-17 16:03:20', '2021-09-17 18:40:11', NULL, NULL, '31.0513180421', '104.4731487841');
INSERT INTO `tbl_area_local`
VALUES (2000842, 1000092, '清泉村', NULL, 5, '2021-09-17 16:03:55', '2021-09-17 18:40:49', NULL, NULL, '31.1707377407', '104.4861043816');
INSERT INTO `tbl_area_local`
VALUES (2000843, 1000092, '东美村', NULL, 5, '2021-09-17 16:04:02', '2021-09-17 18:41:23', NULL, NULL, '31.1730753593', '104.4865777877');
INSERT INTO `tbl_area_local`
VALUES (2000844, 1000092, '八佛村', NULL, 5, '2021-09-17 16:04:08', '2021-09-17 18:41:49', NULL, NULL, '31.1706184019', '104.4860265976');
INSERT INTO `tbl_area_local`
VALUES (2000845, 1000092, '二百钱村', NULL, 5, '2021-09-17 16:04:14', '2021-09-17 18:42:15', NULL, NULL, '31.1707124960', '104.4860406792');
INSERT INTO `tbl_area_local`
VALUES (2000846, 1000092, '金锣桥村', NULL, 5, '2021-09-17 16:04:20', '2021-09-17 18:42:43', NULL, NULL, '31.1705656174', '104.4862612908');
INSERT INTO `tbl_area_local`
VALUES (2000847, 1000092, '美女庙社区', NULL, 5, '2021-09-17 16:04:27', '2021-09-18 09:19:08', NULL, NULL, '31.1698710060', '104.4867119008');
INSERT INTO `tbl_area_local`
VALUES (2000848, 1000092, '通江社区', NULL, 5, '2021-09-17 16:04:35', '2021-09-18 09:24:18', NULL, NULL, '31.1797245154', '104.5362041485');
INSERT INTO `tbl_area_local`
VALUES (2000849, 1000092, '龙凤社区', NULL, 5, '2021-09-17 16:04:41', '2021-09-18 09:25:42', NULL, NULL, '31.1573616818', '104.4502003317');
INSERT INTO `tbl_area_local`
VALUES (2000850, 1000092, '高华强社区', NULL, 5, '2021-09-17 16:04:49', '2021-09-18 09:26:41', NULL, NULL, '31.1808659257', '104.4517659436');
INSERT INTO `tbl_area_local`
VALUES (2000851, 1000092, '翻身村', NULL, 5, '2021-09-17 16:04:57', '2021-09-17 18:43:22', NULL, NULL, '31.1706734814', '104.4860426908');
INSERT INTO `tbl_area_local`
VALUES (2000852, 1000092, '凯江村', NULL, 5, '2021-09-17 16:05:03', '2021-09-17 18:44:06', NULL, NULL, '31.1696568013', '104.4869130676');
INSERT INTO `tbl_area_local`
VALUES (2000853, 1000092, '钻石村', NULL, 5, '2021-09-17 16:05:09', '2021-09-17 18:44:39', NULL, NULL, '31.1698739291', '104.4884882680');
INSERT INTO `tbl_area_local`
VALUES (2000854, 1000093, '白河村', NULL, 5, '2021-09-17 16:05:56', '2021-09-17 18:45:58', NULL, NULL, '31.1269096636', '104.5315207553');
INSERT INTO `tbl_area_local`
VALUES (2000855, 1000093, '德中社区', NULL, 5, '2021-09-17 16:06:03', '2021-09-17 19:40:24', NULL, NULL, '31.1192925210', '104.5380791865');
INSERT INTO `tbl_area_local`
VALUES (2000856, 1000093, '龙居村', NULL, 5, '2021-09-17 16:06:11', '2021-09-17 18:46:27', NULL, NULL, '31.1269096636', '104.5315207553');
INSERT INTO `tbl_area_local`
VALUES (2000857, 1000093, '茶店村', NULL, 5, '2021-09-17 16:06:18', '2021-09-17 18:46:56', NULL, NULL, '31.1234976923', '104.5366464567');
INSERT INTO `tbl_area_local`
VALUES (2000858, 1000093, '桂花村', NULL, 5, '2021-09-17 16:06:23', '2021-09-17 18:47:29', NULL, NULL, '31.1193539165', '104.4914368294');
INSERT INTO `tbl_area_local`
VALUES (2000859, 1000093, '尖山村', NULL, 5, '2021-09-17 16:06:30', '2021-09-17 18:47:58', NULL, NULL, '31.1253666573', '104.5051903925');
INSERT INTO `tbl_area_local`
VALUES (2000860, 1000094, '金牛社区', NULL, 5, '2021-09-17 16:07:05', '2021-09-18 09:30:31', NULL, NULL, '31.1683632083', '104.3980490980');
INSERT INTO `tbl_area_local`
VALUES (2000861, 1000094, '圣风社区', NULL, 5, '2021-09-17 16:07:11', '2021-09-18 09:31:37', NULL, NULL, '31.1871504340', '104.4007887202');
INSERT INTO `tbl_area_local`
VALUES (2000862, 1000094, '永安社区', NULL, 5, '2021-09-17 16:07:16', '2021-09-18 09:32:59', NULL, NULL, '31.1624036560', '104.3890450960');
INSERT INTO `tbl_area_local`
VALUES (2000863, 1000094, '扬程社区', NULL, 5, '2021-09-17 16:07:22', '2021-09-18 09:34:36', NULL, NULL, '31.1578651476', '104.3895947752');
INSERT INTO `tbl_area_local`
VALUES (2000864, 1000094, '华联社区', NULL, 5, '2021-09-17 16:07:29', '2021-09-18 09:35:59', NULL, NULL, '31.1526386367', '104.3870941693');
INSERT INTO `tbl_area_local`
VALUES (2000865, 1000094, '泰山社区', NULL, 5, '2021-09-17 16:07:34', '2021-09-18 09:38:10', NULL, NULL, '31.1537335411', '104.3945622263');
INSERT INTO `tbl_area_local`
VALUES (2000866, 1000094, '秦宓社区', NULL, 5, '2021-09-17 16:07:42', '2021-09-18 09:39:27', NULL, NULL, '31.1564178734', '104.4010996918');
INSERT INTO `tbl_area_local`
VALUES (2000867, 1000094, '汾河路社区', NULL, 5, '2021-09-17 16:07:47', '2021-09-18 09:41:46', NULL, NULL, '31.1514767704', '104.3988063557');
INSERT INTO `tbl_area_local`
VALUES (2000868, 1000094, '淮河街社区', NULL, 5, '2021-09-17 16:07:52', '2021-09-18 09:42:57', NULL, NULL, '31.1474034888', '104.4007911406');
INSERT INTO `tbl_area_local`
VALUES (2000869, 1000094, '五里堆社区', NULL, 5, '2021-09-17 16:07:58', '2021-09-18 09:44:38', NULL, NULL, '31.1551528860', '104.3964054233');
INSERT INTO `tbl_area_local`
VALUES (2000870, 1000094, '联合社区', NULL, 5, '2021-09-17 16:08:03', '2021-09-18 09:50:04', NULL, NULL, '31.1592055857', '104.3819880304');
INSERT INTO `tbl_area_local`
VALUES (2000871, 1000094, '文化路社区', NULL, 5, '2021-09-17 16:08:08', '2021-09-18 09:50:59', NULL, NULL, '31.1567237154', '104.3913242977');
INSERT INTO `tbl_area_local`
VALUES (2000872, 1000094, '太行山路社区', NULL, 5, '2021-09-17 16:08:15', '2021-09-18 09:53:09', NULL, NULL, '31.1522982456', '104.3923113506');
INSERT INTO `tbl_area_local`
VALUES (2000873, 1000094, '金马村', NULL, 5, '2021-09-17 16:08:20', '2021-09-17 18:49:32', NULL, NULL, '31.1861526846', '104.3900715186');
INSERT INTO `tbl_area_local`
VALUES (2000874, 1000094, '红伏村', NULL, 5, '2021-09-17 16:08:25', '2021-09-17 18:51:10', NULL, NULL, '31.1673599787', '104.3719984840');
INSERT INTO `tbl_area_local`
VALUES (2000875, 1000094, '和平村', NULL, 5, '2021-09-17 16:08:30', '2021-09-17 18:51:42', NULL, NULL, '31.1720130006', '104.3731007269');
INSERT INTO `tbl_area_local`
VALUES (2000876, 1000094, '杨柳村', NULL, 5, '2021-09-17 16:08:36', '2021-09-17 18:52:08', NULL, NULL, '31.1802463205', '104.3807238756');
INSERT INTO `tbl_area_local`
VALUES (2000877, 1000094, '黄河村', NULL, 5, '2021-09-17 16:08:41', '2021-09-17 18:52:35', NULL, NULL, '31.1558935233', '104.3699276503');
INSERT INTO `tbl_area_local`
VALUES (2000878, 1000094, '红旗路社区', NULL, 5, '2021-09-17 16:08:47', '2021-09-18 09:55:10', NULL, NULL, '31.1489976750', '104.3975596822');
INSERT INTO `tbl_area_local`
VALUES (2000879, 1000094, '银山路社区', NULL, 5, '2021-09-17 16:08:53', '2021-09-18 09:56:53', NULL, NULL, '31.1715933618', '104.3864168335');
INSERT INTO `tbl_area_local`
VALUES (2000880, 1000094, '友谊路社区', NULL, 5, '2021-09-17 16:08:58', '2021-09-18 09:58:20', NULL, NULL, '31.1405846527', '104.3890476045');
INSERT INTO `tbl_area_local`
VALUES (2000881, 1000094, '铁西社区', NULL, 5, '2021-09-17 16:09:04', '2021-09-18 09:59:23', NULL, NULL, '31.1513830357', '104.3821596918');
INSERT INTO `tbl_area_local`
VALUES (2000882, 1000094, '东工苑社区', NULL, 5, '2021-09-17 16:09:10', '2021-09-18 10:00:47', NULL, NULL, '31.1377379353', '104.3869340238');
INSERT INTO `tbl_area_local`
VALUES (2000883, 1000094, '永兴社区', NULL, 5, '2021-09-17 16:09:15', '2021-09-18 10:02:39', NULL, NULL, '31.1524964232', '104.3964297764');
INSERT INTO `tbl_area_local`
VALUES (2000884, 1000095, '袁家村', NULL, 5, '2021-09-17 16:12:10', '2021-09-17 18:53:33', NULL, NULL, '30.4621434788', '103.7090956786');
INSERT INTO `tbl_area_local`
VALUES (2000885, 1000095, '东泰村', NULL, 5, '2021-09-17 16:12:18', '2021-09-17 18:54:24', NULL, NULL, '31.1399261745', '104.4398175901');
INSERT INTO `tbl_area_local`
VALUES (2000886, 1000095, '仙桥村', NULL, 5, '2021-09-17 16:13:29', '2021-09-17 18:54:49', NULL, NULL, '31.2021776400', '104.4105095509');
INSERT INTO `tbl_area_local`
VALUES (2000887, 1000095, '南华宫社区', NULL, 5, '2021-09-17 16:13:45', '2021-09-17 18:56:19', NULL, NULL, '31.2320560866', '104.4147445215');
INSERT INTO `tbl_area_local`
VALUES (2000888, 1000095, '孟家社区', NULL, 5, '2021-09-17 16:13:51', '2021-09-17 19:41:09', NULL, NULL, '31.2380160403', '104.4210951706');
INSERT INTO `tbl_area_local`
VALUES (2000889, 1000095, '新新社区', NULL, 5, '2021-09-17 16:14:02', '2021-09-17 19:41:44', NULL, NULL, '31.2392023249', '104.4174830569');
INSERT INTO `tbl_area_local`
VALUES (2000890, 1000095, '双原村', NULL, 5, '2021-09-17 16:14:09', '2021-09-17 18:56:45', NULL, NULL, '31.2230704986', '104.4070790894');
INSERT INTO `tbl_area_local`
VALUES (2000891, 1000095, '泰康村', NULL, 5, '2021-09-17 16:14:13', '2021-09-17 18:57:10', NULL, NULL, '31.2293497320,', '104.4160239352');
INSERT INTO `tbl_area_local`
VALUES (2000892, 1000095, '长平村', NULL, 5, '2021-09-17 16:14:18', '2021-09-17 18:57:39', NULL, NULL, '31.2317074758', '104.4203208340');
INSERT INTO `tbl_area_local`
VALUES (2000893, 1000095, '广平村', NULL, 5, '2021-09-17 16:14:26', '2021-09-17 18:58:05', NULL, NULL, '31.2292396414', '104.4092594041');
INSERT INTO `tbl_area_local`
VALUES (2000894, 1000095, '宏山村', NULL, 5, '2021-09-17 16:14:31', '2021-09-17 18:59:23', NULL, NULL, '31.1424682235', '104.4345051239');
INSERT INTO `tbl_area_local`
VALUES (2000895, 1000095, '胜华村', NULL, 5, '2021-09-17 16:14:37', '2021-09-17 18:59:54', NULL, NULL, '31.1330359810', '104.3854776356');
INSERT INTO `tbl_area_local`
VALUES (2000896, 1000095, '新龙村', NULL, 5, '2021-09-17 16:14:42', '2021-09-17 19:00:23', NULL, NULL, '31.2303900848', '104.4167537374');
INSERT INTO `tbl_area_local`
VALUES (2000897, 1000095, '三合村', NULL, 5, '2021-09-17 16:14:48', '2021-09-17 19:00:49', NULL, NULL, '31.2399658939', '104.4134637166');
INSERT INTO `tbl_area_local`
VALUES (2000898, 1000095, '红海村', NULL, 5, '2021-09-17 16:14:54', '2021-09-17 19:01:16', NULL, NULL, '31.2300836663', '104.4254009379');
INSERT INTO `tbl_area_local`
VALUES (2000899, 1000095, '大坝社区', NULL, 5, '2021-09-17 16:14:59', '2021-09-17 19:42:12', NULL, NULL, '31.2333129096', '104.4109652890');
INSERT INTO `tbl_area_local`
VALUES (2000900, 1000095, '滨河街社区', NULL, 5, '2021-09-17 16:15:32', '2021-09-17 19:42:38', NULL, NULL, '31.2420934054', '104.4290683987');
INSERT INTO `tbl_area_local`
VALUES (2000901, 1000096, '寿丰社区', NULL, 5, '2021-09-17 16:16:43', '2021-09-18 10:11:43', NULL, NULL, '31.1060638824', '104.4468698870');
INSERT INTO `tbl_area_local`
VALUES (2000902, 1000096, '新华社区', NULL, 5, '2021-09-17 16:16:49', '2021-09-18 10:14:40', NULL, NULL, '31.1369448022', '104.4449091865');
INSERT INTO `tbl_area_local`
VALUES (2000903, 1000096, '马鞍山社区', NULL, 5, '2021-09-17 16:16:55', '2021-09-18 10:15:24', NULL, NULL, '31.1326745302', '104.4343671537');
INSERT INTO `tbl_area_local`
VALUES (2000904, 1000096, '凯江社区', NULL, 5, '2021-09-17 16:17:01', '2021-09-18 10:16:48', NULL, NULL, '31.1336215601', '104.4192069459');
INSERT INTO `tbl_area_local`
VALUES (2000905, 1000096, '玉泉社区', NULL, 5, '2021-09-17 16:17:07', '2021-09-18 10:17:41', NULL, NULL, '31.1388787320', '104.4159643056');
INSERT INTO `tbl_area_local`
VALUES (2000906, 1000096, '黄河路社区', NULL, 5, '2021-09-17 16:17:13', '2021-09-18 10:19:00', NULL, NULL, '31.1488554608', '104.4211411588');
INSERT INTO `tbl_area_local`
VALUES (2000907, 1000096, '石桥社区', NULL, 5, '2021-09-17 16:17:19', '2021-09-18 10:20:07', NULL, NULL, '31.1538486842', '104.4177986248');
INSERT INTO `tbl_area_local`
VALUES (2000908, 1000096, '水库社区', NULL, 5, '2021-09-17 16:17:24', '2021-09-18 10:21:49', NULL, NULL, '31.1498175765', '104.4293993222');
INSERT INTO `tbl_area_local`
VALUES (2000909, 1000096, '镇江社区', NULL, 5, '2021-09-17 16:17:32', '2021-09-18 10:22:47', NULL, NULL, '31.1614962683', '104.4273071992');
INSERT INTO `tbl_area_local`
VALUES (2000910, 1000096, '拱桥社区', NULL, 5, '2021-09-17 16:17:38', '2021-09-18 10:25:54', NULL, NULL, '31.1650904771', '104.4176166425');
INSERT INTO `tbl_area_local`
VALUES (2000911, 1000096, '大地村', NULL, 5, '2021-09-17 16:17:44', '2021-09-17 19:02:06', NULL, NULL, '31.1025245676', '104.4673916975');
INSERT INTO `tbl_area_local`
VALUES (2000912, 1000096, '马鞍村', NULL, 5, '2021-09-17 16:17:50', '2021-09-17 19:02:52', NULL, NULL, '31.1025245676', '104.4673916975');
INSERT INTO `tbl_area_local`
VALUES (2000913, 1000096, '高槐村', NULL, 5, '2021-09-17 16:17:56', '2021-09-17 19:03:19', NULL, NULL, '31.1028369082', '104.4678959528');
INSERT INTO `tbl_area_local`
VALUES (2000914, 1000096, '新沟村', NULL, 5, '2021-09-17 16:18:02', '2021-09-17 19:03:48', NULL, NULL, '31.1054200817', '104.4672311171');
INSERT INTO `tbl_area_local`
VALUES (2000915, 1000097, '五星村', NULL, 5, '2021-09-17 16:24:01', '2021-09-17 19:04:27', NULL, NULL, '31.2460508226', '104.3641469325');
INSERT INTO `tbl_area_local`
VALUES (2000916, 1000097, '龙泉村', NULL, 5, '2021-09-17 16:24:06', '2021-09-17 19:05:32', NULL, NULL, '31.2137429208', '104.3661341177');
INSERT INTO `tbl_area_local`
VALUES (2000917, 1000097, '腾升社区', NULL, 5, '2021-09-17 16:24:11', '2021-09-17 19:43:46', NULL, NULL, '31.2460014983', '104.3566850238');
INSERT INTO `tbl_area_local`
VALUES (2000918, 1000097, '长江村', NULL, 5, '2021-09-17 16:24:17', '2021-09-17 19:06:04', NULL, NULL, '31.2137429208', '104.3661341177');
INSERT INTO `tbl_area_local`
VALUES (2000919, 1000097, '胜利村', NULL, 5, '2021-09-17 16:24:22', '2021-09-17 19:06:30', NULL, NULL, '31.2480469654', '104.3611964993');
INSERT INTO `tbl_area_local`
VALUES (2000920, 1000097, '红阳村', NULL, 5, '2021-09-17 16:24:27', '2021-09-17 19:06:55', NULL, NULL, '31.2470013061', '104.3611857705');
INSERT INTO `tbl_area_local`
VALUES (2000921, 1000097, '新玉村', NULL, 5, '2021-09-17 16:24:32', '2021-09-17 19:07:24', NULL, NULL, '31.2503125208', '104.3603301458');
INSERT INTO `tbl_area_local`
VALUES (2000922, 1000097, '星光村', NULL, 5, '2021-09-17 16:24:38', '2021-09-17 19:07:52', NULL, NULL, '31.2510489478', '104.3569800668');
INSERT INTO `tbl_area_local`
VALUES (2000923, 1000098, '歇月社区', NULL, 5, '2021-09-17 16:25:32', '2021-09-18 10:30:17', NULL, NULL, '31.1330452984', '104.3051462541');
INSERT INTO `tbl_area_local`
VALUES (2000924, 1000098, '景福社区', NULL, 5, '2021-09-17 16:25:41', '2021-09-18 10:33:18', NULL, NULL, '31.1320061425', '104.3073494896');
INSERT INTO `tbl_area_local`
VALUES (2000925, 1000098, '三元社区', NULL, 5, '2021-09-17 16:25:48', '2021-09-18 10:34:22', NULL, NULL, '31.1478957668', '104.3610670553');
INSERT INTO `tbl_area_local`
VALUES (2000926, 1000098, '段家坝社区', NULL, 5, '2021-09-17 16:25:54', '2021-09-18 10:49:41', NULL, NULL, '31.1309219161', '104.3635283827');
INSERT INTO `tbl_area_local`
VALUES (2000927, 1000098, '黄连桥社区', NULL, 5, '2021-09-17 16:26:01', '2021-09-18 10:53:46', NULL, NULL, '31.1218599067', '104.3568234419');
INSERT INTO `tbl_area_local`
VALUES (2000928, 1000098, '白鹤社区', NULL, 5, '2021-09-17 16:26:11', '2021-09-18 10:54:37', NULL, NULL, '31.1309186620', '104.3359707064');
INSERT INTO `tbl_area_local`
VALUES (2000929, 1000098, '天虹路社区', NULL, 5, '2021-09-17 16:26:17', '2021-09-18 10:55:31', NULL, NULL, '31.1243649194', '104.3350351846');
INSERT INTO `tbl_area_local`
VALUES (2000930, 1000098, '武庙社区', NULL, 5, '2021-09-17 16:26:26', '2021-09-18 10:56:25', NULL, NULL, '31.1211503279', '104.3338979280');
INSERT INTO `tbl_area_local`
VALUES (2000931, 1000098, '东河社区', NULL, 5, '2021-09-17 16:26:32', '2021-09-18 10:57:24', NULL, NULL, '31.1049287567', '104.3469763792');
INSERT INTO `tbl_area_local`
VALUES (2000932, 1000098, '王谊村', NULL, 5, '2021-09-17 16:26:37', '2021-09-17 19:08:51', NULL, NULL, '31.1810523353', '104.2790908439');
INSERT INTO `tbl_area_local`
VALUES (2000933, 1000098, '白江村', NULL, 5, '2021-09-17 16:26:42', '2021-09-17 19:09:52', NULL, NULL, '31.1792966028', '104.2834156793');
INSERT INTO `tbl_area_local`
VALUES (2000934, 1000098, '花景村', NULL, 5, '2021-09-17 16:26:48', '2021-09-17 19:10:57', NULL, NULL, '31.1350415066', '104.3286557348');
INSERT INTO `tbl_area_local`
VALUES (2000935, 1000098, '扬嘉村', NULL, 5, '2021-09-17 16:27:03', '2021-09-17 19:11:24', NULL, NULL, '31.1511675457', '104.3515738687');
INSERT INTO `tbl_area_local`
VALUES (2000936, 1000098, '嘉新社区', NULL, 5, '2021-09-17 16:27:09', '2021-09-18 10:59:00', NULL, NULL, '31.1806904993', '104.3213352368');
INSERT INTO `tbl_area_local`
VALUES (2000937, 1000098, '楠树村', NULL, 5, '2021-09-17 16:27:14', '2021-09-17 19:11:55', NULL, NULL, '31.1504880903', '104.3511205754');
INSERT INTO `tbl_area_local`
VALUES (2000938, 1000098, '青花村', NULL, 5, '2021-09-17 16:27:20', '2021-09-17 19:12:24', NULL, NULL, '31.1442984526', '104.3308047718');
INSERT INTO `tbl_area_local`
VALUES (2000939, 1000098, '丰城村', NULL, 5, '2021-09-17 16:27:26', '2021-09-17 19:12:52', NULL, NULL, '31.1283634002', '104.3364109769');
INSERT INTO `tbl_area_local`
VALUES (2000940, 1000098, '新隆村', NULL, 5, '2021-09-17 16:27:32', '2021-09-17 19:13:22', NULL, NULL, '31.1103921451', '104.3342864554');
INSERT INTO `tbl_area_local`
VALUES (2000941, 1000099, '南平村', NULL, 5, '2021-09-17 16:28:24', '2021-09-17 19:14:29', NULL, NULL, '31.3029736020', '104.3291381785');
INSERT INTO `tbl_area_local`
VALUES (2000942, 1000099, '镇元桥村', NULL, 5, '2021-09-17 16:28:30', '2021-09-17 19:15:08', NULL, NULL, '31.2476992577', '104.3137684333');
INSERT INTO `tbl_area_local`
VALUES (2000943, 1000099, '红花村', NULL, 5, '2021-09-17 16:28:35', '2021-09-17 19:15:32', NULL, NULL, '31.2985799951', '104.3492293743');
INSERT INTO `tbl_area_local`
VALUES (2000944, 1000099, '松柏村', NULL, 5, '2021-09-17 16:28:41', '2021-09-17 19:16:22', NULL, NULL, '31.3011768412', '104.3789950797');
INSERT INTO `tbl_area_local`
VALUES (2000945, 1000099, '隆兴桥村', NULL, 5, '2021-09-17 16:28:47', '2021-09-17 19:16:50', NULL, NULL, '31.3396700237', '104.3457958099');
INSERT INTO `tbl_area_local`
VALUES (2000946, 1000099, '清和村', NULL, 5, '2021-09-17 16:28:53', '2021-09-17 19:17:36', NULL, NULL, '31.2919683892', '104.3345701378');
INSERT INTO `tbl_area_local`
VALUES (2000947, 1000099, '凤泉社区', NULL, 5, '2021-09-17 16:28:58', '2021-09-17 19:39:45', NULL, NULL, '31.3028220982', '104.3331259438');
INSERT INTO `tbl_area_local`
VALUES (2000948, 1000100, '红雨社区', NULL, 5, '2021-09-17 16:29:25', '2021-09-18 11:00:56', NULL, NULL, '31.1311296447', '104.3824359582');
INSERT INTO `tbl_area_local`
VALUES (2000949, 1000100, '文昌社区', NULL, 5, '2021-09-17 16:29:31', '2021-09-18 11:11:11', NULL, NULL, '31.1443352158', '104.3959437937');
INSERT INTO `tbl_area_local`
VALUES (2000950, 1000100, '文庙社区', NULL, 5, '2021-09-17 16:29:37', '2021-09-18 11:12:19', NULL, NULL, '31.1276216691', '104.3897854418');
INSERT INTO `tbl_area_local`
VALUES (2000951, 1000100, '光华社区', NULL, 5, '2021-09-17 16:29:42', '2021-09-18 11:13:14', NULL, NULL, '31.1290701531', '104.3972949424');
INSERT INTO `tbl_area_local`
VALUES (2000952, 1000100, '堰塘坝社区', NULL, 5, '2021-09-17 16:29:48', '2021-09-18 11:14:39', NULL, NULL, '31.1347516613', '104.3888788783');
INSERT INTO `tbl_area_local`
VALUES (2000953, 1000100, '米市坝社区', NULL, 5, '2021-09-17 16:29:53', '2021-09-18 11:15:36', NULL, NULL, '31.1339894372', '104.3901556098');
INSERT INTO `tbl_area_local`
VALUES (2000954, 1000100, '西小区社区', NULL, 5, '2021-09-17 16:29:59', '2021-09-18 11:16:29', NULL, NULL, '31.1308649046', '104.3876343333');
INSERT INTO `tbl_area_local`
VALUES (2000955, 1000100, '陕西馆社区', NULL, 5, '2021-09-17 16:30:04', '2021-09-18 11:17:14', NULL, NULL, '31.1327016393', '104.3932079637');
INSERT INTO `tbl_area_local`
VALUES (2000956, 1000100, '平安社区', NULL, 5, '2021-09-17 16:30:10', '2021-09-18 11:20:26', NULL, NULL, '31.1226358965', '104.3890022599');
INSERT INTO `tbl_area_local`
VALUES (2000957, 1000100, '丁香巷社区', NULL, 5, '2021-09-17 16:30:16', '2021-09-18 11:21:33', NULL, NULL, '31.1171066309', '104.3895601594');
INSERT INTO `tbl_area_local`
VALUES (2000958, 1000100, '南塔社区', NULL, 5, '2021-09-17 16:30:21', '2021-09-18 11:23:09', NULL, NULL, '31.1085071269', '104.3854052623');
INSERT INTO `tbl_area_local`
VALUES (2000959, 1000100, '香山巷社区', NULL, 5, '2021-09-17 16:30:29', '2021-09-18 11:24:14', NULL, NULL, '31.1275751945', '104.3861562808');
INSERT INTO `tbl_area_local`
VALUES (2000960, 1000100, '华山南路社区', NULL, 5, '2021-09-17 16:30:35', '2021-09-18 11:25:20', NULL, NULL, '31.1260322564', '104.3709857066');
INSERT INTO `tbl_area_local`
VALUES (2000961, 1000100, '花园巷社区', NULL, 5, '2021-09-17 16:30:41', '2021-09-18 11:26:03', NULL, NULL, '31.1252883308', '104.3889833291');
INSERT INTO `tbl_area_local`
VALUES (2000962, 1000100, '舟山社区', NULL, 5, '2021-09-17 16:30:48', '2021-09-18 11:26:50', NULL, NULL, '31.1196528762', '104.3860015512');
INSERT INTO `tbl_area_local`
VALUES (2000963, 1000100, '怡安社区', NULL, 5, '2021-09-17 16:30:53', '2021-09-18 11:27:51', NULL, NULL, '31.1102838691', '104.3855831266');
INSERT INTO `tbl_area_local`
VALUES (2000964, 1000100, '桃园社区', NULL, 5, '2021-09-17 16:30:59', '2021-09-18 11:28:48', NULL, NULL, '31.1249983070', '104.3812164903');
INSERT INTO `tbl_area_local`
VALUES (2000965, 1000100, '沙河街社区', NULL, 5, '2021-09-17 16:31:04', '2021-09-18 11:29:57', NULL, NULL, '31.1149133764', '104.3957111479');
INSERT INTO `tbl_area_local`
VALUES (2000966, 1000100, '蒲东社区', NULL, 5, '2021-09-17 16:31:11', '2021-09-18 11:30:36', NULL, NULL, '31.1187684644', '104.3990698945');
INSERT INTO `tbl_area_local`
VALUES (2000967, 1000100, '辽河街社区', NULL, 5, '2021-09-17 16:31:16', '2021-09-18 11:31:25', NULL, NULL, '31.1193011891', '104.3700483930');
INSERT INTO `tbl_area_local`
VALUES (2000968, 1000101, '安安社区', NULL, 5, '2021-09-17 16:32:15', '2021-09-17 19:37:23', NULL, NULL, '31.2468977504', '104.2788416375');
INSERT INTO `tbl_area_local`
VALUES (2000969, 1000101, '高桥村', NULL, 5, '2021-09-17 16:32:20', '2021-09-17 19:18:17', NULL, NULL, '31.2467086297', '104.3125131595');
INSERT INTO `tbl_area_local`
VALUES (2000970, 1000101, '菖蒲村', NULL, 5, '2021-09-17 16:32:26', '2021-09-17 19:19:03', NULL, NULL, '31.2758866425', '104.3105769312');
INSERT INTO `tbl_area_local`
VALUES (2000971, 1000101, '农鲤村', NULL, 5, '2021-09-17 16:32:31', '2021-09-17 19:19:25', NULL, NULL, '31.2417793507', '104.2902463903');
INSERT INTO `tbl_area_local`
VALUES (2000972, 1000101, '涌泉村', NULL, 5, '2021-09-17 16:32:36', '2021-09-17 19:19:51', NULL, NULL, '31.2434855148', '104.2753011216');
INSERT INTO `tbl_area_local`
VALUES (2000973, 1000101, '江河村', NULL, 5, '2021-09-17 16:32:42', '2021-09-17 19:20:21', NULL, NULL, '31.2351949413', '104.2940578546');
INSERT INTO `tbl_area_local`
VALUES (2000974, 1000101, '五会村', NULL, 5, '2021-09-17 16:32:47', '2021-09-17 19:20:43', NULL, NULL, '31.2301439460', '104.2995186442');
INSERT INTO `tbl_area_local`
VALUES (2000975, 1000101, '民安村', NULL, 5, '2021-09-17 16:32:52', '2021-09-17 19:21:07', NULL, NULL, '31.2464625607', '104.2681283033');
INSERT INTO `tbl_area_local`
VALUES (2000976, 1000101, '黎郎村', NULL, 5, '2021-09-17 16:32:57', '2021-09-17 19:21:40', NULL, NULL, '31.2670159301', '104.3212564246');
INSERT INTO `tbl_area_local`
VALUES (2000977, 1000101, '桂花街社区', NULL, 5, '2021-09-17 16:33:03', '2021-09-17 19:37:55', NULL, NULL, '31.2446596312', '104.2762452592');
INSERT INTO `tbl_area_local`
VALUES (2000978, 1000101, '阳安路社区', NULL, 5, '2021-09-17 16:33:09', '2021-09-17 19:38:23', NULL, NULL, '31.2486221666', '104.2887979974');
INSERT INTO `tbl_area_local`
VALUES (2000979, 1000101, '正阳街社区', NULL, 5, '2021-09-17 16:33:15', '2021-09-17 19:38:53', NULL, NULL, '31.2372110824', '104.2913300027');
INSERT INTO `tbl_area_local`
VALUES (2000980, 1000102, '沂河社区', NULL, 5, '2021-09-17 16:33:42', '2021-09-18 11:32:45', NULL, NULL, '31.1310203746', '104.4101205956');
INSERT INTO `tbl_area_local`
VALUES (2000981, 1000102, '春锦社区', NULL, 5, '2021-09-17 16:33:47', '2021-09-18 11:33:49', NULL, NULL, '31.1204461001', '104.4165826261');
INSERT INTO `tbl_area_local`
VALUES (2000982, 1000102, '东山社区', NULL, 5, '2021-09-17 16:33:52', '2021-09-18 11:34:39', NULL, NULL, '31.1268935903', '104.4200694978');
INSERT INTO `tbl_area_local`
VALUES (2000983, 1000102, '旌湖社区', NULL, 5, '2021-09-17 16:33:57', '2021-09-18 11:36:01', NULL, NULL, '31.1183703192', '104.4087398469');
INSERT INTO `tbl_area_local`
VALUES (2000984, 1000102, '乐安社区', NULL, 5, '2021-09-17 16:34:02', '2021-09-18 11:37:24', NULL, NULL, '31.0965122804', '104.4059321014');
INSERT INTO `tbl_area_local`
VALUES (2000985, 1000102, '龙井社区', NULL, 5, '2021-09-17 16:34:06', '2021-09-18 11:38:48', NULL, NULL, '31.1142968145', '104.4177767364');
INSERT INTO `tbl_area_local`
VALUES (2000986, 1000102, '天山社区', NULL, 5, '2021-09-17 16:34:11', '2021-09-18 11:40:14', NULL, NULL, '31.1257475259', '104.4084395727');
INSERT INTO `tbl_area_local`
VALUES (2000987, 1000102, '沱江社区', NULL, 5, '2021-09-17 16:34:16', '2021-09-18 11:41:28', NULL, NULL, '31.0941826295', '104.4060129368');
INSERT INTO `tbl_area_local`
VALUES (2000988, 1000103, '千佛社区', NULL, 5, '2021-09-17 16:34:40', '2021-09-18 11:43:35', NULL, NULL, '31.1077412453', '104.3621427262');
INSERT INTO `tbl_area_local`
VALUES (2000989, 1000103, '衡山路社区', NULL, 5, '2021-09-17 16:34:44', '2021-09-18 11:44:31', NULL, NULL, '31.1088435589', '104.3717557633');
INSERT INTO `tbl_area_local`
VALUES (2000990, 1000103, '东升社区', NULL, 5, '2021-09-17 16:34:49', '2021-09-18 11:46:29', NULL, NULL, '31.0893307163', '104.3756396019');
INSERT INTO `tbl_area_local`
VALUES (2000991, 1000103, '工农社区', NULL, 5, '2021-09-17 16:34:56', '2021-09-18 11:47:21', NULL, NULL, '31.0940148921', '104.3809453182');
INSERT INTO `tbl_area_local`
VALUES (2000992, 1000103, '蒙南路社区', NULL, 5, '2021-09-17 16:35:01', '2021-09-18 11:48:07', NULL, NULL, '31.0835407609', '104.3896131148');
INSERT INTO `tbl_area_local`
VALUES (2000993, 1000103, '旌南社区', NULL, 5, '2021-09-17 16:35:07', '2021-09-18 11:49:02', NULL, NULL, '31.1014645601', '104.3828968634');
INSERT INTO `tbl_area_local`
VALUES (2000994, 1000103, '岷山路社区', NULL, 5, '2021-09-17 16:35:13', '2021-09-18 11:49:59', NULL, NULL, '31.0987452853', '104.3791846861');
INSERT INTO `tbl_area_local`
VALUES (2000995, 1000103, '雅河路社区', NULL, 5, '2021-09-17 16:35:19', '2021-09-18 11:51:03', NULL, NULL, '31.1063884540', '104.3825964560');
INSERT INTO `tbl_area_local`
VALUES (2000996, 1000103, '泰山南路社区', NULL, 5, '2021-09-17 16:35:25', '2021-09-18 11:52:24', NULL, NULL, '31.1044777195', '104.3915228476');
INSERT INTO `tbl_area_local`
VALUES (2000997, 1000103, '松花江路社区', NULL, 5, '2021-09-17 16:35:30', '2021-09-18 11:53:28', NULL, NULL, '31.1001784263', '104.3720607390');
INSERT INTO `tbl_area_local`
VALUES (2000998, 1000103, '宝峰寺社区', NULL, 5, '2021-09-17 16:35:36', '2021-09-18 11:54:34', NULL, NULL, '31.0953277080', '104.3539933791');
INSERT INTO `tbl_area_local`
VALUES (2000999, 1000103, '柳沙社区', NULL, 5, '2021-09-17 16:35:41', '2021-09-18 11:58:49', NULL, NULL, '31.0746611499', '104.3871669402');
INSERT INTO `tbl_area_local`
VALUES (2001000, 1000103, '柳风社区', NULL, 5, '2021-09-17 16:35:46', '2021-09-18 11:59:59', NULL, NULL, '31.0621409639', '104.3969314742');
INSERT INTO `tbl_area_local`
VALUES (2001001, 1000103, '梨园社区', NULL, 5, '2021-09-17 16:35:51', '2021-09-18 12:01:29', NULL, NULL, '31.0679980620', '104.3979185271');
INSERT INTO `tbl_area_local`
VALUES (2001002, 1000103, '双榕社区', NULL, 5, '2021-09-17 16:35:55', '2021-09-18 12:02:41', NULL, NULL, '31.0679061635', '104.3917494464');
INSERT INTO `tbl_area_local`
VALUES (2001003, 1000103, '大汉社区', NULL, 5, '2021-09-17 16:36:01', '2021-09-18 12:03:19', NULL, NULL, '31.0659946551', '104.3980472732');
INSERT INTO `tbl_area_local`
VALUES (2001004, 1000103, '福家社区', NULL, 5, '2021-09-17 16:36:06', '2021-09-18 12:04:33', NULL, NULL, '31.0700202486', '104.3956552595');
INSERT INTO `tbl_area_local`
VALUES (2001005, 1000103, '宝凤社区', NULL, 5, '2021-09-17 16:36:11', '2021-09-18 12:05:45', NULL, NULL, '31.0455358765', '104.4127462954');
INSERT INTO `tbl_area_local`
VALUES (2001006, 1000103, '双圣社区', NULL, 5, '2021-09-17 16:36:16', '2021-09-18 12:06:39', NULL, NULL, '31.0591758462', '104.4176821155');
INSERT INTO `tbl_area_local`
VALUES (2001007, 1000103, '隆圣社区', NULL, 5, '2021-09-17 16:36:22', '2021-09-18 12:07:31', NULL, NULL, '31.0744070297', '104.4084370822');
INSERT INTO `tbl_area_local`
VALUES (2001008, 1000022, '裕丰村', NULL, 5, '2021-10-21 10:46:32', '2021-10-21 10:46:32', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2001009, 1000022, '立新村', NULL, 5, '2021-10-26 09:24:21', '2021-10-26 09:24:21', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2001010, 1000022, '陈南村', NULL, 5, '2021-10-28 14:21:10', '2021-10-28 14:21:10', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2001011, 1000022, '裕西村', NULL, 5, '2021-10-28 15:38:19', '2021-10-28 15:38:19', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2001012, 1000104, 'test村', NULL, 5, '2021-12-28 20:48:49', '2021-12-28 20:48:49', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2001013, 1000126, '测试村111', NULL, 5, '2022-01-19 17:29:03', '2022-01-19 17:29:03', NULL, NULL, '', '');
INSERT INTO `tbl_area_local`
VALUES (2001014, 1000128, '测试村111', NULL, 5, '2022-01-20 15:44:42', '2022-01-20 15:44:42', NULL, NULL, '', '');

-- ----------------------------
-- Table structure for tbl_company_show_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_company_show_config`;
CREATE TABLE `tbl_company_show_config`
(
    `company_id`          bigint(20) NOT NULL COMMENT '企业id',
    `company_logo_name`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业logo名称',
    `company_logo_url`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '企业logo地址',
    `company_logo_url2`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'logo图片2',
    `company_favicon_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面图标地址',
    `login_url`           varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录页地址',
    `home_url`            varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '官网路径',
    `create_time`         datetime NULL DEFAULT NULL,
    `update_time`         datetime NULL DEFAULT NULL,
    `hidden_menu_type`    int(11) NOT NULL DEFAULT 0 COMMENT '隐藏菜单值，位运算，取值为以下取值的和：1-客户，2-宅配，4-订单，8-农场秀，16-库存，32-统计，64-物联网，128-教程，256-统计概览',
    `show_menu_type`      int(11) NOT NULL DEFAULT 0 COMMENT '显示菜单值，位运算，取值为以下取值的和：1-大宗供销管理，2-遥感，'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业页面显示配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_company_show_config
-- ----------------------------
INSERT INTO `tbl_company_show_config`
VALUES (1488, '熊猫溯源', 'http://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/8afbf026-cd5f-48f2-8a61-45f15158133f.png',
        'http://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/6f447f28-832b-412f-abb7-202ddca4cacd.png',
        'http://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/22780937-4b4d-4716-886e-18355cac478c.ico', 'pandalogin.html', 'pandatts.html',
        '2019-04-30 17:24:16', '2021-07-26 17:54:19', 0, 0);
INSERT INTO `tbl_company_show_config`
VALUES (1247, '啦啦啦啦', 'http://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/55e768fc-bae7-457d-b500-9fbbe2c50c08.png',
        'http://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/4c25d925-a5fc-4336-818a-2cd6ae0edf3b.png',
        'http://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/542f56b5-281f-49de-8f63-1145ebf7b561.ico', 'pandalogin.html', 'pandatts.html',
        '2019-05-10 12:02:43', '2019-05-13 18:40:37', 146, 3);
INSERT INTO `tbl_company_show_config`
VALUES (1068, '熊猫溯源', 'https://snkoudai.oss-cn-hangzhou.aliyuncs.com/snkoudai/60ffa388-ce2d-4334-8e1a-1f6a5d273f0e.png',
        'https://snkoudai.oss-cn-hangzhou.aliyuncs.com/snkoudai/b6f3e11c-35ea-4447-81d1-f0c7ba1ce741.png',
        'https://snkoudai.oss-cn-hangzhou.aliyuncs.com/snkoudai/f6377a18-c1b3-4e4b-8d8a-25b4f4246ef0.ico', 'pandalogin.html', 'pandatts.html',
        '2019-05-14 15:40:13', '2019-05-14 15:42:27', 64, 3);
INSERT INTO `tbl_company_show_config`
VALUES (1069, '555', 'https://snkoudai.oss-cn-hangzhou.aliyuncs.com/snkoudai/0b322506-9a9e-4103-9a0b-0a8865350076.png',
        'https://snkoudai.oss-cn-hangzhou.aliyuncs.com/snkoudai/cccf56bc-b478-43f3-befc-e121cb091a4c.png',
        'https://snkoudai.oss-cn-hangzhou.aliyuncs.com/snkoudai/81f38d21-27e9-4532-80f5-0d6e4e96fc78.ico', 'pandalogin.html', 'pandatts.html',
        '2019-05-14 16:52:00', '2019-05-14 16:53:31', 96, 3);

-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `role_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
    `role_desc`        varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色描述',
    `role_detail`      varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色详细描述',
    `muti_choose_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否可多选：1-多选，0-单选',
    `admin_flag`       tinyint(4) NOT NULL DEFAULT 0 COMMENT '系统数据:1-系统数据，0-非系统数据',
    `sort_num`         int(11) NULL DEFAULT NULL COMMENT '排序字段，越小越靠前',
    `farm_flag`        tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否管理所有农场;1-是，0-不是',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_role
-- ----------------------------
INSERT INTO `tbl_role`
VALUES (1, '超级管理员', '可管理企业和所有农场数据', '管理所有农场、邀请员工加入、删除企业、移交企业', 0, 1, 1, 1);
INSERT INTO `tbl_role`
VALUES (2, '管理员', '管理所有农场(最高权限)', '管理所有农场、邀请员工加入、管理农事任务、管理劳作人', 0, 0, 2, 1);
INSERT INTO `tbl_role`
VALUES (3, '总监', '管理指定农场', '管理指定农场、邀请员工加入、管理农事任务、管理劳作人', 0, 0, 3, 0);
INSERT INTO `tbl_role`
VALUES (4, '销售人员', '客户|订单', '管理客户和订单', 0, 0, 4, 1);
INSERT INTO `tbl_role`
VALUES (5, '客服', '客户|订单', '管理客户和订单', 0, 0, 5, 1);
INSERT INTO `tbl_role`
VALUES (6, '农机仓库负责人', '地块|种植品种|生产任务', '管理农机领用、借出和归还', 1, 0, 6, 0);
INSERT INTO `tbl_role`
VALUES (7, '农资仓库负责人', '农资库存', '管理农资出库、入库', 1, 0, 7, 0);
INSERT INTO `tbl_role`
VALUES (8, '中队长', '监管农事作业作业质量', '管理农事任务、邀请小队长、管理劳作人', 0, 0, 8, 0);
INSERT INTO `tbl_role`
VALUES (9, '小队长', '执行领导安排的农事作业活动', '执行农事任务、提交农事任务完成情况', 0, 0, 9, 0);

-- ----------------------------
-- Table structure for tbl_role_resource_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_resource_ref`;
CREATE TABLE `tbl_role_resource_ref`
(
    `role_id`     bigint(20) NULL DEFAULT NULL COMMENT '角色id',
    `resource_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色资源关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_role_resource_ref
-- ----------------------------
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 4);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 36);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 43);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 56);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 200);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 202);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 205);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 206);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 209);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 144);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 145);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 87);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 89);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 90);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 106);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 107);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 108);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 109);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 110);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 111);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 112);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 113);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 114);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 116);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 118);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 119);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 120);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 121);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 128);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 129);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 130);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (4, 136);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 4);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 243);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 36);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 43);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 56);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 200);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 201);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 202);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 203);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 204);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 205);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 206);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 208);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 209);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 210);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 211);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 212);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 213);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 214);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 215);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 216);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 217);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 218);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 220);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 221);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 222);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 223);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 241);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 242);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 226);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 227);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 228);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 229);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 230);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 231);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 232);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 233);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 240);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 234);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 235);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 236);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 237);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 238);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 239);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 144);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 145);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 87);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 89);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 90);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 106);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 107);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 108);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 109);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 110);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 111);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 112);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 113);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 114);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 116);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 118);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 119);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 120);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 121);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 128);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 129);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 130);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (5, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 4);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 6);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 131);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 142);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 157);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 158);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 159);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 160);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 10);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 11);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 12);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 13);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 19);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 20);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 22);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 23);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 24);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 25);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 28);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 29);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 30);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 243);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 31);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 32);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 33);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 34);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 35);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 36);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 37);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 193);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 41);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 42);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 43);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 47);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 48);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 49);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 177);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 178);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 179);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 182);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 53);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 54);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 55);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 163);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 164);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 56);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 173);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 174);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 175);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 200);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 201);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 202);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 203);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 204);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 205);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 208);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 209);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 210);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 211);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 212);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 213);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 244);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 214);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 215);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 216);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 220);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 245);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 221);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 222);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 223);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 226);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 227);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 228);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 229);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 230);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 231);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 232);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 233);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 234);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 235);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 236);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 237);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 238);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 239);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 59);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 165);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 60);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 63);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 166);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 64);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 167);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 132);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 153);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 154);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 66);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 169);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 68);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 170);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 70);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 161);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 162);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 72);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 73);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 74);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 75);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 77);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 78);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 79);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 168);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 81);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 144);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 145);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 148);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 150);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 151);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 152);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 189);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 156);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 180);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 181);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 184);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 185);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 186);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 191);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 192);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 188);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 87);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 89);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 90);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 91);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 96);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 97);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 98);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 99);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 134);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 135);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 106);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 107);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 108);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 109);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 110);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 111);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 112);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 113);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 114);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 116);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 118);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 119);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 120);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 121);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 128);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 129);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 130);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 125);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 126);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 127);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 136);
INSERT INTO `tbl_role_resource_ref`
VALUES (2, 246);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 4);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 6);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 131);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 142);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 157);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 7);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 158);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 159);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 160);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 10);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 11);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 12);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 13);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 19);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 20);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 22);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 23);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 24);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 25);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 27);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 28);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 29);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 30);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 243);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 31);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 32);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 33);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 34);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 35);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 36);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 37);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 193);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 41);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 42);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 43);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 47);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 48);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 49);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 177);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 178);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 179);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 182);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 53);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 54);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 55);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 163);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 164);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 56);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 173);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 174);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 175);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 200);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 201);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 202);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 203);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 204);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 205);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 208);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 212);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 226);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 246);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 227);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 231);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 234);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 235);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 236);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 237);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 238);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 239);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 59);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 165);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 60);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 63);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 166);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 64);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 167);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 132);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 153);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 154);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 66);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 169);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 68);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 170);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 70);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 161);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 162);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 72);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 73);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 74);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 75);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 77);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 78);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 79);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 168);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 81);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 144);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 145);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 148);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 150);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 151);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 152);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 189);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 156);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 180);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 181);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 184);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 185);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 186);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 191);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 192);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 188);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 87);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 89);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 90);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 91);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 96);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 97);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 98);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 99);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 134);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 135);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 106);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 107);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 108);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 109);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 110);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 111);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 112);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 113);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 114);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 116);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 118);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 119);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 120);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 121);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 128);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 129);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 130);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 125);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 126);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 127);
INSERT INTO `tbl_role_resource_ref`
VALUES (8, 136);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 28);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 243);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 32);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 33);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 41);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 49);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 177);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 179);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 182);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 173);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 174);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 175);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 213);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 244);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 214);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 215);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 216);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 226);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 246);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 227);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 228);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 229);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 230);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 231);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 232);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 233);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 234);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 235);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 238);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 59);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 165);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 60);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 63);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 166);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 64);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 167);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 132);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 153);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 154);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 66);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 169);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 72);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 73);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 74);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 75);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 77);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 78);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 79);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 168);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 81);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 148);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 150);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 151);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 152);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 156);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 184);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 185);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 186);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 191);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 192);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 188);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 134);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (6, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 4);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 28);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 243);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 32);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 33);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 47);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 48);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 49);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 177);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 178);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 179);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 182);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 56);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 220);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 245);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 221);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 222);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 223);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 246);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 227);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 234);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 235);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 238);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 148);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 150);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 151);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 152);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 188);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 91);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 134);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (7, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 4);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 6);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 131);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 142);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 157);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 7);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 158);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 159);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 160);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 10);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 11);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 12);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 13);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 19);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 20);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 22);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 23);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 24);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 25);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 27);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 28);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 29);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 30);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 243);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 31);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 32);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 33);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 34);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 35);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 36);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 37);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 193);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 41);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 42);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 43);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 47);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 48);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 49);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 177);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 178);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 179);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 182);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 53);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 54);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 55);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 163);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 164);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 56);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 173);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 174);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 175);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 200);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 201);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 205);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 209);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 210);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 211);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 226);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 246);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 227);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 231);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 234);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 235);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 238);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 59);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 165);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 60);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 63);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 166);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 64);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 167);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 132);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 153);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 154);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 66);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 169);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 68);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 170);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 70);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 161);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 162);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 72);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 73);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 74);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 75);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 77);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 78);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 79);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 168);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 81);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 144);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 145);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 148);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 150);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 151);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 152);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 189);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 156);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 180);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 181);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 184);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 185);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 186);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 191);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 192);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 188);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 87);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 89);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 90);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 91);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 96);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 97);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 98);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 99);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 134);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 135);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 106);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 107);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 108);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 109);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 110);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 111);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 112);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 113);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 114);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 116);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 118);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 119);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 120);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 121);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 128);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 129);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 130);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 125);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 126);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 127);
INSERT INTO `tbl_role_resource_ref`
VALUES (9, 136);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 4);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 158);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 159);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 160);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 10);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 11);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 12);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 13);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 19);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 20);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 22);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 23);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 24);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 28);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 29);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 30);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 243);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 31);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 32);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 33);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 34);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 35);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 36);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 43);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 47);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 48);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 49);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 177);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 178);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 179);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 182);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 53);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 54);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 55);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 163);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 164);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 56);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 173);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 174);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 175);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 200);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 201);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 202);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 203);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 204);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 205);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 208);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 209);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 210);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 211);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 212);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 213);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 244);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 214);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 215);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 216);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 220);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 245);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 221);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 222);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 223);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 226);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 246);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 227);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 228);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 229);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 230);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 231);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 232);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 233);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 234);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 235);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 236);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 237);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 238);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 239);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 59);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 165);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 60);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 63);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 166);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 64);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 167);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 132);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 153);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 154);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 66);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 169);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 68);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 170);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 70);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 161);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 162);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 72);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 73);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 74);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 75);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 77);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 78);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 79);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 168);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 81);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 144);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 145);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 148);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 150);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 151);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 152);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 189);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 156);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 180);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 181);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 184);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 185);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 186);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 191);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 192);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 188);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 87);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 89);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 90);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 91);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 96);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 97);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 98);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 99);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 134);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 135);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 106);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 107);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 108);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 109);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 110);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 111);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 112);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 113);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 114);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 116);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 118);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 119);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 120);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 121);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 125);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 126);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 127);
INSERT INTO `tbl_role_resource_ref`
VALUES (3, 136);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 1);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 2);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 3);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 4);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 5);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 6);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 131);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 142);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 157);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 7);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 158);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 159);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 160);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 8);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 9);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 10);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 11);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 12);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 13);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 14);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 15);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 16);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 17);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 18);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 19);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 20);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 21);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 22);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 23);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 24);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 25);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 26);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 27);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 28);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 29);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 30);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 243);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 31);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 32);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 33);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 34);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 35);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 36);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 37);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 38);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 193);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 39);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 40);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 41);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 42);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 43);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 44);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 45);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 46);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 47);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 48);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 49);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 50);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 177);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 178);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 179);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 182);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 51);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 52);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 53);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 54);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 55);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 163);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 164);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 56);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 171);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 172);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 173);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 174);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 175);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 176);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 200);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 201);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 202);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 203);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 204);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 205);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 208);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 209);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 210);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 211);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 212);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 213);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 244);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 214);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 215);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 216);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 220);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 245);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 221);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 222);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 223);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 226);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 246);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 227);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 228);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 229);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 230);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 231);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 232);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 233);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 234);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 235);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 236);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 237);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 238);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 239);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 57);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 58);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 59);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 165);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 60);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 61);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 62);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 63);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 166);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 64);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 167);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 132);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 153);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 154);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 65);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 66);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 169);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 67);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 68);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 170);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 69);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 70);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 161);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 162);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 71);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 72);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 73);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 74);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 75);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 76);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 77);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 78);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 79);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 168);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 80);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 81);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 82);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 83);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 137);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 138);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 139);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 140);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 143);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 144);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 145);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 146);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 147);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 148);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 149);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 150);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 151);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 152);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 189);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 155);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 156);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 180);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 181);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 183);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 184);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 185);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 186);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 191);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 192);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 187);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 188);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 84);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 85);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 86);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 87);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 88);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 89);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 90);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 91);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 92);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 93);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 94);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 95);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 96);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 97);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 98);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 99);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 133);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 134);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 135);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 100);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 101);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 102);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 103);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 104);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 105);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 106);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 107);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 108);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 109);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 110);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 111);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 112);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 113);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 114);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 115);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 116);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 117);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 118);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 119);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 120);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 121);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 128);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 129);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 130);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 122);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 123);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 124);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 125);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 126);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 127);
INSERT INTO `tbl_role_resource_ref`
VALUES (1, 136);

SET
FOREIGN_KEY_CHECKS = 1;

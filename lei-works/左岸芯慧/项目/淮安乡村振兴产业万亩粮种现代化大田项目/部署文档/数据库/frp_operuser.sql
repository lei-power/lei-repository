SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_operate_login_banner
-- ----------------------------
DROP TABLE IF EXISTS `tbl_operate_login_banner`;
CREATE TABLE `tbl_operate_login_banner`
(
    `id`                 bigint(20)                                            NOT NULL AUTO_INCREMENT,
    `logo1`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '背景图',
    `logo2`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '前景图',
    `sort_num`           int(10)                                               NULL DEFAULT NULL COMMENT '排序',
    `operate_subject_id` bigint(20)                                            NULL DEFAULT NULL COMMENT '主体id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '运营商主体登录banner'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_operate_rank_change_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_operate_rank_change_record`;
CREATE TABLE `tbl_operate_rank_change_record`
(
    `id`                       bigint(20)                                                   NOT NULL COMMENT '主键id',
    `operate_subject_id`       bigint(20)                                                   NULL DEFAULT NULL COMMENT '运营商 主体表id',
    `operate_type`             tinyint(4)                                                   NULL DEFAULT NULL COMMENT '操作类型  0：运营平台  1：运营商   2：企业',
    `before_rank_open_flag`    tinyint(4)                                                   NULL DEFAULT NULL COMMENT '记录上一次等级开关',
    `before_free_farm_num`     int(11)                                                      NULL DEFAULT NULL COMMENT '记录上一次免费版农场数量',
    `before_free_user_num`     int(11)                                                      NULL DEFAULT NULL COMMENT '记录上一次免费版人员数量',
    `before_charge_farm_num`   int(11)                                                      NULL DEFAULT NULL COMMENT '记录上一次收费版农场数量',
    `before_charge_user_num`   int(11)                                                      NULL DEFAULT NULL COMMENT '记录上一次收费版人员数量',
    `before_flagship_farm_num` int(11)                                                      NULL DEFAULT NULL COMMENT '记录上一次旗舰版农场数量',
    `before_flagship_user_num` int(11)                                                      NULL DEFAULT NULL COMMENT '记录上一次旗舰版人员数量',
    `after_rank_open_flag`     tinyint(4)                                                   NULL DEFAULT NULL COMMENT '记录这次等级开关',
    `after_free_farm_num`      int(11)                                                      NULL DEFAULT NULL COMMENT '记录这次免费版农场数量',
    `after_free_user_num`      int(11)                                                      NULL DEFAULT NULL COMMENT '记录这次免费版人员数量',
    `after_charge_farm_num`    int(11)                                                      NULL DEFAULT NULL COMMENT '记录这次收费版农场数量',
    `after_charge_user_num`    int(11)                                                      NULL DEFAULT NULL COMMENT '记录这次收费版人员数量',
    `after_flagship_farm_num`  int(11)                                                      NULL DEFAULT NULL COMMENT '记录这次旗舰版农场数量',
    `after_flagship_user_num`  int(11)                                                      NULL DEFAULT NULL COMMENT '记录这次旗舰版人员数量',
    `operate_user_id`          bigint(20)                                                   NULL DEFAULT NULL COMMENT '操作人id',
    `operate_user_name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人名称',
    `create_time`              datetime                                                     NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '运营商等级变更记录表'
  ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for tbl_operate_subject
-- ----------------------------
DROP TABLE IF EXISTS `tbl_operate_subject`;
CREATE TABLE `tbl_operate_subject`
(
    `id`                             bigint(20)                                                    NOT NULL AUTO_INCREMENT,
    `operate_traceability_config_id` bigint(20)                                                    NULL     DEFAULT NULL COMMENT '溯源配置id',
    `default_conf_flag`              int(2)                                                        NULL     DEFAULT 0 COMMENT '是否默认配置0否，1是，默认0',
    `operate_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '运营商名称',
    `operate_key`                    varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '运营商标识',
    `operate_logo_url1`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '运营商logo1',
    `operate_logo_url2`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '运营商logo2',
    `operate_favicon_url`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '页面图标地址',
    `product_name`                   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '产品名称',
    `login_url`                      varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '登录页地址',
    `home_url`                       varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '官网路径',
    `operate_status`                 int(11)                                                       NULL     DEFAULT NULL COMMENT '运营商状态，0冻结， 1正常',
    `show_pick_check_code_flag`      int(11)                                                       NULL     DEFAULT 0 COMMENT '显示采收记录中的checkCode, 0不显示，1显示， 默认0',
    `enable_add_company`             int(11)                                                       NULL     DEFAULT NULL COMMENT '是否支持添加企业（在运营商端添加企业）， 0 否， 1是',
    `enable_register`                int(11)                                                       NULL     DEFAULT NULL COMMENT '是否支持自注册， 0 否， 1是',
    `domain_name`                    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '域名',
    `copyright_notes`                varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '版权说明',
    `app_download_photo_url`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT 'app下载图片地址',
    `login_banner`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '登录页banner',
    `service_terms_type`             int(2)                                                        NULL     DEFAULT NULL COMMENT '服务条款',
    `privacy_terms_type`             int(2)                                                        NULL     DEFAULT NULL COMMENT '隐私条款',
    `create_time`                    datetime                                                      NULL     DEFAULT NULL,
    `update_time`                    datetime                                                      NULL     DEFAULT NULL,
    `hidden_menu_type`               int(11)                                                       NULL     DEFAULT NULL COMMENT '隐藏菜单值，位运算，取值为以下取值的和：1-客户，2-宅配，4-订单，8-农场秀，16-库存，32-统计，64-物联网，128-教程，256-统计概览，512-溯源码，1024-客服，2048-神农猫入口，4096-病虫害，8192-农场评分，16384-地块管理，32768-农场信息管理，65536-企业设置',
    `show_menu_type`                 int(11)                                                       NULL     DEFAULT NULL COMMENT '显示菜单值，位运算，取值为以下取值的和：1-大宗供销管理，2-遥感，4-认养、8-水肥一体化、16-买农资、32-环保绿色系统、64-专家问答、128-农业保险、256-贷款、512- 买农资',
    `mini_program_show_flag`         tinyint(4)                                                    NOT NULL DEFAULT 1 COMMENT '小程序提示显示标识：1-显示，0-不显示',
    `mini_program_name`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '小程序名称',
    `mini_program_img_url`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '小程序提示图片url',
    `suyuan_doc_url1`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '溯源帮助文档：打印溯源码',
    `suyuan_doc_url2`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '溯源帮助文档：绑定溯源',
    `suyuan_doc_url3`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '溯源帮助文档：按照号码段绑码',
    `help_video_url1`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT 'web端视频教程链接',
    `help_video_url2`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT 'app端视频教程链接',
    `contact_weixin`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '客服微信',
    `contact_phone`                  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '客服手机号',
    `contact_qq`                     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '客服qq',
    `contact_weixin_img`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '客服微信二维码图片',
    `suyuan_demo_url`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '溯源示例url',
    `farmshow_demo_url`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '农场秀示例url',
    `app_logo_url`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT 'app水印logo',
    `rank_open_flag`                 tinyint(4)                                                    NULL     DEFAULT 0 COMMENT '等级开关 0：关 (默认0) 1：开',
    `free_farm_num`                  int(11)                                                       NULL     DEFAULT NULL COMMENT '免费版农场数量',
    `free_user_num`                  int(11)                                                       NULL     DEFAULT NULL COMMENT '免费版成员数量',
    `charge_farm_num`                int(11)                                                       NULL     DEFAULT NULL COMMENT '收费版农场数量',
    `charge_user_num`                int(11)                                                       NULL     DEFAULT NULL COMMENT '收费版成员数量',
    `flagship_farm_num`              int(11)                                                       NULL     DEFAULT NULL COMMENT '旗舰版农场数量',
    `flagship_user_num`              int(11)                                                       NULL     DEFAULT NULL COMMENT '旗舰版成员数量',
    `max_send_expert_num`            int(11)                                                       NULL     DEFAULT 10 COMMENT '允许问题关联的专家数上限',
    `max_reply_expert_num`           int(11)                                                       NULL     DEFAULT 2 COMMENT '允许回答的专家数上限',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '运营商 主体表'
  ROW_FORMAT = DYNAMIC;
INSERT INTO `frp_operuser`.`tbl_operate_subject` (`id`, `operate_traceability_config_id`, `default_conf_flag`, `operate_name`, `operate_key`, `operate_logo_url1`, `operate_logo_url2`, `operate_favicon_url`, `product_name`, `login_url`, `home_url`, `operate_status`, `show_pick_check_code_flag`, `enable_add_company`, `enable_register`, `domain_name`, `copyright_notes`, `app_download_photo_url`, `login_banner`, `service_terms_type`, `privacy_terms_type`, `create_time`, `update_time`, `hidden_menu_type`, `show_menu_type`, `mini_program_show_flag`, `mini_program_name`, `mini_program_img_url`, `suyuan_doc_url1`, `suyuan_doc_url2`, `suyuan_doc_url3`, `help_video_url1`, `help_video_url2`, `contact_weixin`, `contact_phone`, `contact_qq`, `contact_weixin_img`, `suyuan_demo_url`, `farmshow_demo_url`, `app_logo_url`, `rank_open_flag`, `free_farm_num`, `free_user_num`, `charge_farm_num`, `charge_user_num`, `flagship_farm_num`, `flagship_user_num`, `max_send_expert_num`, `max_reply_expert_num`) VALUES (1, 2, 1, '左岸芯慧F', NULL, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/4a4f9798-814d-44dd-86cd-547d297b32fa.png', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/9636dd92-dc1b-49ba-9b84-fc6aed3369f9.png', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/45db3a1d-796a-461c-8464-8433fec48863.jfif', '神农口袋1', '1312', 'https://testf.snkoudai.com/', 1, 0, 1, 1, 'testf.snkoudai.com', 'Copyright © 2010-2021 Zaxh Inc. All Rights Reserved.', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/170e67f9-1651-4dc6-83b7-e40197844c21.jpg', NULL, 1, 2, '2019-06-12 14:33:43', '2022-10-11 17:34:09', 536576, 261949, 1, '啦啦啦', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/de179b1f-eeb3-456b-8a42-bb4f6e78c255.jpg', 'http://opertest.zaxhiot.com/opera-management/detail', 'https://www.kancloud.cn/zaxh/suyuanma/1200215', 'https://www.baidu.com/', 'https://www.baidu.com/', 'https://mp.weixin.qq.com/s/qjn6K3dIoqY8bi4yJ3Lxug', '2222222222', '111111111111', '154569354', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/57898065-d58f-436b-839c-fcb642becf83.png', 'https://showtest.snkoudai.com/ywym/#/home/root/11770000000', 'https://www.baidu.com/', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/e0422d6b-ad92-40df-865f-ec5f2cf50af5.png', 1, 2, 4, 20, 2000, 3000, 4000, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_operate_traceability_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_operate_traceability_config`;
CREATE TABLE `tbl_operate_traceability_config`
(
    `id`                  bigint(20)                                                    NOT NULL AUTO_INCREMENT,
    `config_name`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '溯源定制配置名称',
    `page_title`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '页面title(用于显示在页面标题栏)',
    `config_desc`         varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '配置信息描述',
    `logo1`               varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '印章logo',
    `logo2`               varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '底部logo',
    `trace_name`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '溯源名称',
    `trace_url`           varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '溯源链接',
    `trace_mall_name`     varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '溯源商城名称',
    `trace_mall_url`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '溯源商城url',
    `wx_share_title`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '微信分享标题',
    `wx_share_desc`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '微信分享描述',
    `create_by`           bigint(20)                                                    NULL     DEFAULT NULL COMMENT '创建人',
    `create_time`         datetime                                                      NULL     DEFAULT NULL COMMENT '创建时间',
    `update_by`           bigint(20)                                                    NULL     DEFAULT NULL COMMENT '修改人',
    `update_time`         datetime                                                      NULL     DEFAULT NULL COMMENT '修改时间',
    `home_url`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '溯源页面底部官网链接',
    `home_url_click_flag` tinyint(4)                                                    NOT NULL DEFAULT 0 COMMENT '底部官网链接是否可点击：1可点击，0-不可点击',
    `top_banner_img_url`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '顶部banner图',
    `top_logo_url`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '顶部logo地址',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '企业溯源配置'
  ROW_FORMAT = DYNAMIC;

INSERT INTO `frp_operuser`.`tbl_operate_traceability_config` (`id`, `config_name`, `page_title`, `config_desc`, `logo1`, `logo2`, `trace_name`, `trace_url`, `trace_mall_name`, `trace_mall_url`, `wx_share_title`, `wx_share_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `home_url`, `home_url_click_flag`, `top_banner_img_url`, `top_logo_url`) VALUES (2, '官方模板', '页面标题页面标题页面标题页面标题', '', '', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/7d99e7bf-03bc-4f90-a1fa-73f31c176e75.png', '溯源介绍', 'https://test.snkoudai.com/', '溯源商城', 'https://www.baidu.com/', '&&goodsName&& - 好食材不怕公开', '看得见溯源匠心，吃得出健康安心', 1, '2019-06-17 15:34:08', 1, '2020-07-27 16:44:22', 'https://www.snkoudai.com/', 1, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/b8a8f3d2-862d-4b9d-b049-f40a85cd561e.jpg', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/dcb60488-fbce-4e51-94bf-6d467f1a1644.png');
INSERT INTO `frp_operuser`.`tbl_operate_traceability_config` (`id`, `config_name`, `page_title`, `config_desc`, `logo1`, `logo2`, `trace_name`, `trace_url`, `trace_mall_name`, `trace_mall_url`, `wx_share_title`, `wx_share_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `home_url`, `home_url_click_flag`, `top_banner_img_url`, `top_logo_url`) VALUES (4, '熊猫溯源', '熊猫溯源为您呈现优质农产品', '我是&&goodsName&&。我被农民伯伯摘下来后，被浩浩荡荡发往苏宁小店，我是全批次共&&boundBarcodeTotalNum&&个包装中的第&&pickBindCurNum&&个，很期待与您见面。', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/23fda609-f75c-4fae-8fad-1d4348c2e519.png', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/feec241c-a3fa-45d4-bbcb-27b61ae7baf2.png', '什么是熊猫溯源', 'https://mp.weixin.qq.com/s/ZxdAhEvyzrKiYlfEF05Eog', '', '', '&&goodsName&& - 1食品安全看得见', '1您有权利知道您吃的食物是如何生产出来的，在哪生产的，由谁生产', 2, '2019-06-24 19:30:04', 1, '2020-07-22 15:16:32', '123', 0, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/90e1c4cc-01bf-4f2e-804f-1ffbb5e78825.png', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/ce58f2cf-1291-4585-8a53-9110ac0d04db.png');


-- ----------------------------
-- Table structure for tbl_operate_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_operate_user`;
CREATE TABLE `tbl_operate_user`
(
    `id`                 bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `operate_subject_id` bigint(20)                                                   NULL     DEFAULT NULL COMMENT '运营商id',
    `admin_flag`         int(2)                                                       NULL     DEFAULT NULL COMMENT '是否超级管理员：1-是，0-否，如果是超级管理员，标识账号内置，不可修改，不可删除',
    `operate_role_id`    bigint(20)                                                   NULL     DEFAULT NULL COMMENT '角色id',
    `user_name`          varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '登录名',
    `password`           varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '密码',
    `head_url`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci        NULL COMMENT '头像',
    `account_type`       int(11)                                                      NULL     DEFAULT NULL COMMENT '账号类型1，顶级账号，2子账号',
    `account_status`     int(11)                                                      NULL     DEFAULT NULL COMMENT '账号状态，0冻结，1正常',
    `create_by`          bigint(20)                                                   NULL     DEFAULT NULL,
    `create_time`        datetime                                                     NULL     DEFAULT NULL,
    `update_by`          bigint(20)                                                   NULL     DEFAULT NULL,
    `update_time`        datetime                                                     NULL     DEFAULT NULL,
    `edit_password_flag` tinyint(2)                                                   NOT NULL DEFAULT 0 COMMENT '该账号是否已强制修改密码 true 是 false 否',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '运营商后台user表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_user_salt
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_salt`;
CREATE TABLE `tbl_user_salt`
(
    `user_id` bigint(20)                                                   NOT NULL,
    `salt`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for tbl_operate_resource
-- ----------------------------
DROP TABLE IF EXISTS `tbl_operate_resource`;
CREATE TABLE `tbl_operate_resource`
(
    `id`         int(20)                                                      NOT NULL AUTO_INCREMENT COMMENT '标识',
    `name`       varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '资源名称',
    `permission` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '权限标识',
    `type`       int(2)                                                       NULL     DEFAULT NULL COMMENT '资源类型   1:菜单    2：按钮',
    `parent_id`  int(20)                                                      NULL     DEFAULT NULL COMMENT '父资源id',
    `web_url`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT 'web页面地址',
    `sort_num`   int(20)                                                      NULL     DEFAULT NULL COMMENT '排序',
    `menu_icon`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '菜单图标',
    `icon_color` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '菜单图标颜色',
    `target`     varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '_self' COMMENT '相当于 a 链接的 target 属性：_blank,_self',
    `menu_cat`   tinyint(4)                                                   NOT NULL DEFAULT 1 COMMENT '菜单分类，只在type=1时候有效，采用位运算，取值位一下取值的和：1-web端，2-手机H5端',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 147
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '资源表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_operate_resource
-- ----------------------------
INSERT INTO `tbl_operate_resource`
VALUES (137, '运营数据', NULL, 1, 0, NULL, 2, 'md-trending-up', NULL, '_self', 3);
INSERT INTO `tbl_operate_resource`
VALUES (138, '企业', NULL, 1, 137, '/company', 1, NULL, NULL, '_self', 3);
INSERT INTO `tbl_operate_resource`
VALUES (139, '用户', NULL, 1, 137, '/user', 3, NULL, NULL, '_self', 3);
INSERT INTO `tbl_operate_resource`
VALUES (140, '农场', NULL, 1, 137, '/farm', 2, NULL, NULL, '_self', 3);
INSERT INTO `tbl_operate_resource`
VALUES (144, '平台管理', NULL, 1, 0, NULL, 4, 'ios-people', '', '_self', 1);
INSERT INTO `tbl_operate_resource`
VALUES (145, '平台账号管理', NULL, 1, 144, '/operuser', 1, 'ios-paper-outline', NULL, '_self', 1);
INSERT INTO `tbl_operate_resource`
VALUES (146, '平台设置', NULL, 1, 144, '/subjectconfig', 2, 'ios-paper-outline', NULL, '_self', 1);

-- ----------------------------
-- Table structure for tbl_operate_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_operate_role`;
CREATE TABLE `tbl_operate_role`
(
    `id`          bigint(20)                                                    NOT NULL AUTO_INCREMENT,
    `role_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '角色名称',
    `role_desc`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
    `sort_num`    int(11)                                                       NULL DEFAULT NULL COMMENT '排序字段，越小越靠前',
    `create_time` datetime                                                      NULL DEFAULT NULL,
    `update_time` datetime                                                      NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_operate_role
-- ----------------------------
INSERT INTO `tbl_operate_role`
VALUES (1, '管理员', '管理员权限', 1, '2019-01-04 11:07:11', '2019-01-18 09:56:41');

-- ----------------------------
-- Table structure for tbl_operate_role_resource_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_operate_role_resource_ref`;
CREATE TABLE `tbl_operate_role_resource_ref`
(
    `role_id`     bigint(20) NULL DEFAULT NULL COMMENT '角色id',
    `resource_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色资源关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_operate_role_resource_ref
-- ----------------------------
INSERT INTO `tbl_operate_role_resource_ref`
VALUES (1, 137);
INSERT INTO `tbl_operate_role_resource_ref`
VALUES (1, 138);
INSERT INTO `tbl_operate_role_resource_ref`
VALUES (1, 139);
INSERT INTO `tbl_operate_role_resource_ref`
VALUES (1, 140);
INSERT INTO `tbl_operate_role_resource_ref`
VALUES (1, 144);
INSERT INTO `tbl_operate_role_resource_ref`
VALUES (1, 145);
INSERT INTO `tbl_operate_role_resource_ref`
VALUES (1, 146);

SET FOREIGN_KEY_CHECKS = 1;

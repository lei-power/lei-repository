

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message`
(
    `id`               bigint(20)                                                    NOT NULL AUTO_INCREMENT,
    `client_code`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '端名称',
    `type_code`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '消息类型code',
    `type_sub_code`    tinyint(11)                                                   NULL DEFAULT NULL COMMENT '\'1：专家问答【专家端】专家收到农户的回复；；2：专家问答【专家端】专家收到农户新的提问；3 ：专家问答【专家端】专家收到专家的回复；4：专家问答【提问端】 农户收到了专家的回复；5 公告系统：公告发布通知\',6 农事任务通知：有【接受】任务权限的员工，收到了接受农事任务提醒；7农事任务通知： 有【创建农事任务】任务权限的员工，收到了农事任务确认完成的提醒；',
    `message_code`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '消息编码',
    `send_user_type`   tinyint(1)                                                    NULL DEFAULT NULL COMMENT '发送人类型（1：admin-user，2：government-user，3：user）',
    `send_user_id`     bigint(20)                                                    NULL DEFAULT NULL COMMENT '发送人id',
    `send_user_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送人名称（可以是单位或者个人名称）',
    `send_time`        datetime                                                      NULL DEFAULT NULL COMMENT '发送时间',
    `message_title`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         NULL COMMENT '消息标题',
    `message_body`     longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NULL COMMENT '消息体',
    `message_image`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         NULL COMMENT '消息图片',
    `message_state`    int(11)                                                       NULL DEFAULT NULL COMMENT '推送状态  0未推送 1已推送 2取消推送',
    `feedback_type`    tinyint(1)                                                    NULL DEFAULT NULL COMMENT '操作反馈类型（1：无，2：详情，3：站内跳转，4：外链）',
    `feedback_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         NULL COMMENT '操作反馈内容（可以是id，或者额外扩展的json）',
    `feedback_id`      bigint(20)                                                    NULL DEFAULT NULL COMMENT '操作反馈内省是详情时,存入对应详情id，公告id，问题id',
    `importance`       int(11)                                                       NULL DEFAULT NULL COMMENT '重要性',
    `push_type`        int(11)                                                       NULL DEFAULT NULL COMMENT '推送方式（1：站内信，2：极光推送，3：短信）',
    `delete_flag`      tinyint(1)                                                    NULL DEFAULT NULL COMMENT '是否删除（1：是，0：否）',
    `create_time`      datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_message_code` (`message_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '消息'
  ROW_FORMAT = DYNAMIC;

-- Table structure for tbl_message_client
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_client`;
CREATE TABLE `tbl_message_client`
(
    `id`            bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `client_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '端名称',
    `client_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '端编码',
    `delete_flag`   tinyint(1)                                                    NULL DEFAULT NULL COMMENT '是否删除（1：是，0：否）',
    `jg_app_key`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '极光app的key',
    `jg_app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '极光app的密钥',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '消息展示端'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_message_client
-- ----------------------------
INSERT INTO `tbl_message_client`
VALUES (1, '专家问答', 'expert', 0, '61ab3e61fdd67435fd050284', 'f9a2433f76c0ef6f15164239');
INSERT INTO `tbl_message_client`
VALUES (2, '神农口袋App&Web', 'snkoudai', 0, '76690cd2cfe71bed7da10f7d', 'b011c6c07389bbb92590796f');
INSERT INTO `tbl_message_client`
VALUES (3, '神农口袋OA版', 'snkoudai_oa', 0, '521cd8525700512ee0685fd6', '66e89ba76b695d050816d1b7');

-- ----------------------------
-- Table structure for tbl_message_receiver
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_receiver`;
CREATE TABLE `tbl_message_receiver`
(
    `id`                bigint(20)                                                    NOT NULL AUTO_INCREMENT,
    `message_code`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息id',
    `receiver_id`       bigint(20)                                                    NULL DEFAULT NULL COMMENT '接受者id',
    `receiver_mobile`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接受者手机号（发短信使用）',
    `receiver_audience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接受者设备',
    `read_flag`         tinyint(1)                                                    NULL DEFAULT NULL COMMENT '是否已读（1：是，0：否）',
    `success_flag`      tinyint(1)                                                    NULL DEFAULT NULL COMMENT '消息推送状态  0未推送 1推送成功 2推送失败',
    `delete_flag`       tinyint(1)                                                    NULL DEFAULT NULL COMMENT '是否删除（1：是，0：否）',
    `create_time`       datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`       datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_message_code_receiver_id` (`message_code`, `receiver_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '消息接受者'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_type`;
CREATE TABLE `tbl_message_type`
(
    `id`          bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `type_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '类型名称',
    `type_sort`   int(11)                                                       NULL DEFAULT NULL COMMENT '按端排序值',
    `type_icon`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型图标',
    `show_flag`   int(11)                                                       NULL DEFAULT NULL COMMENT '显示标记',
    `type_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '类型编码',
    `delete_flag` tinyint(1)                                                    NULL DEFAULT NULL COMMENT '是否删除（1：是，0：否）',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '消息类型'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_message_type
-- ----------------------------
INSERT INTO `tbl_message_type`
VALUES (1, '公告通知', 1, NULL, 1, 'XXLX100', 0, '2022-07-01 10:45:23', '2022-07-01 10:45:26');
INSERT INTO `tbl_message_type`
VALUES (2, '农技咨询', 2, NULL, 1, 'XXLX101', 0, '2022-07-06 15:46:54', '2022-07-06 15:46:56');
INSERT INTO `tbl_message_type`
VALUES (3, '政府咨询通知', 3, NULL, 1, 'XXLX102', 0, NULL, NULL);
INSERT INTO `tbl_message_type`
VALUES (4, '农事任务通知', 4, NULL, 1, 'XXLX103', 0, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_message_type_client_code_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_type_client_code_ref`;
CREATE TABLE `tbl_message_type_client_code_ref`
(
    `type_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息类型编码code',
    `client_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息展示端code',
    UNIQUE INDEX `unq_type_code_client_code` (`type_code`, `client_code`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '消息类型端类型关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_message_type_client_code_ref
-- ----------------------------
INSERT INTO `tbl_message_type_client_code_ref`
VALUES ('XXLX100', 'snkoudai');
INSERT INTO `tbl_message_type_client_code_ref`
VALUES ('XXLX100', 'snkoudai_oa');
INSERT INTO `tbl_message_type_client_code_ref`
VALUES ('XXLX101', 'expert');
INSERT INTO `tbl_message_type_client_code_ref`
VALUES ('XXLX101', 'snkoudai');
INSERT INTO `tbl_message_type_client_code_ref`
VALUES ('XXLX102', 'snkoudai');
INSERT INTO `tbl_message_type_client_code_ref`
VALUES ('XXLX103', 'snkoudai_oa');

SET FOREIGN_KEY_CHECKS = 1;

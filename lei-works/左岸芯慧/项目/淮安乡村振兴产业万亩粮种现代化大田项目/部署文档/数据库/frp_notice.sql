SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_government_notice_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_government_notice_type`;
CREATE TABLE `sys_government_notice_type`
(
    `id`                                bigint(20) NOT NULL AUTO_INCREMENT,
    `name`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型名称',
    `status`                            tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态;1-启用，0-禁用',
    `sort_num`                          int(11) NULL DEFAULT NULL COMMENT '排序号,越小越靠前',
    `create_by`                         bigint(20) NULL DEFAULT NULL,
    `create_user_name`                  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者名称',
    `create_time`                       datetime NULL DEFAULT NULL,
    `update_by`                         bigint(20) NULL DEFAULT NULL,
    `update_user_name`                  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改者名称',
    `update_time`                       datetime NULL DEFAULT NULL,
    `government_notice_type_identifier` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一编码',
    `applicable_platform`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '2' COMMENT '1：运营平台；2：管理中台(全选中1,2)',
    `default_cover_img_url`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '默认封面',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '公告类型表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_government_notice_type
-- ----------------------------
INSERT INTO `sys_government_notice_type`
VALUES (1, '11111', 0, 1000, 1, '超管', '2021-12-18 11:39:24', 134, '廖丹', '2022-09-07 10:43:25', '1', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/cd0353d7-2c4d-4687-9ebf-dbc1f96bf2b5.jpg');
INSERT INTO `sys_government_notice_type`
VALUES (2, '222', 0, 1001, 1, '超管', '2021-12-18 14:57:14', 93, '汪健', '2022-06-23 18:08:07', '2', '2', NULL);
INSERT INTO `sys_government_notice_type`
VALUES (3, '政策扶持', 0, 1003, 1, '超管', '2021-12-18 14:58:31', 1, '超管', '2021-12-28 17:13:00', '3', '2', NULL);
INSERT INTO `sys_government_notice_type`
VALUES (4, '444', 0, 1000, 1, '超管', '2021-12-18 15:17:09', 97, '廖丹', '2022-08-25 14:39:16', '4', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/7b19bfcf-7b28-4a43-893d-a870f824e4c8.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (5, '灾情预警', 0, 1003, 1, '超管', '2021-12-27 13:51:03', 93, '汪健', '2022-06-23 18:08:13', '5', '2', NULL);
INSERT INTO `sys_government_notice_type`
VALUES (6, '政府公告222', 0, 1000, 1, '超管', '2021-12-27 17:32:40', 91, '邱晨', '2022-06-27 16:32:20', '6', '2', NULL);
INSERT INTO `sys_government_notice_type`
VALUES (7, '测试类型', 0, 1004, 91, '邱晨', '2022-06-14 10:28:57', 91, '邱晨', '2022-06-14 10:29:40', '111', '2', NULL);
INSERT INTO `sys_government_notice_type`
VALUES (8, '闰土公告', 0, 1000, 1, '超管', '2022-06-21 15:54:34', 2, '管理员', '2022-07-13 18:20:37', 'xixi', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/f62a178f-3a3b-4100-88c3-d357750ef536.png');
INSERT INTO `sys_government_notice_type`
VALUES (9, '测试编辑21', 0, 1000, 134, '廖丹', '2022-06-21 20:23:55', 2, '管理员', '2022-07-13 18:43:52', 'sdfsdfsdf', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/ef4dd528-8aa1-46c3-bbbe-10e1d92916e0.jpg');
INSERT INTO `sys_government_notice_type`
VALUES (10, 'wwww2', 0, 1000, 134, '廖丹', '2022-06-21 21:42:37', 2, '管理员', '2022-07-13 20:51:07', 'wwwwww', '2,1',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/921e5c5e-ed3f-4eba-8c4e-3961ff7f2b3b.png');
INSERT INTO `sys_government_notice_type`
VALUES (11, '2222', 0, 1000, 134, '廖丹', '2022-06-22 09:48:25', 91, '邱晨', '2022-07-08 11:29:35', '2222222', '1,2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/86831f00-ac8a-4816-a3d4-a28dd6e70369.png');
INSERT INTO `sys_government_notice_type`
VALUES (12, '测试添加类型', 0, 1000, 97, '廖丹', '2022-06-23 17:26:23', 2, '管理员', '2022-07-13 19:16:36', 'GGLX+32143', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/128bff4e-11d6-4ca8-8e7b-a30648771995.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (13, '添加类型yypt', 1, 1000, 97, '廖丹', '2022-06-23 17:26:56', 91, '邱晨', '2022-06-24 17:18:19', 'GGLX+3w34', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/88d3c6ec-6aa4-4f6b-8060-2679ff9a3482.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (14, '重要公告类型', 1, 1001, 91, '邱晨', '2022-06-24 17:09:31', 101, 'qiu', '2022-07-13 10:34:57', '001', '1,2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/3bfd9411-a612-44db-8575-1e92ad725d9a.jpg');
INSERT INTO `sys_government_notice_type`
VALUES (15, '无添加权限', 0, 1001, 91, '邱晨', '2022-06-27 10:39:30', 91, '邱晨', '2022-07-08 10:54:17', 'GGLX002', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/0d12e80a-9151-451d-a154-e3012d074ce6.jpg');
INSERT INTO `sys_government_notice_type`
VALUES (16, '测试运营', 0, 1000, 97, '廖丹', '2022-06-27 15:56:36', 2, '管理员', '2022-07-14 15:57:37', 'GGLX00000', '1,2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/b051913d-0f2c-440a-97c3-7545273bdfb5.jpg');
INSERT INTO `sys_government_notice_type`
VALUES (17, '222有两个', 1, 1000, 97, '廖丹', '2022-07-07 13:58:00', 91, '邱晨', '2022-07-13 11:16:49', 'GGLX888', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/2675eb8e-56a8-46dc-b1c2-057e0918a277.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (18, 'admin', 1, 1000, 97, '廖丹', '2022-07-07 14:01:45', 2, '管理员', '2022-07-13 20:53:38', 'GGLX+3GGLX+3', '2,1',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/7315b3f6-c63b-44f4-819c-147e5356d737.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (19, '文档测试3', 1, 1000, 97, '廖丹', '2022-07-07 14:43:40', 91, '邱晨', '2022-07-22 17:09:20', 'GGLX+3333', '1,2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/cbdde2e2-0c39-42a2-8db9-e42048a9afa9.jpg');
INSERT INTO `sys_government_notice_type`
VALUES (20, '测试两个', 1, 1000, 97, '廖丹', '2022-07-07 16:14:16', 97, '廖丹', '2022-07-07 16:14:16', 'GGLX+344', '1,2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/b6d32fc2-757b-4c18-89ce-644ec5335b66.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (21, 'this.form.ap', 1, 1000, 97, '廖丹', '2022-07-07 16:20:09', 97, '廖丹', '2022-07-07 16:20:09', 'GGLX333', '1,2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/3fcbbd86-495e-45a0-8e91-ea906e4a4beb.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (22, 'applicablePl', 1, 1000, 97, '廖丹', '2022-07-07 16:38:12', 97, '廖丹', '2022-07-07 16:38:12', 'GGLX+3', '1',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/7f50faaa-6567-4279-a428-51a5ea620050.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (23, 'bulletinCate', 1, 1000, 97, '廖丹', '2022-07-07 16:48:31', 97, '廖丹', '2022-07-07 16:48:31', 'GGLX777', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/473775fc-1fee-43c7-8896-665f20a19814.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (24, '非法类型', 1, 1000, 97, '廖丹', '2022-07-07 16:50:08', 97, '廖丹', '2022-07-07 16:56:27', 'GGLX443', '2,1',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/8ac1eefa-e6be-440c-911b-2a58d6da3ca4.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (25, '公告类型0201', 1, 1001, 91, '邱晨', '2022-07-08 10:33:18', 97, '廖丹', '2022-07-08 13:46:01', 'qiu1', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/357f7a30-c918-4118-8bee-c56220fadf70.jpeg');
INSERT INTO `sys_government_notice_type`
VALUES (26, '新增', 1, 1000, 91, '邱晨', '2022-07-13 18:37:07', 91, '邱晨', '2022-07-13 18:37:07', '第三方', '2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/1bab3d59-4249-412e-9210-1dadbe73f14b.jpg');
INSERT INTO `sys_government_notice_type`
VALUES (27, '新公告类型', 1, 1000, 2, '管理员', '2022-07-13 20:57:52', 2, '管理员', '2022-07-13 20:57:52', '45', '1,2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/18efe58f-e7f7-4435-bc3f-0c32b55bd955.jpg');
INSERT INTO `sys_government_notice_type`
VALUES (28, '紧急通知', 1, 8721, 94, '张静峰', '2022-07-14 09:56:08', 94, '张静峰', '2022-07-14 09:56:08', 'JJTZ-123', '1,2',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/a8f1e2fb-be73-459b-82e9-16d3bc5c0f91.png');

-- ----------------------------
-- Table structure for tbl_government_notice
-- ----------------------------
DROP TABLE IF EXISTS `tbl_government_notice`;
CREATE TABLE `tbl_government_notice`
(
    `id`                                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告表主键',
    `government_subject_id`              bigint(20) NULL DEFAULT NULL COMMENT '政府主体信息主键id',
    `government_subject_name`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '政府主体名称',
    `type_id`                            bigint(20) NULL DEFAULT 0 COMMENT '关联公告类型',
    `content`                            longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告内容',
    `title`                              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告标题',
    `img_url`                            text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告图片链接URL',
    `business_category_ids`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '政府主体关联经营类目，逗号隔开',
    `business_category_names`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经营类目名称，逗号隔开',
    `publish_status`                     tinyint(4) NULL DEFAULT 1 COMMENT '发布状态：1.已发布；2：定时发布中；3：草稿 ；4：撤回',
    `publish_time`                       datetime NULL DEFAULT NULL COMMENT '发布时间',
    `task_time`                          datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '定时任务使时间，发布状态为定时任务需传入此值',
    `view_count`                         bigint(20) NULL DEFAULT 0 COMMENT '浏览量pv',
    `outer_chain`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '外链',
    `f_ids`                              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件ids',
    `publish_company`                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布单位',
    `mobile_system_notice_reminder_flag` tinyint(4) NULL DEFAULT NULL COMMENT '手机系统通知提醒。0：不提醒；1：提醒',
    `notice_center_display`              tinyint(4) NULL DEFAULT NULL COMMENT '是否在公告中心显示。0：不显示；1：显示',
    `client_type`                        tinyint(4) NULL DEFAULT NULL COMMENT '客户端类型：1：admin后台管理；2：管理后台',
    `content_flag`                       tinyint(4) NULL DEFAULT NULL COMMENT '公告内容类型：1：内容；2：外链',
    `send_all_farm_flag`                 tinyint(4) NULL DEFAULT NULL COMMENT '发送所有经营主体，与经营类目无关：1：是；0：否',
    `create_by`                          bigint(20) NULL DEFAULT NULL,
    `create_user_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人昵称',
    `create_time`                        datetime NULL DEFAULT NULL,
    `update_by`                          bigint(20) NULL DEFAULT NULL,
    `update_user_name`                   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人昵称',
    `update_time`                        datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '公告表'
  ROW_FORMAT = DYNAMIC;

-- ----
-- ----------------------------
-- Table structure for tbl_government_notice_area_ref
-- ----------------------------
DROP TABLE IF EXISTS `tbl_government_notice_area_ref`;
CREATE TABLE `tbl_government_notice_area_ref`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `government_notice_id` bigint(20) NULL DEFAULT NULL COMMENT '公告id',
    `area_type`            tinyint(4) NULL DEFAULT 0 COMMENT '区域类别 0 全国 1 省 2 市 3 区 4镇 5村',
    `area_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地区ID',
    `area_name`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地区名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '政府公告范围地区关联表'
  ROW_FORMAT = DYNAMIC;

-- ----
-- ----------------------------
-- Table structure for tbl_government_notice_visit_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_government_notice_visit_history`;
CREATE TABLE `tbl_government_notice_visit_history`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `government_notice_id` bigint(20) NULL DEFAULT NULL COMMENT '公告',
    `user_id`              bigint(20) NULL DEFAULT NULL COMMENT '用户id，匿名用户访问时，此字段为null',
    `user_type`            tinyint(4) NULL DEFAULT NULL COMMENT '1：co 2：gov 3：admin(还有其他端在扩展)',
    `create_time`          datetime NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`          datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '公告浏览历史'
  ROW_FORMAT = DYNAMIC;


SET
FOREIGN_KEY_CHECKS = 1;

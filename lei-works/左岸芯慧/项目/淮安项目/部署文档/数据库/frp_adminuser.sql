SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`
(
    `id`         int(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
    `name`       varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源名称',
    `permission` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
    `type`       int(2) NULL DEFAULT NULL COMMENT '资源类型   1:菜单    2：按钮',
    `parent_id`  int(20) NULL DEFAULT NULL COMMENT '父资源id',
    `web_url`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'web页面地址',
    `sort_num`   int(20) NULL DEFAULT NULL COMMENT '排序',
    `menu_icon`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
    `icon_color` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标颜色',
    `target`     varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '_self' COMMENT '相当于 a 链接的 target 属性：_blank,_self',
    `menu_cat`   tinyint(4) NOT NULL DEFAULT 1 COMMENT '菜单分类，只在type=1时候有效，采用位运算，取值位一下取值的和：1-web端，2-手机H5端',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 536
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '资源表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource`
VALUES (137, '运营数据', NULL, 1, 0, NULL, 2, 'md-trending-up', NULL, '_self', 3);
INSERT INTO `sys_resource`
VALUES (138, '企业', NULL, 1, 137, '/company', 1, NULL, NULL, '_self', 3);
INSERT INTO `sys_resource`
VALUES (139, '用户', NULL, 1, 137, '/user', 3, NULL, NULL, '_self', 3);
INSERT INTO `sys_resource`
VALUES (140, '农场', NULL, 1, 137, '/farm', 2, NULL, NULL, '_self', 3);
INSERT INTO `sys_resource`
VALUES (141, '地块', NULL, 1, 137, '/land', 4, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (142, '任务', NULL, 1, 137, '/mission', 5, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (143, '采收', NULL, 1, 137, '/pick', 6, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (144, '平台管理', NULL, 1, 0, NULL, 5, 'ios-people', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (145, '平台账号管理', NULL, 1, 144, '/sysuser', 2, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (146, '平台角色管理', NULL, 1, 144, '/sysrole', 2, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (147, '平台菜单管理', NULL, 1, 144, '/sysresource', 3, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (148, '基础配置', NULL, 1, 0, NULL, 3, 'md-options', NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (149, '农资类型', NULL, 1, 148, '/agritype', 4, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (150, '农资单位', NULL, 1, 148, '/agriunit', 5, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (151, '种植标准', NULL, 1, 148, '/plantstandard', 3, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (152, '地块类型', NULL, 1, 148, '/landtype', 2, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (153, '作物种类', NULL, 1, 148, '/crop', 1, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (161, '企业角色', NULL, 1, 148, '/role', 6, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (175, '协议/条款管理', NULL, 1, 212, '/agreement', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (176, '添加', 'landtype:add', 2, 152, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (177, '添加', 'agritype:add', 2, 149, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (178, '编辑', 'agritype:edit', 2, 149, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (179, '删除', 'agritype:del', 2, 149, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (180, '添加', 'agriunit:add', 2, 150, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (181, '编辑', 'landtype:edit', 2, 152, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (182, '删除', 'landtype:del', 2, 152, '', 3, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (183, '添加', 'plantstandard:add', 2, 151, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (184, '编辑', 'plantstandard:edit', 2, 151, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (185, '删除', 'plantstandard:del', 2, 151, '', 3, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (186, '添加', 'crop:add', 2, 153, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (187, '编辑', 'crop:edit', 2, 153, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (188, '删除', 'crop:del', 2, 153, '', 3, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (189, '编辑', 'co:role:edit', 2, 161, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (190, '添加', 'agreement:add', 2, 175, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (191, '编辑', 'agreement:edit', 2, 175, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (192, '删除', 'agreement:edit', 2, 175, '', 3, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (193, '添加', 'sysuser:add', 2, 145, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (194, '编辑', 'sysuser:edit', 2, 145, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (195, '删除', 'sysuser:del', 2, 145, '', 3, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (196, '添加', 'sysrole:add', 2, 146, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (197, '编辑', 'sysrole:edit', 2, 146, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (198, '删除', 'sysrole:del', 2, 146, '', 3, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (199, '添加', 'sysresource:add', 2, 147, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (200, '编辑', 'sysresource:edit', 2, 147, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (201, '删除', 'sysresource:del', 2, 147, '', 3, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (202, '编辑', 'agriunit:edit', 1, 150, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (203, '删除', 'agriunit:del', 1, 150, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (205, 'icon图标', '', 1, 144, 'https://www.iviewui.com/components/icon', 6, 'ios-paper-outline', '', '_blank', 1);
INSERT INTO `sys_resource`
VALUES (207, '企业资源', '', 1, 148, '/resource', 7, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (208, '添加', 'coresource:add', 2, 207, '', 1, 'ios-paper-outline', '', '', 1);
INSERT INTO `sys_resource`
VALUES (209, '编辑', 'coresource:edit', 2, 207, '', 2, 'ios-paper-outline', '', '', 1);
INSERT INTO `sys_resource`
VALUES (210, '删除', 'coresource:del', 2, 207, '', 3, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (212, '高级配置', '', 1, 0, '', 3, 'ios-construct', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (213, '安卓包下载管理', 'apkaddress', 1, 212, '/apkaddress', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (214, '官网农场主评价', 'farmercomment', 1, 212, '/farmercomment', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (216, '登录页Banner', 'loginbanner', 1, 212, '/loginbanner', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (217, '官网示例管理', 'qrcodeexample', 1, 212, '/qrcodeexample', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (218, '官网Banner', 'websitebanner', 1, 212, '/websitebanner', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (219, '添加', 'apkaddress:add', 2, 213, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (220, '编辑', 'apkaddress:edit', 2, 213, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (221, '删除', 'apkaddress:del', 2, 213, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (222, '添加', 'qrcodeexample:add', 2, 217, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (223, '编辑', 'qrcodeexample:edit', 1, 217, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (224, '删除', 'qrcodeexample:del', 1, 217, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (225, '添加', 'loginbanner:add', 2, 216, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (226, '编辑', 'loginbanner:edit', 2, 216, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (227, '删除', 'loginbanner:del', 2, 216, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (228, '添加', 'farmercomment:add', 2, 214, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (231, '编辑', 'farmercomment:edit', 2, 214, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (232, '删除', 'farmercomment:del', 2, 214, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (233, '添加', 'websitebanner:add', 2, 218, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (234, '编辑', 'websitebanner:edit', 1, 218, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (235, '删除', 'websitebanner:del', 2, 218, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (236, '工作台', '', 1, 0, '', 1, 'ios-paper-outline', '', '_self', 3);
INSERT INTO `sys_resource`
VALUES (237, '新增趋势', '', 1, 236, '/home', 1, 'ios-paper-outline', '', '_self', 3);
INSERT INTO `sys_resource`
VALUES (238, '演示农场', '', 1, 212, '/demofarm', 7, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (239, '演示地块', '', 1, 212, '/demoland', 8, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (240, '农场秀模板', '', 1, 212, '/farmshowmodel', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (241, '详情', 'farmshowmodel:info', 2, 240, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (242, '添加', 'farmshowmodel:add', 2, 240, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (243, '编辑', 'farmshowmodel:edit', 2, 240, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (244, '删除', 'farmshowmodel:del', 1, 240, '', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (245, '活跃趋势', '', 1, 236, '/platformdata', 2, 'ios-paper-outline', '', '_self', 3);
INSERT INTO `sys_resource`
VALUES (246, '添加', 'farmdemo:add', 2, 238, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (247, '编辑', 'farmdemo:edit', 2, 238, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (248, '删除', 'farmdemo:del', 2, 238, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (249, '添加', 'landdemo:add', 2, 239, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (250, '编辑', 'landdemo:edit', 2, 239, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (251, '删除', 'landdemo:del', 2, 239, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (252, '种植计划', '', 1, 137, '/plantplan', 7, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (253, '农场地图', '', 1, 236, '/indexmap', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (255, '物联网账号', '', 1, 212, '/iotaccountconfig', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (256, '修改', 'iotaccountconfig:edit', 2, 255, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (258, '农作物审核', '', 1, 137, '/cropfeedback', 10, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (259, '农场iot配置', '', 1, 212, '/iotfarmconfig', 10, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (260, '通过', 'cropfeedback:pass', 2, 258, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (261, '详情', 'iotfarmconfig:info', 2, 259, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (262, '定制logo', '', 1, 212, '/companyshowconfig', 11, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (263, '添加', 'companyshowconfig:add', 2, 262, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (264, '编辑', 'companyshowconfig:edit', 2, 262, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (265, '删除', 'companyshowconfig:del', 2, 262, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (271, '政府端主体（全量）', '', 1, 144, '/governmentsubject', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (272, '详情', 'governmentsubject:info', 2, 271, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (273, '新增', 'governmentsubject:add', 2, 271, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (274, '编辑', 'governmentsubject:edit', 2, 271, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (275, '删除', 'governmentsubject:del', 2, 271, '', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (281, '溯源H5配置', '', 1, 212, '/traceconfig', 13, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (282, '添加', 'traceconfig:add', 2, 281, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (283, '删除', 'traceconfig:del', 2, 281, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (284, '修改', 'traceconfig:edit', 2, 281, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (285, '运营商配置', '', 1, 144, '/opersubject', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (286, '添加', 'opersubject:add', 2, 285, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (287, '修改', 'opersubject:edit', 1, 285, '', 2, 'ios-paper-outline', '', '_self', 2);
INSERT INTO `sys_resource`
VALUES (288, '删除', 'opersubject:del', 1, 285, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (289, '详情', 'opersubject:info', 1, 285, '', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (290, '溯源码样式配置', '', 1, 212, '/barcodetemplateattr', 15, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (291, '溯源码配置', '', 1, 212, '/barcodetemplate', 14, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (292, '溯源过期时间配置', '', 1, 212, '/sysconf', 18, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (293, '添加', 'barcodetemplate:add', 2, 291, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (294, '删除', 'barcodetemplate:del', 2, 291, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (295, '修改', 'barcodetemplate:edit', 1, 291, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (296, '添加', 'barcodetemplateattr:add', 2, 290, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (297, '删除', 'barcodetemplateattr:del', 1, 290, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (298, '修改', 'barcodetemplateattr:edit', 1, 290, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (299, '添加', 'sysconf:add', 2, 292, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (300, '删除', 'sysconf:del', 2, 292, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (301, '修改', 'sysconf:edit', 2, 292, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (302, '企业留存率', '', 1, 236, '/companyretention', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (303, 'gis类型配置', '', 1, 212, '/gistype', 19, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (304, '添加', 'gistype:add', 2, 303, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (305, '编辑', 'gistype:edit', 2, 303, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (306, '删除', 'gistype:del', 2, 303, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (307, '详情', 'gistype:info', 1, 303, '', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (308, '作物大类', '', 1, 148, '/cropSubject', 8, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (310, '客服管理', '', 1, 212, '/service', 20, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (311, '企业资质审核', '', 1, 236, '/qualification', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (312, '审核', 'qualification:check', 2, 311, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (313, '作物分类', '', 1, 148, '/cropClassify', 10, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (314, '作物病虫害', '', 1, 148, '/cropDisease', 11, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (315, '作物小类', '', 1, 148, '/cropCate', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (316, '添加', 'cropCate:add', 2, 315, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (317, '修改', 'cropCate:edit', 1, 315, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (318, '添加', 'cropClassify:add', 2, 313, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (319, '修改', 'cropClassify:edit', 2, 313, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (320, '删除', 'cropClassify:del', 2, 313, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (321, '添加', 'cropDisease:add', 2, 314, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (322, '修改', 'cropDisease:edit', 2, 314, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (323, '删除', 'cropDisease:del', 2, 314, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (324, '修改', 'cropSubject:edit', 2, 308, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (326, '监管', 'company:supervisionflag', 2, 138, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (328, '添加企业成员', 'user:refAdd', 2, 139, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (329, '农场统计', 'produce:farm:editstatisticsflag', 2, 140, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (330, '农场土地经营权', 'produce:farm:editlandright', 2, 140, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (331, '企业类型', 'user:company:editbusinesscategory', 2, 138, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (332, '企业统一社会信用代码', 'user:company:editenterprisecreditcode', 2, 138, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (333, '企业等级配置', 'user:company:editranktype', 2, 138, '', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (334, '收费模式配置', 'operuser:operatesubject:editrankopenflag', 2, 285, '', 5, 'ios-paper-outline', '', '_self', 5);
INSERT INTO `sys_resource`
VALUES (335, '经营类目', '', 1, 148, '/businesscategorymanage', 1, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (336, '企业类型', '', 1, 148, '/companycategory', 3, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (337, '添加', 'businesscategory:add', 2, 335, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (338, '编辑', 'businesscategory:edit', 2, 335, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (339, '删除', 'businesscategory:del', 2, 335, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (340, '添加', 'companycategory:add', 2, 336, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (341, '编辑', 'companycategory:edit', 2, 336, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (342, '删除', 'companycategory:del', 2, 336, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (343, '农场经营类目编辑', 'farm:editbusinesscategory', 2, 140, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (344, '区域配置管理', '', 1, 212, '/arealandtype', 21, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (345, '农产品批发市场列表', '', 1, 212, '/ncMark', 1, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (347, '区域地块类型添加', 'areaLandTypeDistribution:add', 2, 344, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (348, '区域地块类型编辑', 'areaLandTypeDistribution:edit', 2, 344, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (349, '区域地块类型删除', 'areaLandTypeDistribution:del', 2, 344, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (350, '区域摄像头添加', 'areaCameraConfig:add', 2, 344, '', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (351, '区域摄像头编辑', 'areaCameraConfig:edit', 2, 344, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (352, '区域摄像头删除', 'areaCameraConfig:del', 2, 344, '', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (353, '区域更新', '', 1, 148, '/updateArea', 12, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (354, '设置密码', 'user:setpassword', 2, 139, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (355, '删除企业', 'company:del', 2, 138, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (356, '农资管理', '', 1, 148, '/agriList', 5, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (357, '农场地址修改', 'farm:editFarmAddress', 2, 140, '', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (359, '新增农资', 'agriList:add', 2, 356, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (360, '编辑农资', 'agriList:edit', 2, 356, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (361, '删除农资', 'agriList:del', 2, 356, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (363, '农事类型', NULL, 1, 148, '/missioncategory', 4, NULL, NULL, '_self', 1);
INSERT INTO `sys_resource`
VALUES (364, '添加', 'missioncategory:add', 2, 363, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (365, '编辑', 'missioncategory:edit', 2, 363, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (366, '删除', 'missioncategory:del', 2, 363, '', 2, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (367, '农资审核', '', 1, 137, '/agrifeedback', 8, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (368, '通过', 'agrifeedback:pass', 2, 367, '', 1, '', '', '', 1);
INSERT INTO `sys_resource`
VALUES (369, '地区管理', '', 1, 148, '/areaAdmin', 13, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (371, '添加街镇', 'areaAdmin:addTown', 2, 369, '', 1, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (372, '添加村', 'areaAdmin:addVillage', 1, 369, '', 2, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (373, '编辑', 'areaAdmin:edit', 2, 369, '', 3, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (375, '删除', 'areaAdmin:del', 2, 369, '', 4, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (380, '专家列表', '', 1, 212, '/expert', 22, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (381, '问题列表', '', 1, 137, '/question', 11, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (382, '出入库类型', '', 1, 148, '/agristorage', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (383, '添加出入库类型', 'agristorage:add', 2, 382, '', 1, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (384, '修改出入库类型', 'agristorage:edit', 2, 382, '', 2, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (385, '是否禁用出入库类型', 'agristorage:del', 2, 382, '', 3, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (386, '农资包装单位', '', 1, 148, '/agripackunit', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (387, '添加', 'agripackunit:add', 1, 386, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (388, '修改', 'agripackunit:edit', 1, 386, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (389, '禁用', 'agripackunit:del', 1, 386, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (390, '农委企业列表', '', 1, 137, '/nongweicompany', 12, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (391, '修改地块绑定gis地块Id', 'land:editshdkid', 2, 141, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (392, '专家类型', '', 1, 212, '/expertType', 23, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (393, '添加专家', 'expert:add', 2, 380, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (394, '编辑专家', 'expert:edit', 2, 380, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (395, '禁用专家', 'expert:enable', 2, 380, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (396, '增加专家类型', 'expertType:add', 2, 392, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (397, '修改专家类型', 'expertType:edit', 2, 392, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (398, '删除专家类型', 'expertType:del', 2, 392, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (400, '地块校准页面', '', 1, 140, '/farmlandcompare', 6, 'ios-paper-outline', '', '_self', 3);
INSERT INTO `sys_resource`
VALUES (401, '地块校准按钮', 'farm:landedit', 2, 140, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (403, '管理中台菜单管理', '', 1, 144, '/govplat', 3, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (404, '地块用途', '', 1, 148, '/landuse', 2, '', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (406, '添加', 'landuse:add', 1, 404, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (407, '编辑', 'landuse:edit', 2, 404, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (408, '删除', 'landuse:del', 2, 404, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (409, '添加', 'govplat:add', 2, 403, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (410, '编辑', 'govplat:edit', 2, 403, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (411, '删除', 'govplat:del', 2, 403, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (412, '用户信息添加', 'governmentsubject:userinfo:add', 2, 271, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (413, '用户信息修改', 'governmentsubject:userinfo:edit', 2, 271, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (415, '用户角色添加', 'governmentsubject:userrole:add', 2, 271, '', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (416, '用户角色修改', 'governmentsubject:userrole:edit', 2, 271, '', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (417, '用户角色中台授权', 'governmentsubject:userrole:grant', 2, 271, '', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (418, '用户角色删除', 'governmentsubject:userrole:del', 2, 271, '', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (419, '地块信息添加', 'governmentsubject:landtype:add', 2, 271, '', 7, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (420, '种植标准信息添加', 'governmentsubject:plantstandard:add', 2, 271, '', 8, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (421, 'gis信息添加', 'governmentsubject:gis:add', 2, 271, '', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (422, 'gis信息子数据添加', 'governmentsubject:gis:child:add', 2, 271, '', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (423, 'gis信息子数据修改', 'governmentsubject:gis:child:edit', 2, 271, '', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (424, 'gis信息子数据删除', 'governmentsubject:gis:child:del', 2, 271, '', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (425, '产值信息配置添加', 'governmentsubject:output:add', 2, 271, '', 10, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (426, '产值信息配置修改', 'governmentsubject:output:edit', 2, 271, '', 10, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (427, '产值信息配置产值配置开关修改', 'governmentsubject:output:onoff', 2, 271, '', 10, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (428, '产值信息配置删除', 'governmentsubject:output:del', 2, 271, '', 10, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (429, '用户信息重置密码', 'governmentsubject:userinfo:pwdedit', 2, 271, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (430, '用户信息删除', 'governmentsubject:userinfo:del', 2, 271, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (431, '地块信息修改', 'governmentsubject:landtype:edit', 2, 271, '', 7, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (432, '地块信息删除', 'governmentsubject:landtype:del', 2, 271, '', 7, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (433, '种植标准信息修改', 'governmentsubject:plantstandard:edit', 2, 271, '', 8, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (434, '种植标准信息删除', 'governmentsubject:plantstandard:del', 2, 271, '', 8, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (435, 'gis信息修改', 'governmentsubject:gis:edit', 2, 271, '', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (436, 'gis信息删除', 'governmentsubject:gis:del', 2, 271, '', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (437, 'gis信息子数据配置', 'governmentsubject:gis:child', 2, 271, '', 9, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (438, '险种管理', '', 1, 148, '/insure', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (439, '险种管理', '', 1, 137, '/insure', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (440, '险种管理编辑', 'insure:edit', 2, 439, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (441, '公告类型', '', 1, 148, '/bulletinCategory', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (442, '新增地块', 'land:add', 2, 141, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (443, '编辑地块', 'land:edit', 2, 141, '', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (444, '删除地块', 'land:delete', 2, 141, '', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (445, '下架地块', 'land:offShelf', 2, 141, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (446, '大数据平台路由管理', '', 1, 212, '/platformRouteManagement', 24, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (448, '中台&大数据用户解锁', 'governmentsubject:userinfo:unlock', 1, 271, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (449, '险种管理启用禁用', 'insure:disable', 2, 439, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (450, '险种基本信息保存', 'insure:save', 2, 439, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (451, '添加可投保作物', 'insurable:add', 2, 439, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (452, '可投保作物编辑', 'insurable:edit', 2, 439, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (453, '可投保作物启用禁用', 'insurable:disable', 2, 439, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (454, '可投保作物信息保存', 'insurable:save', 2, 439, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (455, '合格证字段', '', 1, 212, '/certificateField', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (456, '合格证样式', '', 1, 212, '/certificateStyle', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (457, '新增', 'certificateField:add', 2, 455, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (458, '修改', 'certificateField:edit', 2, 455, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (459, '下架', 'certificateField:offshelf', 2, 455, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (460, '新增', 'certificateStyle:add', 2, 456, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (461, '修改', 'certificateStyle:edit', 2, 456, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (462, '系统管理', '', 1, 0, '', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (463, '日志管理', '', 1, 462, '/system-logs', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (464, '区域农事类型添加', 'areaFarmingType:add', 2, 344, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (466, '区域农事类型删除', 'areaFarmingType:del', 2, 344, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (467, '地块差异比对（上海） ', '', 1, 137, '/plotDeffience', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (468, '关联测绘院主体', 'plot:association', 2, 467, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (469, '地块校准', 'plot:landedit', 2, 467, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (470, '备注和状态修改', 'plot:edit', 2, 467, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (471, '关联测绘院主体', 'farm:association', 2, 140, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (472, '外设管理', '', 1, 212, '/peripherals', 24, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (473, '一年生作物预测配置', '', 1, 148, '/production-forecast', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (474, '修改', 'productionForecast:edit', 2, 473, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (475, '清空', 'productionForecast:clear', 2, 473, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (476, '解锁', 'sysuser:unlock', 2, 145, '', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (477, '关联政府主体', 'sysuser:link', 1, 145, '', 5, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (478, '关联政府主体详细页', '', 1, 145, '', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (479, '添加关联', 'relateGovSubject:add', 2, 478, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (480, '取消关联', 'relateGovSubject:cancel', 2, 478, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (481, '政府端主体', '', 1, 144, '/governmentsubjectPowser', 4, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (484, '发布公告', '', 1, 144, '/announce', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (485, '发布新公告', 'notice:add', 2, 484, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (487, '解锁', 'opersubject:unlock', 2, 285, '', 6, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (488, '撤回公告', 'notice:withdraw', 2, 484, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (489, '取消公告', 'notice:cancel', 2, 484, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (490, '编辑公告', 'notice:edit', 2, 484, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (491, '删除公告', 'notice:del', 2, 484, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (492, '测试菜单1', '', 1, 463, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (497, '农机作业类型', '', 1, 148, '/machineryOperation', 14, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (498, '农机大类', '', 1, 148, '/machinerySubject', 15, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (499, '农机小类', '', 1, 148, '/machineryCate', 16, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (500, '农机分类', '', 1, 148, '/machineryVariety', 17, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (501, '农机生产企业', '', 1, 148, '/agriMachineCompany', 18, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (502, '农机调度系统菜单管理', '', 1, 144, '/machineryDispatchMenu', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (503, '农机服务中心', '', 1, 144, '/agriMachineryService', 3, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (504, '添加', 'machineryDispatchMenu:add', 2, 502, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (505, '编辑', 'machineryDispatchMenu:edit', 2, 502, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (506, '删除', 'machineryDispatchMenu:del', 2, 502, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (507, '添加', 'agriMachineryService:add', 2, 503, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (508, '修改', 'agriMachineryService:edit', 2, 503, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (509, '角色信息系统授权', 'agriMachineryService:rolegrant', 2, 503, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (510, '1', '', 1, 0, '1', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (511, '22', '', 1, 510, 'sss', 2, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (512, '供应企业', '', 1, 137, '/supplier', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (513, '使用记录', 'supplier:supplierRecord', 2, 512, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (514, '修改', 'supplier:change', 2, 512, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (515, '添加', 'noticetype:add', 2, 441, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (516, '编辑', 'noticetype:edit', 2, 441, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (517, '启用/禁用', 'noticetype:enabled', 2, 441, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (518, '任务类型', '', 1, 148, '/taskType', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (520, '添加', 'machineryVariety:add', 2, 500, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (521, '修改', 'machineryVariety:edit', 2, 500, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (522, '上架', 'machineryVariety:up', 2, 500, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (523, '下架', 'machineryVariety:down', 2, 500, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (524, '添加', 'machineryCate:add', 2, 499, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (525, '修改', 'machineryCate:edit', 2, 499, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (526, '上架', 'machineryCate:up', 2, 499, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (527, '下架', 'machineryCate:down', 2, 499, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (529, '修改', 'machinerySubject:edit', 2, 498, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (530, '添加', 'machinerySubject:add', 2, 498, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (531, '上架', 'machinerySubject:up', 2, 498, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (532, '下架', 'machinerySubject:down', 2, 498, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (533, '添加', 'tasktype:add', 2, 518, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (534, '修改', 'tasktype:edit', 2, 518, '', 1, 'ios-paper-outline', '', '_self', 1);
INSERT INTO `sys_resource`
VALUES (535, '禁用', 'tasktype:forbidden', 2, 518, '', 1, 'ios-paper-outline', '', '_self', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `role_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
    `role_desc`   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
    `sort_num`    int(11) NULL DEFAULT NULL COMMENT '排序字段，越小越靠前',
    `create_time` datetime NULL DEFAULT NULL,
    `update_time` datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '管理员', '管理员权限', 1, '2019-01-04 11:07:11', '2019-01-18 09:56:41');
INSERT INTO `sys_role`
VALUES (14, '开发人员', '开发人员使用', 2, '2019-01-18 09:59:59', '2021-07-16 10:13:58');
INSERT INTO `sys_role`
VALUES (17, '测试', '测试测试测试', 3, '2019-01-21 14:07:55', '2019-01-21 14:08:09');
INSERT INTO `sys_role`
VALUES (19, '运营', '运营人员', 4, '2019-02-01 10:26:10', '2019-02-01 10:26:10');
INSERT INTO `sys_role`
VALUES (20, '政府客户', '只看农场地图', 5, '2019-03-22 19:47:59', '2019-03-22 19:47:59');
INSERT INTO `sys_role`
VALUES (21, '产品', '产品人员', 6, '2019-04-02 16:33:28', '2019-04-02 16:33:28');
INSERT INTO `sys_role`
VALUES (22, '超级管理员', '超级管理员', 1, '2020-06-28 16:04:50', '2021-02-22 10:24:48');
INSERT INTO `sys_role`
VALUES (24, '1', '1', 1, '2021-10-08 10:20:05', '2021-10-08 10:20:05');
INSERT INTO `sys_role`
VALUES (25, '等保测评', '等保测评', 1, '2021-12-23 09:54:45', '2021-12-23 09:54:45');

-- ----------------------------
-- Table structure for sys_role_resource_ref
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource_ref`;
CREATE TABLE `sys_role_resource_ref`
(
    `role_id`     bigint(20) NULL DEFAULT NULL COMMENT '角色id',
    `resource_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色资源关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_resource_ref
-- ----------------------------
INSERT INTO `sys_role_resource_ref`
VALUES (20, 236);
INSERT INTO `sys_role_resource_ref`
VALUES (20, 237);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 236);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 245);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 253);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 302);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 137);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 138);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 326);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 331);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 332);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 333);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 140);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 139);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 141);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 142);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 143);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 148);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 153);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 186);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 187);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 188);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 152);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 176);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 181);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 182);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 151);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 183);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 184);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 185);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 149);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 177);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 178);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 179);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 150);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 180);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 161);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 189);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 175);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 190);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 191);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 192);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 144);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 145);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 193);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 194);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 195);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 146);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 196);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 197);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 198);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 147);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 199);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 200);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 201);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 285);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 286);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 287);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 288);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 289);
INSERT INTO `sys_role_resource_ref`
VALUES (17, 334);
INSERT INTO `sys_role_resource_ref`
VALUES (21, 137);
INSERT INTO `sys_role_resource_ref`
VALUES (21, 140);
INSERT INTO `sys_role_resource_ref`
VALUES (21, 139);
INSERT INTO `sys_role_resource_ref`
VALUES (21, 141);
INSERT INTO `sys_role_resource_ref`
VALUES (21, 142);
INSERT INTO `sys_role_resource_ref`
VALUES (21, 143);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 236);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 237);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 245);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 253);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 311);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 302);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 137);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 138);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 140);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 139);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 141);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 142);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 143);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 252);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 258);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 148);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 153);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 152);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 151);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 149);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 150);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 161);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 207);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 308);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 315);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 313);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 314);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 212);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 213);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 255);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 175);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 218);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 217);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 214);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 228);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 231);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 232);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 216);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 238);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 239);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 240);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 241);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 259);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 261);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 262);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 281);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 291);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 290);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 292);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 303);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 310);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 271);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 272);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 285);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 286);
INSERT INTO `sys_role_resource_ref`
VALUES (14, 205);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 137);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 138);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 326);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 331);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 332);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 333);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 140);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 329);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 330);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 343);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 357);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 139);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 141);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 142);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 143);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 252);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 367);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 258);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 148);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 153);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 335);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 152);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 151);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 336);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 149);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 363);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 150);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 356);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 161);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 308);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 315);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 313);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 369);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 212);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 344);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 347);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 348);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 349);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 350);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 351);
INSERT INTO `sys_role_resource_ref`
VALUES (19, 352);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 236);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 237);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 245);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 302);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 137);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 138);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 140);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 139);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 141);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 212);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 213);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 255);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 175);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 218);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 217);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 214);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 216);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 144);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 145);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 193);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 194);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 195);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 146);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 196);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 197);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 198);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 271);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 272);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 273);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 274);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 275);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 412);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 413);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 429);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 430);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 415);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 416);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 417);
INSERT INTO `sys_role_resource_ref`
VALUES (25, 418);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 236);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 237);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 245);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 253);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 311);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 312);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 302);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 511);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 137);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 138);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 326);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 331);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 332);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 333);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 355);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 439);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 440);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 449);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 450);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 451);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 452);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 453);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 454);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 467);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 468);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 469);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 470);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 512);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 513);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 514);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 140);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 329);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 471);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 330);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 343);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 357);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 401);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 400);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 139);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 328);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 354);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 141);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 442);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 445);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 443);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 444);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 391);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 142);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 143);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 252);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 367);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 368);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 258);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 260);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 381);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 390);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 148);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 153);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 186);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 187);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 188);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 335);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 337);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 338);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 339);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 438);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 473);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 474);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 475);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 518);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 152);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 176);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 181);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 182);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 404);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 406);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 407);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 408);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 151);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 183);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 184);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 185);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 336);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 340);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 341);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 342);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 441);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 149);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 177);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 178);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 179);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 363);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 364);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 365);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 366);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 150);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 180);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 202);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 203);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 356);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 359);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 360);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 361);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 382);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 383);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 384);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 385);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 386);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 387);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 388);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 389);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 161);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 189);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 207);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 208);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 209);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 210);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 308);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 324);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 315);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 316);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 317);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 313);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 318);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 319);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 320);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 314);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 321);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 322);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 323);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 353);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 369);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 371);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 372);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 373);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 375);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 497);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 498);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 499);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 500);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 501);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 212);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 213);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 219);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 220);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 221);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 255);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 256);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 345);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 455);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 457);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 458);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 459);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 456);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 460);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 461);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 175);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 190);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 191);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 192);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 218);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 233);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 234);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 235);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 217);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 222);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 223);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 224);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 214);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 228);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 231);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 232);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 216);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 225);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 226);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 227);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 238);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 246);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 247);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 248);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 239);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 249);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 250);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 251);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 240);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 241);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 242);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 243);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 244);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 259);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 261);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 262);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 263);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 264);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 265);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 281);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 282);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 283);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 284);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 291);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 293);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 294);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 295);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 290);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 296);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 297);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 298);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 292);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 299);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 300);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 301);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 303);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 304);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 305);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 306);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 307);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 310);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 344);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 347);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 464);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 466);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 348);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 349);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 350);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 351);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 352);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 380);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 393);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 394);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 395);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 392);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 396);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 397);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 398);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 446);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 472);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 144);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 484);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 485);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 488);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 489);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 490);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 491);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 145);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 193);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 194);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 195);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 476);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 477);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 478);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 479);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 480);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 146);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 196);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 197);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 198);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 147);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 199);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 200);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 201);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 403);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 409);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 410);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 411);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 502);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 504);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 505);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 506);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 503);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 507);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 508);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 509);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 271);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 272);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 273);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 274);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 275);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 412);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 413);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 429);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 430);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 448);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 415);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 416);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 417);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 418);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 419);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 431);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 432);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 420);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 433);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 434);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 421);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 422);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 423);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 424);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 435);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 436);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 437);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 425);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 426);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 427);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 428);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 481);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 285);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 286);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 287);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 288);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 289);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 334);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 487);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 205);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 462);
INSERT INTO `sys_role_resource_ref`
VALUES (1, 463);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 236);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 237);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 245);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 253);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 311);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 312);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 302);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 137);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 138);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 326);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 331);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 332);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 333);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 355);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 439);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 440);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 449);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 450);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 451);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 452);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 453);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 454);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 467);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 468);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 469);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 470);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 512);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 513);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 514);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 140);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 329);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 471);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 330);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 343);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 357);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 401);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 400);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 139);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 328);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 354);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 141);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 442);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 445);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 443);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 444);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 391);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 142);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 143);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 252);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 367);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 368);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 258);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 260);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 381);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 390);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 148);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 153);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 186);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 187);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 188);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 335);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 337);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 338);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 339);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 438);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 473);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 474);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 475);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 518);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 533);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 534);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 535);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 152);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 176);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 181);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 182);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 404);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 406);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 407);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 408);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 151);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 183);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 184);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 185);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 336);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 340);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 341);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 342);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 441);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 515);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 516);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 517);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 149);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 177);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 178);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 179);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 363);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 364);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 365);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 366);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 150);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 180);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 202);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 203);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 356);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 359);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 360);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 361);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 382);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 383);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 384);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 385);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 386);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 387);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 388);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 389);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 161);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 189);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 207);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 208);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 209);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 210);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 308);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 324);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 315);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 316);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 317);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 313);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 318);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 319);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 320);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 314);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 321);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 322);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 323);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 353);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 369);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 371);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 372);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 373);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 375);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 497);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 498);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 529);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 530);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 531);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 532);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 499);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 524);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 525);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 526);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 527);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 500);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 520);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 521);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 522);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 523);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 501);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 212);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 213);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 219);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 220);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 221);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 255);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 256);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 345);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 455);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 457);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 458);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 459);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 456);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 460);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 461);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 175);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 190);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 191);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 192);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 218);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 233);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 234);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 235);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 217);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 222);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 223);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 224);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 214);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 228);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 231);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 232);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 216);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 225);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 226);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 227);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 238);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 246);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 247);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 248);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 239);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 249);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 250);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 251);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 240);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 241);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 242);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 243);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 244);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 259);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 261);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 262);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 263);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 264);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 265);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 281);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 282);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 283);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 284);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 291);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 293);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 294);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 295);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 290);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 296);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 297);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 298);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 292);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 299);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 300);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 301);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 303);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 304);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 305);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 306);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 307);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 310);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 344);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 347);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 464);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 466);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 348);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 349);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 350);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 351);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 352);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 380);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 393);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 394);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 395);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 392);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 396);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 397);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 398);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 446);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 472);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 144);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 484);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 485);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 488);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 489);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 490);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 491);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 145);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 193);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 194);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 195);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 476);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 477);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 478);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 479);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 480);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 146);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 196);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 197);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 198);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 147);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 199);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 200);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 201);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 403);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 409);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 410);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 411);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 502);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 504);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 505);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 506);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 503);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 507);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 508);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 509);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 271);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 272);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 273);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 274);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 275);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 412);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 413);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 429);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 430);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 448);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 415);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 416);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 417);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 418);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 419);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 431);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 432);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 420);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 433);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 434);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 421);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 422);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 423);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 424);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 435);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 436);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 437);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 425);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 426);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 427);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 428);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 481);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 285);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 286);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 287);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 288);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 289);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 334);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 487);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 205);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 462);
INSERT INTO `sys_role_resource_ref`
VALUES (22, 463);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，采用idgen生成',
    `username`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
    `nickname`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称，正式姓名',
    `password`           varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
    `enable`             tinyint(4) NULL DEFAULT 1 COMMENT '是否启用：1启用，0冻结',
    `head_url`           text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像url',
    `admin_flag`         tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否超级管理员：1-是，0-否，如果是超级管理员，标识账号内置，不可修改，不可删除',
    `login_time`         datetime NULL DEFAULT NULL COMMENT '最近登录时间',
    `role_id`            bigint(20) NULL DEFAULT 0 COMMENT '角色id，如果是内置的超级管理员账号，则不需要设置该字段，该字段取0',
    `create_time`        datetime NULL DEFAULT NULL,
    `update_time`        datetime NULL DEFAULT NULL,
    `edit_password_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '该账号是否已强制修改密码 true 是 false 否',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uqi_username` (`username`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 'superadmin', '超管', 'e10adc3949ba59abbe56e057f20f883e', 1,
        'http://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/DE046EC1CC404284E6A5864BC3CFFF23.jpg', 1, '2022-10-17 14:09:54', 0,
        '2019-01-03 17:52:19', '2022-10-17 14:09:54', 1);

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
-- Records of tbl_user_salt
-- ----------------------------

SET
FOREIGN_KEY_CHECKS = 1;



CREATE TABLE `sys_user_token`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id`          bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
    `access_token`     varchar(64) NOT NULL COMMENT '访问的accessToken',
    `client_type`      tinyint(4) DEFAULT '1' COMMENT '客户端类型：1-webH5，2-安卓端，3-ios端',
    `token_status`     tinyint(4) DEFAULT '1' COMMENT '状态;1-可用，0-不可用',
    `expire_time`      datetime    DEFAULT NULL COMMENT '失效时间，过期后不可使用',
    `refresh_date_str` varchar(16) DEFAULT NULL COMMENT '刷新token日期字符串，格式：yyyy-MM-dd，如果当前刷新过了，则无需重复刷新',
    `create_time`      datetime    DEFAULT NULL,
    `update_time`      datetime    DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uqi_access_token` (`access_token`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2607
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='企业用户token表';


CREATE TABLE `tbl_admin_request_log`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `request_url`        varchar(255) DEFAULT NULL COMMENT '请求地址',
    `request_ip`         varchar(64)  DEFAULT NULL COMMENT '请求ip',
    `request_method`     varchar(255) DEFAULT NULL COMMENT '请求方法',
    `request_body`       longtext COMMENT '请求参数',
    `response_body`      longtext COMMENT '返回参数',
    `request_time`       int(11) DEFAULT NULL COMMENT '消耗时长(单位:ms)',
    `response_code`      int(11) NOT NULL COMMENT '响应代码',
    `response_msg`       varchar(255) DEFAULT NULL COMMENT '响应描述信息',
    `operator_user_id`   bigint(20) NOT NULL COMMENT '操作人id',
    `operator_user_name` varchar(64)  DEFAULT NULL COMMENT '操作人姓名',
    `access_token`       varchar(255) DEFAULT NULL COMMENT 'token记录',
    `create_time`        datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 264966
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='管理后台操作日志记录表';
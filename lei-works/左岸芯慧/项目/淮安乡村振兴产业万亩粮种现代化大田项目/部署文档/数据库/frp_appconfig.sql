

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_agreement
-- ----------------------------
DROP TABLE IF EXISTS `sys_agreement`;
CREATE TABLE `sys_agreement`
(
    `id`             bigint(20)                                                   NOT NULL,
    `type_flag`      tinyint(4)                                                   NULL DEFAULT NULL COMMENT '类型。1:服务条款,2隐私条款',
    `agreement_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议名称',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `content`        mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL,
    `create_by`      bigint(20)                                                   NULL DEFAULT NULL,
    `create_time`    timestamp                                                    NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `update_by`      bigint(20)                                                   NULL DEFAULT NULL,
    `update_time`    timestamp                                                    NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_typeflag` (`type_flag`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '协议表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_agreement
-- ----------------------------
INSERT INTO `sys_agreement`
VALUES (33, 2, '神农口袋隐私政策', '隐私政策',
        '<p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">一、隐私条款的覆盖范围</span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">您的隐私安全对于我们十分重要，我们也非常乐意告知您我们是如何收集、使用您的相关信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">本文旨在帮助您了解如下内容：</span></p><ul class=\" list-paddingleft-2\" style=\"width: 1389.84px; white-space: normal;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们收集哪些信息；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们将如何使用收集到的信息；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们如何存储收集到的信息并如何保障其安全性；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">有害信息的过滤和删除；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">您的权利；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">业务转让；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">其他重要的隐私策略；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">联系我们；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">隐私政策的变更。</span></p></li></ul></ul><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">本隐私协议在您使用“神农口袋”网站、移动客户端（APP）及其他软件服务（以下简称“神农口袋”或“产品”）、相关系列产品和服务或者在您以其他方式调用神农口袋时全程有效（除其他单独的隐私协议注释外）。此政策还阐述了您有权决定是否允许我们收集您的行为数据。如果您不同意此政策，请勿访问或使用我们的产品或服务或者与我们业务的任何其他方面进行互动，否则视为您接受并遵守本政策。当本政策中提及“神农口袋”或“我们”时，指的是安徽左岸芯慧信息科技有限公司（Anhui&nbsp; Zuoanxinhui Information Technology Co., Ltd.），神农口袋在您使用服务时收集的信息由其进行控制。神农口袋以包括网站、桌面产品、移动产品在内的产品为您提供了农场管理工具，帮助您进行农场管理和与人沟通。我们还拥有并运营着多个其他网站并提供相关服务。本政策中的“服务”指的是上述所有产品及服务。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">二、我们收集哪些信息</span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们将收集您提供给我们的信息，包括您在使用我们的产品或服务时产生的信息以及其他信息来源向我们提供的信息，具体类别如下所述：</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">您提供给我们的信息</span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们将收集您在我们网站或服务中直接输入或提交的数据。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 账户信息和个人资料信息：我们将在您注册账户、创建或修改个人资料、设置偏好、登入、通过我们的服务进行购买或为购买而进行登记时收集您的有关信息，例如：您在注册服务时提供的联系信息以及某些情况下的帐单信息将会被我们收集。您还可以选择将个人照片及其他详细信息添加到您的个人资料中，以显示于我们的服务系统之上。在您选择或修改个人偏好时，我们也将持续获取和追踪您的偏好信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 您通过我们的产品所提供的内容：我们将通过您使用的神农口袋网页和移动产品来收集和存储您发布、发送、接收和分享的内容，此内容包括您的任何信息或者您选择包含的信息，还包括您上传到服务系统中的文件和链接。我们收集和存储的内容包括：企业信息、员工、农场信息、地块、种植计划、生产任务、采收、客户、宅配计划和订单等。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. 支付信息：当您注册某些付费服务时，我们会收集某些付款和账单信息。例如：在您为我们的产品付费时，我们要求您提交的姓名和联系信息等；您也可能会提供付款账号信息，如银行卡卡号等。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"></span></p><p style=\"white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4.个人设备信息（包括设备型号、硬件序列号、设备MAC地址、操作系统版本、设备设置、唯一设备识别码（IMEI、Android ID、IDFA、SIM卡IMSI信息)、UUD、必要的移动应用列表信息、软硬件及设备、设备环境信息)；</span></p><p style=\"white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">5.个人位置信息（包括精准定位信息)。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">您使用服务时自动收集的信息</span></strong><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">当您浏览和使用我们的服务时（如浏览网站或者在网页中进行相应的操作），我们将自动收集您的一些相关信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 您在我们的产品中的使用行为：当您访问我们的任何服务并与之互动时，我们会跟踪您的某些信息。这些信息包括您正在使用的功能，如：点击任务、选择地块或者点击其他链接；同时包括了您上传到服务中的附件及其类型、大小和文件名称；也包括您所经常使用的搜索词以及您在产品中是如何与他人互动的等等。我们还收集了您的企业和人员的信息以及您与他们的互动方式，例如与您最频繁合作和沟通的人员。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 设备与连接信息：在您使用我们的服务时，我们收集了有关您的计算机、手机、平板电脑或您用于访问服务的其他设备的信息。此设备信息包括您在安装、访问、更新或使用我们的服务时的连接类型和设置。我们还通过您的设备收集关于您的操作系统、浏览器类型、IP地址、分享/退出页面的URL、设备标识符以及应用于软件崩溃相关数据的信息。我们也将使用您的IP地址、国家或地区偏好来估算您的位置，以提供更好的服务体验。我们所收集的信息数量取决于您用于访问服务的设备类型和设置。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. Cookies和其他跟踪技术：神农口袋及我们的第三方合作伙伴（如我们的分析合作伙伴）可能会使用Cookie和其他跟踪技术（如网页打点等）来识别您的身份。Cookie是仅限文本的信息字符串，网站会将这些字符串传输到计算机硬盘的浏览器 Cookie 文件中，以便网站能够记住您的身份信息以及其他详细信息。Cookie可能由网站设置或来源自第三方，如广告商。Cookie本身不用于或意图用于从用户计算机读取任何信息（Cookie本身的内容除外）。Cookie只是网站所使用的最初将其放置在您硬盘上的标识符。同一台服务器可以检索到 Cookie 信息的实际内容，从而标识计算机，并进而根据主服务器上存储的信息来自定义、跟踪或控制站点的使用情况。我们会通过这些追踪手段来帮助您更好地使用神农口袋，也帮助我们更好地改善对应功能。您可以通过修改浏览器设置来选择接受或者拒绝Cookie。但是如果您禁用了Cookie，您将不能使用神农口袋的各项交互功能。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"><melo-data data-src=\"{&quot;mainAtext&quot;:&quot;{\\&quot;atext\\&quot;:{\\&quot;attribs\\&quot;:\\&quot;*0*1*2*3*4*5*6*7+15*0*8*2*5*6+5*0*1*2*3*4*5*6*7+1d*9*a*b*c*d*e*f*g*0*1*2*3*4*5*6*7+1\\&quot;,\\&quot;text\\&quot;:\\&quot;4.用户软件安装列表和Mac地址：这部分信息可能是由底层技术框架APICloud和极光sdk收集，收集目的是为了判断设备当前是否安装了本公司的其他应用，方便应用之间进行联动、推送最新版本等。\\\\n\\&quot;},\\&quot;apool\\&quot;:{\\&quot;numToAttrib\\&quot;:{\\&quot;0\\&quot;:[\\&quot;author\\&quot;,\\&quot;p.144115224858580591\\&quot;],\\&quot;1\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;微软雅黑, \\\\\\&quot;Microsoft YaHei\\\\\\&quot;\\&quot;],\\&quot;2\\&quot;:[\\&quot;font-size\\&quot;,\\&quot;9pt\\&quot;],\\&quot;3\\&quot;:[\\&quot;bold\\&quot;,\\&quot;false\\&quot;],\\&quot;4\\&quot;:[\\&quot;italic\\&quot;,\\&quot;false\\&quot;],\\&quot;5\\&quot;:[\\&quot;color\\&quot;,\\&quot;rgb(102, 102, 102)\\&quot;],\\&quot;6\\&quot;:[\\&quot;background-color\\&quot;,\\&quot;rgb(247, 249, 251)\\&quot;],\\&quot;7\\&quot;:[\\&quot;letter-spacing\\&quot;,\\&quot;0pt\\&quot;],\\&quot;8\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;9\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;10\\&quot;:[\\&quot;pap-right-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;11\\&quot;:[\\&quot;pap-specialIndent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;12\\&quot;:[\\&quot;pap-line\\&quot;,\\&quot;1\\&quot;],\\&quot;13\\&quot;:[\\&quot;pap-line-rule\\&quot;,\\&quot;auto\\&quot;],\\&quot;14\\&quot;:[\\&quot;pap-spacing-before\\&quot;,\\&quot;11.25pt\\&quot;],\\&quot;15\\&quot;:[\\&quot;pap-spacing-after\\&quot;,\\&quot;3.75pt\\&quot;],\\&quot;16\\&quot;:[\\&quot;snapToGrid\\&quot;,\\&quot;1\\&quot;]},\\&quot;nextNum\\&quot;:17}}&quot;,&quot;storyAtexts&quot;:[],&quot;srcGlobalPadId&quot;:&quot;300000000$PEyZJdSMxBjG&quot;}\" data-version=\"2.1.0\"></melo-data></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4.用户软件安装列表、Mac地址、<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">IMEI码</span>：这部分信息可能是由底层技术框架APICloud和极光sdk收集，收集目的是为了判断设备当前是否安装了本公司的其他应用，方便应用之间进行联动、推送最新版本等。</span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"><br/></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"><melo-data data-src=\"{&quot;mainAtext&quot;:&quot;{\\&quot;atext\\&quot;:{\\&quot;attribs\\&quot;:\\&quot;*0*1*2*3*4*5*6*7+6*8*9*a*b*c*d*e*f*0*1*2*3*4*5*6*7+1*0*1*2*g*4*5*6*7+l*8*9*a*b*c*d*e*f*0*1*2*g*4*5*6*7+1*0*h*2*5*6+s*0*i*2*5*6+o*0*1*2*g*4*5*6*7+3n*0*h*2*5*6+w*0*i*2*5*6+1o*8*9*b*c*d*e*f*j*k*0*1*2*g*4*5*6*7+1*0*1*2*g*4*5*6*7+2*0*h*2*5*6+2w*0*i*2*5*6+17*8*9*b*c*d*e*f*j*0*h*2*5*6+1*0*h*2*g*4*5*6*7+2*0*i*2*5*6+13*0*1*2*g*4*5*6*7+31*8*9*b*c*d*e*f*j*0*1*2*g*4*5*6*7+1*0*h*2*g*4*5*6*7+2*0*i*2*5*6+e*0*1*2*g*4*5*6*7+42*0*h*2*5*6+v*l*9*b*c*d*e*f*j*0*1*2*g*4*5*6*7+1\\&quot;,\\&quot;text\\&quot;:\\&quot;第三方SDK\\\\n为了更好的服务用户，我们还集成了以下SDK\\\\n1.cn.jpush.android(极光;极光推送)、 com.huawei.hms(华为;华为推送)，主要用于向用户推送信息，例如，用户在使用“专家问答”功能时，“专家端”用户进行回复后，我们将用上述SDK向您推送回复内容，以达到及时提醒的目。可能会收集的用户信息：信息推送的时间、推送结果、用户查看信息的时间、用户软件安装列表和Mac地址。请参考：极光推送介绍https://www.jiguang.cn/push，华为推送https://developer.huawei.com/consumer/cn/hms/huawei-pushkit/\\\\n2.com.tencent.smtt(TBS腾讯浏览服务;腾讯浏览服务;腾讯X5浏览器;腾讯浏览器)，主要用于在客户端打开“溯源信息”H5页面，让用户可以浏览。该SDK并不会收集任何用户信息。请参考：腾讯浏览服务https://x5.tencent.com/tbs/product/tbs.html\\\\n3.com.amap.api(高德地图;高德导航;高德定位;阿里高德地图;高德) ，主要用于获取用户的定位信息，例如，在使用“圈地”功能时，将通过该SDK获取到用户当前所在的地理位置，便于用户用户。可能会收集的用户信息：用户位置信息；请参考：高德地图API https://lbs.amap.com/\\\\n4. com.umeng(友盟)，主要用于统计用户使用应用内各种功能的次数，例如，打开应用的次数、某个页面停留的时间、使用农事操作功能的次数等，目的是为了根据用户习惯优化应用的设计。该SDK会收集的用户信息：应用访问次数、页面访问时间、某个功能的访问次数、访问时间、应用内的页面的使用路径等。请参考：友盟U-APP移动统计 https://www.umeng.com/analytics\\\\n\\&quot;},\\&quot;apool\\&quot;:{\\&quot;numToAttrib\\&quot;:{\\&quot;0\\&quot;:[\\&quot;author\\&quot;,\\&quot;p.144115224858580591\\&quot;],\\&quot;1\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;微软雅黑, \\\\\\&quot;Microsoft YaHei\\\\\\&quot;\\&quot;],\\&quot;2\\&quot;:[\\&quot;font-size\\&quot;,\\&quot;9pt\\&quot;],\\&quot;3\\&quot;:[\\&quot;bold\\&quot;,\\&quot;true\\&quot;],\\&quot;4\\&quot;:[\\&quot;italic\\&quot;,\\&quot;false\\&quot;],\\&quot;5\\&quot;:[\\&quot;color\\&quot;,\\&quot;rgb(102, 102, 102)\\&quot;],\\&quot;6\\&quot;:[\\&quot;background-color\\&quot;,\\&quot;rgb(247, 249, 251)\\&quot;],\\&quot;7\\&quot;:[\\&quot;letter-spacing\\&quot;,\\&quot;0pt\\&quot;],\\&quot;8\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;9\\&quot;:[\\&quot;pap-right-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;10\\&quot;:[\\&quot;pap-specialIndent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;11\\&quot;:[\\&quot;pap-line\\&quot;,\\&quot;1\\&quot;],\\&quot;12\\&quot;:[\\&quot;pap-line-rule\\&quot;,\\&quot;auto\\&quot;],\\&quot;13\\&quot;:[\\&quot;pap-spacing-before\\&quot;,\\&quot;11.25pt\\&quot;],\\&quot;14\\&quot;:[\\&quot;pap-spacing-after\\&quot;,\\&quot;3.75pt\\&quot;],\\&quot;15\\&quot;:[\\&quot;snapToGrid\\&quot;,\\&quot;1\\&quot;],\\&quot;16\\&quot;:[\\&quot;bold\\&quot;,\\&quot;false\\&quot;],\\&quot;17\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;18\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,\\\\\\&quot;Helvetica\\\\\\&quot;,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;19\\&quot;:[\\&quot;pap-list-level\\&quot;,\\&quot;0\\&quot;],\\&quot;20\\&quot;:[\\&quot;pap-list-task\\&quot;,\\&quot;\\&quot;],\\&quot;21\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0em\\&quot;]},\\&quot;nextNum\\&quot;:22}}&quot;,&quot;storyAtexts&quot;:[],&quot;srcGlobalPadId&quot;:&quot;300000000$PEyZJdSMxBjG&quot;}\" data-version=\"2.1.0\"></melo-data></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">第三方SDK</span></strong></span><span style=\"font-size: 9pt; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 700; color: rgb(102, 102, 102); background: rgb(247, 249, 251); letter-spacing: 0pt; vertical-align: baseline;\"></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">为了更好的服务用户，我们还集成了以下SDK</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1.cn.jpush.android(极光;极光推送)、 com.huawei.hms(华为;华为推送)，主要用于向用户推送信息，例如，用户在使用“专家问答”功能时，“专家端”用户进行回复后，我们将用上述SDK向您推送回复内容，以达到及时提醒的目。可能会收集的用户信息：信息推送的时间、推送结果、用户查看信息的时间、用户软件安装列表和Mac地址。请参考：极光推送介绍https://www.jiguang.cn/push，华为推送https://developer.huawei.com/consumer/cn/hms/huawei-pushkit/</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2.com.tencent.smtt(TBS腾讯浏览服务;腾讯浏览服务;腾讯X5浏览器;腾讯浏览器)，主要用于在客户端打开“溯源信息”H5页面，让用户可以浏览。该SDK并不会收集任何用户信息。请参考：腾讯浏览服务https://x5.tencent.com/tbs/product/tbs.html</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3.com.amap.api(高德地图;高德导航;高德定位;阿里高德地图;高德) ，主要用于获取用户的定位信息，例如，在使用“圈地”功能时，将通过该SDK获取到用户当前所在的地理位置，便于用户用户。可能会收集的用户信息：用户位置信息；请参考：高德地图API https://lbs.amap.com/</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4. com.umeng(友盟)，主要用于统计用户使用应用内各种功能的次数，例如，打开应用的次数、某个页面停留的时间、使用农事操作功能的次数等，目的是为了根据用户习惯优化应用的设计。该SDK会收集的用户信息：应用访问次数、页面访问时间、某个功能的访问次数、访问时间、应用内的页面的使用路径等。请参考：友盟U-APP移动统计 https://www.umeng.com/analytics</span><span style=\"font-size: 9pt; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; color: rgb(102, 102, 102); background: rgb(247, 249, 251); letter-spacing: 0pt; vertical-align: baseline;\"></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: normal;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"><br/></span><br/></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">三、我们将如何使用收集到的信息</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们如何使用收集到的信息部分取决于您所使用的服务、如何使用它们以及您所设置的偏好。以下是我们使用所收集的、关于您的信息的具体目的：</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 用于研究与开发迭代：我们一直在寻找方法使我们的服务以更智能、更快速、更安全、更综合、更有效的方式来帮助您获得更好的使用体验。我们通过集体学习，了解人们如何使用我们的服务，并不断收集用户直接向我们提供的反馈，以帮助我们排查问题并确定产品趋势、用法、活动模式以及服务整合和改进的方式。例如：我们在每次迭代与更新时，会记录新功能的使用量以及用户的使用链路，从而设计更好、更人性化的功能。在某些情况下，我们会将这部分的调查数据与研究数据提供给对应的研究机构以进行更深层的产品研究与学术研究。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 用于改善与用户的沟通交流：我们将使用您的联系信息，通过发送短信，包括确认您的购买、提醒您订阅到期、回应您的意见问题与需求、提供客户支持以及向您发送更新、通知、警告等。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. 用于技术服务：我们使用您的信息来解决您遇到的技术问题、响应您的协助请求、分析崩溃信息并进行修复和改进服务。如果您允许我们这样做，我们会与神农口袋的技术专家分享您的信息，以回应与支持相关请求。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4. 用于加强安全保护与鉴权：我们使用有关您和您的服务使用情况信息来验证账户和活动、监控可疑或欺诈活动并确定上述行为是否违反服务政策。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">5. 用于保护我们合法的商业利益和其他合法权益：在法律要求或我们认为有必要保护我们的合法权利、利益和他人利益的情况下，我们会使用有关您的信息来处理法律诉讼、合规、监管和审计相关事务，以及与收购、合并或出售业务相关的信息披露。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">6. 神农口袋所采集的数据所有权属于用户所有，但为提供更好的为用户提供服务，用户以此授予左岸芯慧及其关联公司、合作公司独家的、全球通用的、永久的、免费的许可使用权利 (并有权在多个层面对该权利进行再授权)，使左岸芯慧及其关联公司、合作公司有权(全部或部分地) 使用、复制、修订、改写、发布、翻译、分发、执行和展示用户的全部数据资料及个人信息或制作其派生作品，并对所采集数据享有开发权限，提供更多元化服务。为帮助您获得更好的金融服务，我们会向合作的金融机构共享您必要的个人信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">如果使用神农口袋，则视为您已经同意我们出于特定目的使用您的信息，当然您也拥有随时改变主意的权利，但这不会影响任何已经发生了的处理。当我们或第三方（如您的雇主）合法使用您的信息时，您有权反对。但是在某些情况下，这可能意味着您不再使用神农口袋。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">四、我们如何存储收集到的信息并如何保障其安全性</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">信息的存储和安全：我们使用阿里云提供的云服务托管我们收集的信息，并使用技术措施来保护您的数据。尽管我们极尽可能地保护您的信息安全，但由于互联网的固有特性，没有任何系统是绝对安全的，我们无法保证数据在通过互联网传输过程中和存储在我们系统时的绝对安全。我们会尽一切可能防止安全入侵事件的发生。但如果发生该类事件，我们将在合理期限内第一时间告知您。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">信息将被存储多久</span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">信息将被存储多久是由该信息的种类所决定的，我们在下文中将详细描述。当信息达到一定存储期限后，我们会删除您的信息或做匿名处理。但当删除操作无法进行的时候（如信息已存储在备份存档中），我们将安全地存储您的信息，并将其隔离，直至删除成为可能。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 账号信息：我们将保留您的账户信息，直到您删除您的账户。我们还将保留一些必要的信息，以履行法律义务、解决争议、履行协议、支持业务运营并继续开发和改进我们的服务。如果我们将要保留这些信息以用于服务改进和产品迭代，我们会将数据脱敏，并且我们只会利用这些信息进行集体性分析而不会针对您的个人数据做专门分析。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 您在我们服务中所分享的信息：如果您的账户已停用或被停用，您的部分信息和您提供的内容将被保留，以便您的团队成员或其他用户充分使用服务。例如：我们会继续显示您提供给企业或任务中的内容。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. 市场偏好信息：如果您选择接收我们的营销电子邮件，我们会保留有关您的营销偏好信息，除非您明确要求我们删除此类信息。我们将保留自创建日期起的合理时间段内从 Cookie 和其他跟踪技术中所获得的信息。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">五、有害信息的过滤和删除</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">根据相关法律的规定，神农口袋禁止用户创建和储存一切有害信息，包括：</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（1）违反中国宪法确定的基本原则的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（3）宣扬恐怖主义、极端主义、民族仇恨、民族歧视的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（4）破坏国家、地区间友好关系的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（6）散布谣言或不实消息，扰乱社会秩序，破坏社会稳定的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（7）煽动、组织、教唆恐怖活动、非法集会、结社、游行、示威、聚众扰乱社会秩序的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（8）散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（9）侵犯他人名誉、隐私、著作权、信息网络传播权等合法权益的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（10）含有法律、行政法规禁止的其他内容的。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">神农口袋将针对以上信息制定过滤和屏蔽机制。如用户创建项目或储存文件时不能履行和遵守本政策中的规定，神农口袋有权对违反本政策的用户做出关闭账户的处理，同时保留依法追究当事人法律责任的权利。此外，神农口袋在采取移除等相应措施后，不为此向原发布人承担违约责任或其他法律责任。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">六、您的权利</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 您可以在使用我们服务的过程中，访问、修改、撤回和删除您提供的注册信息和其他个人信息，也可按照通知指引与我们联系。您访问、修改和删除个人信息的范围和方式将取决于您使用的具体服务。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 每个业务功能可能需要某些基本的个人信息才能得以完成。对于额外收集的个人信息的收集和使用，您可以随时给予或撤回您的授权同意。当您撤回同意后，我们将不再处理相应的个人信息。但您撤回同意的决定，不会影响此前基于您的授权而开展的个人信息处理。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. 您有权获取您的个人信息副本。在技术可行的前提下，例如数据接口匹配，我们还可按您的要求，直接将您的个人信息副本传输给您指定的第三方。我们将以弹窗方式单独告知接收个人信息的第三方身份或类型、向第三方分享数据的目的及数据的范围并征得您的同意。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4. 在某些业务功能中，我们可能仅依据信息系统、算法等非人工自动决策机制对您的个人信息做出处理。如果这些决定将显著影响您的合法权益，您有权要求我们做出解释，我们也将对此提供适当的救济方式。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">5. 您有权要求限制对您个人数据的处理。在下列情形中，您有权限制我们处理数据：当您对个人数据的准确性有争议，并允许我们在一定的期限内核实其准确性时；当数据处理是非法的，且您反对删除个人数据而是要求限制使用该个人数据时；当我们不再需要个人数据以实现处理目的，但您为了提起、行使或抗辩法律诉求而需要该个人数据时；当您基于反对权需要核实我们的法律依据是否优先于您的法律依据时。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">6. 您有权选择退出促销。您可以选择不接收我们的促销信息，为此目的，您可以直接联系我们从促销邮件列表或注册数据库中中删除您的联系信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">7. 为保障安全，您可能需要以提供书面材料或其他方式证明您的身份。我们可能会先要求您验证自己的身份，然后再处理您的请求。对于您的合理请求，我们原则上不收取费用，但对多次重复、超出合理限度的请求，我们将视情况收取一定的成本费用。对于那些无端重复、需要过多技术手段（例如：需要开发新系统或从根本上改变现行惯例）、给他人合法权益带来风险或者非常不切实际（例如：涉及备份磁带上存放的信息）的请求，我们可能会予以拒绝。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">在以下情形中，按照法律法规要求，我们将无法响应您的请求：</span></p><ul class=\" list-paddingleft-2\" style=\"width: 1389.84px; white-space: normal;\"><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">与国家安全、国防安全直接相关的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">与公共安全、公共卫生、重大公共利益直接相关的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">与犯罪侦查、起诉、审判和判决执行等直接相关的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">有充分证据表明您存在主观恶意或滥用权利的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">响应您的请求将导致您或其他个人、组织的合法权益受到严重损害的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">涉及商业秘密的。</span></p></li></ul><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">七、业务转让</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">神农口袋收集的信息将被视作一项资产，如果存在下列情况之一，此类信息可能成为被转让的资产之一：神农口袋、任何关联公司或部门与其他企业或部门进行合并、被收购，或者进行破产、解散、重组，或者出售部分或全部神农口袋的资产或股票，或者进行融资、公开发行证券，或者被收购全部或部分业务，或者进入其他类似交易或程序，或者为此类活动进行的其他程序和步骤（例如尽职调查）。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">当上述交易完成后，若存在转让神农口袋收集的信息的情况，我们会以邮件和/或其他方式通知您。收购方或者其他与收购方具有类似地位的权利义务承继者，只能按照此隐私策略（或者向您收集信息时任何有效的后续策略）来使用您的信息。请注意，转让后提交或收集的信息可能根据收购方的要求在法律允许的范围内进行修改，隐私政策也将据此进行更新。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">八、其他重要的隐私策略</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们的产品适用于个人使用和组织使用，在通过组织（例如您的雇主）向您提供服务的情况下，该组织是服务的管理员，并且对其拥有控制权的最终用户和服务站点负责。如果是此种情况，请将您的数据隐私需求提交给管理员，因为您对服务的使用受制于该组织的政策。我们不对管理员组织的隐私或安全做法负责，这些做法可能与本政策有所出入。即使服务目前没有由组织管理，如果您是由组织管理的团队的成员，那么该团队的管理员（例如您的雇主）可能会对您的账户进行管理、控制，并在这之后使用我们的服务。如果发生此类情况，您会收到通知。农场管理员、企业管理员能够限制您对任务、农场、企业的访问与权限。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">如果您不希望管理员能够控制您的账户或使用服务，您可以退出企业、农场。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">请联系您的组织或您的管理员，以获取组织政策和了解更多信息。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">九、联系我们</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">如果您对本隐私政策有任何疑问、意见或建议，请通过以下方式与我们联系：</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">邮箱：zaxh@zaxh.cn</span></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">地址：上海市嘉定区平城路1455号中科院新微大厦B座11楼</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">客服电话：021-60766628</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">一般情况下，我们将在十天内回复。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">十、隐私政策的变更</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们可能会不时更改此隐私政策。隐私政策的任何更改都会在此页面上发布。如果更改的内容十分重要，我们将通过在服务主页或登录屏幕上添加通知或者向您发送电子邮件的方式通知您。我们也会将此隐私政策的先前版本保留在档案中供您查看。我们鼓励您在使用服务时了解我们的隐私政策，随时了解我们的信息能够帮助您更好地保护隐私。如果您不同意本隐私政策的任何更改，您需要停止使用服务并停用您的账户。</span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">本条款更新时间：2021年10月27日16:20:01</p><p style=\"white-space: normal;\">生效时间：2021年10月27日16:20:12</p><p><br/></p>',
        1, '2019-01-30 16:39:39', 104, '2022-07-28 11:18:48');
INSERT INTO `sys_agreement`
VALUES (35, 1, '神农口袋用户协议', '用户协议',
        '<p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>特别提示</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">安徽左岸芯慧信息科技有限公司（以下简称“左岸芯慧”）在此特别提醒您（用户）在使用左岸芯慧提供的“神农口袋”网站、移动客户端（APP）及其他软件服务（以下简称“神农口袋”）之前，请认真阅读本《用户协议》（以下简称“协议”），确保已充分理解本协议各条款内容，特别是免除或者限制责任的条款、争议解决和法律适用条款。用户一经使用本协议约定服务，即视为同意接受并遵守本协议的约定，且不应以未阅读本协议的内容或者未获得“神农口袋”对用户问询的解答等理由，主张本协议无效，或要求解除本协议。</p><p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>一、协议定义</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">1.&nbsp; &nbsp;神农口袋（本协议中指包括但不限于snkoudai.com网站、移动客户端（APP）及其他软件服务等）由安徽左岸芯慧信息科技有限公司所有和运作。</p><p style=\"margin-top: 15px; line-height: 2em;\">2.&nbsp;&nbsp; 本协议是网站用户(包括个人、企业及其他组织)与网站运营企业左岸芯慧之间的法律契约。用户访问、浏览和注册“神农口袋”即代表接受本协议条款的约束，用户对“神农口袋”的访问和使用应以接受并遵守本协议所载明的条款和条件为前提。</p><p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>二、知识产权申明</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">1.&nbsp;&nbsp; “神农口袋”涉及的包括但不限于应用程序、源代码、商标、标示图案(LOGO)、界面设计、应用程序编程接口(API)等所关联的所有知识产权均属左岸芯慧所有。用户不得复制、修改、传播或在非“神农口袋”所属的服务器上做镜像或者以其它方式进行非法使用。</p><p style=\"margin-top: 15px; line-height: 2em;\">2.&nbsp;&nbsp; 用户在“神农口袋”平台所创建的独创性数据所有权归属该用户所有，该用户有权对前述数据进行任何形式的处置，包括从平台中复制，导出和删除。</p><p style=\"margin-top: 15px; line-height: 2em;\">3.&nbsp;&nbsp; 用户应当确保其公开或存储（方式包括但不限于：上传、保存、公布、发布等）于“神农口袋”及相关服务器的内容不存在任何侵犯其他第三方知识产权的情形。若存在本条所述情形，左岸芯慧有权根据具体情节针对上述内容，采取包括但不限于限制、屏蔽、删除、修改等手段，由此给网站用户造成的损失由网站用户自行承担；若左岸芯慧因网站用户存在本条所述行为而向其他第三方承担法律责任的，左岸芯慧有权向网站用户追偿全部损失。</p><p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>三、网站使用规则</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">1.&nbsp;&nbsp; 用户在使用“神农口袋”过程中，必须遵循以下规则：</p><p style=\"margin-top: 15px; line-height: 2em;\">(1) 遵守中国有关的法律法规；</p><p style=\"margin-top: 15px; line-height: 2em;\">(2) 不得对“神农口袋”进行任何形式的对其他第三方的再授权使用、销售或转让；</p><p style=\"margin-top: 15px; line-height: 2em;\">(3) 不得为设计开发竞争产品对“神农口袋”进行任何形式的反向工程、反向编译、反汇编，或在竞争产品抄袭模仿“神农口袋”的设计；</p><p style=\"margin-top: 15px; line-height: 2em;\">(4) 不得滥用“神农口袋”的通信功能发送垃圾邮件和短信；</p><p style=\"margin-top: 15px; line-height: 2em;\">(5) 不得对“神农口袋”的连续服务和商誉构成损害的其他行为，包括对网站服务器的攻击；</p><p style=\"margin-top: 15px; line-height: 2em;\">(6) 遵守本协议中的全部约定。</p><p style=\"margin-top: 15px; line-height: 2em;\">2.&nbsp;&nbsp; 如用户在使用“神农口袋”时违反任何上述规定，左岸芯慧有权要求用户改正或直接采取一切必要的措施（包括但不限于暂停或终止用户使用“神农口袋”的权利并追讨因此带来的损失）以减轻用户不当行为造成的影响。</p><p style=\"margin-top: 15px; line-height: 2em;\">3.&nbsp;&nbsp; 用户所拥有的互联网域名所对应的电子邮件地址作为用户权证的唯一识别信息。当用户不再拥有或完全控制在“神农口袋”登记的域名时，左岸芯慧有权随时删除所有的用户数据。在高级模式下，系统支持多个域名电子邮件地址，当最早登记的主域名权属发生改变时，左岸芯慧有权随时删除主域名及其关联域名所有的用户数据。</p><p style=\"margin-top: 15px; line-height: 2em;\">4.&nbsp;&nbsp; 用户须对在“神农口袋”的注册信息的真实性、合法性、有效性承担全部责任，用户不得冒充他人；不得利用他人的名义发布任何信息；不得恶意使用注册帐户导致其他用户误认；否则左岸芯慧有权立即停止提供服务，收回其帐号并由用户独自承担由此而产生的一切法律责任。如因此给左岸芯慧造成任何损失，其有权向违约用户追偿。</p><p style=\"margin-top: 15px; line-height: 2em;\">5.&nbsp;&nbsp; 用户直接或通过各类方式（如 RSS 源和站外 API 引用等）间接使用“神农口袋”及“神农口袋”任何数据的行为，都将被视作已无条件接受本协议全部内容；若用户对本协议的任何条款存在异议，请停止使用“神农口袋”或左岸芯慧所提供的全部服务。</p><p style=\"margin-top: 15px; line-height: 2em;\">6.&nbsp;&nbsp; 用户承诺不得以任何方式利用“神农口袋”直接或间接从事违反中国法律、以及社会公德的行为，否则左岸芯慧有权对违反上述承诺的内容予以删除。</p><p style=\"margin-top: 15px; line-height: 2em;\">7.&nbsp;&nbsp; 用户不得利用“神农口袋”制作、上载、复制、发布、传播或者转载如下内容：</p><p style=\"margin-top: 15px; line-height: 2em;\">(1) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</p><p style=\"margin-top: 15px; line-height: 2em;\">(2) 损害国家荣誉和利益的；</p><p style=\"margin-top: 15px; line-height: 2em;\">(3) 煽动民族仇恨、民族歧视，破坏民族团结的；</p><p style=\"margin-top: 15px; line-height: 2em;\">(4) 破坏国家宗教政策，宣扬邪教和封建迷信的；</p><p style=\"margin-top: 15px; line-height: 2em;\">(5) 散布谣言，扰乱社会秩序，破坏社会稳定的；</p><p style=\"margin-top: 15px; line-height: 2em;\">(6) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</p><p style=\"margin-top: 15px; line-height: 2em;\">(7) 侮辱或者诽谤他人，侵害他人合法权益的；</p><p style=\"margin-top: 15px; line-height: 2em;\">(8) 含有法律、行政法规禁止的其他内容的信息。</p><p style=\"margin-top: 15px; line-height: 2em;\">8.&nbsp;&nbsp; 左岸芯慧有权对用户使用“神农口袋”的情况进行审查和监督，如用户在使用“神农口袋”时违反任何上述规定，左岸芯慧或其授权方有权要求用户改正或直接采取一切必要的措施（包括但不限于更改或删除用户张贴的内容、暂停或终止用户使用“神农口袋”的权利）以减轻用户不当行为造成的影响。</p><p style=\"margin-top: 15px; line-height: 2em;\">9.&nbsp;&nbsp; 左岸芯慧有权但无义务对用户发布的内容进行审核，有权根据相关证据结合《中华人民共和国侵权责任法》、《信息网络传播权保护条例》等法律法规及“神农口袋”社区指导原则对侵权信息进行处理。</p><p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>四、用户信息保护</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">1.&nbsp;&nbsp; 用户数据及个人信息包括涉及用户个人身份的数据及信息（如用户真实姓名、身份证号、手机号码、手机设备识别码、微信号、IP地址等）、用户在操作或使用“神农口袋”过程中明确且客观反映在“神农口袋”服务器端中的基本数据及信息（如历史记录、聊天记录等），以及除前述信息外的其他用户数据及信息。</p><p style=\"margin-top: 15px; line-height: 2em;\">2.&nbsp;&nbsp; 为帮助您获得更好的金融服务，我们会向合作的金融机构共享您必要的个人信息”用户同意授予左岸芯慧及其关联公司、合作公司独家的、全球通用的、永久的、免费的许可使用权利 (并有权在多个层面对该权利进行再授权)，使左岸芯慧及其关联公司、合作公司有权(全部或部份地) 使用、复制、修订、改写、发布、翻译、分发、执行和展示用户的全部数据资料及个人信息或制作其派生作品。</p><p style=\"margin-top: 15px; line-height: 2em;\">3.&nbsp;&nbsp; 保护用户数据及个人信息的私有性是左岸芯慧的一贯制度，左岸芯慧将采取技术措施和其他必要措施，确保用户数据及个人信息安全，防止在“神农口袋”中收集的用户数据及个人信息泄露、毁损或丢失，并在发生前述情形或者存在发生前述情形的可能时，及时采取补救措施。</p><p style=\"margin-top: 15px; line-height: 2em;\">4.&nbsp;&nbsp; 为保证能为用户提供更好的服务，用户同意左岸芯慧具有采集用户数据及个人信息并对其进行共享开发、依据本协议约定使用或授权第三方使用前述数据及个人信息的权限，具体使用事项及情形包括但不限于：</p><p style=\"margin-top: 15px; line-height: 2em;\">(1) 向用户及时发送重要通知，如软件更新、本协议条款的变更；</p><p style=\"margin-top: 15px; line-height: 2em;\">(2) 内部进行审计、数据分析和研究等，以改进左岸芯慧的产品、服务和与用户之间的沟通；</p><p style=\"margin-top: 15px; line-height: 2em;\">(3) 依本协议约定，左岸芯慧管理、审查用户信息及进行处理措施；</p><p style=\"margin-top: 15px; line-height: 2em;\">(4) 在紧急情况下，为维护用户及公众的权益；</p><p style=\"margin-top: 15px; line-height: 2em;\">(5) 为维护“神农口袋”的商标权、专利权及其他任何合法权益；</p><p style=\"margin-top: 15px; line-height: 2em;\">(6) 根据本协议项下授权、法律法规规定或有权机关的指示提供用户数据及个人信息；</p><p style=\"margin-top: 15px; line-height: 2em;\">(7) 存在其他依据法律法规规定或左岸芯慧需要，需公开、编辑或透露的情况。</p><p style=\"margin-top: 15px; line-height: 2em;\">5.&nbsp;&nbsp; 左岸芯慧保留使用汇总统计性信息的权利，在不透露单个用户隐私资料的前提下，左岸芯慧有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。</p><p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>五、免责申明</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">1.&nbsp;&nbsp; 左岸芯慧将尽最大努力保障“神农口袋”所涉平台的连续可靠运行，但鉴于网络服务的特殊性，左岸芯慧对可能发生的网络服务的中断或终止所可能导致的一切损失，不承担任何法律责任及经济赔偿。</p><p style=\"margin-top: 15px; line-height: 2em;\">2.&nbsp;&nbsp; 左岸芯慧将尽最大努力保障客户数据的安全备份，但无法承诺100%的数据恢复，对因数据丢失带来的任何直接或间接损失不承担任何责任。</p><p style=\"margin-top: 15px; line-height: 2em;\">3.&nbsp;&nbsp; 在发生需要从备份文件中恢复数据的情形时，通常需要4小时，最长48小时完成，在此时间范围内的数据恢复视作服务是连续的。</p><p style=\"margin-top: 15px; line-height: 2em;\">4.&nbsp;&nbsp; 对于因不可抗力或左岸芯慧不能控制的原因造成的服务中断和长时间终止，左岸芯慧不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</p><p style=\"margin-top: 15px; line-height: 2em;\">5.&nbsp;&nbsp; 左岸芯慧将尽可能采取一切措施保护用户数据及个人信息的安全。但用户通过使用或安装第三方应用打开“神农口袋”中的文件，该文件会在第三方应用中打开，由于第三方应用而造成的损失，左岸芯慧不承担任何法律责任及经济赔偿。</p><p style=\"margin-top: 15px; line-height: 2em;\">6.&nbsp;&nbsp; 鉴于互联网体制及环境的特殊性，客户在服务中分享的信息及个人资料有可能会被他人复制、转载、擅改或做其它非法用途，左岸芯慧对此不承担任何责任。</p><p style=\"margin-top: 15px; line-height: 2em;\">7.&nbsp;&nbsp; 客户在使用服务过程中可能存在来自任何他人的包括威胁性的、诽谤性的、令人反感的或非法的内容或行为或对他人权利的侵犯（包括知识产权）及匿名或冒名的信息的风险左岸芯慧对此不承担任何责任。</p><p style=\"margin-top: 15px; line-height: 2em;\">8.&nbsp;&nbsp; 与特定网络安全事故相关免责事由。例如，在法律允许的范围内，左岸芯慧对于因受到计算机病毒、木马或其他恶意程序、黑客攻击的破坏而导致的服务中断及信息泄露不承担责任。</p><p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>六、协议变更</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">1.&nbsp;&nbsp; 本协议可由左岸芯慧随时更新，更新后的协议条款一旦公布即代替原来的协议条款，恕不再另行通知，用户可查阅最新版协议条款。</p><p style=\"margin-top: 15px; line-height: 2em;\">2.&nbsp;&nbsp; 在左岸芯慧修改协议条款后，如果用户不接受修改后的条款，请立即停止使用左岸芯慧提供的服务，用户继续使用左岸芯慧提供的服务将被视为接受修改后的协议。</p><p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>七、违约责任</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">1.&nbsp;&nbsp; 由于用户通过服务上载、传送或分享之信息、使用“神农口袋”其他功能、违反本协议、或侵害他人任何权利因而衍生或导致任何第三人向左岸芯慧及其关联公司、合作公司提出任何索赔或请求，或导致左岸芯慧及其关联公司、合作公司因此而发生任何损失，用户同意将足额进行赔偿（包括但不限于合理的律师费）。</p><p style=\"margin-top: 15px; line-height: 2em;\">2.&nbsp;&nbsp; 如果左岸芯慧发现或收到他人举报或投诉用户违反本协议约定的，左岸芯慧有权不经通知随时对相关内容，包括但不限于用户资料、业务记录进行审查、删除，并视情节轻重对违规用户处以包括但不限于警告、账号封禁等处罚，且通知用户处理结果。</p><p style=\"margin-top: 15px; line-height: 2em;\">3.&nbsp;&nbsp; 因违反用户协议被封禁的用户，可以联系左岸芯慧客服查询封禁期限，并在封禁期限届满后自助解封。其中，被实施功能封禁的用户会在封禁期届满后自动恢复被封禁功能。被封禁用户可向左岸芯慧相关页面提交申诉，左岸芯慧将对申诉进行审查，并自行合理判断决定是否变更处罚措施。</p><p style=\"margin-top: 15px; line-height: 2em;\">4.&nbsp;&nbsp; 用户理解并同意，左岸芯慧有权依合理判断对违反有关法律法规或本协议规定的行为进行处罚，对违法违规的任何用户采取适当的法律行动，并依据法律法规保存有关信息向有关部门报告等，用户应承担由此而产生的一切法律责任。</p><p style=\"margin-top: 20px; line-height: 2em;\"><span style=\"font-size: 18px;\"><strong>八、其他</strong></span></p><p style=\"margin-top: 15px; line-height: 2em;\">1.&nbsp;&nbsp; 本协议的订立、执行和解释以及争议的解决均应适用中华人民共和国法律并受中国法院管辖。</p><p style=\"margin-top: 15px; line-height: 2em;\">2.&nbsp;&nbsp; 协议双方就本协议内容或其执行发生任何争议，应首先力争友好协商解决；协商不成时，任何一方均可向左岸芯慧注册地有管辖权的人民法院提起诉讼。</p><p style=\"margin-top: 15px; line-height: 2em;\">3.&nbsp;&nbsp; 左岸芯慧郑重提醒用户注意本协议中免除左岸芯慧责任和限制用户权利的条款，请用户仔细阅读，自主考虑风险。未成年人应在法定监护人的陪同下阅读本协议。</p><p><br style=\"white-space: normal;\"/></p><p><br/></p>',
        NULL, NULL, 104, '2022-06-23 10:54:53');
INSERT INTO `sys_agreement`
VALUES (47, 11, 'dasd', '用户协议',
        '<p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&lt;abc&gt;</span></strong></span></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">一、隐私条款的覆盖范围</span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">您的隐私安全对于我们十分重要，我们也非常乐意告知您我们是如何收集、使用您的相关信息。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">本文旨在帮助您了解如下内容：</span></p><ul class=\" list-paddingleft-2\" style=\"padding: 0px; list-style-position: initial; list-style-image: initial; max-width: 100%; margin-block-start: 1em; padding-inline-start: 20px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们收集哪些信息；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们将如何使用收集到的信息；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们如何存储收集到的信息并如何保障其安全性；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">有害信息的过滤和删除；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">您的权利；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">业务转让；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">其他重要的隐私策略；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">联系我们；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">隐私政策的变更。</span></p></li></ul></ul><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">本隐私协议在您使用“神农口袋”网站、移动客户端（APP）及其他软件服务（以下简称“神农口袋”或“产品”）、相关系列产品和服务或者在您以其他方式调用神农口袋时全程有效（除其他单独的隐私协议注释外）。此政策还阐述了您有权决定是否允许我们收集您的行为数据。如果您不同意此政策，请勿访问或使用我们的产品或服务或者与我们业务的任何其他方面进行互动，否则视为您接受并遵守本政策。当本政策中提及“神农口袋”或“我们”时，指的是安徽左岸芯慧信息科技有限公司（Anhui&nbsp; Zuoanxinhui Information Technology Co., Ltd.），神农口袋在您使用服务时收集的信息由其进行控制。神农口袋以包括网站、桌面产品、移动产品在内的产品为您提供了农场管理工具，帮助您进行农场管理和与人沟通。我们还拥有并运营着多个其他网站并提供相关服务。本政策中的“服务”指的是上述所有产品及服务。</span></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">二、我们收集哪些信息</span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们将收集您提供给我们的信息，包括您在使用我们的产品或服务时产生的信息以及其他信息来源向我们提供的信息，具体类别如下所述：</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">您提供给我们的信息</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们将收集您在我们网站或服务中直接输入或提交的数据。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">1. 账户信息和个人资料信息：我们将在您注册账户、创建或修改个人资料、设置偏好、登入、通过我们的服务进行购买或为购买而进行登记时收集您的有关信息，例如：您在注册服务时提供的联系信息以及某些情况下的帐单信息将会被我们收集。您还可以选择将个人照片及其他详细信息添加到您的个人资料中，以显示于我们的服务系统之上。在您选择或修改个人偏好时，我们也将持续获取和追踪您的偏好信息。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2. 您通过我们的产品所提供的内容：我们将通过您使用的神农口袋网页和移动产品来收集和存储您发布、发送、接收和分享的内容，此内容包括您的任何信息或者您选择包含的信息，还包括您上传到服务系统中的文件和链接。我们收集和存储的内容包括：企业信息、员工、农场信息、地块、种植计划、生产任务、采收、客户、宅配计划和订单等。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">3. 支付信息：当您注册某些付费服务时，我们会收集某些付款和账单信息。例如：在您为我们的产品付费时，我们要求您提交的姓名和联系信息等；您也可能会提供付款账号信息，如银行卡卡号等。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></p><p style=\"margin-top: 0px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4.个人设备信息（包括设备型号、硬件序列号、设备MAC地址、操作系统版本、设备设置、唯一设备识别码（IMEI、Android ID、IDFA、SIM卡IMSI信息)、UUD、必要的移动应用列表信息、软硬件及设备、设备环境信息)；</span></p><p style=\"margin-top: 0px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">5.个人位置信息（包括精准定位信息)。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">您使用服务时自动收集的信息</span></strong><span style=\"margin: 0px; padding: 0px; font-size: 16px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">当您浏览和使用我们的服务时（如浏览网站或者在网页中进行相应的操作），我们将自动收集您的一些相关信息。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">1. 您在我们的产品中的使用行为：当您访问我们的任何服务并与之互动时，我们会跟踪您的某些信息。这些信息包括您正在使用的功能，如：点击任务、选择地块或者点击其他链接；同时包括了您上传到服务中的附件及其类型、大小和文件名称；也包括您所经常使用的搜索词以及您在产品中是如何与他人互动的等等。我们还收集了您的企业和人员的信息以及您与他们的互动方式，例如与您最频繁合作和沟通的人员。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2. 设备与连接信息：在您使用我们的服务时，我们收集了有关您的计算机、手机、平板电脑或您用于访问服务的其他设备的信息。此设备信息包括您在安装、访问、更新或使用我们的服务时的连接类型和设置。我们还通过您的设备收集关于您的操作系统、浏览器类型、IP地址、分享/退出页面的URL、设备标识符以及应用于软件崩溃相关数据的信息。我们也将使用您的IP地址、国家或地区偏好来估算您的位置，以提供更好的服务体验。我们所收集的信息数量取决于您用于访问服务的设备类型和设置。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">3. Cookies和其他跟踪技术：神农口袋及我们的第三方合作伙伴（如我们的分析合作伙伴）可能会使用Cookie和其他跟踪技术（如网页打点等）来识别您的身份。Cookie是仅限文本的信息字符串，网站会将这些字符串传输到计算机硬盘的浏览器 Cookie 文件中，以便网站能够记住您的身份信息以及其他详细信息。Cookie可能由网站设置或来源自第三方，如广告商。Cookie本身不用于或意图用于从用户计算机读取任何信息（Cookie本身的内容除外）。Cookie只是网站所使用的最初将其放置在您硬盘上的标识符。同一台服务器可以检索到 Cookie 信息的实际内容，从而标识计算机，并进而根据主服务器上存储的信息来自定义、跟踪或控制站点的使用情况。我们会通过这些追踪手段来帮助您更好地使用神农口袋，也帮助我们更好地改善对应功能。您可以通过修改浏览器设置来选择接受或者拒绝Cookie。但是如果您禁用了Cookie，您将不能使用神农口袋的各项交互功能。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><melo-data data-src=\"{&quot;mainAtext&quot;:&quot;{\\&quot;atext\\&quot;:{\\&quot;attribs\\&quot;:\\&quot;*0*1*2*3*4*5*6*7+15*0*8*2*5*6+5*0*1*2*3*4*5*6*7+1d*9*a*b*c*d*e*f*g*0*1*2*3*4*5*6*7+1\\&quot;,\\&quot;text\\&quot;:\\&quot;4.用户软件安装列表和Mac地址：这部分信息可能是由底层技术框架APICloud和极光sdk收集，收集目的是为了判断设备当前是否安装了本公司的其他应用，方便应用之间进行联动、推送最新版本等。\\\\n\\&quot;},\\&quot;apool\\&quot;:{\\&quot;numToAttrib\\&quot;:{\\&quot;0\\&quot;:[\\&quot;author\\&quot;,\\&quot;p.144115224858580591\\&quot;],\\&quot;1\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;微软雅黑, \\\\\\&quot;Microsoft YaHei\\\\\\&quot;\\&quot;],\\&quot;2\\&quot;:[\\&quot;font-size\\&quot;,\\&quot;9pt\\&quot;],\\&quot;3\\&quot;:[\\&quot;bold\\&quot;,\\&quot;false\\&quot;],\\&quot;4\\&quot;:[\\&quot;italic\\&quot;,\\&quot;false\\&quot;],\\&quot;5\\&quot;:[\\&quot;color\\&quot;,\\&quot;rgb(102, 102, 102)\\&quot;],\\&quot;6\\&quot;:[\\&quot;background-color\\&quot;,\\&quot;rgb(247, 249, 251)\\&quot;],\\&quot;7\\&quot;:[\\&quot;letter-spacing\\&quot;,\\&quot;0pt\\&quot;],\\&quot;8\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;9\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;10\\&quot;:[\\&quot;pap-right-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;11\\&quot;:[\\&quot;pap-specialIndent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;12\\&quot;:[\\&quot;pap-line\\&quot;,\\&quot;1\\&quot;],\\&quot;13\\&quot;:[\\&quot;pap-line-rule\\&quot;,\\&quot;auto\\&quot;],\\&quot;14\\&quot;:[\\&quot;pap-spacing-before\\&quot;,\\&quot;11.25pt\\&quot;],\\&quot;15\\&quot;:[\\&quot;pap-spacing-after\\&quot;,\\&quot;3.75pt\\&quot;],\\&quot;16\\&quot;:[\\&quot;snapToGrid\\&quot;,\\&quot;1\\&quot;]},\\&quot;nextNum\\&quot;:17}}&quot;,&quot;storyAtexts&quot;:[],&quot;srcGlobalPadId&quot;:&quot;300000000$PEyZJdSMxBjG&quot;}\" data-version=\"2.1.0\" style=\"margin: 0px; padding: 0px;\"></melo-data></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 1; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4.用户软件安装列表、Mac地址、<span style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">IMEI码</span>：这部分信息可能是由底层技术框架APICloud和极光sdk收集，收集目的是为了判断设备当前是否安装了本公司的其他应用，方便应用之间进行联动、推送最新版本等。</span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 1; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br style=\"margin: 0px; padding: 0px;\"/></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 1; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><melo-data data-src=\"{&quot;mainAtext&quot;:&quot;{\\&quot;atext\\&quot;:{\\&quot;attribs\\&quot;:\\&quot;*0*1*2*3*4*5*6*7+6*8*9*a*b*c*d*e*f*0*1*2*3*4*5*6*7+1*0*1*2*g*4*5*6*7+l*8*9*a*b*c*d*e*f*0*1*2*g*4*5*6*7+1*0*h*2*5*6+s*0*i*2*5*6+o*0*1*2*g*4*5*6*7+3n*0*h*2*5*6+w*0*i*2*5*6+1o*8*9*b*c*d*e*f*j*k*0*1*2*g*4*5*6*7+1*0*1*2*g*4*5*6*7+2*0*h*2*5*6+2w*0*i*2*5*6+17*8*9*b*c*d*e*f*j*0*h*2*5*6+1*0*h*2*g*4*5*6*7+2*0*i*2*5*6+13*0*1*2*g*4*5*6*7+31*8*9*b*c*d*e*f*j*0*1*2*g*4*5*6*7+1*0*h*2*g*4*5*6*7+2*0*i*2*5*6+e*0*1*2*g*4*5*6*7+42*0*h*2*5*6+v*l*9*b*c*d*e*f*j*0*1*2*g*4*5*6*7+1\\&quot;,\\&quot;text\\&quot;:\\&quot;第三方SDK\\\\n为了更好的服务用户，我们还集成了以下SDK\\\\n1.cn.jpush.android(极光;极光推送)、 com.huawei.hms(华为;华为推送)，主要用于向用户推送信息，例如，用户在使用“专家问答”功能时，“专家端”用户进行回复后，我们将用上述SDK向您推送回复内容，以达到及时提醒的目。可能会收集的用户信息：信息推送的时间、推送结果、用户查看信息的时间、用户软件安装列表和Mac地址。请参考：极光推送介绍https://www.jiguang.cn/push，华为推送https://developer.huawei.com/consumer/cn/hms/huawei-pushkit/\\\\n2.com.tencent.smtt(TBS腾讯浏览服务;腾讯浏览服务;腾讯X5浏览器;腾讯浏览器)，主要用于在客户端打开“溯源信息”H5页面，让用户可以浏览。该SDK并不会收集任何用户信息。请参考：腾讯浏览服务https://x5.tencent.com/tbs/product/tbs.html\\\\n3.com.amap.api(高德地图;高德导航;高德定位;阿里高德地图;高德) ，主要用于获取用户的定位信息，例如，在使用“圈地”功能时，将通过该SDK获取到用户当前所在的地理位置，便于用户用户。可能会收集的用户信息：用户位置信息；请参考：高德地图API https://lbs.amap.com/\\\\n4. com.umeng(友盟)，主要用于统计用户使用应用内各种功能的次数，例如，打开应用的次数、某个页面停留的时间、使用农事操作功能的次数等，目的是为了根据用户习惯优化应用的设计。该SDK会收集的用户信息：应用访问次数、页面访问时间、某个功能的访问次数、访问时间、应用内的页面的使用路径等。请参考：友盟U-APP移动统计 https://www.umeng.com/analytics\\\\n\\&quot;},\\&quot;apool\\&quot;:{\\&quot;numToAttrib\\&quot;:{\\&quot;0\\&quot;:[\\&quot;author\\&quot;,\\&quot;p.144115224858580591\\&quot;],\\&quot;1\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;微软雅黑, \\\\\\&quot;Microsoft YaHei\\\\\\&quot;\\&quot;],\\&quot;2\\&quot;:[\\&quot;font-size\\&quot;,\\&quot;9pt\\&quot;],\\&quot;3\\&quot;:[\\&quot;bold\\&quot;,\\&quot;true\\&quot;],\\&quot;4\\&quot;:[\\&quot;italic\\&quot;,\\&quot;false\\&quot;],\\&quot;5\\&quot;:[\\&quot;color\\&quot;,\\&quot;rgb(102, 102, 102)\\&quot;],\\&quot;6\\&quot;:[\\&quot;background-color\\&quot;,\\&quot;rgb(247, 249, 251)\\&quot;],\\&quot;7\\&quot;:[\\&quot;letter-spacing\\&quot;,\\&quot;0pt\\&quot;],\\&quot;8\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;9\\&quot;:[\\&quot;pap-right-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;10\\&quot;:[\\&quot;pap-specialIndent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;11\\&quot;:[\\&quot;pap-line\\&quot;,\\&quot;1\\&quot;],\\&quot;12\\&quot;:[\\&quot;pap-line-rule\\&quot;,\\&quot;auto\\&quot;],\\&quot;13\\&quot;:[\\&quot;pap-spacing-before\\&quot;,\\&quot;11.25pt\\&quot;],\\&quot;14\\&quot;:[\\&quot;pap-spacing-after\\&quot;,\\&quot;3.75pt\\&quot;],\\&quot;15\\&quot;:[\\&quot;snapToGrid\\&quot;,\\&quot;1\\&quot;],\\&quot;16\\&quot;:[\\&quot;bold\\&quot;,\\&quot;false\\&quot;],\\&quot;17\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;18\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,\\\\\\&quot;Helvetica\\\\\\&quot;,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;19\\&quot;:[\\&quot;pap-list-level\\&quot;,\\&quot;0\\&quot;],\\&quot;20\\&quot;:[\\&quot;pap-list-task\\&quot;,\\&quot;\\&quot;],\\&quot;21\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0em\\&quot;]},\\&quot;nextNum\\&quot;:22}}&quot;,&quot;storyAtexts&quot;:[],&quot;srcGlobalPadId&quot;:&quot;300000000$PEyZJdSMxBjG&quot;}\" data-version=\"2.1.0\" style=\"margin: 0px; padding: 0px;\"></melo-data></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 1; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">第三方SDK</span></strong></span><span style=\"margin: 0px; padding: 0px; font-size: 9pt; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 700; background: rgb(247, 249, 251); letter-spacing: 0pt; vertical-align: baseline;\"></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 1; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">为了更好的服务用户，我们还集成了以下SDK</span></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">1.cn.jpush.android(极光;极光推送)、 com.huawei.hms(华为;华为推送)，主要用于向用户推送信息，例如，用户在使用“专家问答”功能时，“专家端”用户进行回复后，我们将用上述SDK向您推送回复内容，以达到及时提醒的目。可能会收集的用户信息：信息推送的时间、推送结果、用户查看信息的时间、用户软件安装列表和Mac地址。请参考：极光推送介绍https://www.jiguang.cn/push，华为推送https://developer.huawei.com/consumer/cn/hms/huawei-pushkit/</span></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2.com.tencent.smtt(TBS腾讯浏览服务;腾讯浏览服务;腾讯X5浏览器;腾讯浏览器)，主要用于在客户端打开“溯源信息”H5页面，让用户可以浏览。该SDK并不会收集任何用户信息。请参考：腾讯浏览服务https://x5.tencent.com/tbs/product/tbs.html</span></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">3.com.amap.api(高德地图;高德导航;高德定位;阿里高德地图;高德) ，主要用于获取用户的定位信息，例如，在使用“圈地”功能时，将通过该SDK获取到用户当前所在的地理位置，便于用户用户。可能会收集的用户信息：用户位置信息；请参考：高德地图API https://lbs.amap.com/</span></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4. com.umeng(友盟)，主要用于统计用户使用应用内各种功能的次数，例如，打开应用的次数、某个页面停留的时间、使用农事操作功能的次数等，目的是为了根据用户习惯优化应用的设计。该SDK会收集的用户信息：应用访问次数、页面访问时间、某个功能的访问次数、访问时间、应用内的页面的使用路径等。请参考：友盟U-APP移动统计 https://www.umeng.com/analytics</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background: rgb(247, 249, 251); letter-spacing: 0pt; vertical-align: baseline;\"></span></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: normal; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br style=\"margin: 0px; padding: 0px;\"/></span><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">三、我们将如何使用收集到的信息</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们如何使用收集到的信息部分取决于您所使用的服务、如何使用它们以及您所设置的偏好。以下是我们使用所收集的、关于您的信息的具体目的：</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">1.为您提供更好的服务与体验：我们使用关于您的信息用于身份验证，默认设定，基于地理位置的扩展功能，应该提供什么样的用户支持以及如何运营和维护整体服务等。例如：识别您在什么地点登陆，我们将通过发送短信验证码的方式验证您的身份信息是否有效。记录您的操作记录，默认您的语言设定和位置设定。我们的服务还包括根据您上一次的操作记录和填报记录，默认下一次的操作设定，提高他人与您沟通协作的能力与效率，为您提供更好的个性化体验，并通过自动化的分析与计算，更好地帮助您和您的企业构建稳固与准确的关联关系。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2. 用于研究与开发迭代：我们一直在寻找方法使我们的服务以更智能、更快速、更安全、更综合、更有效的方式来帮助您获得更好的使用体验。我们通过集体学习，了解人们如何使用我们的服务，并不断收集用户直接向我们提供的反馈，以帮助我们排查问题并确定产品趋势、用法、活动模式以及服务整合和改进的方式。例如：我们在每次迭代与更新时，会记录新功能的使用量以及用户的使用链路，从而设计更好、更人性化的功能。在某些情况下，我们会将这部分的调查数据与研究数据提供给对应的研究机构以进行更深层的产品研究与学术研究。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">3. 用于改善与用户的沟通交流：我们将使用您的联系信息，通过发送短信，包括确认您的购买、提醒您订阅到期、回应您的意见问题与需求、提供客户支持以及向您发送更新、通知、警告等。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4. 用于技术服务：我们使用您的信息来解决您遇到的技术问题、响应您的协助请求、分析崩溃信息并进行修复和改进服务。如果您允许我们这样做，我们会与神农口袋的技术专家分享您的信息，以回应与支持相关请求。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">5. 用于加强安全保护与鉴权：我们使用有关您和您的服务使用情况信息来验证账户和活动、监控可疑或欺诈活动并确定上述行为是否违反服务政策。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">6. 用于保护我们合法的商业利益和其他合法权益：在法律要求或我们认为有必要保护我们的合法权利、利益和他人利益的情况下，我们会使用有关您的信息来处理法律诉讼、合规、监管和审计相关事务，以及与收购、合并或出售业务相关的信息披露。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">7. 神农口袋所采集的数据所有权属于用户所有，但为提供更好的为用户提供服务，用户以此授予左岸芯慧及其关联公司、合作公司独家的、全球通用的、永久的、免费的许可使用权利 (并有权在多个层面对该权利进行再授权)，使左岸芯慧及其关联公司、合作公司有权(全部或部分地) 使用、复制、修订、改写、发布、翻译、分发、执行和展示用户的全部数据资料及个人信息或制作其派生作品，并对所采集数据享有开发权限，提供更多元化服务。为帮助您获得更好的金融服务，我们会向合作的金融机构共享您必要的个人信息。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">如果使用神农口袋，则视为您已经同意我们出于特定目的使用您的信息，当然您也拥有随时改变主意的权利，但这不会影响任何已经发生了的处理。当我们或第三方（如您的雇主）合法使用您的信息时，您有权反对。但是在某些情况下，这可能意味着您不再使用神农口袋。</span></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">四、我们如何存储收集到的信息并如何保障其安全性</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">信息的存储和安全：我们使用阿里云提供的云服务托管我们收集的信息，并使用技术措施来保护您的数据。尽管我们极尽可能地保护您的信息安全，但由于互联网的固有特性，没有任何系统是绝对安全的，我们无法保证数据在通过互联网传输过程中和存储在我们系统时的绝对安全。我们会尽一切可能防止安全入侵事件的发生。但如果发生该类事件，我们将在合理期限内第一时间告知您。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">信息将被存储多久</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">信息将被存储多久是由该信息的种类所决定的，我们在下文中将详细描述。当信息达到一定存储期限后，我们会删除您的信息或做匿名处理。但当删除操作无法进行的时候（如信息已存储在备份存档中），我们将安全地存储您的信息，并将其隔离，直至删除成为可能。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">1. 账号信息：我们将保留您的账户信息，直到您删除您的账户。我们还将保留一些必要的信息，以履行法律义务、解决争议、履行协议、支持业务运营并继续开发和改进我们的服务。如果我们将要保留这些信息以用于服务改进和产品迭代，我们会将数据脱敏，并且我们只会利用这些信息进行集体性分析而不会针对您的个人数据做专门分析。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2. 您在我们服务中所分享的信息：如果您的账户已停用或被停用，您的部分信息和您提供的内容将被保留，以便您的团队成员或其他用户充分使用服务。例如：我们会继续显示您提供给企业或任务中的内容。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">3. 市场偏好信息：如果您选择接收我们的营销电子邮件，我们会保留有关您的营销偏好信息，除非您明确要求我们删除此类信息。我们将保留自创建日期起的合理时间段内从 Cookie 和其他跟踪技术中所获得的信息。</span></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">五、有害信息的过滤和删除</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">根据相关法律的规定，神农口袋禁止用户创建和储存一切有害信息，包括：</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（1）违反中国宪法确定的基本原则的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（3）宣扬恐怖主义、极端主义、民族仇恨、民族歧视的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（4）破坏国家、地区间友好关系的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（6）散布谣言或不实消息，扰乱社会秩序，破坏社会稳定的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（7）煽动、组织、教唆恐怖活动、非法集会、结社、游行、示威、聚众扰乱社会秩序的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（8）散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（9）侵犯他人名誉、隐私、著作权、信息网络传播权等合法权益的；</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">（10）含有法律、行政法规禁止的其他内容的。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">神农口袋将针对以上信息制定过滤和屏蔽机制。如用户创建项目或储存文件时不能履行和遵守本政策中的规定，神农口袋有权对违反本政策的用户做出关闭账户的处理，同时保留依法追究当事人法律责任的权利。此外，神农口袋在采取移除等相应措施后，不为此向原发布人承担违约责任或其他法律责任。</span></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">六、您的权利</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">1. 您可以在使用我们服务的过程中，访问、修改、撤回和删除您提供的注册信息和其他个人信息，也可按照通知指引与我们联系。您访问、修改和删除个人信息的范围和方式将取决于您使用的具体服务。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2. 每个业务功能可能需要某些基本的个人信息才能得以完成。对于额外收集的个人信息的收集和使用，您可以随时给予或撤回您的授权同意。当您撤回同意后，我们将不再处理相应的个人信息。但您撤回同意的决定，不会影响此前基于您的授权而开展的个人信息处理。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">3. 您有权获取您的个人信息副本。在技术可行的前提下，例如数据接口匹配，我们还可按您的要求，直接将您的个人信息副本传输给您指定的第三方。我们将以弹窗方式单独告知接收个人信息的第三方身份或类型、向第三方分享数据的目的及数据的范围并征得您的同意。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4. 在某些业务功能中，我们可能仅依据信息系统、算法等非人工自动决策机制对您的个人信息做出处理。如果这些决定将显著影响您的合法权益，您有权要求我们做出解释，我们也将对此提供适当的救济方式。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">5. 您有权要求限制对您个人数据的处理。在下列情形中，您有权限制我们处理数据：当您对个人数据的准确性有争议，并允许我们在一定的期限内核实其准确性时；当数据处理是非法的，且您反对删除个人数据而是要求限制使用该个人数据时；当我们不再需要个人数据以实现处理目的，但您为了提起、行使或抗辩法律诉求而需要该个人数据时；当您基于反对权需要核实我们的法律依据是否优先于您的法律依据时。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">6. 您有权选择退出促销。您可以选择不接收我们的促销信息，为此目的，您可以直接联系我们从促销邮件列表或注册数据库中中删除您的联系信息。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">7. 为保障安全，您可能需要以提供书面材料或其他方式证明您的身份。我们可能会先要求您验证自己的身份，然后再处理您的请求。对于您的合理请求，我们原则上不收取费用，但对多次重复、超出合理限度的请求，我们将视情况收取一定的成本费用。对于那些无端重复、需要过多技术手段（例如：需要开发新系统或从根本上改变现行惯例）、给他人合法权益带来风险或者非常不切实际（例如：涉及备份磁带上存放的信息）的请求，我们可能会予以拒绝。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">在以下情形中，按照法律法规要求，我们将无法响应您的请求：</span></p><ul class=\" list-paddingleft-2\" style=\"padding: 0px; list-style-position: initial; list-style-image: initial; max-width: 100%; margin-block-start: 1em; padding-inline-start: 20px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><li><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">与国家安全、国防安全直接相关的；</span></p></li><li><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">与公共安全、公共卫生、重大公共利益直接相关的；</span></p></li><li><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">与犯罪侦查、起诉、审判和判决执行等直接相关的；</span></p></li><li><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">有充分证据表明您存在主观恶意或滥用权利的；</span></p></li><li><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">响应您的请求将导致您或其他个人、组织的合法权益受到严重损害的；</span></p></li><li><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">涉及商业秘密的。</span></p></li></ul><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">七、业务转让</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">神农口袋收集的信息将被视作一项资产，如果存在下列情况之一，此类信息可能成为被转让的资产之一：神农口袋、任何关联公司或部门与其他企业或部门进行合并、被收购，或者进行破产、解散、重组，或者出售部分或全部神农口袋的资产或股票，或者进行融资、公开发行证券，或者被收购全部或部分业务，或者进入其他类似交易或程序，或者为此类活动进行的其他程序和步骤（例如尽职调查）。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">当上述交易完成后，若存在转让神农口袋收集的信息的情况，我们会以邮件和/或其他方式通知您。收购方或者其他与收购方具有类似地位的权利义务承继者，只能按照此隐私策略（或者向您收集信息时任何有效的后续策略）来使用您的信息。请注意，转让后提交或收集的信息可能根据收购方的要求在法律允许的范围内进行修改，隐私政策也将据此进行更新。</span></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">八、其他重要的隐私策略</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们的产品适用于个人使用和组织使用，在通过组织（例如您的雇主）向您提供服务的情况下，该组织是服务的管理员，并且对其拥有控制权的最终用户和服务站点负责。如果是此种情况，请将您的数据隐私需求提交给管理员，因为您对服务的使用受制于该组织的政策。我们不对管理员组织的隐私或安全做法负责，这些做法可能与本政策有所出入。即使服务目前没有由组织管理，如果您是由组织管理的团队的成员，那么该团队的管理员（例如您的雇主）可能会对您的账户进行管理、控制，并在这之后使用我们的服务。如果发生此类情况，您会收到通知。农场管理员、企业管理员能够限制您对任务、农场、企业的访问与权限。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">如果您不希望管理员能够控制您的账户或使用服务，您可以退出企业、农场。</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">请联系您的组织或您的管理员，以获取组织政策和了解更多信息。</span></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">九、联系我们</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">如果您对本隐私政策有任何疑问、意见或建议，请通过以下方式与我们联系：</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">邮箱：zaxh@zaxh.cn</span></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">地址：上海市嘉定区平城路1455号中科院新微大厦B座11楼</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">客服电话：021-60766628</span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">一般情况下，我们将在十天内回复。</span></p><p style=\"margin-top: 20px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">十、隐私政策的变更</span></strong><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; padding: 0px; word-break: break-all; line-height: 2em; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们可能会不时更改此隐私政策。隐私政策的任何更改都会在此页面上发布。如果更改的内容十分重要，我们将通过在服务主页或登录屏幕上添加通知或者向您发送电子邮件的方式通知您。我们也会将此隐私政策的先前版本保留在档案中供您查看。我们鼓励您在使用服务时了解我们的隐私政策，随时了解我们的信息能够帮助您更好地保护隐私。如果您不同意本隐私政策的任何更改，您需要停止使用服务并停用您的账户。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 2.5; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 2.5; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\">本条款更新时间：2021年10月27日16:20:01</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; line-height: 2.5; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;\">生效时间：2021年10月27日16:20:12</p><p><br/></p>',
        104, '2022-06-22 20:39:33', 104, '2022-06-22 20:39:44');
INSERT INTO `sys_agreement`
VALUES (48, 10, '协议名称协议名称', '用户协议',
        '<p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">一、隐私条款的覆盖范围</span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">您的隐私安全对于我们十分重要，我们也非常乐意告知您我们是如何收集、使用您的相关信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">本文旨在帮助您了解如下内容：</span></p><ul class=\" list-paddingleft-2\" style=\"width: 1379.39px; white-space: normal;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们收集哪些信息；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们将如何使用收集到的信息；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们如何存储收集到的信息并如何保障其安全性；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">有害信息的过滤和删除；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">您的权利；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">业务转让；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">其他重要的隐私策略；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">联系我们；</span></p></li><li><p dir=\"ltr\" style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">隐私政策的变更。</span></p></li></ul></ul><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">本隐私协议在您使用“神农口袋”网站、移动客户端（APP）及其他软件服务（以下简称“神农口袋”或“产品”）、相关系列产品和服务或者在您以其他方式调用神农口袋时全程有效（除其他单独的隐私协议注释外）。此政策还阐述了您有权决定是否允许我们收集您的行为数据。如果您不同意此政策，请勿访问或使用我们的产品或服务或者与我们业务的任何其他方面进行互动，否则视为您接受并遵守本政策。当本政策中提及“神农口袋”或“我们”时，指的是安徽左岸芯慧信息科技有限公司（Anhui&nbsp; Zuoanxinhui Information Technology Co., Ltd.），神农口袋在您使用服务时收集的信息由其进行控制。神农口袋以包括网站、桌面产品、移动产品在内的产品为您提供了农场管理工具，帮助您进行农场管理和与人沟通。我们还拥有并运营着多个其他网站并提供相关服务。本政策中的“服务”指的是上述所有产品及服务。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">二、我们收集哪些信息</span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们将收集您提供给我们的信息，包括您在使用我们的产品或服务时产生的信息以及其他信息来源向我们提供的信息，具体类别如下所述：</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">您提供给我们的信息</span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们将收集您在我们网站或服务中直接输入或提交的数据。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 账户信息和个人资料信息：我们将在您注册账户、创建或修改个人资料、设置偏好、登入、通过我们的服务进行购买或为购买而进行登记时收集您的有关信息，例如：您在注册服务时提供的联系信息以及某些情况下的帐单信息将会被我们收集。您还可以选择将个人照片及其他详细信息添加到您的个人资料中，以显示于我们的服务系统之上。在您选择或修改个人偏好时，我们也将持续获取和追踪您的偏好信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 您通过我们的产品所提供的内容：我们将通过您使用的神农口袋网页和移动产品来收集和存储您发布、发送、接收和分享的内容，此内容包括您的任何信息或者您选择包含的信息，还包括您上传到服务系统中的文件和链接。我们收集和存储的内容包括：企业信息、员工、农场信息、地块、种植计划、生产任务、采收、客户、宅配计划和订单等。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. 支付信息：当您注册某些付费服务时，我们会收集某些付款和账单信息。例如：在您为我们的产品付费时，我们要求您提交的姓名和联系信息等；您也可能会提供付款账号信息，如银行卡卡号等。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"></span></p><p style=\"white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4.个人设备信息（包括设备型号、硬件序列号、设备MAC地址、操作系统版本、设备设置、唯一设备识别码（IMEI、Android ID、IDFA、SIM卡IMSI信息)、UUD、必要的移动应用列表信息、软硬件及设备、设备环境信息)；</span></p><p style=\"white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">5.个人位置信息（包括精准定位信息)。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">您使用服务时自动收集的信息</span></strong><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">当您浏览和使用我们的服务时（如浏览网站或者在网页中进行相应的操作），我们将自动收集您的一些相关信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 您在我们的产品中的使用行为：当您访问我们的任何服务并与之互动时，我们会跟踪您的某些信息。这些信息包括您正在使用的功能，如：点击任务、选择地块或者点击其他链接；同时包括了您上传到服务中的附件及其类型、大小和文件名称；也包括您所经常使用的搜索词以及您在产品中是如何与他人互动的等等。我们还收集了您的企业和人员的信息以及您与他们的互动方式，例如与您最频繁合作和沟通的人员。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 设备与连接信息：在您使用我们的服务时，我们收集了有关您的计算机、手机、平板电脑或您用于访问服务的其他设备的信息。此设备信息包括您在安装、访问、更新或使用我们的服务时的连接类型和设置。我们还通过您的设备收集关于您的操作系统、浏览器类型、IP地址、分享/退出页面的URL、设备标识符以及应用于软件崩溃相关数据的信息。我们也将使用您的IP地址、国家或地区偏好来估算您的位置，以提供更好的服务体验。我们所收集的信息数量取决于您用于访问服务的设备类型和设置。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. Cookies和其他跟踪技术：神农口袋及我们的第三方合作伙伴（如我们的分析合作伙伴）可能会使用Cookie和其他跟踪技术（如网页打点等）来识别您的身份。Cookie是仅限文本的信息字符串，网站会将这些字符串传输到计算机硬盘的浏览器 Cookie 文件中，以便网站能够记住您的身份信息以及其他详细信息。Cookie可能由网站设置或来源自第三方，如广告商。Cookie本身不用于或意图用于从用户计算机读取任何信息（Cookie本身的内容除外）。Cookie只是网站所使用的最初将其放置在您硬盘上的标识符。同一台服务器可以检索到 Cookie 信息的实际内容，从而标识计算机，并进而根据主服务器上存储的信息来自定义、跟踪或控制站点的使用情况。我们会通过这些追踪手段来帮助您更好地使用神农口袋，也帮助我们更好地改善对应功能。您可以通过修改浏览器设置来选择接受或者拒绝Cookie。但是如果您禁用了Cookie，您将不能使用神农口袋的各项交互功能。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"><melo-data data-src=\"{&quot;mainAtext&quot;:&quot;{\\&quot;atext\\&quot;:{\\&quot;attribs\\&quot;:\\&quot;*0*1*2*3*4*5*6*7+15*0*8*2*5*6+5*0*1*2*3*4*5*6*7+1d*9*a*b*c*d*e*f*g*0*1*2*3*4*5*6*7+1\\&quot;,\\&quot;text\\&quot;:\\&quot;4.用户软件安装列表和Mac地址：这部分信息可能是由底层技术框架APICloud和极光sdk收集，收集目的是为了判断设备当前是否安装了本公司的其他应用，方便应用之间进行联动、推送最新版本等。\\\\n\\&quot;},\\&quot;apool\\&quot;:{\\&quot;numToAttrib\\&quot;:{\\&quot;0\\&quot;:[\\&quot;author\\&quot;,\\&quot;p.144115224858580591\\&quot;],\\&quot;1\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;微软雅黑, \\\\\\&quot;Microsoft YaHei\\\\\\&quot;\\&quot;],\\&quot;2\\&quot;:[\\&quot;font-size\\&quot;,\\&quot;9pt\\&quot;],\\&quot;3\\&quot;:[\\&quot;bold\\&quot;,\\&quot;false\\&quot;],\\&quot;4\\&quot;:[\\&quot;italic\\&quot;,\\&quot;false\\&quot;],\\&quot;5\\&quot;:[\\&quot;color\\&quot;,\\&quot;rgb(102, 102, 102)\\&quot;],\\&quot;6\\&quot;:[\\&quot;background-color\\&quot;,\\&quot;rgb(247, 249, 251)\\&quot;],\\&quot;7\\&quot;:[\\&quot;letter-spacing\\&quot;,\\&quot;0pt\\&quot;],\\&quot;8\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;9\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;10\\&quot;:[\\&quot;pap-right-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;11\\&quot;:[\\&quot;pap-specialIndent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;12\\&quot;:[\\&quot;pap-line\\&quot;,\\&quot;1\\&quot;],\\&quot;13\\&quot;:[\\&quot;pap-line-rule\\&quot;,\\&quot;auto\\&quot;],\\&quot;14\\&quot;:[\\&quot;pap-spacing-before\\&quot;,\\&quot;11.25pt\\&quot;],\\&quot;15\\&quot;:[\\&quot;pap-spacing-after\\&quot;,\\&quot;3.75pt\\&quot;],\\&quot;16\\&quot;:[\\&quot;snapToGrid\\&quot;,\\&quot;1\\&quot;]},\\&quot;nextNum\\&quot;:17}}&quot;,&quot;storyAtexts&quot;:[],&quot;srcGlobalPadId&quot;:&quot;300000000$PEyZJdSMxBjG&quot;}\" data-version=\"2.1.0\"></melo-data></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4.用户软件安装列表、Mac地址、<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">IMEI码</span>：这部分信息可能是由底层技术框架APICloud和极光sdk收集，收集目的是为了判断设备当前是否安装了本公司的其他应用，方便应用之间进行联动、推送最新版本等。</span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"><br/></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"><melo-data data-src=\"{&quot;mainAtext&quot;:&quot;{\\&quot;atext\\&quot;:{\\&quot;attribs\\&quot;:\\&quot;*0*1*2*3*4*5*6*7+6*8*9*a*b*c*d*e*f*0*1*2*3*4*5*6*7+1*0*1*2*g*4*5*6*7+l*8*9*a*b*c*d*e*f*0*1*2*g*4*5*6*7+1*0*h*2*5*6+s*0*i*2*5*6+o*0*1*2*g*4*5*6*7+3n*0*h*2*5*6+w*0*i*2*5*6+1o*8*9*b*c*d*e*f*j*k*0*1*2*g*4*5*6*7+1*0*1*2*g*4*5*6*7+2*0*h*2*5*6+2w*0*i*2*5*6+17*8*9*b*c*d*e*f*j*0*h*2*5*6+1*0*h*2*g*4*5*6*7+2*0*i*2*5*6+13*0*1*2*g*4*5*6*7+31*8*9*b*c*d*e*f*j*0*1*2*g*4*5*6*7+1*0*h*2*g*4*5*6*7+2*0*i*2*5*6+e*0*1*2*g*4*5*6*7+42*0*h*2*5*6+v*l*9*b*c*d*e*f*j*0*1*2*g*4*5*6*7+1\\&quot;,\\&quot;text\\&quot;:\\&quot;第三方SDK\\\\n为了更好的服务用户，我们还集成了以下SDK\\\\n1.cn.jpush.android(极光;极光推送)、 com.huawei.hms(华为;华为推送)，主要用于向用户推送信息，例如，用户在使用“专家问答”功能时，“专家端”用户进行回复后，我们将用上述SDK向您推送回复内容，以达到及时提醒的目。可能会收集的用户信息：信息推送的时间、推送结果、用户查看信息的时间、用户软件安装列表和Mac地址。请参考：极光推送介绍https://www.jiguang.cn/push，华为推送https://developer.huawei.com/consumer/cn/hms/huawei-pushkit/\\\\n2.com.tencent.smtt(TBS腾讯浏览服务;腾讯浏览服务;腾讯X5浏览器;腾讯浏览器)，主要用于在客户端打开“溯源信息”H5页面，让用户可以浏览。该SDK并不会收集任何用户信息。请参考：腾讯浏览服务https://x5.tencent.com/tbs/product/tbs.html\\\\n3.com.amap.api(高德地图;高德导航;高德定位;阿里高德地图;高德) ，主要用于获取用户的定位信息，例如，在使用“圈地”功能时，将通过该SDK获取到用户当前所在的地理位置，便于用户用户。可能会收集的用户信息：用户位置信息；请参考：高德地图API https://lbs.amap.com/\\\\n4. com.umeng(友盟)，主要用于统计用户使用应用内各种功能的次数，例如，打开应用的次数、某个页面停留的时间、使用农事操作功能的次数等，目的是为了根据用户习惯优化应用的设计。该SDK会收集的用户信息：应用访问次数、页面访问时间、某个功能的访问次数、访问时间、应用内的页面的使用路径等。请参考：友盟U-APP移动统计 https://www.umeng.com/analytics\\\\n\\&quot;},\\&quot;apool\\&quot;:{\\&quot;numToAttrib\\&quot;:{\\&quot;0\\&quot;:[\\&quot;author\\&quot;,\\&quot;p.144115224858580591\\&quot;],\\&quot;1\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;微软雅黑, \\\\\\&quot;Microsoft YaHei\\\\\\&quot;\\&quot;],\\&quot;2\\&quot;:[\\&quot;font-size\\&quot;,\\&quot;9pt\\&quot;],\\&quot;3\\&quot;:[\\&quot;bold\\&quot;,\\&quot;true\\&quot;],\\&quot;4\\&quot;:[\\&quot;italic\\&quot;,\\&quot;false\\&quot;],\\&quot;5\\&quot;:[\\&quot;color\\&quot;,\\&quot;rgb(102, 102, 102)\\&quot;],\\&quot;6\\&quot;:[\\&quot;background-color\\&quot;,\\&quot;rgb(247, 249, 251)\\&quot;],\\&quot;7\\&quot;:[\\&quot;letter-spacing\\&quot;,\\&quot;0pt\\&quot;],\\&quot;8\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;9\\&quot;:[\\&quot;pap-right-indent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;10\\&quot;:[\\&quot;pap-specialIndent\\&quot;,\\&quot;0pt\\&quot;],\\&quot;11\\&quot;:[\\&quot;pap-line\\&quot;,\\&quot;1\\&quot;],\\&quot;12\\&quot;:[\\&quot;pap-line-rule\\&quot;,\\&quot;auto\\&quot;],\\&quot;13\\&quot;:[\\&quot;pap-spacing-before\\&quot;,\\&quot;11.25pt\\&quot;],\\&quot;14\\&quot;:[\\&quot;pap-spacing-after\\&quot;,\\&quot;3.75pt\\&quot;],\\&quot;15\\&quot;:[\\&quot;snapToGrid\\&quot;,\\&quot;1\\&quot;],\\&quot;16\\&quot;:[\\&quot;bold\\&quot;,\\&quot;false\\&quot;],\\&quot;17\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;18\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;\\\\\\&quot;微软雅黑\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,\\\\\\&quot;Helvetica\\\\\\&quot;,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,\\\\\\&quot;Helvetica Neue\\\\\\&quot;,Helvetica,\\\\\\&quot;PingFang SC\\\\\\&quot;,\\\\\\&quot;Microsoft YaHei\\\\\\&quot;,\\\\\\&quot;Source Han Sans SC\\\\\\&quot;,\\\\\\&quot;Noto Sans CJK SC\\\\\\&quot;,\\\\\\&quot;WenQuanYi Micro Hei\\\\\\&quot;,sans-serif\\&quot;],\\&quot;19\\&quot;:[\\&quot;pap-list-level\\&quot;,\\&quot;0\\&quot;],\\&quot;20\\&quot;:[\\&quot;pap-list-task\\&quot;,\\&quot;\\&quot;],\\&quot;21\\&quot;:[\\&quot;pap-left-indent\\&quot;,\\&quot;0em\\&quot;]},\\&quot;nextNum\\&quot;:22}}&quot;,&quot;storyAtexts&quot;:[],&quot;srcGlobalPadId&quot;:&quot;300000000$PEyZJdSMxBjG&quot;}\" data-version=\"2.1.0\"></melo-data></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">第三方SDK</span></strong></span><span style=\"font-size: 9pt; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-weight: 700; color: rgb(102, 102, 102); background: rgb(247, 249, 251); letter-spacing: 0pt; vertical-align: baseline;\"></span></p><p class=\"paragraph text-align-type-left pap-line-1 pap-line-rule-auto pap-spacing-before-11.25pt pap-spacing-after-3.75pt\" style=\"margin-top: 15px; white-space: normal; line-height: 1;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">为了更好的服务用户，我们还集成了以下SDK</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1.cn.jpush.android(极光;极光推送)、 com.huawei.hms(华为;华为推送)，主要用于向用户推送信息，例如，用户在使用“专家问答”功能时，“专家端”用户进行回复后，我们将用上述SDK向您推送回复内容，以达到及时提醒的目。可能会收集的用户信息：信息推送的时间、推送结果、用户查看信息的时间、用户软件安装列表和Mac地址。请参考：极光推送介绍https://www.jiguang.cn/push，华为推送https://developer.huawei.com/consumer/cn/hms/huawei-pushkit/</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2.com.tencent.smtt(TBS腾讯浏览服务;腾讯浏览服务;腾讯X5浏览器;腾讯浏览器)，主要用于在客户端打开“溯源信息”H5页面，让用户可以浏览。该SDK并不会收集任何用户信息。请参考：腾讯浏览服务https://x5.tencent.com/tbs/product/tbs.html</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3.com.amap.api(高德地图;高德导航;高德定位;阿里高德地图;高德) ，主要用于获取用户的定位信息，例如，在使用“圈地”功能时，将通过该SDK获取到用户当前所在的地理位置，便于用户用户。可能会收集的用户信息：用户位置信息；请参考：高德地图API https://lbs.amap.com/</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4. com.umeng(友盟)，主要用于统计用户使用应用内各种功能的次数，例如，打开应用的次数、某个页面停留的时间、使用农事操作功能的次数等，目的是为了根据用户习惯优化应用的设计。该SDK会收集的用户信息：应用访问次数、页面访问时间、某个功能的访问次数、访问时间、应用内的页面的使用路径等。请参考：友盟U-APP移动统计 https://www.umeng.com/analytics</span><span style=\"font-size: 9pt; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; color: rgb(102, 102, 102); background: rgb(247, 249, 251); letter-spacing: 0pt; vertical-align: baseline;\"></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: normal;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\"><br/></span><br/></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">三、我们将如何使用收集到的信息</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们如何使用收集到的信息部分取决于您所使用的服务、如何使用它们以及您所设置的偏好。以下是我们使用所收集的、关于您的信息的具体目的：</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1.为您提供更好的服务与体验：我们使用关于您的信息用于身份验证，默认设定，基于地理位置的扩展功能，应该提供什么样的用户支持以及如何运营和维护整体服务等。例如：识别您在什么地点登陆，我们将通过发送短信验证码的方式验证您的身份信息是否有效。记录您的操作记录，默认您的语言设定和位置设定。我们的服务还包括根据您上一次的操作记录和填报记录，默认下一次的操作设定，提高他人与您沟通协作的能力与效率，为您提供更好的个性化体验，并通过自动化的分析与计算，更好地帮助您和您的企业构建稳固与准确的关联关系。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 用于研究与开发迭代：我们一直在寻找方法使我们的服务以更智能、更快速、更安全、更综合、更有效的方式来帮助您获得更好的使用体验。我们通过集体学习，了解人们如何使用我们的服务，并不断收集用户直接向我们提供的反馈，以帮助我们排查问题并确定产品趋势、用法、活动模式以及服务整合和改进的方式。例如：我们在每次迭代与更新时，会记录新功能的使用量以及用户的使用链路，从而设计更好、更人性化的功能。在某些情况下，我们会将这部分的调查数据与研究数据提供给对应的研究机构以进行更深层的产品研究与学术研究。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. 用于改善与用户的沟通交流：我们将使用您的联系信息，通过发送短信，包括确认您的购买、提醒您订阅到期、回应您的意见问题与需求、提供客户支持以及向您发送更新、通知、警告等。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4. 用于技术服务：我们使用您的信息来解决您遇到的技术问题、响应您的协助请求、分析崩溃信息并进行修复和改进服务。如果您允许我们这样做，我们会与神农口袋的技术专家分享您的信息，以回应与支持相关请求。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">5. 用于加强安全保护与鉴权：我们使用有关您和您的服务使用情况信息来验证账户和活动、监控可疑或欺诈活动并确定上述行为是否违反服务政策。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">6. 用于保护我们合法的商业利益和其他合法权益：在法律要求或我们认为有必要保护我们的合法权利、利益和他人利益的情况下，我们会使用有关您的信息来处理法律诉讼、合规、监管和审计相关事务，以及与收购、合并或出售业务相关的信息披露。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">7. 神农口袋所采集的数据所有权属于用户所有，但为提供更好的为用户提供服务，用户以此授予左岸芯慧及其关联公司、合作公司独家的、全球通用的、永久的、免费的许可使用权利 (并有权在多个层面对该权利进行再授权)，使左岸芯慧及其关联公司、合作公司有权(全部或部分地) 使用、复制、修订、改写、发布、翻译、分发、执行和展示用户的全部数据资料及个人信息或制作其派生作品，并对所采集数据享有开发权限，提供更多元化服务。为帮助您获得更好的金融服务，我们会向合作的金融机构共享您必要的个人信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">如果使用神农口袋，则视为您已经同意我们出于特定目的使用您的信息，当然您也拥有随时改变主意的权利，但这不会影响任何已经发生了的处理。当我们或第三方（如您的雇主）合法使用您的信息时，您有权反对。但是在某些情况下，这可能意味着您不再使用神农口袋。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">四、我们如何存储收集到的信息并如何保障其安全性</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">信息的存储和安全：我们使用阿里云提供的云服务托管我们收集的信息，并使用技术措施来保护您的数据。尽管我们极尽可能地保护您的信息安全，但由于互联网的固有特性，没有任何系统是绝对安全的，我们无法保证数据在通过互联网传输过程中和存储在我们系统时的绝对安全。我们会尽一切可能防止安全入侵事件的发生。但如果发生该类事件，我们将在合理期限内第一时间告知您。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">信息将被存储多久</span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">信息将被存储多久是由该信息的种类所决定的，我们在下文中将详细描述。当信息达到一定存储期限后，我们会删除您的信息或做匿名处理。但当删除操作无法进行的时候（如信息已存储在备份存档中），我们将安全地存储您的信息，并将其隔离，直至删除成为可能。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 账号信息：我们将保留您的账户信息，直到您删除您的账户。我们还将保留一些必要的信息，以履行法律义务、解决争议、履行协议、支持业务运营并继续开发和改进我们的服务。如果我们将要保留这些信息以用于服务改进和产品迭代，我们会将数据脱敏，并且我们只会利用这些信息进行集体性分析而不会针对您的个人数据做专门分析。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 您在我们服务中所分享的信息：如果您的账户已停用或被停用，您的部分信息和您提供的内容将被保留，以便您的团队成员或其他用户充分使用服务。例如：我们会继续显示您提供给企业或任务中的内容。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. 市场偏好信息：如果您选择接收我们的营销电子邮件，我们会保留有关您的营销偏好信息，除非您明确要求我们删除此类信息。我们将保留自创建日期起的合理时间段内从 Cookie 和其他跟踪技术中所获得的信息。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">五、有害信息的过滤和删除</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">根据相关法律的规定，神农口袋禁止用户创建和储存一切有害信息，包括：</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（1）违反中国宪法确定的基本原则的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（3）宣扬恐怖主义、极端主义、民族仇恨、民族歧视的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（4）破坏国家、地区间友好关系的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（6）散布谣言或不实消息，扰乱社会秩序，破坏社会稳定的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（7）煽动、组织、教唆恐怖活动、非法集会、结社、游行、示威、聚众扰乱社会秩序的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（8）散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（9）侵犯他人名誉、隐私、著作权、信息网络传播权等合法权益的；</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">（10）含有法律、行政法规禁止的其他内容的。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">神农口袋将针对以上信息制定过滤和屏蔽机制。如用户创建项目或储存文件时不能履行和遵守本政策中的规定，神农口袋有权对违反本政策的用户做出关闭账户的处理，同时保留依法追究当事人法律责任的权利。此外，神农口袋在采取移除等相应措施后，不为此向原发布人承担违约责任或其他法律责任。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">六、您的权利</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">1. 您可以在使用我们服务的过程中，访问、修改、撤回和删除您提供的注册信息和其他个人信息，也可按照通知指引与我们联系。您访问、修改和删除个人信息的范围和方式将取决于您使用的具体服务。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">2. 每个业务功能可能需要某些基本的个人信息才能得以完成。对于额外收集的个人信息的收集和使用，您可以随时给予或撤回您的授权同意。当您撤回同意后，我们将不再处理相应的个人信息。但您撤回同意的决定，不会影响此前基于您的授权而开展的个人信息处理。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">3. 您有权获取您的个人信息副本。在技术可行的前提下，例如数据接口匹配，我们还可按您的要求，直接将您的个人信息副本传输给您指定的第三方。我们将以弹窗方式单独告知接收个人信息的第三方身份或类型、向第三方分享数据的目的及数据的范围并征得您的同意。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">4. 在某些业务功能中，我们可能仅依据信息系统、算法等非人工自动决策机制对您的个人信息做出处理。如果这些决定将显著影响您的合法权益，您有权要求我们做出解释，我们也将对此提供适当的救济方式。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">5. 您有权要求限制对您个人数据的处理。在下列情形中，您有权限制我们处理数据：当您对个人数据的准确性有争议，并允许我们在一定的期限内核实其准确性时；当数据处理是非法的，且您反对删除个人数据而是要求限制使用该个人数据时；当我们不再需要个人数据以实现处理目的，但您为了提起、行使或抗辩法律诉求而需要该个人数据时；当您基于反对权需要核实我们的法律依据是否优先于您的法律依据时。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">6. 您有权选择退出促销。您可以选择不接收我们的促销信息，为此目的，您可以直接联系我们从促销邮件列表或注册数据库中中删除您的联系信息。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">7. 为保障安全，您可能需要以提供书面材料或其他方式证明您的身份。我们可能会先要求您验证自己的身份，然后再处理您的请求。对于您的合理请求，我们原则上不收取费用，但对多次重复、超出合理限度的请求，我们将视情况收取一定的成本费用。对于那些无端重复、需要过多技术手段（例如：需要开发新系统或从根本上改变现行惯例）、给他人合法权益带来风险或者非常不切实际（例如：涉及备份磁带上存放的信息）的请求，我们可能会予以拒绝。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">在以下情形中，按照法律法规要求，我们将无法响应您的请求：</span></p><ul class=\" list-paddingleft-2\" style=\"width: 1379.39px; white-space: normal;\"><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">与国家安全、国防安全直接相关的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">与公共安全、公共卫生、重大公共利益直接相关的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">与犯罪侦查、起诉、审判和判决执行等直接相关的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">有充分证据表明您存在主观恶意或滥用权利的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">响应您的请求将导致您或其他个人、组织的合法权益受到严重损害的；</span></p></li><li><p style=\"margin-top: 15px; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">涉及商业秘密的。</span></p></li></ul><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">七、业务转让</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">神农口袋收集的信息将被视作一项资产，如果存在下列情况之一，此类信息可能成为被转让的资产之一：神农口袋、任何关联公司或部门与其他企业或部门进行合并、被收购，或者进行破产、解散、重组，或者出售部分或全部神农口袋的资产或股票，或者进行融资、公开发行证券，或者被收购全部或部分业务，或者进入其他类似交易或程序，或者为此类活动进行的其他程序和步骤（例如尽职调查）。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">当上述交易完成后，若存在转让神农口袋收集的信息的情况，我们会以邮件和/或其他方式通知您。收购方或者其他与收购方具有类似地位的权利义务承继者，只能按照此隐私策略（或者向您收集信息时任何有效的后续策略）来使用您的信息。请注意，转让后提交或收集的信息可能根据收购方的要求在法律允许的范围内进行修改，隐私政策也将据此进行更新。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">八、其他重要的隐私策略</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们的产品适用于个人使用和组织使用，在通过组织（例如您的雇主）向您提供服务的情况下，该组织是服务的管理员，并且对其拥有控制权的最终用户和服务站点负责。如果是此种情况，请将您的数据隐私需求提交给管理员，因为您对服务的使用受制于该组织的政策。我们不对管理员组织的隐私或安全做法负责，这些做法可能与本政策有所出入。即使服务目前没有由组织管理，如果您是由组织管理的团队的成员，那么该团队的管理员（例如您的雇主）可能会对您的账户进行管理、控制，并在这之后使用我们的服务。如果发生此类情况，您会收到通知。农场管理员、企业管理员能够限制您对任务、农场、企业的访问与权限。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">如果您不希望管理员能够控制您的账户或使用服务，您可以退出企业、农场。</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">请联系您的组织或您的管理员，以获取组织政策和了解更多信息。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">九、联系我们</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">如果您对本隐私政策有任何疑问、意见或建议，请通过以下方式与我们联系：</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">邮箱：zaxh@zaxh.cn</span></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">地址：上海市嘉定区平城路1455号中科院新微大厦B座11楼</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">客服电话：021-60766628</span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">一般情况下，我们将在十天内回复。</span></p><p style=\"margin-top: 20px; white-space: normal; line-height: 2em;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">十、隐私政策的变更</span></strong><strong><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"margin-top: 15px; white-space: normal; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 12px;\">我们可能会不时更改此隐私政策。隐私政策的任何更改都会在此页面上发布。如果更改的内容十分重要，我们将通过在服务主页或登录屏幕上添加通知或者向您发送电子邮件的方式通知您。我们也会将此隐私政策的先前版本保留在档案中供您查看。我们鼓励您在使用服务时了解我们的隐私政策，随时了解我们的信息能够帮助您更好地保护隐私。如果您不同意本隐私政策的任何更改，您需要停止使用服务并停用您的账户。</span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">本条款更新时间：2021年10月27日16:20:01</p><p style=\"white-space: normal;\">生效时间：2021年10月27日16:20:12</p><p><br/></p>',
        104, '2022-06-23 10:55:50', 104, '2022-06-23 10:55:50');
INSERT INTO `sys_agreement`
VALUES (49, 111, 'xss漏洞测试11', '用户协议',
        '<p>&amp;lt;iframe src=&quot;data:text/html,&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&quot;&amp;gt;&amp;lt;/iframe&amp;gt;</p><p><br/></p>',
        1, '2022-06-23 11:05:34', 1, '2022-06-23 11:05:34');
INSERT INTO `sys_agreement`
VALUES (56, 3, '隐私条政策4111111222222222222', '隐私政策', '<p>阿萨大大111</p>', 2, '2019-06-28 10:39:45', 2, '2020-04-08 10:39:29');
INSERT INTO `sys_agreement`
VALUES (58, 5, '吴杰拉德55', '用户协议', '<p>大的6666</p>', 2, '2019-07-02 14:12:18', 1, '2022-06-21 14:54:11');
INSERT INTO `sys_agreement`
VALUES (67, 6, '新增用户协议', '用户协议',
        '<p><span style=\"color: rgb(51, 51, 51); font-family: tahoma, &quot;Microsoft YaHei&quot;, 微软雅黑, 宋体, &quot;Malgun Gothic&quot;, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(247, 248, 250);\">&lt;iframe src=&quot;data:text/html, &lt;script&gt;alert(1)&lt;/script&gt;&quot;&gt;&lt;/iframe&gt;</span></p>',
        2, '2020-04-08 14:55:37', 1, '2022-06-21 17:59:17');

-- ----------------------------
-- Table structure for sys_agri_res_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sys_agri_res_feedback`;
CREATE TABLE `sys_agri_res_feedback`
(
    `id`                      bigint(20)                                                    NOT NULL,
    `company_id`              bigint(20)                                                    NULL DEFAULT NULL COMMENT '提交申请的企业id',
    `company_name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '提交申请的企业名称',
    `agri_res_name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '农资名称',
    `first_agri_category_id`  bigint(20)                                                    NULL DEFAULT NULL COMMENT '一级农资分类id',
    `second_agri_category_id` bigint(20)                                                    NULL DEFAULT 0 COMMENT '二级农资分类id',
    `productor`               varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '生产厂家',
    `img_url`                 varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci       NULL DEFAULT NULL COMMENT '农资图片',
    `img_url_big`             varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci       NULL DEFAULT '' COMMENT '大图地址',
    `feedback_user_id`        bigint(20)                                                    NULL DEFAULT NULL COMMENT '提交人id',
    `feedback_phone`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '提交人手机号',
    `user_company_name`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '用户在企业中的名称',
    `status_flag`             tinyint(4)                                                    NULL DEFAULT 1 COMMENT '1：待审核，2通过，3不通过，4忽略',
    `submit_time`             datetime                                                      NULL DEFAULT NULL COMMENT '提交时间',
    `check_user_id`           bigint(20)                                                    NULL DEFAULT NULL COMMENT '审核人id',
    `check_nickname`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '审核人名称',
    `check_time`              datetime                                                      NULL DEFAULT NULL COMMENT '审核时间',
    `check_fail_reason`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注：审核不通过原因',
    `msg_send_status`         tinyint(2)                                                    NULL DEFAULT 0 COMMENT '短信发送状态0：失败，1：成功',
    `msg_send_remark`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         NULL COMMENT '短信发送描述',
    `create_time`             datetime                                                      NULL DEFAULT NULL,
    `update_time`             datetime                                                      NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户农资反馈表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_agri_res_feedback
-- ----------------------------
INSERT INTO `sys_agri_res_feedback`
VALUES (443, 11770, '水产养殖证', '敌敌畏', 0, 0, '合肥哈哈哈哈', NULL, '', 124593, '15555223322', '神农3322', 1, '2021-03-04 14:14:23', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-04 14:14:23', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (444, 11770, '水产养殖证', '敌敌畏', 0, 0, '合肥哈哈哈哈', NULL, '', 124593, '15555223322', '神农3322', 1, '2021-03-04 14:14:23', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-04 14:14:23', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (445, 6181, '蔬菜&果园', '哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或', 0, 0, '萨芬撒高门大户sad考核科技开发的环境奋达科技货到付款很快就大家克服哈沙几号放假和大家大家奥斯卡索拉卡', NULL, '', 116595, '15956949585', 'cc', 2,
        '2021-03-09 10:11:33', 1, '超管', '2021-03-09 14:13:52', NULL, 1, '成功', '2021-03-09 10:11:33', '2021-03-09 14:13:52');
INSERT INTO `sys_agri_res_feedback`
VALUES (446, 10027, '汪健的农场', '汪健的测试农资', 0, 0, '汪健的工厂', NULL, '', 115627, '18658831890', '神农1890', 1, '2021-03-09 10:55:55', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-09 10:55:55', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (447, 10027, '汪健的农场', 'test', 0, 0, 'test——prodoctor', NULL, '', 115627, '18658831890', '神农1890', 1, '2021-03-09 10:59:30', 0, NULL, NULL, NULL, 0,
        NULL, '2021-03-09 10:59:30', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (448, 2532, '上海演示（正义）', '32423423423423423423', 0, 0,
        '4324234234234234234234234234234234234534645653453534543253645436543256345345342543265367457547455463456546546456543654645364564564564564', NULL,
        '', 105591, '18715065755', '张涛', 1, '2021-03-10 11:13:10', 0, NULL, NULL, NULL, 0, NULL, '2021-03-10 11:13:10', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (449, 2532, '上海演示（正义）', '1222', 0, 0, '的是根深蒂固的方式', NULL, '', 105591, '18715065755', '张涛', 1, '2021-03-10 11:25:13', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-10 11:25:13', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (452, 926, '磐安天海中药有限', '一二三四五一二三四五一二三四五一二三四五', 0, 0,
        '一二三四五一二三四五一二三四五一一二三四五一二三四五一二三四五一一二三四五一二三四五一二三四五一一二三四五一二三四五一二三四五一一二三四五一二三四五一二三四五一一二三四五一二三四五一二三四五一一二三四五一二三四五一二三四五一一二三四五一二三四五一二三四五一大锅饭发鬼地方个高度固定发大范甘迪官方的滚动对郭德纲',
        NULL, '', 99562, '13182341525', '多比', 1, '2021-03-10 17:02:44', 0, NULL, NULL, NULL, 0, NULL, '2021-03-10 17:02:44', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (453, 926, '磐安天海中药有限', '11', 0, 0, '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十1222', NULL,
        '', 99562, '13182341525', '多比', 1, '2021-03-10 17:03:27', 0, NULL, NULL, NULL, 0, NULL, '2021-03-10 17:03:27', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (454, 11744, 'test', '哈哈哈', 0, 0, '嘿嘿', NULL, '', 105591, '18715065755', '神农5755', 1, '2021-03-11 10:51:57', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-11 10:51:57', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (455, 11744, 'test', 'test', 0, 0, '哈哈哈哈', NULL, '', 105591, '18715065755', '神农5755', 1, '2021-03-11 15:18:03', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-11 15:18:03', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (456, 6181, '蔬菜&果园', '12345678912345678900', 0, 0, '给大喊大叫记得记得记得看看继续坚持坚持坚持积极参加继续坚持奖学金', NULL, '', 116595, '15956949585', 'cc', 1,
        '2021-03-15 09:35:00', 0, NULL, NULL, NULL, 0, NULL, '2021-03-15 09:35:00', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (457, 6181, '蔬菜&果园', '好的记得记得你', 0, 0, '给大喊大叫的聚集地', NULL, '', 116595, '15956949585', 'cc', 1, '2021-03-15 09:46:34', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-15 09:46:34', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (458, 2579, '上海众德农产品专业合作社', '驼鹿', 0, 0, '85888', NULL, '', 109671, '19956038826', '张静峰', 1, '2021-03-15 11:16:12', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-15 11:16:12', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (459, 11790, '3.21.0', '一二三四五六七八九人一二三四五六七八九人', 0, 0, '厂家厂家', NULL, '', 99562, '13182341525', '神农1525', 1, '2021-03-15 11:34:00', 0, NULL, NULL,
        NULL, 0, NULL, '2021-03-15 11:34:00', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (460, 11790, '3.21.0', '01234567890123456789', 0, 0, '厂家厂家批发零售直销企业经营范围扩大了空间感生产出来吧……不过现在还是挺期待这样子说吧……好像也一样吗……', NULL, '', 99562, '13182341525',
        '神农1525', 1, '2021-03-15 11:36:51', 0, NULL, NULL, NULL, 0, NULL, '2021-03-15 11:36:51', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (461, 11790, '3.21.0', '1', 0, 0, '2', NULL, '', 99562, '13182341525', '神农1525', 1, '2021-03-15 11:37:25', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-15 11:37:25', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (462, 10027, '汪健的农场', '1234', 0, 0, '12434', NULL, '', 115627, '18658831890', '神农1890', 1, '2021-03-15 14:34:15', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-15 14:34:15', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (463, 6181, '蔬菜&果园', '大家都觉得就到家', 0, 0, '还是纠结的经典咖啡减肥', NULL, '', 116595, '15956949585', 'cc', 1, '2021-03-15 14:53:26', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-15 14:53:26', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (464, 11790, '3.21.0', '一二三四', 0, 0, '啦啦啦', NULL, '', 99562, '13182341525', '多比', 1, '2021-03-15 18:09:17', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-15 18:09:17', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (465, 11790, '3.21.0', '测试新增', 0, 0, '厂家', NULL, '', 99562, '13182341525', '多比', 1, '2021-03-16 09:34:00', 0, NULL, NULL, NULL, 0, NULL,
        '2021-03-16 09:34:00', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (466, 11790, '3.21.0', '1', 0, 0, '2', NULL, '', 99562, '13182341525', '多比', 4, '2021-03-16 09:34:30', 1, '超管', '2021-03-16 18:11:06', NULL, 1,
        '成功', '2021-03-16 09:34:30', '2021-03-16 18:11:06');
INSERT INTO `sys_agri_res_feedback`
VALUES (467, 11790, '3.21.0', '一二三四一二三四五天一二三四五六七一二节', 0, 0, '咯哦', NULL, '', 99562, '13182341525', '多比', 2, '2021-03-16 17:07:49', 1, '超管',
        '2021-03-16 18:11:01', NULL, 1, '成功', '2021-03-16 17:07:49', '2021-03-16 18:11:01');
INSERT INTO `sys_agri_res_feedback`
VALUES (468, 6181, '蔬菜&果园', '不是记得记得亟待解决记得记得记得记得就记', 0, 0,
        '不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记',
        NULL, '', 116595, '15956949585', 'cc', 3, '2021-03-17 10:24:43', 1, '超管', '2021-03-17 10:27:31', '测试', 1, '成功', '2021-03-17 10:24:43',
        '2021-03-17 10:27:31');
INSERT INTO `sys_agri_res_feedback`
VALUES (469, 6181, '蔬菜&果园', '不是记得记得亟待解决记得记得记得记得就记', 0, 0,
        '不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记不是记得记得亟待解决记得记得记得记得就记',
        NULL, '', 116595, '15956949585', 'cc', 3, '2021-03-17 10:24:44', 1, '超管', '2021-03-17 10:27:54', '测试', 1, '成功', '2021-03-17 10:24:44',
        '2021-03-17 10:27:54');
INSERT INTO `sys_agri_res_feedback`
VALUES (485, 11636, '合肥中天', '钉钉', 0, 0, '辅导费', NULL, '', 115149, '15551711621', '神农1621', 1, '2021-07-06 17:39:29', 0, NULL, NULL, NULL, 0, NULL,
        '2021-07-06 17:39:29', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (486, 10027, '汪健的农场一二三四五一二三四五一二三四五一二三四五一二三四五', '测试添加农资', 0, 0, '汪健生产', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/3F8A5CAD5D85873F081B415031583AB1.png', 124585, '18856262053', '汪健', 1,
        '2021-07-14 12:30:12', 0, NULL, NULL, NULL, 0, NULL, '2021-07-14 12:30:12', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (487, 10027, '汪健的农场一二三四五一二三四五一二三四五一二三四五一二三四五', '农资入库测试新增农资', 0, 0, '汪健生产', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/7D9E0F5F3E150DFA196F14ACF77B3D9D.png', 124585, '18856262053', '汪健', 1,
        '2021-07-14 12:35:57', 0, NULL, NULL, NULL, 0, NULL, '2021-07-14 12:35:57', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (488, 11636, '合肥中天', '农资测试图片', 0, 0, '合肥', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/94C915BB401552F2870AA1875680E222.jpg', 115149, '15551711621', '神农1621', 1,
        '2021-07-14 13:42:09', 0, NULL, NULL, NULL, 0, NULL, '2021-07-14 13:42:09', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (489, 6181, '蔬菜&果园', '测测测试', 0, 0, '1111111111111111', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/CBAEBF07AFD47DDA2640BD274433E0BA.jpg', 116595, '15956949585', 'chengqing', 1,
        '2021-07-15 14:42:36', 0, NULL, NULL, NULL, 0, NULL, '2021-07-15 14:42:36', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (490, 6181, '蔬菜&果园', '地方还放假', 0, 0, '房管局房管局发', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/655C33FF9B8FF97C3C848641280277F2.jpg', 116595, '15956949585', 'chengqing', 1,
        '2021-07-15 14:50:06', 0, NULL, NULL, NULL, 0, NULL, '2021-07-15 14:50:06', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (491, 10027, '汪健的农场一二三四五一二三四五一二三四五一二三四五一二三四五', '1111', 0, 0, '2222', NULL, NULL, 124585, '18856262053', '汪健', 1, '2021-07-15 15:22:05', 0, NULL,
        NULL, NULL, 0, NULL, '2021-07-15 15:22:05', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (492, 11994, '迭代28企业迭代28企业迭代28企业迭代28企业迭代28企业迭代28企业', '地方', 0, 0, '党委', NULL, NULL, 124575, '13637088252', '神农8252', 1, '2021-07-15 18:38:27', 0,
        NULL, NULL, NULL, 0, NULL, '2021-07-15 18:38:27', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (493, 12025, '4.9.0', '复合维生素', 0, 0, '巅峰计划多少放假发动机地方发动机的说法大富豪大厦', NULL, NULL, 116595, '15956949585', '神农9585', 1, '2021-07-16 13:57:16', 0, NULL,
        NULL, NULL, 0, NULL, '2021-07-16 13:57:16', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (494, 12025, '4.9.0', '让我也认为', 0, 0, '收到货收到货大叔大婶收到货收到货', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/1DF79E62B65CDC48126041E444D1006A.png', 116595, '15956949585', '神农9585', 1,
        '2021-07-16 13:57:54', 0, NULL, NULL, NULL, 0, NULL, '2021-07-16 13:57:54', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (495, 2578, '上海阅乡农产品专业合作社', '测试123', 0, 0, '456', NULL, NULL, 99562, '13182341525', '田方永', 4, '2021-07-16 15:53:04', 1, '超管', '2021-11-30 14:52:33',
        NULL, 1, '成功', '2021-07-16 15:53:04', '2021-11-30 14:52:33');
INSERT INTO `sys_agri_res_feedback`
VALUES (496, 11800, '3.23.0', '发顺丰的是', 0, 0, '发顺丰', NULL, NULL, 99562, '13182341525', '神农1525', 4, '2021-07-16 16:32:53', 1, '超管', '2021-07-27 14:37:57',
        NULL, 1, '成功', '2021-07-16 16:32:53', '2021-07-27 14:37:57');
INSERT INTO `sys_agri_res_feedback`
VALUES (497, 11800, '3.23.0', '111', 0, 0, '222', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/8419DED754A23BCCDDFD4716C455BEAA.JPG', 99562, '13182341525', '神农1525', 1,
        '2021-07-16 16:33:29', 0, NULL, NULL, NULL, 0, NULL, '2021-07-16 16:33:29', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (498, 11800, '3.23.0', '人人通', 0, 0, '同仁堂', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2021-07-16 16:33:44', 0, NULL, NULL, NULL, 0, NULL,
        '2021-07-16 16:33:44', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (499, 11800, '3.23.0', '11', 0, 0, '22', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/EC0A568D064032944D569E6210A694BB.jpg', 99562, '13182341525', '神农1525', 2,
        '2021-07-16 18:41:04', 1, '超管', '2021-09-22 17:17:43', NULL, 1, '成功', '2021-07-16 18:41:04', '2021-09-22 17:17:43');
INSERT INTO `sys_agri_res_feedback`
VALUES (500, 12025, '4.9.0', '都是公司的', 0, 0, '十多个的感受是啥时说的很对', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/F49D6E3B4E25460844DF58AA21705DCE.jpg', 116595, '15956949585', '神农9585', 1,
        '2021-07-16 19:02:42', 0, NULL, NULL, NULL, 0, NULL, '2021-07-16 19:02:42', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (501, 12025, '4.9.0', '阿萨德贵师大SD', 0, 0, 'GSDGS ', NULL, NULL, 116595, '15956949585', '神农9585', 2, '2021-07-16 19:02:51', 104, '史火霞',
        '2022-03-09 16:50:48', NULL, 1, '成功', '2021-07-16 19:02:51', '2022-03-09 16:50:48');
INSERT INTO `sys_agri_res_feedback`
VALUES (502, 12025, '4.9.0', ' 农资农资', 0, 0, '333', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/A609A36E2CEAB4323D262CDEFEB81A1B.jpg', 116595, '15956949585', '神农9585', 3,
        '2021-07-20 14:52:12', 1, '超管', '2021-07-27 14:32:01', 'rete', 1, '成功', '2021-07-20 14:52:12', '2021-07-27 14:32:01');
INSERT INTO `sys_agri_res_feedback`
VALUES (503, 2645, '上海正义园艺有限公司', '11', 0, 0, '222', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/8CB2B7D154638E502ABD821913E726C4.jpg', 99562, '13182341525', '史火霞', 2,
        '2021-07-20 15:35:08', 1, '超管', '2021-07-27 14:27:33', NULL, 1, '成功', '2021-07-20 15:35:08', '2021-07-27 14:27:33');
INSERT INTO `sys_agri_res_feedback`
VALUES (504, 2645, '上海正义园艺有限公司', '11', 0, 0, '22', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/FF34399A82CC17DF6B1B71C79FE88119.jpg', 99562, '13182341525', '史火霞', 3,
        '2021-07-20 15:35:18', 1, '超管', '2021-07-23 17:12:37', '不付费', 1, '成功', '2021-07-20 15:35:18', '2021-07-23 17:12:37');
INSERT INTO `sys_agri_res_feedback`
VALUES (505, 5325, 'EAP INC LTD', '化肥', 0, 0, 'a', NULL, NULL, 129618, '18610792080', 'zt', 2, '2021-10-24 14:39:54', 1, '超管', '2021-10-24 14:43:35', NULL,
        1, '成功', '2021-10-24 14:39:54', '2021-10-24 14:43:35');
INSERT INTO `sys_agri_res_feedback`
VALUES (506, 5325, 'EAP INC LTD', '化肥2', 0, 0, 'b', NULL, NULL, 115580, '13876180831', '神农0831', 2, '2021-10-24 14:41:34', 1, '超管', '2021-10-24 14:43:27',
        NULL, 1, '成功', '2021-10-24 14:41:34', '2021-10-24 14:43:27');
INSERT INTO `sys_agri_res_feedback`
VALUES (508, 12164, 'js测试企业', '啊实打实', 0, 0, '阿城市', NULL, NULL, 129653, '19955157561', '神农7561', 4, '2021-11-30 15:14:14', 1, '超管', '2021-11-30 15:14:25',
        NULL, 1, '成功', '2021-11-30 15:14:14', '2021-11-30 15:14:25');
INSERT INTO `sys_agri_res_feedback`
VALUES (509, 12164, 'js测试企业', '12121', 0, 0, '1212', NULL, NULL, 129653, '19955157561', '神农7561', 3, '2021-11-30 15:14:56', 1, '超管', '2021-11-30 15:15:14',
        '阿松大', 1, '成功', '2021-11-30 15:14:56', '2021-11-30 15:15:14');
INSERT INTO `sys_agri_res_feedback`
VALUES (516, 12644, '11', '12', 0, 0, '2', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-05-26 17:59:51', 0, NULL, NULL, NULL, 0, NULL,
        '2022-05-26 17:59:51', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (518, 12650, '迭代57蔬菜预测产量归档', '11', 0, 0, '22', NULL, NULL, 99562, '13182341525', '神农1525', 3, '2022-06-02 09:38:13', 104, '史火霞',
        '2022-06-06 13:54:58', '11', 1, '成功', '2022-06-02 09:38:13', '2022-06-06 13:54:58');
INSERT INTO `sys_agri_res_feedback`
VALUES (519, 12650, '迭代57蔬菜预测产量归档', '测试短信', 0, 0, '11', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 14:28:42', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 14:28:42', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (521, 12650, '迭代57蔬菜预测产量归档', '测试农资', 0, 0, '11', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 14:59:24', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 14:59:24', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (522, 12650, '迭代57蔬菜预测产量归档', '测试农资', 0, 0, '11', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 14:59:33', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 14:59:33', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (523, 12650, '迭代57蔬菜预测产量归档', '测试农资', 0, 0, '11', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 14:59:48', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 14:59:48', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (524, 12650, '迭代57蔬菜预测产量归档', '测试农资', 0, 0, '11', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 15:01:00', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 15:01:00', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (525, 12650, '迭代57蔬菜预测产量归档', '测试农资', 0, 0, '11', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 15:06:10', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 15:06:10', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (526, 12652, '迭代57', '11', 0, 0, '22', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 15:18:35', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 15:18:35', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (527, 12652, '迭代57', '11', 0, 0, '22', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 15:23:19', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 15:23:19', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (528, 12652, '迭代57', '11', 0, 0, '22', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-06-06 15:29:13', 0, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 15:29:13', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (541, 2645, '上海正义园艺有限公司企业', '晓风呀', 0, 0, '测试', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-07-14 14:26:40', 0, NULL, NULL, NULL, 0, NULL,
        '2022-07-14 14:26:41', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (542, 12664, '上海趣看科技有限公司', '测试农资品类', 0, 0, '合肥史丹利', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/4D9CDF36B8752F0ED7F3093E26BF21BD.png', 129802, '18119675311', '神农5311', 1,
        '2022-07-14 14:46:27', 0, NULL, NULL, NULL, 0, NULL, '2022-07-14 14:46:27', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (543, 2645, '上海正义园艺有限公司企业', '晓风呀', 0, 0, '111222', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/6FFED79B9639F4D28118AF3C91F5A60F.png', 129674, '15890866974', '黄浦', 1,
        '2022-07-14 17:03:37', 0, NULL, NULL, NULL, 0, NULL, '2022-07-14 17:03:37', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (544, 12664, '上海趣看科技有限公司', '测试农资入库', 0, 0, '史丹利', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/snkoudai/62AA3D8740C953531692DBE30C887222.png', 129802, '18119675311', '神农5311', 1,
        '2022-07-14 17:27:33', 0, NULL, NULL, NULL, 0, NULL, '2022-07-14 17:27:33', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (545, 2645, '上海正义园艺有限公司企业', '222', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-07-14 17:52:18', 0, NULL, NULL, NULL, 0, NULL,
        '2022-07-14 17:52:18', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (546, 12763, '多比迭代60农企业', '多比', 0, 0, '厂家厂家', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-07-21 15:31:41', 0, NULL, NULL, NULL, 0, NULL,
        '2022-07-21 15:31:41', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (547, 12763, '多比迭代60农企业', '多比', 0, 0, '厂家', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/53ad2fd7-78c7-4bb0-bf7c-88ae4e7f9aa1.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-07-21 15:35:14', 0, NULL, NULL, NULL, 0, NULL, '2022-07-21 15:35:14', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (548, 12763, '多比迭代60农企业', 'hello ', 0, 0, 'hsh ', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/9a93698c-dfed-42d2-8d2d-77b10be81c36.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-07-21 15:36:03', 0, NULL, NULL, NULL, 0, NULL, '2022-07-21 15:36:03', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (549, 12763, '多比迭代60农企业', '一二三四五六七八九十一二三四五六七八九十', 0, 0, '生产厂家生产厂家六十一二三四五一二三四五一二三四五六七八九十头摸头诺托头诺木木屋', NULL, NULL, 99562, '13182341525', '神农1525', 1,
        '2022-07-21 17:05:31', 0, NULL, NULL, NULL, 0, NULL, '2022-07-21 17:05:31', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (550, 12763, '多比迭代60农企业', '农资', 0, 0, '厂家', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-07-21 17:06:31', 0, NULL, NULL, NULL, 0, NULL,
        '2022-07-21 17:06:31', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (551, 12763, '多比迭代60农企业', '农资1', 0, 0, '厂家1', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-07-21 17:06:48', 0, NULL, NULL, NULL, 0, NULL,
        '2022-07-21 17:06:48', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (552, 12763, '多比迭代60农企业', '安卓农资', 0, 0, '安卓厂家', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/1c78dc0a-29c4-4840-9906-3ecee36422b3.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-07-21 17:32:52', 0, NULL, NULL, NULL, 0, NULL, '2022-07-21 17:32:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (553, 2645, '上海正义园艺有限公司企业', '11', 0, 0, '22', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-07-25 15:09:12', 0, NULL, NULL, NULL, 0, NULL,
        '2022-07-25 15:09:12', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (554, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '2', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/26e1e087-a9de-49bf-81db-458ba0db1ded.jpg', 129674, '15890866974', '黄浦', 1,
        '2022-07-25 15:11:11', 0, NULL, NULL, NULL, 0, NULL, '2022-07-25 15:11:11', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (555, 12782, '迭代60企业5', '测试', 0, 0, '厂家', NULL, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/853a7187-2d19-43d1-b585-aead72888811.jpg',
        99562, '13182341525', '神农1525', 1, '2022-07-25 19:07:23', 0, NULL, NULL, NULL, 0, NULL, '2022-07-25 19:07:23', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (556, 12782, '迭代60企业5', '466446', 0, 0, '哦婆婆', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/56f3a260-d985-4a92-892c-3998af9663d5.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-07-25 19:07:55', 0, NULL, NULL, NULL, 0, NULL, '2022-07-25 19:07:55', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (557, 12782, '迭代60企业5', '123', 0, 0, '456', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/7f7195b3-0ef8-45e4-8476-3ef3a1bc711c.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-07-25 19:08:41', 0, NULL, NULL, NULL, 0, NULL, '2022-07-25 19:08:41', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (558, 12782, '迭代60企业5', '55', 0, 0, '666', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/75cddbf6-99dd-4022-9261-bdc32db08daa.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-07-25 19:09:43', 0, NULL, NULL, NULL, 0, NULL, '2022-07-25 19:09:43', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (559, 12782, '迭代60企业5', '15555', 0, 0, '4566', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/6b336b6c-eb16-463c-a5ce-a719700af7ca.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-07-25 19:39:24', 0, NULL, NULL, NULL, 0, NULL, '2022-07-25 19:39:24', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (560, 12799, '多比迭代60企业9泰捷', '123', 0, 0, '456', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/7ddb5c94-a4bf-4c38-b4ca-de793622a571.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-07-27 18:12:44', 0, NULL, NULL, NULL, 0, NULL, '2022-07-27 18:12:44', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (575, 12808, '多比迭代61企业1外采修改农事较多', '测试新增', 0, 0, '厂家', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 10:02:52', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 10:02:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (576, 12808, '多比迭代61企业1外采修改农事较多', '测试新增', 0, 0, '厂家', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 10:02:52', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 10:02:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (577, 12808, '多比迭代61企业1外采修改农事较多', '测试新增', 0, 0, '厂家', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 10:02:52', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 10:02:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (578, 2645, '上海正义园艺有限公司企业', '331', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:53:46', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:53:46', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (579, 2645, '上海正义园艺有限公司企业', '331', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:53:46', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:53:46', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (580, 2645, '上海正义园艺有限公司企业', '331', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:53:46', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:53:46', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (581, 2645, '上海正义园艺有限公司企业', '331', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:53:46', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:53:46', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (582, 2645, '上海正义园艺有限公司企业', '331', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:53:46', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:53:46', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (583, 2645, '上海正义园艺有限公司企业', '大萨达所', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:54:02', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:54:02', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (584, 2645, '上海正义园艺有限公司企业', '大萨达所', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:54:02', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:54:02', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (585, 2645, '上海正义园艺有限公司企业', '大萨达所', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:54:02', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:54:02', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (586, 2645, '上海正义园艺有限公司企业', '打啊', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:55:49', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:55:49', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (587, 2645, '上海正义园艺有限公司企业', '打啊', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:55:49', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:55:49', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (588, 2645, '上海正义园艺有限公司企业', '打啊', 0, 0, '111', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 10:55:49', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 10:55:49', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (589, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '1', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:02:21', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:02:21', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (590, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '1', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:02:21', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:02:21', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (591, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '1', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:02:21', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:02:21', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (592, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '23', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:16:00', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:16:00', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (593, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '23', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:16:00', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:16:00', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (594, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:51', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:51', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (595, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:51', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:51', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (596, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:51', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:51', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (597, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:52', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (598, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:52', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (599, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:52', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (600, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:52', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (601, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:52', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:52', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (602, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:53', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:53', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (603, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:53', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:53', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (604, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:53', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:53', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (605, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:17:53', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:17:53', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (606, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:19:11', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:19:11', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (607, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 11:19:11', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 11:19:11', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (608, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '2', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 13:34:24', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 13:34:24', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (609, 2645, '上海正义园艺有限公司企业', '1', 0, 0, '2', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 13:34:24', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 13:34:24', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (610, 2645, '上海正义园艺有限公司企业', '333', 0, 0, '3333', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 13:34:46', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 13:34:46', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (611, 2645, '上海正义园艺有限公司企业', '3', 0, 0, '3', NULL, NULL, 129674, '15890866974', '黄浦', 1, '2022-08-23 14:09:18', 0, NULL, NULL, NULL, 0, NULL,
        '2022-08-23 14:09:18', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (612, 12808, '多比迭代61企业1外采修改农事较多', '发顺丰的', 0, 0, '佛山市的', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 16:10:54', 0, NULL, NULL, NULL,
        0, NULL, '2022-08-23 16:10:54', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (613, 12808, '多比迭代61企业1外采修改农事较多', '11', 0, 0, '22', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 16:11:01', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 16:11:01', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (614, 12808, '多比迭代61企业1外采修改农事较多', '22', 0, 0, '22', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 16:11:08', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 16:11:08', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (615, 12808, '多比迭代61企业1外采修改农事较多', '22', 0, 0, '22', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 16:11:09', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 16:11:09', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (616, 12808, '多比迭代61企业1外采修改农事较多', '33', 0, 0, '33', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 16:11:15', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 16:11:15', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (617, 12808, '多比迭代61企业1外采修改农事较多', '44', 0, 0, '44', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 16:12:22', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 16:12:22', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (618, 12808, '多比迭代61企业1外采修改农事较多', '55', 0, 0, '55', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 16:12:27', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 16:12:27', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (619, 12808, '多比迭代61企业1外采修改农事较多', '66', 0, 0, '66', NULL, NULL, 99562, '13182341525', '神农1525', 1, '2022-08-23 16:12:34', 0, NULL, NULL, NULL, 0,
        NULL, '2022-08-23 16:12:34', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (620, 12808, '多比迭代61企业1外采修改农事较多', '1', 0, 0, '1', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/da15eacf-178b-4b6a-90a6-634858e787f7.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-08-23 16:16:30', 0, NULL, NULL, NULL, 0, NULL, '2022-08-23 16:16:30', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (621, 12808, '多比迭代61企业1外采修改农事较多', '2', 0, 0, '2', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/215b18bb-7e82-4066-8de4-7ad3c2bdf48b.jpg', 99562, '13182341525', '神农1525', 1,
        '2022-08-23 16:16:46', 0, NULL, NULL, NULL, 0, NULL, '2022-08-23 16:16:46', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (622, 2645, '上海正义园艺有限公司企业', '3', 0, 0, '3', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/bd1cdd52-d998-4852-ae4f-56fd454a9a3a.jpg', 99562, '13182341525', '史火霞54', 1,
        '2022-08-23 16:17:28', 0, NULL, NULL, NULL, 0, NULL, '2022-08-23 16:17:28', NULL);
INSERT INTO `sys_agri_res_feedback`
VALUES (628, 10027, '汪健的农场一二三四五一二三四五一二三四五一二三四五一二三四五', '测试', 0, 0, '1233', NULL,
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/snkd-app/06fc9f42-7b85-4c2a-8c24-b28b332fd28f.jpg', 115627, '18658831890', '神农1890', 1,
        '2022-09-14 16:22:35', 0, NULL, NULL, NULL, 0, NULL, '2022-09-14 16:22:35', NULL);

-- ----------------------------
-- Table structure for sys_apk_address
-- ----------------------------
DROP TABLE IF EXISTS `sys_apk_address`;
CREATE TABLE `sys_apk_address`
(
    `id`           bigint(20)                                                    NOT NULL,
    `app_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'app名称',
    `app_type`     tinyint(4)                                                    NULL DEFAULT NULL COMMENT '1:企业web端',
    `download_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载地址',
    `create_time`  datetime                                                      NULL DEFAULT NULL,
    `create_by`    bigint(20)                                                    NULL DEFAULT NULL,
    `update_time`  datetime                                                      NULL DEFAULT NULL,
    `update_by`    bigint(20)                                                    NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'apk下载地址配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_apk_address
-- ----------------------------
INSERT INTO `sys_apk_address`
VALUES (21, '企业端APP', 1, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/404bd99e89a4be99af5897bf9738a978.apk', '2022-06-09 15:14:41', 104,
        '2022-08-24 17:50:42', 104);

-- ----------------------------
-- Table structure for sys_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_conf`;
CREATE TABLE `sys_conf`
(
    `id`               bigint(20)                                                   NOT NULL AUTO_INCREMENT,
    `conf_name`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置名称',
    `conf_type`        int(11)                                                      NULL DEFAULT NULL COMMENT '类型1：溯源码',
    `effective_second` int(11)                                                      NULL DEFAULT NULL COMMENT '有效时间(秒钟)',
    `create_time`      datetime                                                     NULL DEFAULT NULL,
    `update_time`      datetime                                                     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_conf
-- ----------------------------
INSERT INTO `sys_conf`
VALUES (1, '溯源信息过期时间', 1, -1, '2019-07-05 16:27:13', '2021-01-04 09:53:04');

-- ----------------------------
-- Table structure for sys_crop_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sys_crop_feedback`;
CREATE TABLE `sys_crop_feedback`
(
    `id`                bigint(20)                                                    NOT NULL,
    `company_id`        bigint(20)                                                    NULL DEFAULT NULL COMMENT '提交申请的企业id',
    `company_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '提交申请的企业名称',
    `farm_id`           bigint(20)                                                    NULL DEFAULT NULL COMMENT '提交申请的农场id',
    `farm_name`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '提交申请的农场名称',
    `feedback_user_id`  bigint(20)                                                    NULL DEFAULT NULL,
    `feedback_phone`    varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '提交人手机号',
    `user_company_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '提交人名称',
    `crop_name`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL,
    `status_flag`       tinyint(4)                                                    NULL DEFAULT 1 COMMENT '1：待审核，2通过，3不通过，4忽略',
    `submit_time`       datetime                                                      NULL DEFAULT NULL COMMENT '提交时间',
    `check_user_id`     bigint(20)                                                    NULL DEFAULT NULL COMMENT '审核人id',
    `check_nickname`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '审核人名称',
    `check_time`        datetime                                                      NULL DEFAULT NULL COMMENT '审核时间',
    `check_fail_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注：审核不通过原因',
    `msg_send_status`   tinyint(2)                                                    NULL DEFAULT 0 COMMENT '短信发送状态0：失败，1：成功',
    `msg_send_remark`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '短信发送描述',
    `create_time`       datetime                                                      NULL DEFAULT NULL,
    `update_time`       datetime                                                      NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户农作物反馈表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_crop_feedback
-- ----------------------------
INSERT INTO `sys_crop_feedback`
VALUES (57, 1488, '胖小喵喵的企业', 2662, '农场1', NULL, '13063458882', '超级管理员', '哈哈ヾﾉ≧∀≦)o', 2, '2019-05-05 17:42:29', 1, '超管', '2020-10-20 11:51:33', NULL, 1,
        '成功', '2019-05-05 17:42:29', '2020-10-20 11:51:33');
INSERT INTO `sys_crop_feedback`
VALUES (58, 1488, '胖小喵喵的企业', 2662, '农场1', NULL, '13063458882', '超级管理员', '五月五号测试', 2, '2019-05-05 17:43:37', 1, '超管', '2021-07-23 17:13:14', NULL, 1, '成功',
        '2019-05-05 17:43:37', '2021-07-23 17:13:14');
INSERT INTO `sys_crop_feedback`
VALUES (59, 1488, '胖小喵喵的企业', 2662, '农场1', NULL, '13063458882', '超级管理员', '五月五号测试2', 4, '2019-05-05 17:43:59', 1, '超管', '2021-07-23 17:13:10', NULL, 1, '成功',
        '2019-05-05 17:43:59', '2021-07-23 17:13:10');
INSERT INTO `sys_crop_feedback`
VALUES (60, 817, '合肥诺伊农业科技有限公司', 1568, '合肥诺伊有机蔬果', NULL, '18855174855', '钱浩伟', '黄大仙', 4, '2019-05-05 22:06:33', 1, '超管', '2019-05-07 16:04:12', NULL, 0,
        '参数错误', '2019-05-05 22:06:33', '2019-05-07 16:04:12');
INSERT INTO `sys_crop_feedback`
VALUES (61, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '13182341525', '超级管理员', '一二三四五上山下海经', 4, '2019-05-07 11:25:46', 2, '管理员',
        '2019-05-07 15:53:09', NULL, 0, '参数错误', '2019-05-07 11:25:46', '2019-05-07 15:53:09');
INSERT INTO `sys_crop_feedback`
VALUES (62, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '13182341525', '超级管理员', '大黄瓜🥒', 3, '2019-05-07 11:32:13', 2, '管理员',
        '2019-05-07 14:50:24', '作物已存在', 1, '成功', '2019-05-07 11:32:13', '2019-05-07 14:50:24');
INSERT INTO `sys_crop_feedback`
VALUES (63, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '13182341525', '超级管理员', '黄瓜', 3, '2019-05-07 11:33:04', 2, '管理员', '2019-05-08 10:02:35',
        '系统中已存在黄瓜黄瓜作物种类，可通过搜索作物种类快速查找到。', 0, '短信发送失败', '2019-05-07 11:33:04', '2019-05-08 10:02:35');
INSERT INTO `sys_crop_feedback`
VALUES (64, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '13182341525', '超级管理员', '圣女果', 3, '2019-05-07 11:51:15', 2, '管理员',
        '2019-05-07 14:52:49', '作物已存在', 1, '成功', '2019-05-07 11:51:15', '2019-05-07 14:52:49');
INSERT INTO `sys_crop_feedback`
VALUES (65, 1488, '胖小喵喵的企业', 2662, '农场1', NULL, '15256982729', '超级管理员', '测试作物', 3, '2019-05-07 15:42:46', 4, '刘鹏', '2019-05-08 10:20:24',
        '测试二二二测试二二二测试二二二11AAb,', 0, '短信发送失败', '2019-05-07 15:42:46', '2019-05-08 10:20:24');
INSERT INTO `sys_crop_feedback`
VALUES (66, 1488, '胖小喵喵的企业', 2662, '农场1', NULL, '15256982729', '超级管理员', '又来测试作物啦', 3, '2019-05-07 15:43:44', 2, '管理员', '2019-05-07 16:23:47',
        '一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五', 1, '成功', '2019-05-07 15:43:44', '2019-05-07 16:23:47');
INSERT INTO `sys_crop_feedback`
VALUES (67, 1166, '安徽左岸芯慧（史）', 2712, '嘀咕嘀咕', NULL, '15556463668', '习近平1', '测试删除农场', 4, '2019-05-07 16:34:04', 2, '管理员', '2019-05-07 16:35:02', NULL, 0,
        '参数错误', '2019-05-07 16:34:04', '2019-05-07 16:35:02');
INSERT INTO `sys_crop_feedback`
VALUES (68, 1488, '胖小喵喵的企业', 2662, '农场1', NULL, '15256982729', '超级管理员', '胖喵测试', 3, '2019-05-07 17:57:35', 1, '超管', '2021-07-23 17:13:21', '4有5人', 1, '成功',
        '2019-05-07 17:57:35', '2021-07-23 17:13:21');
INSERT INTO `sys_crop_feedback`
VALUES (69, 1542, '江西2', 2742, '1243433', NULL, '19999999999', '超级管理员', '啦啦啦', 2, '2019-05-07 18:18:49', 2, '管理员', '2019-06-03 15:12:36', NULL, 1, '成功',
        '2019-05-07 18:18:49', '2019-06-03 15:12:36');
INSERT INTO `sys_crop_feedback`
VALUES (70, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '13182341525', '超级管理员', '结球大白菜（直筒型', 3, '2019-05-07 22:28:21', 2, '管理员',
        '2019-05-08 10:34:25', '不高兴不高兴不高兴不高兴不高兴不高兴12', 1, '成功', '2019-05-07 22:28:21', '2019-05-08 10:34:25');
INSERT INTO `sys_crop_feedback`
VALUES (71, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '13182341525', '超级管理员', '朝天椒（紫色）', 2, '2019-05-07 22:35:09', 2, '管理员',
        '2019-05-08 09:58:58', NULL, 1, '成功', '2019-05-07 22:35:09', '2019-05-08 09:58:58');
INSERT INTO `sys_crop_feedback`
VALUES (72, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '13182341525', '超级管理员', '01234567890123456789', 3, '2019-05-08 09:57:30', 2, '管理员',
        '2019-05-08 09:57:57', '一二三四五一二三四五一二三四五一二三四五一二三四五一二三四五', 0, '短信发送失败', '2019-05-08 09:57:30', '2019-05-08 09:57:57');
INSERT INTO `sys_crop_feedback`
VALUES (73, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '13182341525', '超级管理员', '测试新增作物种类繁多', 3, '2019-05-08 10:33:47', 2, '管理员',
        '2019-05-08 10:34:15', '不高兴不高兴不高兴不高兴不高兴不高兴123', 0, '短信发送失败', '2019-05-08 10:33:47', '2019-05-08 10:34:15');
INSERT INTO `sys_crop_feedback`
VALUES (74, 745, '1', 1351, '1', NULL, '13735479486', '超级管理员', '测试删除员工', 2, '2019-05-08 10:38:04', 2, '管理员', '2019-05-08 10:41:49', NULL, 1, '成功',
        '2019-05-08 10:38:04', '2019-05-08 10:41:49');
INSERT INTO `sys_crop_feedback`
VALUES (75, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧', NULL, '13182341525', '超级管理员', '测试忽略', 4, '2019-05-08 10:46:18', 2, '管理员', '2019-05-08 10:46:31', NULL, 0,
        '参数错误', '2019-05-08 10:46:18', '2019-05-08 10:46:31');
INSERT INTO `sys_crop_feedback`
VALUES (76, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧', NULL, '13182341525', '超级管理员', '1234567890123456789', 1, '2019-05-08 10:48:19', NULL, NULL, NULL, NULL, 0,
        NULL, '2019-05-08 10:48:19', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (77, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧', NULL, '13182341525', '超级管理员', '98765432109876543210', 3, '2019-05-08 10:59:00', 2, '管理员',
        '2019-05-08 10:59:13', '一二三四五一二三四五一二三四五一二三四五', 1, '成功', '2019-05-08 10:59:00', '2019-05-08 10:59:13');
INSERT INTO `sys_crop_feedback`
VALUES (78, 1510, 'APP创建企业', 2701, 'APP创建农场', NULL, '13182341525', '超级管理员', '测试删除企业', 3, '2019-05-08 11:02:12', 2, '管理员', '2019-05-08 11:02:37', '不高兴', 1,
        '成功', '2019-05-08 11:02:12', '2019-05-08 11:02:37');
INSERT INTO `sys_crop_feedback`
VALUES (79, 817, '合肥诺伊农业科技有限公司', 1568, '合肥诺伊有机蔬果', NULL, '13182341525', '史火霞', '01234567890123456789', 3, '2019-05-08 11:08:53', 2, '管理员',
        '2019-05-24 15:12:39', '44', 1, '成功', '2019-05-08 11:08:53', '2019-05-24 15:12:39');
INSERT INTO `sys_crop_feedback`
VALUES (80, 745, '1', 1439, '22', NULL, '13735479486', '超级管理员', '测试修改手机号', 3, '2019-05-08 11:16:29', 2, '管理员', '2019-05-08 11:19:22', '修改手机号', 1, '成功',
        '2019-05-08 11:16:29', '2019-05-08 11:19:22');
INSERT INTO `sys_crop_feedback`
VALUES (81, 1488, '胖小喵喵的企业', 2663, '有好多好多任务呀有好多好多任务呀有好多好', NULL, '15256982729', '超级管理员', '西红柿', 1, '2019-05-09 13:55:46', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-05-09 13:55:46', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (82, 1488, '胖小喵喵的企业', 2663, '有好多好多任务呀有好多好多任务呀有好多好', NULL, '15256982729', '超级管理员', '2019-5-9测试作物', 4, '2019-05-09 14:55:24', 2, '管理员',
        '2019-05-24 15:10:38', NULL, 0, '参数错误', '2019-05-09 14:55:24', '2019-05-24 15:10:38');
INSERT INTO `sys_crop_feedback`
VALUES (83, 817, '合肥诺伊农业科技有限公司', 1568, '合肥诺伊有机蔬果', NULL, '18855174855', '钱浩伟', '不知火', 2, '2019-05-09 17:47:36', 2, '管理员', '2019-05-24 15:13:49', NULL, 1,
        '成功', '2019-05-09 17:47:36', '2019-05-24 15:13:49');
INSERT INTO `sys_crop_feedback`
VALUES (84, 1166, '安徽左岸芯慧（史）', 2744, '2', NULL, '13182341525', '超级管理员', '（大黄瓜）', 3, '2019-05-10 10:47:14', 2, '管理员', '2019-06-03 15:13:07', '11', 1, '成功',
        '2019-05-10 10:47:14', '2019-06-03 15:13:07');
INSERT INTO `sys_crop_feedback`
VALUES (85, 1166, '安徽左岸芯慧（史）', 2744, '2', NULL, '13182341525', '超级管理员', '（大黄瓜）', 1, '2019-05-10 10:50:46', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-05-10 10:50:46', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (86, 1166, '安徽左岸芯慧（史）', 2744, '2', NULL, '13182341525', '超级管理员', '大', 3, '2019-05-10 10:51:29', 1, '超管', '2019-05-24 18:11:42', '1321', 1, '成功',
        '2019-05-10 10:51:29', '2019-05-24 18:11:42');
INSERT INTO `sys_crop_feedback`
VALUES (87, 1488, '胖小喵喵的企业', 2662, '农场1', NULL, '15256982729', '超级管理员', '哈哈', 3, '2019-05-10 11:55:55', 1, '超管', '2019-05-24 18:11:28', '131', 1, '成功',
        '2019-05-10 11:55:55', '2019-05-24 18:11:28');
INSERT INTO `sys_crop_feedback`
VALUES (88, 1166, '安徽左岸芯慧（史）', 2696, 'web创建1111', NULL, '13182341525', '超级管理员', '大黄瓜（新）', 1, '2019-05-13 10:13:33', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-05-13 10:13:33', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (89, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '15556463668', '习近平1', '45646', 1, '2019-05-13 11:36:51', NULL, NULL, NULL, NULL, 0,
        NULL, '2019-05-13 11:36:51', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (90, 1247, '熊猫溯源', 2777, '熊猫溯源', NULL, '13182341525', '超级管理员', '1', 3, '2019-05-13 11:44:36', 2, '管理员', '2019-06-03 15:12:28', '不高兴', 1, '成功',
        '2019-05-13 11:44:36', '2019-06-03 15:12:28');
INSERT INTO `sys_crop_feedback`
VALUES (91, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '15556463668', '习近平1', '1', 1, '2019-05-13 12:37:54', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-05-13 12:37:54', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (92, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '15556463668', '习近平1', '2', 4, '2019-05-13 12:38:11', 2, '管理员', '2019-06-03 15:12:57',
        NULL, 0, '参数错误', '2019-05-13 12:38:11', '2019-06-03 15:12:57');
INSERT INTO `sys_crop_feedback`
VALUES (93, 1166, '安徽左岸芯慧（史）', 2063, '左岸芯慧左岸芯慧左岸芯慧左岸芯慧左岸芯慧', NULL, '15556463668', '习近平1', '3', 3, '2019-05-13 12:38:45', 2, '管理员', '2019-06-03 15:12:46',
        '不高兴', 1, '成功', '2019-05-13 12:38:45', '2019-06-03 15:12:46');
INSERT INTO `sys_crop_feedback`
VALUES (94, 817, '合肥诺伊农业科技有限公司', 1568, '合肥诺伊有机蔬果', NULL, '18855174855', '钱浩伟', '魔鬼椒', 4, '2019-05-13 19:41:54', 2, '管理员', '2019-06-03 17:02:47', NULL, 0,
        '参数错误', '2019-05-13 19:41:54', '2019-06-03 17:02:47');
INSERT INTO `sys_crop_feedback`
VALUES (95, 1488, '胖小喵喵的企业', 2663, '有好多好多任务呀有好多好多任务呀有好多好', NULL, '15256982729', '超级管理员', '胖喵测试', 4, '2019-05-14 15:46:56', 2, '管理员', '2019-06-03 15:12:09',
        NULL, 0, '参数错误', '2019-05-14 15:46:56', '2019-06-03 15:12:09');
INSERT INTO `sys_crop_feedback`
VALUES (96, 1488, '胖小喵喵的企业', 2663, '有好多好多任务呀有好多好多任务呀有好多好', NULL, '15256982729', '超级管理员', '西红柿', 3, '2019-05-14 15:47:25', 4, '刘鹏', '2019-05-14 15:48:21',
        '重复了', 1, '成功', '2019-05-14 15:47:25', '2019-05-14 15:48:21');
INSERT INTO `sys_crop_feedback`
VALUES (97, 1488, '胖小喵喵的企业', 2663, '有好多好多任务呀有好多好多任务呀有好多好', NULL, '15256982729', '超级管理员', '西红柿', 4, '2019-05-14 15:48:58', 2, '管理员', '2019-05-30 16:47:09',
        NULL, 0, '参数错误', '2019-05-14 15:48:58', '2019-05-30 16:47:09');
INSERT INTO `sys_crop_feedback`
VALUES (98, 1584, '江天农业啦啦', 2866, '鹅湖香米', NULL, '19999999999', '超级管理员', '测试新增', 4, '2019-05-30 16:46:41', 2, '管理员', '2019-05-30 16:47:06', NULL, 0, '参数错误',
        '2019-05-30 16:46:41', '2019-05-30 16:47:06');
INSERT INTO `sys_crop_feedback`
VALUES (99, 1166, '安徽左岸芯慧（史）安徽左岸芯慧（史）安徽左岸', 2063, '（勿删）左岸芯慧', NULL, '13063458882', '王存兰', '非官方新增', 1, '2019-06-27 10:36:33', 4, '刘鹏',
        '2019-06-27 11:36:21', NULL, 0, '短信发送失败', '2019-06-27 10:36:33', '2019-06-27 11:36:21');
INSERT INTO `sys_crop_feedback`
VALUES (100, 1377, '测试演示数据', 2437, '11111111', NULL, '13063458882', '超级管理员', 'lp测试', 3, '2019-06-27 11:37:39', 4, '刘鹏', '2019-06-27 11:50:28', '2222', 1,
        '成功', '2019-06-27 11:37:39', '2019-06-27 11:50:28');
INSERT INTO `sys_crop_feedback`
VALUES (101, 1377, '测试演示数据', 2437, '11111111', NULL, '13063458882', '超级管理员', '11111111111', 3, '2019-06-27 11:44:48', 4, '刘鹏', '2019-06-27 11:47:51',
        '1232131', 1, '成功', '2019-06-27 11:44:48', '2019-06-27 11:47:51');
INSERT INTO `sys_crop_feedback`
VALUES (102, 1377, '测试演示数据', 2437, '11111111', NULL, '13063458882', '超级管理员', '12321321312', 1, '2019-06-27 11:51:20', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-06-27 11:51:20', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (103, 1377, '测试演示数据', 2437, '11111111', NULL, '13063458882', '超级管理员', '321321312', 1, '2019-06-27 11:54:55', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-06-27 11:54:55', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (104, 1377, '测试演示数据', 2437, '11111111', NULL, '13063458882', '超级管理员', '321321312', 1, '2019-06-27 11:55:35', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-06-27 11:55:35', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (105, 1377, '测试演示数据', 2437, '11111111', NULL, '13063458882', '超级管理员', '131321', 1, '2019-06-27 12:06:53', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-06-27 12:06:53', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (106, 1377, '测试演示数据', 2437, '11111111', NULL, '13063458882', '超级管理员', '1456312', 2, '2019-06-27 12:07:32', 4, '刘鹏', '2019-06-27 12:13:44', NULL, 1,
        '成功', '2019-06-27 12:07:32', '2019-06-27 12:13:44');
INSERT INTO `sys_crop_feedback`
VALUES (107, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', '官方提交', 2, '2019-06-27 13:54:29', 2, '管理员', '2019-06-27 13:54:47', NULL, 1,
        '成功', '2019-06-27 13:54:29', '2019-06-27 13:54:47');
INSERT INTO `sys_crop_feedback`
VALUES (108, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', '官方不通过', 3, '2019-06-27 13:56:22', 2, '管理员', '2019-06-27 13:56:30', 'add', 1,
        '成功', '2019-06-27 13:56:22', '2019-06-27 13:56:30');
INSERT INTO `sys_crop_feedback`
VALUES (109, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', '非官方', 2, '2019-06-27 13:58:08', 2, '管理员', '2019-06-27 13:59:03', NULL, 1,
        '成功', '2019-06-27 13:58:08', '2019-06-27 13:59:03');
INSERT INTO `sys_crop_feedback`
VALUES (110, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', '非官方不通过', 3, '2019-06-27 13:59:26', 2, '管理员', '2019-06-27 13:59:33', '111',
        1, '成功', '2019-06-27 13:59:26', '2019-06-27 13:59:33');
INSERT INTO `sys_crop_feedback`
VALUES (111, 1166, '安徽左岸芯慧（史）安徽左岸芯慧（史）安徽左岸', 2063, '（勿删）左岸芯慧', NULL, '13182341525', '王存兰', 'AQ新增', 1, '2019-06-27 14:04:46', NULL, NULL, NULL, NULL, 0,
        NULL, '2019-06-27 14:04:46', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (112, 817, '合肥诺伊农业科技有限公司', 2223, '好农场', NULL, '13182341525', '史火霞', '啦啦啦', 2, '2019-06-27 17:06:56', 2, '管理员', '2019-06-27 17:09:40', NULL, 1, '成功',
        '2019-06-27 17:06:56', '2019-06-27 17:09:40');
INSERT INTO `sys_crop_feedback`
VALUES (113, 1639, '（勿删）有遥感地块', 2937, '（勿删）有遥感地块', NULL, '13182341525', '超级管理员', '非官方', 3, '2019-06-27 17:13:58', 2, '管理员', '2019-06-27 17:14:13', '66', 1,
        '成功', '2019-06-27 17:13:58', '2019-06-27 17:14:13');
INSERT INTO `sys_crop_feedback`
VALUES (114, 1601, '艾米', 2897, '艾米', NULL, '13182341525', '超级管理员', '官方', 2, '2019-06-27 17:15:15', 2, '管理员', '2019-06-27 17:15:25', NULL, 1, '成功',
        '2019-06-27 17:15:15', '2019-06-27 17:15:25');
INSERT INTO `sys_crop_feedback`
VALUES (115, 1690, '艾米APP创建', 2994, '艾米APP创建', NULL, '13182341525', '1318234152', '测试短信', 3, '2019-07-02 13:37:04', 2, '管理员', '2019-07-02 13:37:19', '55',
        1, '成功', '2019-07-02 13:37:04', '2019-07-02 13:37:19');
INSERT INTO `sys_crop_feedback`
VALUES (116, 1690, '艾米APP创建', 2994, '艾米APP创建', NULL, '13182341525', '1318234152', '测试通过', 2, '2019-07-02 13:38:18', 2, '管理员', '2019-07-02 13:38:27', NULL,
        1, '成功', '2019-07-02 13:38:18', '2019-07-02 13:38:27');
INSERT INTO `sys_crop_feedback`
VALUES (117, 1690, '艾米APP创建', 2994, '艾米APP创建', NULL, '13182341525', '1318234152', '测试', 3, '2019-07-02 13:39:44', 2, '管理员', '2019-07-02 13:39:53', '55', 1,
        '成功', '2019-07-02 13:39:44', '2019-07-02 13:39:53');
INSERT INTO `sys_crop_feedback`
VALUES (118, 1690, '艾米APP创建', 2994, '艾米APP创建', NULL, '13182341525', '1318234152', '官方', 2, '2019-07-02 13:40:39', 2, '管理员', '2019-07-02 13:40:57', NULL, 1,
        '成功', '2019-07-02 13:40:39', '2019-07-02 13:40:57');
INSERT INTO `sys_crop_feedback`
VALUES (119, 1582, '安徽左岸', 2861, '鹅湖香米种植基地', NULL, '13182341525', '超级管理员', '喔喔', 3, '2019-07-02 14:39:11', 2, '管理员', '2019-07-02 14:39:21', '55', 1, '成功',
        '2019-07-02 14:39:11', '2019-07-02 14:39:21');
INSERT INTO `sys_crop_feedback`
VALUES (122, 1166, '安徽左岸芯慧（史）安徽左岸芯慧（史）安徽左岸', 2063, '（勿删）左岸芯慧55', NULL, '13182341525', '王存兰', '命名', 1, '2019-08-01 16:15:23', NULL, NULL, NULL, NULL, 0,
        NULL, '2019-08-01 16:15:23', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (123, 1166, '安徽左岸芯慧（史）安徽左岸芯慧（史）安徽左岸', 2063, '（勿删）左岸芯慧（勿删）左岸芯慧（勿删）左岸芯', NULL, '13182341525', '王存兰', '苹果种苗', 1, '2019-08-23 22:25:23', NULL, NULL,
        NULL, NULL, 0, NULL, '2019-08-23 22:25:23', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (133, 1935, '江天哈哈哈', 3334, '鹅湖', NULL, '19999999999', '超级管理员', '青苹果', 1, '2019-09-19 09:46:58', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-09-19 09:46:58', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (134, 1969, '测试新版物联网', 3406, '测试新版物联网多比', NULL, '18855174855', '浩伟', '钱浩伟的测试', 1, '2019-11-24 20:38:04', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-11-24 20:38:04', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (135, 1982, '测试地块轮廓绘制', 3435, '测试地块轮廓绘制', NULL, '13182341525', '超级管理员', '新增', 1, '2019-12-02 11:39:02', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-02 11:39:02', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (136, 1166, '安徽左岸芯慧（史）安徽左岸芯慧（史）安徽左岸', 2063, '（勿删）左岸芯慧（勿删）左岸芯慧（勿删）左岸芯', NULL, '13182341525', '王存兰', '花牛', 1, '2019-12-05 17:04:21', NULL, NULL, NULL,
        NULL, 0, NULL, '2019-12-05 17:04:21', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (137, 1166, '安徽左岸芯慧（史）安徽左岸芯慧（史）安徽左岸', 2063, '（勿删）左岸芯慧（勿删）左岸芯慧（勿删）左岸芯', NULL, '13182341525', '王存兰', '哈哈', 1, '2019-12-06 11:05:40', NULL, NULL, NULL,
        NULL, 0, NULL, '2019-12-06 11:05:40', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (138, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '23', 1, '2019-12-24 11:43:57', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-24 11:43:57', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (139, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '测试种类', 1, '2019-12-24 11:44:54', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-24 11:44:54', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (140, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '测试', 1, '2019-12-24 11:46:02', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-24 11:46:02', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (141, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '又要测试啦', 1, '2019-12-24 11:49:24', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-24 11:49:24', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (142, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '又来测试了', 1, '2019-12-24 11:50:12', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-24 11:50:12', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (143, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', 'skjhfjds', 1, '2019-12-30 15:30:50', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-30 15:30:50', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (144, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', 'www', 1, '2019-12-30 15:31:35', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-30 15:31:35', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (145, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', 'sss', 1, '2019-12-30 15:32:07', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-30 15:32:07', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (146, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '小辣椒', 1, '2019-12-30 15:47:30', NULL, NULL, NULL, NULL, 0, NULL,
        '2019-12-30 15:47:30', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (147, 2350, 'test2.0', 3478, 'test2.0', NULL, '13182341525', '超级管理员', '测试新增', 1, '2020-01-06 10:47:22', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-06 10:47:22', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (148, 2350, 'test2.0', 3478, 'test2.0', NULL, '13182341525', '超级管理员', '啦啦啦啦', 1, '2020-01-06 10:47:49', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-06 10:47:49', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (149, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '测试作物提交', 1, '2020-01-06 14:23:57', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-06 14:23:57', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (150, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '测试', 1, '2020-01-06 14:25:33', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-06 14:25:33', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (151, 2350, 'test2.0', 3478, 'test2.0', NULL, '13182341525', '超级管理员', '大黄瓜1', 1, '2020-01-06 14:26:43', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-06 14:26:43', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (152, 1953, '胖喵の美食公司', 3359, '胖喵的秘密花园', NULL, '15256982729', '超级管理员', '大黄瓜瓜', 1, '2020-01-06 14:29:01', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-06 14:29:01', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (153, 2350, 'test2.0', 3478, 'test2.0', NULL, '13182341525', '超级管理员', '测试新在', 1, '2020-01-06 16:40:08', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-06 16:40:08', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (154, 1956, '啦啦的屋屋', 3373, '新版物联网 传感 视频 控制哈哈哈哈哈哈可', NULL, '18055373268', '超级管理员', '我来测试', 1, '2020-01-07 11:54:05', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-07 11:54:05', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (155, 2350, 'test2.09999很看好可', 3487, '5555', NULL, '13182341525', '超级管理员', '测试all绿绿绿', 1, '2020-01-07 18:57:37', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-07 18:57:37', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (156, 2350, 'test2.09999很看好可', 3478, 'test2.0', NULL, '13182341525', '超级管理员', '测试新增', 1, '2020-01-07 20:07:06', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-07 20:07:06', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (157, 2350, 'test2.09999很看好可', 3478, 'test2.0', NULL, '13182341525', '超级管理员', '测试新增啦啦啦', 1, '2020-01-07 20:07:40', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-07 20:07:40', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (158, 2350, 'test2.09999很看好可', 3478, 'test2.0', NULL, '13182341525', '超级管理员', '1111', 2, '2020-01-07 20:08:01', 1, '超管', '2021-07-28 11:15:33',
        NULL, 1, '成功', '2020-01-07 20:08:01', '2021-07-28 11:15:33');
INSERT INTO `sys_crop_feedback`
VALUES (159, 2350, 'test2.09999很看好可', 3478, 'test2.0', NULL, '13182341525', '超级管理员', '大', 1, '2020-01-07 20:10:18', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-07 20:10:18', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (160, 2363, '蔬百味', 3497, '蔬百味', NULL, '18911112222', '超级管理员', '食用花', 1, '2020-01-08 20:53:10', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-08 20:53:10', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (161, 1166, '安徽左岸芯慧（史）安徽左岸芯慧（史）安徽左岸', 2063, '（勿删）左岸芯慧（勿删）左岸芯慧（勿删）左岸芯', NULL, '13182341525', '王存兰', '大象', 1, '2020-01-09 16:14:15', NULL, NULL, NULL,
        NULL, 0, NULL, '2020-01-09 16:14:15', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (162, 2368, '测试2.0APP', 3504, '测试2.0APP', NULL, '13182345125', '超级管理员', '大黄酚', 1, '2020-01-09 17:55:38', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-09 17:55:38', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (163, 2368, '测试2.0APP', 3504, '测试2.0APP', NULL, '13182345125', '超级管理员', '大黄KKK', 1, '2020-01-09 17:56:07', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-09 17:56:07', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (164, 2368, '测试2.0APP', 3504, '测试2.0APP', NULL, '13182345125', '超级管理员', '法官', 1, '2020-01-09 17:56:10', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-09 17:56:10', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (165, 2368, '测试2.0APP', 3504, '测试2.0APP', NULL, '13182345125', '超级管理员', '大', 1, '2020-01-10 11:40:48', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-10 11:40:48', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (166, 2350, 'test2.09999很看好可', 3478, 'test2.0', NULL, '11111111111', '管理员', '哒哒哒哒', 1, '2020-01-11 19:46:56', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-11 19:46:56', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (167, 2408, '测试主流成', 3572, '测试主流程', NULL, '19393656236', '超级管理员', '樱花🌸', 1, '2020-01-14 15:24:18', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-01-14 15:24:18', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (168, 2476, '啦啦啦啦我们可以', 3676, '好哒啦', NULL, '13182341525', '超级管理员啦啦啦', '测试新增', 1, '2020-03-11 15:43:56', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-03-11 15:43:56', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (169, 1166, '安徽左岸芯慧（史）安徽左岸芯慧（史）安徽左岸', 2063, '（勿删）左岸芯慧（勿删）左岸芯慧（勿删）左岸芯', NULL, '13182341525', '王存兰', '哇哈哈', 1, '2020-03-11 17:21:29', NULL, NULL,
        NULL, NULL, 0, NULL, '2020-03-11 17:21:29', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (170, 2476, '啦啦啦啦我们可以明后', 3676, '好哒啦', NULL, '13182341525', '超级管理员啦啦啦', '测试', 1, '2020-03-19 13:42:44', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-03-19 13:42:44', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (171, 1790, '合肥诺伊农业科技有限公司', 3111, '合肥诺伊农业科技有限公司', NULL, '13182341525', '超级管理员', '测试新增', 1, '2020-04-08 15:55:34', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-04-08 15:55:34', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (172, 732, '洛伊公司', 1330, '逻辑农庄', NULL, '18355113144', '超级管理员', 'HAHA', 2, '2020-04-23 19:59:21', 1, '超管', '2020-04-23 20:00:52', NULL, 1, '成功',
        '2020-04-23 19:59:21', '2020-04-23 20:00:52');
INSERT INTO `sys_crop_feedback`
VALUES (173, 2561, '测试海尔私有化部署', 3804, '测试海尔私有化部署', NULL, '13182341525', '神农1525', '测试新增', 2, '2020-04-23 20:13:12', 1, '超管', '2020-04-23 20:13:48', NULL,
        1, '成功', '2020-04-23 20:13:12', '2020-04-23 20:13:48');
INSERT INTO `sys_crop_feedback`
VALUES (174, 2561, '测试海尔私有化部署', 3804, '测试海尔私有化部署', NULL, '13182341525', '神农1525', '不通过', 3, '2020-04-23 20:14:17', 1, '超管', '2020-04-23 20:14:32', '不高兴',
        1, '成功', '2020-04-23 20:14:17', '2020-04-23 20:14:32');
INSERT INTO `sys_crop_feedback`
VALUES (175, 2561, '测试海尔私有化部署', 3804, '测试海尔私有化部署', NULL, '13182341525', '神农1525', '777', 2, '2020-04-23 20:41:57', 1, '超管', '2020-04-23 20:42:07', NULL, 1,
        '成功', '2020-04-23 20:41:57', '2020-04-23 20:42:07');
INSERT INTO `sys_crop_feedback`
VALUES (176, 2563, '测试新增', 3808, '测试新增', NULL, '13735479486', '神农9486', '测试新增', 2, '2020-04-24 10:30:28', 1, '超管', '2020-04-24 10:30:38', NULL, 1, '成功',
        '2020-04-24 10:30:28', '2020-04-24 10:30:38');
INSERT INTO `sys_crop_feedback`
VALUES (177, 817, '合肥诺伊农业科技有限公司', 1568, '合肥诺伊有机蔬果', NULL, '13182341525', '史火霞', '测试不通过', 3, '2020-04-24 10:31:30', 1, '超管', '2020-04-24 10:31:45', '啦啦啦啦',
        1, '成功', '2020-04-24 10:31:30', '2020-04-24 10:31:45');
INSERT INTO `sys_crop_feedback`
VALUES (178, 817, '合肥诺伊农业科技有限公司', 1568, '合肥诺伊有机蔬果', NULL, '13182341525', '史火霞', '666', 2, '2020-04-24 10:32:10', 1, '超管', '2020-04-24 10:32:31', NULL, 1,
        '成功', '2020-04-24 10:32:10', '2020-04-24 10:32:31');
INSERT INTO `sys_crop_feedback`
VALUES (179, 2585, '测试主流程啦啦啦', 3842, '测试主流程', NULL, '13182341525', '多比咯哦哦', '测试新鲜', 1, '2020-05-19 11:33:05', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-05-19 11:33:05', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (180, 2573, '江西绿海油脂有限公司', 3824, '迭代15优先级1', NULL, '13182341525', '神农', '好测试', 1, '2020-05-25 13:59:45', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-05-25 13:59:45', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (181, 2601, '测试快速创建溯源', 3865, '快速溯源', NULL, '13182341525', '神农1525', '测试新增', 1, '2020-06-01 14:20:33', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-06-01 14:20:33', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (182, 2594, '测试地块名称', 3857, '测试地块名称', NULL, '13182341525', '神农1525', '测试大黄瓜', 1, '2020-06-01 16:39:10', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-06-01 16:39:10', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (183, 2639, '迭代15', 3917, '迭代15PK路兔兔土建冷库', NULL, '15656568585', '神农8585', '测试具体', 1, '2020-06-15 12:02:31', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-06-15 12:02:31', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (184, 2708, '无农场', 4016, '5', NULL, '13182341525', '神农1525', '测试新增', 1, '2020-06-22 16:06:41', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-06-22 16:06:41', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (185, 2712, '测试加工环节', 4018, '测试加工环节', NULL, '13182341525', '神农1525', '啦啦啦', 1, '2020-06-28 10:45:57', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-06-28 10:45:57', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (186, 2344, '青春有你', 3485, '啦啦啦', NULL, '18715065755', '刘雨昕', '你弄', 2, '2020-07-02 11:02:13', 1, '超管', '2020-07-02 11:04:34', NULL, 1, '成功',
        '2020-07-02 11:02:13', '2020-07-02 11:04:34');
INSERT INTO `sys_crop_feedback`
VALUES (187, 2593, '正义园艺', 3855, '地块多农场', NULL, '18655178750', '李海峰', 'ceshi', 3, '2020-07-16 14:38:35', 1, '超管', '2020-07-16 14:49:45', '5', 1, '成功',
        '2020-07-16 14:38:35', '2020-07-16 14:49:45');
INSERT INTO `sys_crop_feedback`
VALUES (188, 2593, '正义园艺', 3855, '地块多农场', NULL, '18655178750', '李海峰', 'hahah', 1, '2020-07-16 16:31:16', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-07-16 16:31:16', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (189, 2823, '测试所有溯源码', 4141, '测试所有溯源码', NULL, '13182341525', '神农1525', '测试作物审核', 2, '2020-07-16 16:35:06', 1, '超管', '2020-07-16 16:35:26', NULL, 1,
        '成功', '2020-07-16 16:35:06', '2020-07-16 16:35:26');
INSERT INTO `sys_crop_feedback`
VALUES (190, 2823, '测试所有溯源码', 4141, '测试所有溯源码', NULL, '13182341525', '神农1525', '测试不通过', 3, '2020-07-16 16:36:06', 1, '超管', '2020-07-16 16:36:17', '不高兴', 1,
        '成功', '2020-07-16 16:36:06', '2020-07-16 16:36:17');
INSERT INTO `sys_crop_feedback`
VALUES (191, 2823, '测试所有溯源码', 4141, '测试所有溯源码', NULL, '13182341525', '神农1525', '测试通过', 2, '2020-07-16 16:36:46', 1, '超管', '2020-07-16 16:36:54', NULL, 1,
        '成功', '2020-07-16 16:36:46', '2020-07-16 16:36:54');
INSERT INTO `sys_crop_feedback`
VALUES (192, 1639, '（勿删）有遥感地块', 2937, '（勿删）有遥感地块', NULL, '13182341525', '超级管理员', '测试通过', 3, '2020-07-16 16:38:14', 1, '超管', '2020-07-16 16:39:53', 'ng', 1,
        '成功', '2020-07-16 16:38:14', '2020-07-16 16:39:53');
INSERT INTO `sys_crop_feedback`
VALUES (193, 1639, '（勿删）有遥感地块', 2937, '（勿删）有遥感地块', NULL, '13182341525', '超级管理员', '测试不通过', 3, '2020-07-16 16:38:55', 1, '超管', '2020-07-16 16:39:14',
        '不通过不通过', 1, '成功', '2020-07-16 16:38:55', '2020-07-16 16:39:14');
INSERT INTO `sys_crop_feedback`
VALUES (194, 2823, '测试所有溯源码', 4141, '测试所有溯源码', NULL, '13182341525', '神农1525', '测试测试审核通过', 2, '2020-07-16 16:40:59', 1, '超管', '2020-07-16 16:42:09', NULL,
        1, '成功', '2020-07-16 16:40:59', '2020-07-16 16:42:09');
INSERT INTO `sys_crop_feedback`
VALUES (195, 2823, '测试所有溯源码', 4141, '测试所有溯源码', NULL, '13182341525', '神农1525', '非官方新增', 2, '2020-07-16 16:42:41', 1, '超管', '2020-07-16 16:43:13', NULL, 1,
        '成功', '2020-07-16 16:42:41', '2020-07-16 16:43:13');
INSERT INTO `sys_crop_feedback`
VALUES (196, 1639, '（勿删）有遥感地块', 2937, '（勿删）有遥感地块', NULL, '13182341525', '超级管理员', '非官方新增', 3, '2020-07-16 16:42:55', 1, '超管', '2020-07-16 16:43:35',
        '非官方不通过', 1, '成功', '2020-07-16 16:42:55', '2020-07-16 16:43:35');
INSERT INTO `sys_crop_feedback`
VALUES (197, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', '玉雪新增', 2, '2020-07-16 16:45:34', 1, '超管', '2020-07-16 16:45:54', NULL, 1,
        '成功', '2020-07-16 16:45:34', '2020-07-16 16:45:54');
INSERT INTO `sys_crop_feedback`
VALUES (198, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', '玉雪新增不通过', 3, '2020-07-16 16:46:08', 1, '超管', '2020-07-16 16:46:22', '玉雪不通过',
        1, '成功', '2020-07-16 16:46:08', '2020-07-16 16:46:22');
INSERT INTO `sys_crop_feedback`
VALUES (199, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', 'lalll', 3, '2020-07-16 16:49:04', 1, '超管', '2020-07-16 16:50:50', '不通过', 1,
        '成功', '2020-07-16 16:49:04', '2020-07-16 16:50:50');
INSERT INTO `sys_crop_feedback`
VALUES (200, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', 'tongg', 2, '2020-07-16 16:51:20', 1, '超管', '2020-07-16 16:51:30', NULL, 1,
        '成功', '2020-07-16 16:51:20', '2020-07-16 16:51:30');
INSERT INTO `sys_crop_feedback`
VALUES (201, 1684, '测试新增企业777', 2984, '测试新增企业', NULL, '13735479486', '超级管理员', 'shoubudao', 1, '2020-07-16 16:52:56', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-07-16 16:52:56', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (210, 2927, '有企业无农场', 4344, '5', NULL, '11111111111', '张三', '测试新增作物', 1, '2020-07-28 18:15:19', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-07-28 18:15:19', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (211, 1166, '安徽左岸芯慧（史）', 2063, '（勿删）左岸芯慧', NULL, '13182341525', '习近平在', '西红柿', 1, '2020-08-29 17:18:01', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-08-29 17:18:01', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (212, 2344, '青春有你', 3462, '阿胶小鸡小鸡', NULL, '18715065755', '刘雨昕', 'hh', 1, '2020-09-10 10:05:27', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-09-10 10:05:27', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (213, 3639, '测试主流程', 5148, '测试主流程', NULL, '12555555555', '神农5555', '新增', 1, '2020-10-12 10:44:59', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-10-12 10:44:59', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (214, 3639, '测试主流程123', 5148, '测试主流程', NULL, '12555555555', '神农5555', '涂料', 1, '2020-10-12 12:56:08', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-10-12 12:56:08', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (215, 3646, '主流程1222', 5160, '主流程', NULL, '13182341525', '神农1525', '辣鸡', 1, '2020-10-12 19:54:19', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-10-12 19:54:19', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (216, 3675, '上海上海市金山区', 5194, '蔬菜种植基地', NULL, '15956949585', '神农9585', '杂交稻', 1, '2020-10-27 18:11:37', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-10-27 18:11:37', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (217, 3675, '上海上海市金山区', 5194, '蔬菜种植基地', NULL, '15956949585', '神农9585', '螃蟹', 1, '2020-10-28 09:41:57', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-10-28 09:41:57', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (218, 3677, '果园企业', 5198, '稻田种植基地', NULL, '15956949585', '神农9585', '稻子', 1, '2020-10-28 11:09:17', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-10-28 11:09:17', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (219, 3675, '上海上海市金山区', 5200, '养殖业', NULL, '15956949585', '神农9585', '羊驼', 2, '2020-10-30 10:24:54', 1, '超管', '2020-12-16 11:29:33', NULL, 1, '成功',
        '2020-10-30 10:24:54', '2020-12-16 11:29:33');
INSERT INTO `sys_crop_feedback`
VALUES (220, 3676, '上海上海市松江区', 5260, '龙虾', NULL, '15855162271', '神农2271', '龙虾', 1, '2020-11-16 11:22:52', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-11-16 11:22:52', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (430, 11626, '666', 12764, '666', NULL, '15855162271', '神农2271', '大龙虾', 2, '2020-11-25 10:40:57', 1, '超管', '2020-11-25 10:43:41', NULL, 1, '成功',
        '2020-11-25 10:40:57', '2020-11-25 10:43:41');
INSERT INTO `sys_crop_feedback`
VALUES (431, 11626, '666', 12764, '666', NULL, '15855162271', '神农2271', '大龙虾', 4, '2020-11-25 10:44:37', 1, '超管', '2020-11-25 10:46:32', NULL, 1, '成功',
        '2020-11-25 10:44:37', '2020-11-25 10:46:32');
INSERT INTO `sys_crop_feedback`
VALUES (432, 1394, '安徽农业有限公司', 2276, '滨湖玉米地', NULL, '15349867208', '超级管理员', '渔业', 1, '2020-12-02 09:58:28', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-12-02 09:58:28', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (433, 926, '磐安天海中药有限', 2025, '磐安天海中药有限公司', NULL, '13182341525', '多比', '测试新增', 1, '2020-12-16 14:27:22', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-12-16 14:27:22', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (434, 2916, '安徽飞远公司', 3853, '飞远农场', NULL, '18756946301', '神农6301', '测试新增', 1, '2020-12-16 14:33:10', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-12-16 14:33:10', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (435, 2916, '安徽飞远公司', 3853, '飞远农场', NULL, '18756946301', '神农6301', '大大大大黄瓜', 1, '2020-12-16 14:38:31', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-12-16 14:38:31', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (436, 2916, '安徽飞远公司', 3853, '飞远农场', NULL, '18756946301', '神农6301', '测试新增', 1, '2020-12-16 14:38:40', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-12-16 14:38:40', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (437, 11696, '测试wkwebview8888', 12860, '测试wk', NULL, '13879232488', '神农2488', '测试新增', 1, '2020-12-22 10:46:01', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-12-22 10:46:01', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (438, 11696, '测试wkwebview8888', 12860, '测试wk', NULL, '13879232488', '神农2488', '大黄瓜1', 1, '2020-12-22 10:46:18', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-12-22 10:46:18', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (439, 11696, '测试wkwebview8888', 12860, '测试wk', NULL, '13182341525', '多比', '大黄瓜1', 1, '2020-12-22 10:46:35', NULL, NULL, NULL, NULL, 0, NULL,
        '2020-12-22 10:46:35', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (441, 11761, '测试19-1', 12942, '测试19-1', NULL, '13182341525', '神农1525', '5', 1, '2021-02-27 15:44:33', NULL, NULL, NULL, NULL, 0, NULL,
        '2021-02-27 15:44:33', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (442, 11767, '主流程333', 12949, '主流程', NULL, '14556565656', '神农56', '大黄瓜1', 1, '2021-03-03 17:29:15', NULL, NULL, NULL, NULL, 0, NULL,
        '2021-03-03 17:29:15', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (470, 11801, '测试3.21.0主流程11', 13011, '测试3.21.0主流程', NULL, '13182341525', '多比', '新增', 1, '2021-03-19 10:15:24', NULL, NULL, NULL, NULL, 0, NULL,
        '2021-03-19 10:15:24', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (474, 11818, '3.24.0', 13040, '3.24.0', NULL, '13182341525', '神农1525', '55', 1, '2021-03-31 15:39:54', NULL, NULL, NULL, NULL, 0, NULL,
        '2021-03-31 15:39:54', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (475, 11818, '3.24.0', 13040, '3.24.0', NULL, '13182341525', '神农1525', '66', 1, '2021-03-31 15:40:05', NULL, NULL, NULL, NULL, 0, NULL,
        '2021-03-31 15:40:05', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (507, 12164, 'js测试企业', 13519, 'js测试农场', NULL, '19955157561', '神农7561', '测试加种类', 3, '2021-11-30 15:08:14', 1, '超管', '2021-11-30 15:08:34', '种类名有误',
        1, '成功', '2021-11-30 15:08:14', '2021-11-30 15:08:34');
INSERT INTO `sys_crop_feedback`
VALUES (510, 12164, 'js测试企业', 13519, 'js测试农场', NULL, '19955157561', '神农7561', 'qqqq', 1, '2021-11-30 15:23:36', NULL, NULL, NULL, NULL, 0, NULL,
        '2021-11-30 15:23:36', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (511, 12164, 'js测试企业', 13519, 'js测试农场', NULL, '19955157561', '神农7561', '苹果皮个苹果', 3, '2021-11-30 15:32:38', 1, '超管', '2021-11-30 15:49:33', '测试发短信',
        1, '成功', '2021-11-30 15:32:38', '2021-11-30 15:49:33');
INSERT INTO `sys_crop_feedback`
VALUES (512, 12420, 'TEST', 13837, 'TEST', NULL, '18625706122', '神农', 'test', 1, '2022-03-07 15:27:14', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-03-07 15:27:14', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (513, 12422, 'test', 13840, 'test基地', NULL, '18625706122', '神农6122', '虾米', 3, '2022-03-07 16:26:10', 1, '超管', '2022-03-07 16:31:40', '1', 1, '成功',
        '2022-03-07 16:26:10', '2022-03-07 16:31:40');
INSERT INTO `sys_crop_feedback`
VALUES (514, 12494, '测试YYF-001', 13920, '合肥科技生产基地+1', NULL, '15605589603', '神农9603', '石斑鱼', 1, '2022-04-07 10:07:21', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-04-07 10:07:21', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (515, 12494, '测试YYF-001', 13920, '合肥科技生产基地+1', NULL, '15605589603', '神农9603', '阳光玫瑰', 1, '2022-04-07 10:08:38', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-04-07 10:08:38', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (517, 12644, '11', 14104, '合格证22', NULL, '13182341525', '神农1525', '11', 1, '2022-05-26 18:00:16', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-05-26 18:00:16', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (520, 12650, '迭代57蔬菜预测产量归档', 14114, '迭代57蔬菜预测产量归档农场', NULL, '13182341525', '神农1525', '测试作物', 1, '2022-06-06 14:29:37', NULL, NULL, NULL, NULL, 0,
        NULL, '2022-06-06 14:29:37', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (529, 12652, '迭代57', 14117, '迭代57', NULL, '13182341525', '神农1525', 'dada', 1, '2022-06-06 15:29:40', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 15:29:40', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (530, 12652, '迭代57', 14117, '迭代57', NULL, '13182341525', '神农1525', '测试短信', 1, '2022-06-06 15:30:01', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 15:30:01', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (531, 12652, '迭代57', 14117, '迭代57', NULL, '13182341525', '神农1525', '测试作物', 1, '2022-06-06 15:31:28', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-06-06 15:31:28', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (540, 2605, '上海泰捷水产养殖专业合作社', 3531, '上海泰捷水产养殖专业合作社光明', NULL, '18616553920', '戴聪', 'ddd', 1, '2022-07-06 15:57:18', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-07-06 15:57:18', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (561, 12808, '多比迭代61企业1外采', 14301, '多比迭代61农场1外采', NULL, '13182341525', '神农1525', '搜到搜索多', 1, '2022-07-28 17:30:59', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-07-28 17:30:59', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (562, 12808, '多比迭代61企业1外采', 14301, '多比迭代61农场1外采', NULL, '13182341525', '神农1525', '份数份数发多少', 1, '2022-07-28 17:31:46', NULL, NULL, NULL, NULL, 0,
        NULL, '2022-07-28 17:31:46', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (563, 12816, '多比迭代61企业4', 14310, '多比迭代61农场4', NULL, '13182341525', '神农1525', '测试新增', 1, '2022-08-02 17:51:38', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-02 17:51:38', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (564, 12400, '戴聪企业', 13812, '戴聪农场', NULL, '18616553920', '神农3920', 'zuowu1', 1, '2022-08-03 10:01:10', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 10:01:10', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (565, 12400, '戴聪企业', 13812, '戴聪农场', NULL, '18616553920', '神农3920', '新作做', 1, '2022-08-03 10:18:53', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 10:18:53', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (566, 12400, '戴聪企业', 13812, '戴聪农场', NULL, '18616553920', '神农3920', '作物瓜', 1, '2022-08-03 10:26:33', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 10:26:33', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (567, 12400, '戴聪企业', 13812, '戴聪农场', NULL, '18616553920', '神农3920', '瓜瓜', 1, '2022-08-03 10:27:58', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 10:27:58', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (568, 12400, '戴聪企业', 13812, '戴聪农场', NULL, '18616553920', '神农3920', '呱呱呱', 1, '2022-08-03 10:28:14', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 10:28:14', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (569, 12816, '多比迭代61企业4', 14310, '多比迭代61农场4', NULL, '13182341525', '神农1525', '测试新增', 1, '2022-08-03 16:03:13', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 16:03:13', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (570, 12816, '多比迭代61企业4', 14310, '多比迭代61农场4', NULL, '13182341525', '神农1525', '大黄瓜11', 1, '2022-08-03 16:03:58', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 16:03:58', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (571, 12816, '多比迭代61企业4', 14310, '多比迭代61农场4', NULL, '13182341525', '神农1525', '测试新增1233', 1, '2022-08-03 16:46:58', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 16:46:58', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (572, 12816, '多比迭代61企业4', 14310, '多比迭代61农场4', NULL, '13182341525', '神农1525', '测试新增555', 1, '2022-08-03 16:47:05', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-03 16:47:05', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (573, 12842, '测试主流程', 14359, '测试主流程', NULL, '15556463667', '神农3667', '测试新增', 1, '2022-08-10 14:03:30', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-10 14:03:30', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (574, 12838, '多比迭代61企业15', 14344, '多比迭代61农场15', NULL, '13182341525', '神农1525', '黄瓜黄瓜', 1, '2022-08-10 14:56:43', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-10 14:56:43', NULL);
INSERT INTO `sys_crop_feedback`
VALUES (623, 12856, '62迭代', 14373, '6201', NULL, '18625706122', '六六6201', 'zuowu', 1, '2022-08-25 16:16:55', NULL, NULL, NULL, NULL, 0, NULL,
        '2022-08-25 16:16:55', NULL);

-- ----------------------------
-- Table structure for sys_demo_farm
-- ----------------------------
DROP TABLE IF EXISTS `sys_demo_farm`;
CREATE TABLE `sys_demo_farm`
(
    `id`          bigint(20) NOT NULL,
    `company_id`  bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `farm_id`     bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `create_by`   bigint(20) NULL DEFAULT NULL,
    `create_time` datetime   NULL DEFAULT NULL,
    `update_by`   bigint(20) NULL DEFAULT NULL,
    `update_time` datetime   NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_farm_id` (`farm_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_demo_farm
-- ----------------------------
INSERT INTO `sys_demo_farm`
VALUES (23, 1428, 2514, 4, '2019-03-21 13:42:58', 4, '2019-03-21 13:42:58');
INSERT INTO `sys_demo_farm`
VALUES (24, 1431, 2517, 4, '2019-03-21 14:03:16', 4, '2019-03-21 14:03:16');
INSERT INTO `sys_demo_farm`
VALUES (26, 1436, 2522, 4, '2019-03-21 14:32:09', 4, '2019-03-21 14:32:09');
INSERT INTO `sys_demo_farm`
VALUES (36, 1434, 2520, 4, '2019-03-21 14:37:12', 4, '2019-03-21 14:37:12');
INSERT INTO `sys_demo_farm`
VALUES (42, 1398, 2455, 4, '2019-03-21 15:25:29', 4, '2019-03-21 15:25:29');
INSERT INTO `sys_demo_farm`
VALUES (46, 1314, 2371, 4, '2019-03-21 15:37:00', 4, '2019-03-21 15:37:00');
INSERT INTO `sys_demo_farm`
VALUES (47, 1293, 2283, 4, '2019-03-21 15:37:38', 4, '2019-03-21 15:37:38');
INSERT INTO `sys_demo_farm`
VALUES (54, 1504, 2692, 4, '2019-04-22 10:48:58', 4, '2019-04-22 10:48:58');

-- ----------------------------
-- Table structure for sys_demo_land
-- ----------------------------
DROP TABLE IF EXISTS `sys_demo_land`;
CREATE TABLE `sys_demo_land`
(
    `id`          bigint(20) NOT NULL,
    `company_id`  bigint(20) NULL DEFAULT NULL COMMENT '企业id',
    `farm_id`     bigint(20) NULL DEFAULT NULL COMMENT '农场id',
    `land_id`     bigint(20) NULL DEFAULT NULL COMMENT '地块id',
    `create_by`   bigint(20) NULL DEFAULT NULL,
    `create_time` datetime   NULL DEFAULT NULL,
    `update_by`   bigint(20) NULL DEFAULT NULL,
    `update_time` datetime   NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_land_id` (`land_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_demo_land
-- ----------------------------

-- ----------------------------
-- Table structure for sys_farmer_comment
-- ----------------------------
DROP TABLE IF EXISTS `sys_farmer_comment`;
CREATE TABLE `sys_farmer_comment`
(
    `id`                       bigint(20)                                                    NOT NULL,
    `content`                  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价内容',
    `commentator`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '评论人姓名',
    `commentator_company_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '评论人企业名称',
    `commentator_company_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论人企业logo',
    `commentator_position`     varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '评论人职位',
    `sort_num`                 int(10)                                                       NULL DEFAULT NULL,
    `status_flag`              tinyint(2)                                                    NULL DEFAULT NULL COMMENT '0:禁用，1启用',
    `create_by`                bigint(20)                                                    NULL DEFAULT NULL,
    `create_time`              datetime                                                      NULL DEFAULT NULL,
    `update_by`                bigint(20)                                                    NULL DEFAULT NULL,
    `update_time`              datetime                                                      NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '农场主评价表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_farmer_comment
-- ----------------------------
INSERT INTO `sys_farmer_comment`
VALUES (4, '神农口袋的“可视农场”非常棒，每次领导/会员过来农场考察/游玩，先打开大屏幕给他们介绍下农场的地块分布、当前种植品种、以及每个地块的当前生产状况，非常直观。溯源也非常好用，可向会员展示作物生产全过程。', '张淑芳', '合肥诺伊有机',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/374ca512-31b4-4435-94ea-7534411e5423.jpg', '运营总监', 1, 1, 4, '2019-03-04 11:43:49', 2,
        '2019-09-18 10:14:00');
INSERT INTO `sys_farmer_comment`
VALUES (5, '神农口袋帮助田庄实现了精细化管理，每一个地块上一次什么时候使用了投入品，用量是多少，都能完整记录并追溯，让农事操作安排有条不紊。还可以统计每个地块的农资投入成本，对我们核算成本、收益帮助不小。', '康玮', '谷米田庄',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/3c1516b9-7cc2-4765-ac30-e4d4ae7ab7d4.jpg', '总经理', 2, 1, 4, '2019-03-04 11:44:59', 2,
        '2019-04-23 10:21:01');
INSERT INTO `sys_farmer_comment`
VALUES (6, '之前管理农场会员全靠微信群管理，工作量大且低效，客服收集会员的下单菜品后要进行汇总然后发给基地，协作很不顺畅、易出错。神农口袋帮我们解决了这一系列问题，客户、客服、销售和基地之间沟通效率提高不少。', '蒋国平', '北京食为先',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/3e6d2fe2-d655-460f-9246-2f0c487f669d.jpg', '董事长', 3, 1, 4, '2019-03-04 11:46:04', 2,
        '2019-04-23 10:21:03');
INSERT INTO `sys_farmer_comment`
VALUES (12, '田园综合体目前占地1万亩，管理起来很费劲，神农口袋把所有地块、大棚数字化展示，通过可视化的方式展示园区规划、作物生长状况、物联网设备监测数据，给田园综合体增加了科技元素和现代化的管理方式。', '李超然', '江西巴夫洛田园综合体',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/9e4a36ef-01a0-4a75-8ecb-efe09af345fc.jpg', '副总经理', 4, 1, 2, '2019-04-19 10:31:47', 104,
        '2022-04-08 17:59:51');
INSERT INTO `sys_farmer_comment`
VALUES (32, '1111', '1', '1', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/75d7fc34-722f-4d0c-8878-a37dda083fc6.jpg', '1', 1, 1, 122,
        '2022-04-08 18:06:19', 122, '2022-04-08 18:06:19');

-- ----------------------------
-- Table structure for sys_login_banner
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_banner`;
CREATE TABLE `sys_login_banner`
(
    `id`                bigint(20)                                                    NOT NULL,
    `login_banner_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '登录页banner名称',
    `big_img_url`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'banner图片(大图)',
    `small_img_url`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'banner图片(小图)',
    `status_flag`       tinyint(2)                                                    NULL DEFAULT NULL COMMENT '0：禁用，1启用',
    `sort_num`          int(10)                                                       NULL DEFAULT NULL,
    `create_by`         bigint(20)                                                    NULL DEFAULT NULL,
    `create_time`       datetime                                                      NULL DEFAULT NULL,
    `update_by`         bigint(20)                                                    NULL DEFAULT NULL,
    `update_time`       datetime                                                      NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '登录页banner表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_banner
-- ----------------------------
INSERT INTO `sys_login_banner`
VALUES (2, '21312', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/bdb6958a-3697-4d1c-8e92-d441de51133d.png',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/ebe08b18-f662-4bb2-ade9-b8c7aef18e73.png', 1, 3, 4, '2019-02-27 14:38:38', 1,
        '2021-07-27 15:03:05');
INSERT INTO `sys_login_banner`
VALUES (3, '222', 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/60713118-d13e-4e08-8aad-1f38ad79ccf6.png',
        'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/84dbcf77-d9cc-42f7-8312-2270052867de.png', 0, 2, 4, '2019-02-28 11:38:21', 4,
        '2019-02-28 11:38:27');

-- ----------------------------
-- Table structure for sys_qrcode_example
-- ----------------------------
DROP TABLE IF EXISTS `sys_qrcode_example`;
CREATE TABLE `sys_qrcode_example`
(
    `id`          bigint(20)                                                    NOT NULL,
    `qrcode_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '溯源码名称',
    `qrcode_type` tinyint(4)                                                    NULL DEFAULT NULL COMMENT '溯源码类型,1溯源码',
    `qrcode_url`  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '溯源url',
    `create_by`   bigint(20)                                                    NULL DEFAULT NULL,
    `create_time` datetime                                                      NULL DEFAULT NULL,
    `update_by`   bigint(20)                                                    NULL DEFAULT NULL,
    `update_time` datetime                                                      NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '示例配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_qrcode_example
-- ----------------------------
INSERT INTO `sys_qrcode_example`
VALUES (13, '官网溯源示例', 1, 'https://showtest.snkoudai.com/ywym/#/home/root/113W0000000', 4, '2019-03-04 11:59:45', 2, '2020-04-09 00:37:35');
INSERT INTO `sys_qrcode_example`
VALUES (23, '官网农场秀示例', 2, 'https://showtest.snkoudai.com/farmshow/#/farmshow/58', 2, '2019-04-19 10:32:17', 2, '2020-04-09 00:37:09');
INSERT INTO `sys_qrcode_example`
VALUES (43, '!@#$', 100, 'https://www.snkoudai.com/', 104, '2022-06-22 20:35:05', 104, '2022-06-22 20:37:00');

-- ----------------------------
-- Table structure for sys_website_banner
-- ----------------------------
DROP TABLE IF EXISTS `sys_website_banner`;
CREATE TABLE `sys_website_banner`
(
    `id`                    bigint(20)                                                    NOT NULL,
    `img_url`               varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `title`                 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主标题',
    `sub_title`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '副标题',
    `gradients_color_start` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渐变开始',
    `gradients_color_end`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渐变结束',
    `sort_num`              int(10)                                                       NULL DEFAULT NULL COMMENT '排序',
    `status_flag`           tinyint(4)                                                    NULL DEFAULT NULL COMMENT '0禁用，1启用',
    `create_by`             bigint(20)                                                    NULL DEFAULT NULL,
    `create_time`           datetime                                                      NULL DEFAULT NULL,
    `update_by`             bigint(20)                                                    NULL DEFAULT NULL,
    `update_time`           datetime                                                      NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '官网banner配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_website_banner
-- ----------------------------
INSERT INTO `sys_website_banner`
VALUES (4, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/85514813-b20b-432d-89d6-57827061ac76.png', '农场竟然可以这样管理',
        '颠覆传统农场ERP，打造最接“地”气的农场管理工具', '#sadqw', '#12312321', 2, 1, 4, '2019-03-04 13:45:02', 2, '2019-09-17 16:39:36');
INSERT INTO `sys_website_banner`
VALUES (12, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/a9e2c338-009b-4238-91e1-f53bed0a53ca.JPG', '12312', '3213', '321', '3213', 1, 0, 1,
        '2019-04-22 15:11:03', 104, '2022-04-08 17:59:25');
INSERT INTO `sys_website_banner`
VALUES (13, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/79544a39-2dc3-4b9f-86de-bb51c7bb4f7c.png', '321', '321', '312', '321', 5, 1, 1,
        '2019-04-22 15:11:32', 4, '2019-06-21 09:26:53');
INSERT INTO `sys_website_banner`
VALUES (21, 'https://zuoan-test.oss-cn-hangzhou.aliyuncs.com/zuoan-test/88669401-37ef-4aaf-8a57-249562465d57.jpg', '1', '1', '1', '1', 1, 0, 122,
        '2022-04-08 18:06:05', 122, '2022-04-08 18:06:05');

SET FOREIGN_KEY_CHECKS = 1;

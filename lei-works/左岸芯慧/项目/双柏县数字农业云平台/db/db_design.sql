-- 合格证按地区、年份、月份归档表
DROP TABLE IF EXISTS `frp_gisdata_archive`.`tbl_archive_print_area_year_month`;
CREATE TABLE `frp_gisdata_archive`.`tbl_archive_print_area_year_month`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`         varchar(64) NOT NULL COMMENT '区域id，可以是省、市、区、镇、村等编码id',
    `area_name`       varchar(64)    DEFAULT NULL COMMENT '区域名称，可以是省、市、区、镇、村等编码名称',
    `archive_year`    int(11) NOT NULL COMMENT '年份',
    `total_count`     int(11) DEFAULT '0' COMMENT '合格证开具总数量(张)',
    `total_weight`    decimal(16, 2) DEFAULT '0' COMMENT '合格证开具总重量(吨)',
    `jan_count`       int(11) DEFAULT '0' COMMENT '一月合格证开具数量(张)',
    `jan_weight`      decimal(16, 2) DEFAULT '0' COMMENT '一月合格证开具重量(吨)',
    `feb_count`       int(11) DEFAULT '0' COMMENT '二月合格证开具数量(张)',
    `feb_weight`      decimal(16, 2) DEFAULT '0' COMMENT '二月合格证开具重量(吨)',
    `mar_count`       int(11) DEFAULT '0' COMMENT '三月合格证开具数量(张)',
    `mar_weight`      decimal(16, 2) DEFAULT '0' COMMENT '三月合格证开具重量(吨)',
    `apr_count`       int(11) DEFAULT '0' COMMENT '四月合格证开具数量(张)',
    `apr_weight`      decimal(16, 2) DEFAULT '0' COMMENT '四月合格证开具重量(吨)',
    `may_count`       int(11) DEFAULT '0' COMMENT '五月合格证开具数量(张)',
    `may_weight`      decimal(16, 2) DEFAULT '0' COMMENT '五月合格证开具重量(吨)',
    `jun_count`       int(11) DEFAULT '0' COMMENT '六月合格证开具数量(张)',
    `jun_weight`      decimal(16, 2) DEFAULT '0' COMMENT '六月合格证开具重量(吨)',
    `jul_count`       int(11) DEFAULT '0' COMMENT '七月合格证开具数量(张)',
    `jul_weight`      decimal(16, 2) DEFAULT '0' COMMENT '七月合格证开具重量(吨)',
    `aug_count`       int(11) DEFAULT '0' COMMENT '八月合格证开具数量(张)',
    `aug_weight`      decimal(16, 2) DEFAULT '0' COMMENT '八月合格证开具重量(吨)',
    `sept_count`      int(11) DEFAULT '0' COMMENT '九月合格证开具数量(张)',
    `sept_weight`     decimal(16, 2) DEFAULT '0' COMMENT '九月合格证开具重量(吨)',
    `oct_count`       int(11) DEFAULT '0' COMMENT '十月合格证开具数量(张)',
    `oct_weight`      decimal(16, 2) DEFAULT '0' COMMENT '十月合格证开具重量(吨)',
    `nov_count`       int(11) DEFAULT '0' COMMENT '十一月合格证开具数量(张)',
    `nov_weight`      decimal(16, 2) DEFAULT '0' COMMENT '十一月合格证开具重量(吨)',
    `dec_count`       int(11) DEFAULT '0' COMMENT '十二月合格证开具数量(张)',
    `dec_weight`      decimal(16, 2) DEFAULT '0' COMMENT '十二月合格证开具重量(吨)',
    `statistics_mode` tinyint(2) DEFAULT '0' COMMENT '统计方式 0 手动 1 自动',
    `create_time`     datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='合格证按地区、年份、月份归档表';

-- 合格证按地区、年份、主体类型归档表
DROP TABLE IF EXISTS `frp_gisdata_archive`.`tbl_archive_print_area_year_category`;
CREATE TABLE `frp_gisdata_archive`.`tbl_archive_print_area_year_category`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`              varchar(64) NOT NULL COMMENT '区域id，可以是省、市、区、镇、村等编码id',
    `archive_year`         int(11) NOT NULL COMMENT '年份',
    `total_count`          int(11) DEFAULT '0' COMMENT '合格证开具总数量(张)',
    `total_weight`         decimal(16, 2) DEFAULT '0' COMMENT '合格证开具总重量(吨)',
    `cooperative_count`    int(11) DEFAULT '0' COMMENT '合作社合格证开具数量(张)',
    `cooperative_weight`   decimal(16, 2) DEFAULT '0' COMMENT '合作社合格证开具重量(吨)',
    `agri_business_count`  int(11) DEFAULT '0' COMMENT '农业企业合格证开具数量(张)',
    `agri_business_weight` decimal(16, 2) DEFAULT '0' COMMENT '农业企业合格证开具重量(吨)',
    `family_farm_count`    int(11) DEFAULT '0' COMMENT '家庭农场合格证开具数量(张)',
    `family_farm_weight`   decimal(16, 2) DEFAULT '0' COMMENT '家庭农场合格证开具重量(吨)',
    `other_count`          int(11) DEFAULT '0' COMMENT '其他类型合格证开具数量(张)',
    `other_weight`         decimal(16, 2) DEFAULT '0' COMMENT '其他类型合格证开具重量(吨)',
    `statistics_mode`      tinyint(2) DEFAULT '0' COMMENT '统计方式 0 手动 1 自动',
    `create_time`          datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`          datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='合格证按地区、年份、主体类型归档表';

-- 合格证按地区、年份、经营主体归档表
DROP TABLE IF EXISTS `frp_gisdata_archive`.`tbl_archive_print_area_year_farm`;
CREATE TABLE `frp_gisdata_archive`.`tbl_archive_print_area_year_farm`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `area_id`         varchar(64) NOT NULL COMMENT '区域id，可以是省、市、区、镇、村等编码id',
    `archive_year`    int(11) NOT NULL COMMENT '年份',
    `farm_id`         varchar(64)    DEFAULT NULL COMMENT '经营主体id,对应gis服务tbl_gisfarm_jianguan表id',
    `farm_name`       varchar(64)    DEFAULT NULL COMMENT '打印主体',
    `count`           int(11) DEFAULT '0' COMMENT '合格证开具数量(张)',
    `weight`          decimal(16, 2) DEFAULT '0' COMMENT '合格证开具重量(吨)',
    `statistics_mode` tinyint(2) DEFAULT '0' COMMENT '统计方式 0 手动 1 自动',
    `create_time`     datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='合格证按地区、年份、经营主体归档表';



(SELECT tmp.area_id                                                                             AS areaid,
        tmp.`year`                                                                              AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                             AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                                     AS totalweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 2 THEN tmp.count ELSE 0 END), 0)         AS cooperativecount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 2 THEN tmp.weight ELSE 0 END) / 1000, 0) AS cooperativeweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 1 THEN tmp.count ELSE 0 END), 0)         AS agribusinesscount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 1 THEN tmp.weight ELSE 0 END) / 1000, 0) AS agribusinessweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 3 THEN tmp.count ELSE 0 END), 0)         AS familyfarmcount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 3 THEN tmp.weight ELSE 0 END) / 1000, 0) AS familyfarmweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 5 THEN tmp.count ELSE 0 END), 0) +
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 6 THEN tmp.count ELSE 0 END), 0) +
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 7 THEN tmp.count ELSE 0 END), 0) AS 'otherCount',
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 5 THEN tmp.weight ELSE 0 END) / 1000, 0) +
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 6 THEN tmp.weight ELSE 0 END) / 1000, 0) +
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 7 THEN tmp.weight ELSE 0 END) / 1000, 0) AS 'otherWeight'
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              a.county_id                      area_id,
              MAX(a.county_name)               area_name,
              b.company_category_id,
              MAX(b.company_category_name)     company_category_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                a.county_id,
                b.company_category_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`)
UNION
(SELECT tmp.area_id                                                                             AS areaid,
        tmp.`year`                                                                              AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                             AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                                     AS totalweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 2 THEN tmp.count ELSE 0 END), 0)         AS cooperativecount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 2 THEN tmp.weight ELSE 0 END) / 1000, 0) AS cooperativeweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 1 THEN tmp.count ELSE 0 END), 0)         AS agribusinesscount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 1 THEN tmp.weight ELSE 0 END) / 1000, 0) AS agribusinessweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 3 THEN tmp.count ELSE 0 END), 0)         AS familyfarmcount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 3 THEN tmp.weight ELSE 0 END) / 1000, 0) AS familyfarmweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 5 THEN tmp.count ELSE 0 END), 0) +
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 6 THEN tmp.count ELSE 0 END), 0) +
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 7 THEN tmp.count ELSE 0 END), 0) AS 'otherCount',
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 5 THEN tmp.weight ELSE 0 END) / 1000, 0) +
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 6 THEN tmp.weight ELSE 0 END) / 1000, 0) +
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 7 THEN tmp.weight ELSE 0 END) / 1000, 0) AS 'otherWeight'
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              a.town_id                        area_id,
              MAX(a.town_name)                 area_name,
              b.company_category_id,
              MAX(b.company_category_name)     company_category_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                a.town_id,
                b.company_category_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`)
UNION
(SELECT tmp.area_id                                                                             AS areaid,
        tmp.`year`                                                                              AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                             AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                                     AS totalweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 2 THEN tmp.count ELSE 0 END), 0)         AS cooperativecount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 2 THEN tmp.weight ELSE 0 END) / 1000, 0) AS cooperativeweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 1 THEN tmp.count ELSE 0 END), 0)         AS agribusinesscount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 1 THEN tmp.weight ELSE 0 END) / 1000, 0) AS agribusinessweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 3 THEN tmp.count ELSE 0 END), 0)         AS familyfarmcount,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 3 THEN tmp.weight ELSE 0 END) / 1000, 0) AS familyfarmweight,
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 5 THEN tmp.count ELSE 0 END), 0) +
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 6 THEN tmp.count ELSE 0 END), 0) +
        IFNULL(SUM(CASE WHEN tmp.company_category_id = 7 THEN tmp.count ELSE 0 END), 0) AS 'otherCount',
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 5 THEN tmp.weight ELSE 0 END) / 1000, 0) +
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 6 THEN tmp.weight ELSE 0 END) / 1000, 0) +
             IFNULL(SUM(CASE WHEN tmp.company_category_id = 7 THEN tmp.weight ELSE 0 END) / 1000, 0) AS 'otherWeight'
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              a.village_id                     area_id,
              MAX(a.village_name)              area_name,
              b.company_category_id,
              MAX(b.company_category_name)     company_category_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                a.village_id,
                b.company_category_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`);



(SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
        a.county_id                      area_id,
        MAX(a.county_name)               area_name,
        COUNT(*)                         `count`,
        SUM(product_count)               weight,
        a.farm_id,
        MAX(a.farm_name)                 farm_name
 FROM tbl_archive_jianguan_print a
          LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
 WHERE a.county_id IS NOT NULL
   AND a.town_id IS NOT NULL
   AND a.village_id IS NOT NULL
   AND b.company_category_id IS NOT NULL
   AND a.farm_id IS NOT NULL
 GROUP BY DATE_FORMAT(print_time, '%Y'),
          a.county_id,
          a.farm_id)
UNION
(SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
        a.town_id                        area_id,
        MAX(a.town_name)                 area_name,
        COUNT(*)                         `count`,
        SUM(product_count)               weight,
        a.farm_id,
        MAX(a.farm_name)                 farm_name
 FROM tbl_archive_jianguan_print a
          LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
 WHERE a.county_id IS NOT NULL
   AND a.town_id IS NOT NULL
   AND a.village_id IS NOT NULL
   AND b.company_category_id IS NOT NULL
   AND a.farm_id IS NOT NULL
 GROUP BY DATE_FORMAT(print_time, '%Y'),
          a.town_id,
          a.farm_id)
UNION
(SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
        a.village_id                     area_id,
        MAX(a.village_name)              area_name,
        COUNT(*)                         `count`,
        SUM(product_count)               weight,
        a.farm_id,
        MAX(a.farm_name)                 farm_name
 FROM tbl_archive_jianguan_print a
          LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
 WHERE a.county_id IS NOT NULL
   AND a.town_id IS NOT NULL
   AND a.village_id IS NOT NULL
   AND b.company_category_id IS NOT NULL
   AND a.farm_id IS NOT NULL
 GROUP BY DATE_FORMAT(print_time, '%Y'),
          a.village_id,
          a.farm_id);



(SELECT tmp.area_id                                                                    AS areaid,
        max(tmp.area_name)                                                             AS areaname,
        tmp.`year`                                                                     AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                    AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                            AS totalweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.count ELSE 0 END), 0)         AS jancount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.weight ELSE 0 END) / 1000, 0) AS janweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.count ELSE 0 END), 0)         AS febcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.weight ELSE 0 END) / 1000, 0) AS febweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.count ELSE 0 END), 0)         AS marcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.weight ELSE 0 END) / 1000, 0) AS marweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.count ELSE 0 END), 0)         AS aprcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.weight ELSE 0 END) / 1000, 0) AS aprweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.count ELSE 0 END), 0)         AS maycount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.weight ELSE 0 END) / 1000, 0) AS mayweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.count ELSE 0 END), 0)         AS juncount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.weight ELSE 0 END) / 1000, 0) AS junweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.count ELSE 0 END), 0)         AS julcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.weight ELSE 0 END) / 1000, 0) AS julweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.count ELSE 0 END), 0)         AS augcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.weight ELSE 0 END) / 1000, 0) AS augweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.count ELSE 0 END), 0)         AS septcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.weight ELSE 0 END) / 1000, 0) AS septweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.count ELSE 0 END), 0)         AS octcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.weight ELSE 0 END) / 1000, 0) AS octweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.count ELSE 0 END), 0)         AS novcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.weight ELSE 0 END) / 1000, 0) AS novweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.count ELSE 0 END), 0)         AS deccount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.weight ELSE 0 END) / 1000, 0) AS decweight
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              DATE_FORMAT(print_time, '%m') AS `month`,
              a.county_id                      area_id,
              MAX(a.county_name)               area_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                DATE_FORMAT(print_time, '%m'),
                a.county_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`)
UNION
(SELECT tmp.area_id                                                                    AS areaid,
        max(tmp.area_name)                                                             AS areaname,
        tmp.`year`                                                                     AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                    AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                            AS totalweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.count ELSE 0 END), 0)         AS jancount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.weight ELSE 0 END) / 1000, 0) AS janweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.count ELSE 0 END), 0)         AS febcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.weight ELSE 0 END) / 1000, 0) AS febweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.count ELSE 0 END), 0)         AS marcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.weight ELSE 0 END) / 1000, 0) AS marweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.count ELSE 0 END), 0)         AS aprcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.weight ELSE 0 END) / 1000, 0) AS aprweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.count ELSE 0 END), 0)         AS maycount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.weight ELSE 0 END) / 1000, 0) AS mayweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.count ELSE 0 END), 0)         AS juncount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.weight ELSE 0 END) / 1000, 0) AS junweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.count ELSE 0 END), 0)         AS julcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.weight ELSE 0 END) / 1000, 0) AS julweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.count ELSE 0 END), 0)         AS augcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.weight ELSE 0 END) / 1000, 0) AS augweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.count ELSE 0 END), 0)         AS septcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.weight ELSE 0 END) / 1000, 0) AS septweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.count ELSE 0 END), 0)         AS octcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.weight ELSE 0 END) / 1000, 0) AS octweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.count ELSE 0 END), 0)         AS novcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.weight ELSE 0 END) / 1000, 0) AS novweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.count ELSE 0 END), 0)         AS deccount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.weight ELSE 0 END) / 1000, 0) AS decweight
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              DATE_FORMAT(print_time, '%m') AS `month`,
              a.town_id                        area_id,
              MAX(a.village_name)              area_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                DATE_FORMAT(print_time, '%m'),
                a.town_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`)
UNION
(SELECT tmp.area_id                                                                    AS areaid,
        max(tmp.area_name)                                                             AS areaname,
        tmp.`year`                                                                     AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                    AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                            AS totalweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.count ELSE 0 END), 0)         AS jancount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.weight ELSE 0 END) / 1000, 0) AS janweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.count ELSE 0 END), 0)         AS febcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.weight ELSE 0 END) / 1000, 0) AS febweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.count ELSE 0 END), 0)         AS marcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.weight ELSE 0 END) / 1000, 0) AS marweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.count ELSE 0 END), 0)         AS aprcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.weight ELSE 0 END) / 1000, 0) AS aprweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.count ELSE 0 END), 0)         AS maycount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.weight ELSE 0 END) / 1000, 0) AS mayweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.count ELSE 0 END), 0)         AS juncount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.weight ELSE 0 END) / 1000, 0) AS junweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.count ELSE 0 END), 0)         AS julcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.weight ELSE 0 END) / 1000, 0) AS julweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.count ELSE 0 END), 0)         AS augcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.weight ELSE 0 END) / 1000, 0) AS augweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.count ELSE 0 END), 0)         AS septcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.weight ELSE 0 END) / 1000, 0) AS septweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.count ELSE 0 END), 0)         AS octcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.weight ELSE 0 END) / 1000, 0) AS octweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.count ELSE 0 END), 0)         AS novcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.weight ELSE 0 END) / 1000, 0) AS novweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.count ELSE 0 END), 0)         AS deccount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.weight ELSE 0 END) / 1000, 0) AS decweight
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              DATE_FORMAT(print_time, '%m') AS `month`,
              a.village_id                     area_id,
              MAX(a.village_name)              area_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                DATE_FORMAT(print_time, '%m'),
                a.village_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`);



(SELECT tmp.area_id                                                                    AS areaid,
        max(tmp.area_name)                                                             AS areaname,
        tmp.`year`                                                                     AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                    AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                            AS totalweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.count ELSE 0 END), 0)         AS jancount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.weight ELSE 0 END) / 1000, 0) AS janweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.count ELSE 0 END), 0)         AS febcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.weight ELSE 0 END) / 1000, 0) AS febweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.count ELSE 0 END), 0)         AS marcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.weight ELSE 0 END) / 1000, 0) AS marweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.count ELSE 0 END), 0)         AS aprcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.weight ELSE 0 END) / 1000, 0) AS aprweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.count ELSE 0 END), 0)         AS maycount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.weight ELSE 0 END) / 1000, 0) AS mayweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.count ELSE 0 END), 0)         AS juncount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.weight ELSE 0 END) / 1000, 0) AS junweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.count ELSE 0 END), 0)         AS julcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.weight ELSE 0 END) / 1000, 0) AS julweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.count ELSE 0 END), 0)         AS augcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.weight ELSE 0 END) / 1000, 0) AS augweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.count ELSE 0 END), 0)         AS septcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.weight ELSE 0 END) / 1000, 0) AS septweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.count ELSE 0 END), 0)         AS octcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.weight ELSE 0 END) / 1000, 0) AS octweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.count ELSE 0 END), 0)         AS novcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.weight ELSE 0 END) / 1000, 0) AS novweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.count ELSE 0 END), 0)         AS deccount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.weight ELSE 0 END) / 1000, 0) AS decweight
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              DATE_FORMAT(print_time, '%m') AS `month`,
              a.county_id                      area_id,
              MAX(a.county_name)               area_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                DATE_FORMAT(print_time, '%m'),
                a.county_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`)
UNION
(SELECT tmp.area_id                                                                    AS areaid,
        max(tmp.area_name)                                                             AS areaname,
        tmp.`year`                                                                     AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                    AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                            AS totalweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.count ELSE 0 END), 0)         AS jancount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.weight ELSE 0 END) / 1000, 0) AS janweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.count ELSE 0 END), 0)         AS febcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.weight ELSE 0 END) / 1000, 0) AS febweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.count ELSE 0 END), 0)         AS marcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.weight ELSE 0 END) / 1000, 0) AS marweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.count ELSE 0 END), 0)         AS aprcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.weight ELSE 0 END) / 1000, 0) AS aprweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.count ELSE 0 END), 0)         AS maycount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.weight ELSE 0 END) / 1000, 0) AS mayweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.count ELSE 0 END), 0)         AS juncount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.weight ELSE 0 END) / 1000, 0) AS junweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.count ELSE 0 END), 0)         AS julcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.weight ELSE 0 END) / 1000, 0) AS julweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.count ELSE 0 END), 0)         AS augcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.weight ELSE 0 END) / 1000, 0) AS augweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.count ELSE 0 END), 0)         AS septcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.weight ELSE 0 END) / 1000, 0) AS septweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.count ELSE 0 END), 0)         AS octcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.weight ELSE 0 END) / 1000, 0) AS octweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.count ELSE 0 END), 0)         AS novcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.weight ELSE 0 END) / 1000, 0) AS novweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.count ELSE 0 END), 0)         AS deccount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.weight ELSE 0 END) / 1000, 0) AS decweight
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              DATE_FORMAT(print_time, '%m') AS `month`,
              a.town_id                        area_id,
              MAX(a.town_name)                 area_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                DATE_FORMAT(print_time, '%m'),
                a.town_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`)
UNION
(SELECT tmp.area_id                                                                    AS areaid,
        max(tmp.area_name)                                                             AS areaname,
        tmp.`year`                                                                     AS archiveyear,
        IFNULL(SUM(tmp.`count`), 0)                                                    AS totalcount,
        IFNULL(SUM(tmp.`weight`) / 1000, 0)                                            AS totalweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.count ELSE 0 END), 0)         AS jancount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '01' THEN tmp.weight ELSE 0 END) / 1000, 0) AS janweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.count ELSE 0 END), 0)         AS febcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '02' THEN tmp.weight ELSE 0 END) / 1000, 0) AS febweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.count ELSE 0 END), 0)         AS marcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '03' THEN tmp.weight ELSE 0 END) / 1000, 0) AS marweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.count ELSE 0 END), 0)         AS aprcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '04' THEN tmp.weight ELSE 0 END) / 1000, 0) AS aprweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.count ELSE 0 END), 0)         AS maycount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '05' THEN tmp.weight ELSE 0 END) / 1000, 0) AS mayweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.count ELSE 0 END), 0)         AS juncount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '06' THEN tmp.weight ELSE 0 END) / 1000, 0) AS junweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.count ELSE 0 END), 0)         AS julcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '07' THEN tmp.weight ELSE 0 END) / 1000, 0) AS julweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.count ELSE 0 END), 0)         AS augcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '08' THEN tmp.weight ELSE 0 END) / 1000, 0) AS augweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.count ELSE 0 END), 0)         AS septcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '09' THEN tmp.weight ELSE 0 END) / 1000, 0) AS septweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.count ELSE 0 END), 0)         AS octcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '10' THEN tmp.weight ELSE 0 END) / 1000, 0) AS octweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.count ELSE 0 END), 0)         AS novcount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '11' THEN tmp.weight ELSE 0 END) / 1000, 0) AS novweight,

        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.count ELSE 0 END), 0)         AS deccount,
        IFNULL(SUM(CASE WHEN tmp.`month` = '12' THEN tmp.weight ELSE 0 END) / 1000, 0) AS decweight
 FROM (SELECT DATE_FORMAT(print_time, '%Y') AS `year`,
              DATE_FORMAT(print_time, '%m') AS `month`,
              a.village_id                     area_id,
              MAX(a.village_name)              area_name,
              COUNT(*)                         `count`,
              SUM(product_count)               weight
       FROM tbl_archive_jianguan_print a
                LEFT JOIN tbl_gisfarm b ON a.farm_id = b.id
       WHERE a.county_id IS NOT NULL
         AND a.town_id IS NOT NULL
         AND a.village_id IS NOT NULL
         AND b.company_category_id IS NOT NULL
         AND a.farm_id IS NOT NULL
       GROUP BY DATE_FORMAT(print_time, '%Y'),
                DATE_FORMAT(print_time, '%m'),
                a.village_id) tmp
 GROUP BY tmp.area_id,
          tmp.`year`);
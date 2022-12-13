####################################### tbl_area_local 匹配区域编码 strart ####################################################

# 联表查询到市区镇村的信息
SELECT city.id          AS city_id,
       city.area_name   AS city_name,
       county.id        AS county_id,
       county.area_name AS county_name,
       town.id          AS town_id,
       town.name        AS town_name,
       village.id       AS village_id,
       village.name     AS village_name
FROM tbl_area_local village
         INNER JOIN tbl_area_local town ON village.parent_id = town.id
         INNER JOIN sys_area county ON town.parent_id = county.id
         INNER JOIN sys_area city ON county.parent_id = city.id;


# frp_test 匹配中间操作
# -- 新增了match字段
SELECT a.city_name,
       a.county_name,
       b.county_name,
       a.town_name,
       b.town_name,
       a.village_name,
       a.village_match,
       b.village_name,
       b.village_match,
       a.village_id,
       b.village_code
FROM tbl_area_testc a
         INNER JOIN tbl_area_all b ON a.county_name = b.county_name AND a.town_name = b.town_name AND a.village_match = b.village_match;


# 去除字符串两端包含的子字符串
UPDATE `tbl_area_all`SET village_match=village_name;
UPDATE `tbl_area_all`SET village_match=TRIM('居委会' FROM village_match);
UPDATE `tbl_area_all`SET village_match=TRIM('居民委员会' FROM village_match);
UPDATE `tbl_area_all`SET village_match=TRIM('居委会筹备组' FROM village_match);
UPDATE `tbl_area_all`SET village_match=TRIM('民委员会' FROM village_match);
UPDATE `tbl_area_all`SET village_match=TRIM('委会' FROM village_match);
UPDATE `tbl_area_all`SET village_match=CONCAT(TRIM('村' FROM village_match), '村') WHERE village_match LIKE '%村村%';


# 第一步
UPDATE tbl_area_testc a
    INNER JOIN tbl_area_all b ON a.county_name = b.county_name
        AND a.town_name = b.town_name
        AND a.village_name = b.village_match
SET a.village_code = b.village_code;

# 第二步
UPDATE tbl_area_testc a
    INNER JOIN tbl_area_all b ON a.county_name = b.county_name
        AND a.town_name != b.town_name
        AND a.village_name = b.village_match
        AND b.village_name is not null
        AND b.town_name in ('嘉定工业区','朱家角镇','香花桥街道','下溪街道','南岩街道','大石街道','社赓镇','葛仙山镇','沙雅县哈德墩镇','沙雅县塔河管理委员会')
        AND a.town_name in ('工业区','朱家角','香花桥','下溪镇','南岩镇','大石乡','社赓乡','葛仙山乡','哈德墩镇','塔河管理委员会')
SET a.village_code = b.village_code;


####################################### tbl_area_local 匹配区域编码 end ####################################################




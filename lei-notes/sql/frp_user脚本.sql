# 联表查询到市区镇村的信息
SELECT city.id          city_id,
       city.area_name   city_name,
       county.id        county_id,
       county.area_name county_name,
       town.id          town_id,
       town.name        town_name,
       village.id       village_id,
       village.name     village_name
FROM tbl_area_local village
         INNER JOIN tbl_area_local town ON village.parent_id = town.id
         INNER JOIN sys_area county ON town.parent_id = county.id
         INNER JOIN sys_area city ON county.parent_id = city.id;

@formatter:off
# frp_test 匹配中间操作
SELECT a.county_name,
       b.county_name,
       a.town_name,
       b.town_name,
       a.village_name,
       b.village_name,
       a.village_code,
       b.village_id
FROM frp_test.tbl_area_testc b
    INNER JOIN frp_test.tbl_area_all a
    ON  a.county_name = b.county_name
    AND a.town_name = b.town_name
    AND b.village_name LIKE CONCAT('',a.village_name,'%');
@formatter:off
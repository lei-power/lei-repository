DROP TABLE IF EXISTS scenic_spot;
CREATE TABLE scenic_spot
(
    id               bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    name             VARCHAR(64) COMMENT '景点名称',
    background_image VARCHAR(255) COMMENT '封面图',
    vr_url           VARCHAR(255) COMMENT 'vr',
    description      VARCHAR(512) COMMENT '简介',
    opening_time     VARCHAR(128) COMMENT '开放时间',
    entrance_ticke   VARCHAR(128) COMMENT '门票',
    tel              VARCHAR(64) COMMENT '联系电话',
    longitude        VARCHAR(64) COMMENT '经度',
    latitude         VARCHAR(64) COMMENT '维度',
    county_id        VARCHAR(64) COMMENT '区、县id',
    county_name      VARCHAR(64) COMMENT '区、县名称',
    town_id          VARCHAR(64) COMMENT '镇id',
    town_name        VARCHAR(64) COMMENT '镇名称',
    village_id       VARCHAR(64) COMMENT '村id',
    village_name     VARCHAR(64) COMMENT '村名称',
    show_flag        INT(1) COMMENT '显示标记',
    PRIMARY KEY (id)
) COMMENT = '景点';

DROP TABLE IF EXISTS travel_strategy;
CREATE TABLE travel_strategy
(
    id                BIGINT(20) COMMENT '主键',
    NAME              VARCHAR(255) COMMENT '名称',
    background_image  VARCHAR(255) COMMENT '封面',
    description_image DATETIME(255) COMMENT '长图',
    tel               VARCHAR(32) COMMENT '联系电话',
    best_time         VARCHAR(16) COMMENT '最佳时间',
    journey_days      INT(11) COMMENT '行程天数',
    pv                INT(11) COMMENT '浏览量',
    show_flag         INT(11) COMMENT '显示标记',
    type              INT(11) COMMENT '类型(1:半日游，2：一日游，3...)'
) COMMENT = '旅游攻略';
DROP TABLE IF EXISTS commercial_tenant;
CREATE TABLE commercial_tenant
(
    id                bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    name              VARCHAR(64) COMMENT '名称',
    background_image  VARCHAR(255) COMMENT '封面',
    per_cost          VARCHAR(32) COMMENT '人均消费',
    tel               VARCHAR(32) COMMENT '电话',
    type              int(11) COMMENT '类型，1：餐饮，2：酒店，3：农家',
    longitude         VARCHAR(255) COMMENT '经度',
    latitude          VARCHAR(255) COMMENT '维度',
    description_image VARCHAR(255) COMMENT '详情长图',
    pv                int(11) COMMENT '浏览量',
    show_flag         int(11) COMMENT '显示标记',
    county_id         VARCHAR(64) COMMENT '区、县id',
    county_name       VARCHAR(64) COMMENT '区、县名称',
    town_id           VARCHAR(64) COMMENT '镇id',
    town_name         VARCHAR(64) COMMENT '镇名称',
    village_id        VARCHAR(64) COMMENT '村id',
    village_name      VARCHAR(64) COMMENT '村名称',
    PRIMARY KEY (id)
) COMMENT = '商户';
DROP TABLE IF EXISTS village_farm_products;
CREATE TABLE village_farm_products
(
    id                bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    name              VARCHAR(64) COMMENT '名称',
    product_image     VARCHAR(255) COMMENT '产品图',
    description       VARCHAR(512) COMMENT '简介',
    description_image VARCHAR(255) COMMENT '简介长图',
    show_flag         int(11) COMMENT '显示标记',
    landmark_flag     int(11) COMMENT '地标标记',
    county_id         VARCHAR(64) COMMENT '区、县id',
    county_name       VARCHAR(64) COMMENT '区、县名称',
    town_id           VARCHAR(64) COMMENT '镇id',
    town_name         VARCHAR(64) COMMENT '镇名称',
    village_id        VARCHAR(64) COMMENT '村id',
    village_name      VARCHAR(64) COMMENT '村名称',
    PRIMARY KEY (id)
) COMMENT = '一村一品';
DROP TABLE IF EXISTS honor;
CREATE TABLE honor
(
    id                       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    name                     VARCHAR(255) COMMENT '',
    honor_time               VARCHAR(32) COMMENT '',
    Issued_by                VARCHAR(64) COMMENT '',
    village_farm_products_id bigint(20) COMMENT '',
    PRIMARY KEY (id)
) COMMENT = '获奖荣誉';
DROP TABLE IF EXISTS file;
CREATE TABLE file
(
    id          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    biz_id      bigint(20) COMMENT '业务主键id',
    biz_type    int(11) COMMENT '文件业务类型,哪个业务的文件',
    url         VARCHAR(255) COMMENT '文件路径',
    create_time DATETIME COMMENT '创建时间',
    PRIMARY KEY (id)
) COMMENT = '文件表';
DROP TABLE IF EXISTS village_farm_products_shop;
CREATE TABLE village_farm_products_shop
(
    id                       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    village_farm_products_id bigint(20) COMMENT '一村一品id',
    shop_id                  bigint(20) COMMENT '店铺id',
    PRIMARY KEY (id)
) COMMENT = '一村一品店铺关联表';
DROP TABLE IF EXISTS product;
CREATE TABLE product
(
    id                bigint(20) COMMENT '主键',
    name              VARCHAR(255) COMMENT '名称',
    price             VARCHAR(32) COMMENT '价格',
    description_image VARCHAR(255) COMMENT '详情图片',
    jd_url            VARCHAR(512) COMMENT '京东url',
    snkoudai_url      VARCHAR(255) COMMENT '神农口袋溯源url',
    shop_id           bigint(20) COMMENT '所属店铺',
    pv                int(11) COMMENT '浏览量',
    show_flag         int(11) COMMENT '显示标记',
    county_id         VARCHAR(64) COMMENT '区、县id',
    county_name       VARCHAR(64) COMMENT '区、县名称',
    town_id           VARCHAR(64) COMMENT '镇id',
    town_name         VARCHAR(64) COMMENT '镇名称',
    village_id        VARCHAR(64) COMMENT '村id',
    village_name      VARCHAR(64) COMMENT '村名称',
    brand_id          bigint(20) COMMENT '品牌id'
) COMMENT = '商品表';
DROP TABLE IF EXISTS product_type;
CREATE TABLE product_type
(
    id   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    name VARCHAR(32) COMMENT '名称',
    sort int(11) COMMENT '排序',
    PRIMARY KEY (id)
) COMMENT = '商品分类';
DROP TABLE IF EXISTS product_type_ref;
CREATE TABLE product_type_ref
(
    TENANT_ID       bigint(20) COMMENT '主键',
    product_type_id bigint(20) COMMENT '商品分类id',
    product_id      bigint(20) COMMENT '商品id'
) COMMENT = '商品分类关联表';
DROP TABLE IF EXISTS brand;
CREATE TABLE brand
(
    id                bigint(20) COMMENT '主键',
    name              VARCHAR(255) COMMENT '名称',
    brand_logo        VARCHAR(255) COMMENT '品牌logo',
    description       VARCHAR(512) COMMENT '简介',
    background_image  VARCHAR(255) COMMENT '封面图',
    description_image VARCHAR(512) COMMENT '详情长图',
    show_flag         int(11) COMMENT '显示标记'
) COMMENT = '品牌表';


DROP TABLE IF EXISTS shop;
CREATE TABLE shop
(
    id         bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    name       VARCHAR(64) COMMENT '名称',
    title      VARCHAR(64) COMMENT '口号',
    shop_image VARCHAR(255) COMMENT '店铺图片',
    jd_url     VARCHAR(255) COMMENT '京东店铺链接',
    show_flag  int(11) COMMENT '显示标记',
    tel        VARCHAR(64) COMMENT '电话',
    PRIMARY KEY (id)
) COMMENT = '店铺';
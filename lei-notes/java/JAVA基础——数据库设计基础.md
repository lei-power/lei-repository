#### 第一范式 1NF

1. 列是同一类型
2. 列名不重复
3. 列顺序不影响
4. 行顺序不影响
5. 每一行不能有重复记录
6. 列不可再分

#### 第二范式 2NF

非主属性（唯一性列）完全依赖于码（**谁是码？？可能是联合主键，那就可能不是完全依赖，部分依赖了**）
*第二范式依旧会有更新复杂，删除异常等问题*

#### 第三范式 3NF

非主属性既不不**部分依赖**、又不**传递依赖**于主键（可能联合主键）

```java
例如:
        A(primaryKey)-->B A(primaryKey)-->C B-->C(学院对应能对应宿舍)
```

P13 8:29

#### 表连接算法

##### nested loop 循环嵌套

小表驱动大表，小表遍历每一行去匹配，大表走索引的对应列，故 小表在左，大表列要建索引

##### hash join 哈希连接

两表匹配的列取哈希，放入内存*桶*里，缩小匹配范围

##### sort merge 排序合并

#### 冗余表会出现的问题

以学生号为主键（带有业务属性的麻烦）

1. 数据冗余太大，某个元素重复出现
2. 更新异常 更换系主任，需修改每个学生行
3. 插入异常 若一系无学生，没法存系的信息和系主任
4. 删除异常 删除了某系全部学生，导致该系消失了

#### 设计积累

1. 省市区 三级 省唯一，市区就不一定，所以市区叫做弱实体，上级叫做支撑实体 弱实体无法作为主键，需将支撑实体拿来一起用 例如：（安徽省） （安徽省合肥市） （安徽省合肥市包河区）

#### 订餐系统表语句留档

```sql
CREATE TABLE `tbl_address`
(
    `id`             BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `own_id`         BIGINT(20) NOT NULL COMMENT '地址所属人',
    `province_id`    VARCHAR(64) DEFAULT NULL COMMENT '所在省份id',
    `province_name`  VARCHAR(64) DEFAULT NULL COMMENT '所在省份名称',
    `city_id`        VARCHAR(64) DEFAULT NULL COMMENT '所在城市id',
    `city_name`      VARCHAR(64) DEFAULT NULL COMMENT '所在城市名称',
    `county_id`      VARCHAR(64) DEFAULT NULL COMMENT '区/县id',
    `county_name`    VARCHAR(64) DEFAULT NULL COMMENT '区/县名称',
    `town_id`        VARCHAR(64) DEFAULT NULL COMMENT '镇id',
    `town_name`      VARCHAR(64) DEFAULT NULL COMMENT '镇名称',
    `village_id`     VARCHAR(64) DEFAULT NULL COMMENT '村id',
    `village_name`   VARCHAR(64) DEFAULT NULL COMMENT '村名称',
    `community_id`   VARCHAR(64) DEFAULT NULL COMMENT '社区id',
    `community_name` VARCHAR(64) DEFAULT NULL COMMENT '社区名称',
    `detail_address` VARCHAR(64) DEFAULT NULL COMMENT '楼栋和门牌号',
    `delivery_flag`  TINYINT(2) NOT NULL DEFAULT 0 COMMENT '是否是餐馆送餐范围 0-否 1-是',
    `create_time`    datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime    DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_own_id` (`own_id`) USING BTREE
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '地址表';


CREATE TABLE `tbl_customer`
(
    `id`            BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `login_account` VARCHAR(64) DEFAULT NULL COMMENT '登录账号',
    `pass_word`     VARCHAR(64) DEFAULT NULL COMMENT '登录密码',
    `nick_name`     VARCHAR(64) DEFAULT NULL COMMENT '用户名',
    `gender`        TINYINT(2) DEFAULT NULL COMMENT '性别 0-男 1-女',
    `phone_number`  VARCHAR(20) DEFAULT NULL COMMENT '联系电话',
    `address_id`    BIGINT(20) NOT NULL COMMENT '用户当前地址',
    `create_time`   datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime    DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '顾客表';


CREATE TABLE `tbl_restaurant`
(
    `id`             BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `contact_person` VARCHAR(64)    DEFAULT NULL COMMENT '联系人',
    `order_number`   VARCHAR(20)    DEFAULT NULL COMMENT '订餐电话',
    `address_id`     BIGINT(20) NOT NULL COMMENT '餐厅地址',
    `delivery_scope` BIGINT(20) NOT NULL COMMENT '送餐范围（共用地址表，是否送餐范围标志）',
    `delivery_rate`  VARCHAR(64)    DEFAULT NULL COMMENT '送餐收费标准',
    `payment_type`   VARCHAR(64)    DEFAULT NULL COMMENT '支付方式，多种的话逗号分割',
    `discount`       DECIMAL(16, 2) DEFAULT 1.00 NOT NULL COMMENT '优惠活动，默认不打折',
    `create_time`    datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '餐厅表';


CREATE TABLE `tbl_menu`
(
    `id`           BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `dish_name`    VARCHAR(64)    DEFAULT NULL COMMENT '菜名',
    `cuisine_id`   BIGINT(20) DEFAULT NULL COMMENT '菜系id 1-xxx,2-xxx,3-xxx,...8-xxx',
    `cuisine_name` VARCHAR(64)    DEFAULT NULL COMMENT '菜系名',
    `photo_urls`   TEXT           DEFAULT NULL COMMENT '菜品图片，多张的话逗号分割',
    `detail`       VARCHAR(255)   DEFAULT NULL COMMENT '菜品介绍',
    `dish_price`   DECIMAL(16, 2) DEFAULT 0.00 NOT NULL COMMENT '菜品价格',
    `create_time`  datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`  datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '菜单字典表';


CREATE TABLE `tbl_deliveryman`
(
    `id`               BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `deliveryman_name` VARCHAR(64)    DEFAULT NULL COMMENT '送餐员姓名',
    `cuisine_id`       BIGINT(20) DEFAULT NULL COMMENT '菜系id 1-xxx,2-xxx,3-xxx,...8-xxx',
    `cuisine_name`     VARCHAR(64)    DEFAULT NULL COMMENT '菜系名',
    `photo_urls`       TEXT           DEFAULT NULL COMMENT '菜品图片，多张的话逗号分割',
    `detail`           VARCHAR(255)   DEFAULT NULL COMMENT '菜品介绍',
    `dish_price`       DECIMAL(16, 2) DEFAULT 0.00 NOT NULL COMMENT '菜品价格',
    `create_time`      datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '送餐员表';
```


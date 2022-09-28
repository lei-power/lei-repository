#### 查询表结构，注释，字段
```mysql
-- 查询表结构，注释，字段
SELECT b.*,a.`字段名`,a.`字段注释` FROM 
( SELECT TABLE_NAME 表名, COLUMN_NAME 字段名, COLUMN_COMMENT 字段注释 FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = 'gmall_user' ) 
AS a
LEFT JOIN 
( SELECT TABLE_NAME 表名, TABLE_COMMENT 表注释 FROM information_schema.`TABLES` WHERE TABLE_SCHEMA = 'gmall_user' ) 
AS b 
ON a.表名 = b.表名
```
```mysql
SELECT  CONCAT(b.`表名`,' : ',b.`表注释`),CONCAT(a.`字段名`,' : ',a.`字段注释`)
FROM 
( SELECT TABLE_NAME 表名, COLUMN_NAME 字段名, COLUMN_COMMENT 字段注释 FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = 'test' ) 
AS a
LEFT JOIN 
( SELECT TABLE_NAME 表名, TABLE_COMMENT 表注释 FROM information_schema.`TABLES` WHERE TABLE_SCHEMA = 'test' ) 
AS b 
ON a.表名 = b.表名
```



```sql
SELECT  CONCAT(c.a,'\r\n',c.b) 
FROM
(SELECT	test.`表名` a,GROUP_CONCAT(test.`字段名` separator '\r\n') b

 FROM
(SELECT  CONCAT(b.`表名`,' : ',b.`表注释`) `表名`,CONCAT(a.`字段名`,' : ',a.`字段注释`) 字段名
FROM 
( SELECT TABLE_NAME 表名, COLUMN_NAME 字段名, COLUMN_COMMENT 字段注释 FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = 'backup' ) 
AS a
LEFT JOIN 
( SELECT TABLE_NAME 表名, TABLE_COMMENT 表注释 FROM information_schema.`TABLES` WHERE TABLE_SCHEMA = 'backup' ) 
AS b 
ON a.表名 = b.表名)test
GROUP BY test.`表名`) c
```
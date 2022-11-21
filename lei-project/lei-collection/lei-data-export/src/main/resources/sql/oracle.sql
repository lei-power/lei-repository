SELECT
    B.COLUMN_NAME,
    B.DATA_TYPE,
    B.DATA_LENGTH,
    B.DATA_PRECISION,
    B.DATA_SCALE,
    B.NULLABLE,
    B.DATA_DEFAULT,
    A.COMMENTS
FROM
    ALL_COL_COMMENTS A,
    ALL_TAB_COLUMNS B,
    ALL_TAB_COMMENTS C
WHERE 1=1
  AND A.TABLE_NAME IN (SELECT U.TABLE_NAME FROM USER_ALL_TABLES U)
  AND A.OWNER = B.OWNER
  AND A.TABLE_NAME = B.TABLE_NAME
  AND A.COLUMN_NAME = B.COLUMN_NAME
  AND C.TABLE_NAME = A.TABLE_NAME
  AND C.OWNER = A.OWNER
  AND A.OWNER = UPPER(?) --其中xxx_db_name为DB用户名
  AND A.TABLE_NAME = ? --xxx_table_name为表名称
ORDER BY A.TABLE_NAME, B.COLUMN_ID
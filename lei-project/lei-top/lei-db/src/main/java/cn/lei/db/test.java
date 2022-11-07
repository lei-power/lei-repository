package cn.lei.db;

import cn.hutool.db.Db;
import cn.hutool.db.Entity;
import cn.hutool.db.ds.DSFactory;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

/***
 *@author wanglei
 *@Date 2022/11/7 23:05
 ***/


public class test {

    public static void main(String[] args) throws SQLException {
        List<Entity> sqlLite = Db.use().query("select * from test where id=?", 1);

        List<Entity> mysql_testc = Db.use("mysql_testc").query("SELECT * FROM `sys_area` WHERE id=?", 110000);

//        List<Entity> entityList = Db.use("sqlserver").query("SELECT * FROM [sde].[TBL_XINJIANG_AKESU_LUNKUO] WHERE OBJECTID=?", 1);


        DataSource ds = DSFactory.get("sqlserver");

        Db db = Db.use(ds);
        List<Entity> query = db.query("SELECT * FROM [sde].[TBL_XINJIANG_AKESU_LUNKUO] WHERE OBJECTID=?", 1);

        System.err.println(query);
    }
}

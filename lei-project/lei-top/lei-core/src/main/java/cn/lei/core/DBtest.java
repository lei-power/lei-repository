package cn.lei.core;

import cn.hutool.db.Db;
import cn.hutool.db.Entity;
import java.sql.SQLException;
import java.util.List;

/***
 *@author wanglei
 *@Date 2022/11/7 17:38
 ***/


public class DBtest {

    public static void main(String[] args) throws SQLException {

        List<Entity> query = Db.use().query("select * from tbl_area_local_temp where id=?", 1);
        System.err.println(query);
    }
}

package cn.lei.core.entity;

import cn.hutool.db.Db;
import cn.hutool.db.DbUtil;
import cn.hutool.db.Entity;
import java.util.List;
import javax.sql.DataSource;
import lombok.SneakyThrows;

/***
 *@author wanglei
 *@Date 2022/11/8 15:35
 ***/


public class ConTest {

    @SneakyThrows
    public void snkdGenFlow() {
        //1.读取classPath的配置文件
        List<Entity> sqlserver = Db.use("sqlserver").query("SELECT * FROM TBL_GISFARM_YANGZHIYE WHERE farm_id >?", 1);
        DataSource mysql_local = DbUtil.getDs("mysql_local");
        List<Entity> query2 = Db.use("mysql_testc").query("select * from tbl_area_local where id >?", 1);

        //2.调用数据库查询信息
        System.err.println(query2);

        //生成代码

    }

    public static void main(String[] args) {
        System.err.println("dfsdf");
        new ConTest().snkdGenFlow();
    }
}

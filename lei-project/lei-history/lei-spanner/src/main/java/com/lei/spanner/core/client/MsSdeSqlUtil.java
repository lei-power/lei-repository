package com.lei.spanner.core.client;

import com.lei.spanner.core.base.model.ConfigContext;
import com.lei.spanner.core.base.model.DBHelper;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/***
 *@author wanglei
 *@Date 2022/11/4 18:09
 ***/

@Slf4j
@Component
public class MsSdeSqlUtil {

    @Value("${dbhelp.mssql.sde.url}")
    private String url;
    @Value("${dbhelp.mssql.sde.driver}")
    private String driver;
    @Value("${dbhelp.mssql.sde.username}")
    private String username;
    @Value("${dbhelp.mssql.sde.password}")
    private String password;
    @Value("${dbhelp.mssql.sde.prefix}")
    private String prefix;

    public List<Map<String, Object>> queryBySql(String sql) {
        ConfigContext configContext = new ConfigContext();
        configContext.setDriver(driver);
        configContext.setUrl(url);
        configContext.setUserName(username);
        configContext.setPassword(password);

        //初始化DB工具类
        DBHelper dbHelper = new DBHelper(configContext);

        //得到数据库表的元数据
        log.info("发送请求的sql：", sql);
        List<Map<String, Object>> maps = dbHelper.queryMapList(sql, null);
        log.info(sql);
        return maps;
    }
}
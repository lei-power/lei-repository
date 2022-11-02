package com.lei.spanner.core.util;

import com.alibaba.fastjson.JSON;
import com.lei.spanner.core.base.model.ColumnDefinition;
import com.lei.spanner.core.base.model.ColumnHelper;
import com.lei.spanner.core.base.model.ConfigContext;
import com.lei.spanner.core.base.model.DBHelper;
import com.lei.spanner.core.base.model.EntityService;
import com.lei.spanner.entity.req.GenCodeSnkoudaiReq;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;


/***
 *@author wanglei
 *@Date 2022/11/2 20:13
 ***/

@Component
@Slf4j
public class SnkdGenUtil {

    private final static String dirver = "com.mysql.cj.jdbc.Driver";
    private final static String password = "root";
    private final static String userName = "root";
    private final static String url = "jdbc:mysql://192.168.200.128:3306/backup?serverTimezone=UTC";
    private final static String outputPath = "D:\\GenFiles";


    public void snkdGen(List<GenCodeSnkoudaiReq> reqList) {
        if (reqList != null && reqList.size() > 0) {
            for (GenCodeSnkoudaiReq req : reqList) {
                log.info("==============================开始生成：{}===================================", JSON.toJSONString(req));
                //得到配置文件对象
                ConfigContext configContext = new ConfigContext();
                configContext.setDriver(dirver);
                configContext.setUrl(url);
                configContext.setUserName(userName);
                configContext.setPassword(password);
                configContext.setOutputPath(outputPath);

                configContext.setTargetTable(req.getTableName());
                configContext.setTargetName(req.getFileName());
                configContext.setTargetPackage(req.getPackageName());

                //初始化DB工具类
                DBHelper dbHelper = new DBHelper(configContext);

                //得到数据库表的元数据
                List<Map<String, Object>> resultList = dbHelper.descTable();
                System.out.println("resultList:" + resultList);

                //元数据处理
                List<ColumnDefinition> columnDefinitionList = ColumnHelper.covertColumnDefinition(resultList);

                System.out.println("columnDefinitionList:" + columnDefinitionList);
                //生成代码
                EntityService.doGenerator(configContext, columnDefinitionList, null);
                log.info("========================生成结束===================================");
            }
        }

    }

    public static void main(String[] args) {
        SnkdGenUtil snkdGenUtil = new SnkdGenUtil();
        snkdGenUtil.snkdGen(null);
    }
}




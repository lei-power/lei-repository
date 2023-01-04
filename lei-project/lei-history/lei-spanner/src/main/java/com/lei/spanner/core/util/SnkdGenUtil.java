package com.lei.spanner.core.util;

import com.alibaba.fastjson.JSON;
import com.lei.spanner.core.base.model.Callback;
import com.lei.spanner.core.base.model.ColumnDefinition;
import com.lei.spanner.core.base.model.ColumnHelper;
import com.lei.spanner.core.base.model.ConfigContext;
import com.lei.spanner.core.base.model.DBHelper;
import com.lei.spanner.core.base.model.EntityService;
import com.lei.spanner.entity.req.GenCodeSnkoudaiReq;
import java.util.Date;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.VelocityContext;
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
    private final static String outputPath = "D:\\GenFiles\\";


    public void snkdGen(List<GenCodeSnkoudaiReq> reqList) {
        if (reqList != null && reqList.size() > 0) {
            for (GenCodeSnkoudaiReq req : reqList) {
                log.info("==============================开始生成：{}===================================", JSON.toJSONString(req));
                //得到配置文件对象
                String time = "_" + DateTimeUtils.convertDate2String(new Date(), DateTimeUtils.YYYY_MM_DD) + "\\";

                ConfigContext configContext = new ConfigContext();
                configContext.setDriver(dirver);
                configContext.setUrl(url);
                configContext.setUserName(userName);
                configContext.setPassword(password);
                configContext.setOutputPath(outputPath + "snkdgen" + time);

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
                EntityService.doGenerator(configContext, columnDefinitionList, new Callback() {
                    public void write(ConfigContext configContext, VelocityContext context) {

                        String name = String.format("%s", configContext.getTargetName());
                        name = name.substring(0, 1).toLowerCase() + name.substring(1);

                        FileUtil.writeFile(configContext.getOutputPath() + "po/",                   //输出目录
                                String.format("%s.java", configContext.getTargetName()),    //文件名
                                VelocityUtil.render("entity.vm", context));                 //模板生成内容

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "manage/", String.format("%sManage.java", configContext.getTargetName()), VelocityUtil.render("manage.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "mapper/", String.format("%sMapper.java", configContext.getTargetName()), VelocityUtil.render("mapper.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "mapper/", String.format("%sMapper.xml", configContext.getTargetName()), VelocityUtil.render("xml.vm", context));

                        //                FileUtil.writeFile(configContext.getOutputPath(),
                        //                        String.format("Co%sVO.java",configContext.getTargetName()),
                        //                        VelocityUtil.render("vo_co.vm", context));
                        //
                        //                FileUtil.writeFile(configContext.getOutputPath(),
                        //                        String.format("Admin%sVO.java",configContext.getTargetName()),
                        //                        VelocityUtil.render("vo_admin.vm", context));
                        //
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/vo/"
                                + name.toLowerCase(), String.format("Gov%sVO.java", configContext.getTargetName()), VelocityUtil.render("vo_gov.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "transfer/", String.format("Trans.java", configContext.getTargetName()), VelocityUtil.render("transfer.vm", context));
                        //                FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/req/" + name,
                        //                        String.format("Gov%sStatisticByAreaReq.java", configContext.getTargetName()),
                        //                        VelocityUtil.render("Govreq_statistic.vm", context));
                        //                FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/req/" + name,
                        //                        String.format("Gov%sListByAreaReq.java", configContext.getTargetName()),
                        //                        VelocityUtil.render("Govreq_list.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "biz/gov/controller/", String.format("Gov%sController.java", configContext.getTargetName()), VelocityUtil.render("Govcontroller.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "biz/gov/service/", String.format("Gov%sService.java", configContext.getTargetName()), VelocityUtil.render("Govservice.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/req/"
                                + name.toLowerCase(), String.format("Gov%sListReq.java", configContext.getTargetName()), VelocityUtil.render("req_list.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/req/"
                                + name.toLowerCase(), String.format("Gov%sGetReq.java", configContext.getTargetName()), VelocityUtil.render("req_get.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/req/"
                                + name.toLowerCase(), String.format("Gov%sAddReq.java", configContext.getTargetName()), VelocityUtil.render("req_add.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/req/"
                                + name.toLowerCase(), String.format("Gov%sEditReq.java", configContext.getTargetName()), VelocityUtil.render("req_edit.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/req/"
                                + name.toLowerCase(), String.format("Gov%sDelReq.java", configContext.getTargetName()), VelocityUtil.render("req_del.vm", context));
                        //创建admin相关文件
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "admin/", String.format("Admin%sController.java", configContext.getTargetName()), VelocityUtil.render("admincontroller.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "admin/", String.format("Admin%sService.java", configContext.getTargetName()), VelocityUtil.render("adminservice.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "admin/", String.format("Admin%sListReq.java", configContext.getTargetName()), VelocityUtil.render("adminreq_list.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "admin/", String.format("Admin%sGetReq.java", configContext.getTargetName()), VelocityUtil.render("adminreq_get.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "admin/", String.format("Admin%sAddReq.java", configContext.getTargetName()), VelocityUtil.render("adminreq_add.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "admin/", String.format("Admin%sEditReq.java", configContext.getTargetName()), VelocityUtil.render("adminreq_edit.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "admin/", String.format("Admin%sDelReq.java", configContext.getTargetName()), VelocityUtil.render("adminreq_del.vm", context));

                        //co

                        FileUtil.writeFile(configContext.getOutputPath() + "biz/co/model/vo/"
                                + name.toLowerCase(), String.format("Co%sVO.java", configContext.getTargetName()), VelocityUtil.render("vo_co.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "transfer/", String.format("Trans.java", configContext.getTargetName()), VelocityUtil.render("transfer.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "biz/co/controller/", String.format("Co%sController.java", configContext.getTargetName()), VelocityUtil.render("CoController.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "biz/co/service/", String.format("Co%sService.java", configContext.getTargetName()), VelocityUtil.render("COService.vm", context));

                        FileUtil.writeFile(configContext.getOutputPath() + "biz/co/model/req/"
                                + name.toLowerCase(), String.format("Co%sListReq.java", configContext.getTargetName()), VelocityUtil.render("co_req_list.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/co/model/req/"
                                + name.toLowerCase(), String.format("Co%sGetReq.java", configContext.getTargetName()), VelocityUtil.render("co_req_get.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/co/model/req/"
                                + name.toLowerCase(), String.format("Co%sAddReq.java", configContext.getTargetName()), VelocityUtil.render("co_req_add.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/co/model/req/"
                                + name.toLowerCase(), String.format("Co%sEditReq.java", configContext.getTargetName()), VelocityUtil.render("co_req_edit.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath() + "biz/co/model/req/"
                                + name.toLowerCase(), String.format("Co%sDelReq.java", configContext.getTargetName()), VelocityUtil.render("co_req_del.vm", context));

                        System.err.println();
                    }
                });
                log.info("========================生成结束===================================");
            }
        }

    }


    public void spannerGen(List<GenCodeSnkoudaiReq> reqList) {
        if (reqList != null && reqList.size() > 0) {
            for (GenCodeSnkoudaiReq req : reqList) {
                log.info("==============================开始生成：{}===================================", JSON.toJSONString(req));
                //得到配置文件对象
                String time = "_" + DateTimeUtils.convertDate2String(new Date(), DateTimeUtils.YYYY_MM_DD) + "\\";

                ConfigContext configContext = new ConfigContext();
                configContext.setDriver(dirver);
                configContext.setUrl(url);
                configContext.setUserName(userName);
                configContext.setPassword(password);
                configContext.setOutputPath(outputPath + "spannergen" + time);

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
                EntityService.doGenerator(configContext, columnDefinitionList, new Callback() {
                    public void write(ConfigContext configContext, VelocityContext context) {

                        String name = String.format("%s", configContext.getTargetName());
                        name = name.substring(0, 1).toLowerCase() + name.substring(1);

                        FileUtil.writeFile(configContext.getOutputPath() + "entity/po/",           //输出目录
                                String.format("%s.java", configContext.getTargetName()),    //文件名
                                VelocityUtil.render("entity.vm", context));                 //模板生成内容

                        FileUtil.writeFile(configContext.getOutputPath()
                                + "service/", String.format("%sService.java", configContext.getTargetName()), VelocityUtil.render("service.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "mapper/", String.format("%sMapper.java", configContext.getTargetName()), VelocityUtil.render("mapper.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "mapper/", String.format("%sMapper.xml", configContext.getTargetName()), VelocityUtil.render("xml.vm", context));
                        FileUtil.writeFile(configContext.getOutputPath()
                                + "entity/req/", String.format("%sReq.java", configContext.getTargetName()), VelocityUtil.render("req_add.vm", context));

                        System.err.println();
                    }
                });
                log.info("========================生成结束===================================");
            }
        }
    }
}




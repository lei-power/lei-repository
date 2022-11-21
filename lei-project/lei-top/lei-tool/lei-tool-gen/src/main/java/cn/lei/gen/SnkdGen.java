package cn.lei.gen;


import cn.hutool.core.io.file.FileReader;
import cn.hutool.db.DbUtil;
import cn.hutool.db.meta.MetaUtil;
import cn.lei.core.util.FileUtil;
import cn.lei.gen.entity.Callback;
import cn.lei.gen.entity.ColumnDefinition;
import cn.lei.gen.entity.ColumnHelper;
import cn.lei.gen.entity.ConfigContext;
import cn.lei.gen.entity.EntityService;
import cn.lei.gen.entity.VelocityUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.sql.DataSource;
import lombok.Data;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.velocity.VelocityContext;

/***
 *@author wanglei
 *@Date 2022/11/8 1:53
 ***/

@Data
@Slf4j
public class SnkdGen {

    @SneakyThrows
    public void snkdGenFlow() {
        //1.读取classPath的配置文件
        //写死从本地库里取数据
        DataSource mysql_lcoal = DbUtil.getDs("mysql_testc");
        List<Map<String, String>> sources = getSources();

        for (Map<String, String> source : sources) {
            String tableName = source.get("tableName");
            String fileName = source.get("fileName");
            String packageName = source.get("packageName");
            log.info("========================开始生成表{}===================================",tableName);

            //得到数据库表的元数据
            List<Map<String, Object>> resultList = MetaUtil.getTableMeta(mysql_lcoal, tableName).getColumns().stream().map(temp -> {
                Map<String, Object> row = new HashMap<>();
                row.put("Field", temp.getName());
                row.put("Type", temp.getTypeName());
                row.put("Comment", temp.getComment());
                return row;
            }).collect(Collectors.toList());
            //元数据处理
            List<ColumnDefinition> columnDefinitionList = ColumnHelper.covertColumnDefinition(resultList);

            System.out.println("columnDefinitionList:" + columnDefinitionList);
            //生成代码
            ConfigContext configContext = new ConfigContext();
            configContext.setOutputPath(cn.hutool.core.io.FileUtil.getAbsolutePath("/snkd_gen")+"/");
            configContext.setSourcePath(cn.hutool.core.io.FileUtil.getAbsolutePath("snkd_vm"));
            configContext.setTargetName(fileName);
            configContext.setTargetTable(tableName);
            configContext.setTargetPackage(packageName);

            snkdGen(configContext, columnDefinitionList);
        }

        log.error("========================生成结束===================================");

    }

    private List<Map<String, String>> getSources() {
        FileReader fileReader = FileReader.create(cn.hutool.core.io.FileUtil.file("classpath:table_source.csv"));
        log.info("========================读取源信息{}===================================",fileReader.readLines());
        //读取的文件逗号分割，按顺序为tableName，fileName,packageName
        List<Map<String, String>> mapList = fileReader.readLines().stream().map(str -> {
            String[] split = StringUtils.split(str, ",");
            HashMap<String, String> source = new HashMap<>();
            source.put("tableName", split[0]);
            source.put("fileName", split[1]);
            source.put("packageName", split[2]);
            return source;
        }).collect(Collectors.toList());
        return mapList;
    }

    private void snkdGen(ConfigContext configContext, List<ColumnDefinition> columnDefinitionList) {
        //生成代码
        EntityService.doGenerator(configContext, columnDefinitionList, new Callback() {
            public void write(ConfigContext configContext, VelocityContext context) {

                String name = String.format("%s", configContext.getTargetName());
                name = name.substring(0, 1).toLowerCase() + name.substring(1);

                FileUtil.writeFile(configContext.getOutputPath() + "po/",           //输出目录
                        String.format("%s.java", configContext.getTargetName()),    //文件名
                        VelocityUtil.render("entity.vm", context));                 //模板生成内容

                FileUtil.writeFile(configContext.getOutputPath()
                        + "manage/", String.format("%sManage.java", configContext.getTargetName()), VelocityUtil.render("manage.vm", context));

                FileUtil.writeFile(configContext.getOutputPath()
                        + "mapper/", String.format("%sMapper.java", configContext.getTargetName()), VelocityUtil.render("mapper.vm", context));

                FileUtil.writeFile(configContext.getOutputPath()
                        + "mapper/", String.format("%sMapper.xml", configContext.getTargetName()), VelocityUtil.render("xml.vm", context));

                FileUtil.writeFile(configContext.getOutputPath() + "biz/gov/model/vo/"
                        + name.toLowerCase(), String.format("Gov%sVO.java", configContext.getTargetName()), VelocityUtil.render("vo_gov.vm", context));
                FileUtil.writeFile(configContext.getOutputPath()
                        + "transfer/", String.format("Trans.java", configContext.getTargetName()), VelocityUtil.render("transfer.vm", context));
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
            }
        });
    }


    public static void main(String[] args) {
        new SnkdGen().snkdGenFlow();
    }
}
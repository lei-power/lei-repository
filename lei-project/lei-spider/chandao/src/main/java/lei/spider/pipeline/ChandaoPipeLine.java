//package lei.spider.pipeline;
//
//import java.io.FileWriter;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//import java.util.Map;
//import lei.spider.processor.ChandaoProcessor;
//import lombok.Data;
//import org.apache.commons.codec.digest.DigestUtils;
//import org.apache.commons.lang3.builder.ToStringBuilder;
//import us.codecraft.webmagic.ResultItems;
//import us.codecraft.webmagic.Spider;
//import us.codecraft.webmagic.Task;
//import us.codecraft.webmagic.model.HasKey;
//import us.codecraft.webmagic.pipeline.Pipeline;
//
///***
// *@author wanglei
// *@Date 2022/10/31 17:16
// ***/
//
//@Data
//public class ChandaoPipeLine implements Pipeline {
//
//    @Override
//    public void process(ResultItems resultItems, Task task) {
//        Map<String, Object> result = resultItems.getAll();
//
//        List<String> titleList = (List<String>) result.get("titleList");
//        String titleLicontentst = (String) result.get("content");
//        List<String> fujainList = (List<String>) result.get("fujainList");
//
//        try {
//            String filename;
//            if (o instanceof HasKey) {
//                filename = path + ((HasKey) o).key() + ".html";
//            }
//            else {
//                filename = path + DigestUtils.md5Hex(ToStringBuilder.reflectionToString(o)) + ".html";
//            }
//            PrintWriter printWriter = new PrintWriter(new FileWriter(getFile(filename)));
//            printWriter.write(ToStringBuilder.reflectionToString(o));
//            printWriter.close();
//        }
//        catch (IOException e) {
//        }
//        for (String title : titleList) {
//            Spider.create(new ChandaoProcessor()).addUrl("http://chandao.freetek.cc/zentao/doc-objectLibs-custom-0-37-330.html").addPipeline(new ChandaoPipeLine()).thread(1).run();
//
//        }
//
//    }
//}

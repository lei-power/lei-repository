package cn.lei.spider.pipeline;

import cn.lei.spider.model.ChanDaoTree;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.text.StrBuilder;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;
import us.codecraft.webmagic.utils.FilePersistentBase;

/***
 *@author wanglei
 *@Date 2022/10/31 17:16
 ***/

@Data
@Slf4j
public class ChandaoPipeLine extends FilePersistentBase implements Pipeline {

    @Override
    public void process(ResultItems resultItems, Task task) {
        Map<String, Object> result = resultItems.getAll();

        String content = (String) result.get("content");
        List<String> fujainList = (List<String>) result.get("fujainList");
        ChanDaoTree chanDaoTree = (ChanDaoTree) result.get("chanDaoTree");
        String path = System.getProperty("user.dir") + "lei-project/lei-top/lei-tool/lei-tool-spider/target/chandao/";

        if (chanDaoTree != null) {
            try {
                PrintWriter printWriter = new PrintWriter(new FileWriter(this.getFile(path + this.getFile(chanDaoTree.getPath() + ".html"))));
                StrBuilder strBuilder = new StrBuilder(
                        "<!DOCTYPE html>\n" + "<html lang=\"en\">\n" + "<head>\n" + "  <meta charset=\"UTF-8\">\n" + "  <title>" + chanDaoTree.getName()
                                + "</title>\n" + "</head> <body>");
                strBuilder.append(content).append("</body>\n" + "</html>");
                printWriter.write(strBuilder.toString());
                printWriter.close();
            } catch (IOException var5) {
                log.error(path + resultItems.getRequest().getUrl() + ".json" + "写入错误！！！");
            }
        }


    }
}

package cn.lei.spider.pipeline;

import cn.lei.spider.model.ChanDaoTree;
import com.alibaba.fastjson.JSON;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;
import us.codecraft.webmagic.utils.FilePersistentBase;

/***
 *@author wanglei
 *@Date 2022/11/1 2:12
 ***/

@Data
@Slf4j
public class ChandaoIndexPipeLine extends FilePersistentBase implements Pipeline {

    @Override
    public void process(ResultItems resultItems, Task task) {
        String path = System.getProperty("user.dir") + "\\lei-project\\lei-spider\\chandao\\target\\chandaoindex\\";
        try {
            PrintWriter printWriter = new PrintWriter(new FileWriter(this.getFile(path + UUID.randomUUID() +"-chandaoindex.json")));

            Map<String, Object> itemsAll = resultItems.getAll();
            List<ChanDaoTree> tree = (List<ChanDaoTree>) itemsAll.get("tree");
            printWriter.write(JSON.toJSONString(tree));
            printWriter.close();
        }
        catch (IOException var5) {
            log.error(path + resultItems.getRequest().getUrl() + ".json" + "写入错误！！！");
        }

    }
}


package lei.spider.processor;

import com.alibaba.fastjson.JSON;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import lei.spider.model.ChanDaoTree;
import lei.spider.pipeline.ChandaoPipeLine;
import lombok.SneakyThrows;
import org.springframework.beans.BeanUtils;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;

/***
 *@author wanglei
 *@Date 2022/10/28 17:55
 ***/

public class ChandaoProcessor implements PageProcessor {

    private Site site = Site.me().setRetryTimes(3).setSleepTime(100).addCookie("Cookie", "lang=zh-cn; device=desktop; theme=default; preProductID=1; preBranch=0; keepLogin=on; za=wanglei; lastProject=51; lastDocModule=417; storyPreExecutionID=116; goback=%7B%22doc%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-387.html%22%7D; tab=doc; zentaosid=g2sm4gupl0o03sdrfpub4vl5j7; zp=ae27bc084fe6648f0f12c70b6c11a63979356f1f; windowWidth=1920; windowHeight=333").setUserAgent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36");

    private static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
        Set<Object> seen = ConcurrentHashMap.newKeySet();
        return t -> seen.add(keyExtractor.apply(t));
    }


    @SneakyThrows
    @Override
    public void process(Page page) {

        String path = System.getProperty("user.dir") + "\\lei-project\\lei-spider\\chandao\\target\\chandaoindex\\";
        File[] files = new File(path).listFiles();
        List<ChanDaoTree> tree = new ArrayList<>();
        for (File file : files) {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String currentLine = reader.readLine();
            List<ChanDaoTree> parse = JSON.parseArray(currentLine, ChanDaoTree.class);
            tree.addAll(parse);
            reader.close();
        }
        List<ChanDaoTree> treeList = tree.stream().filter(distinctByKey(ChanDaoTree::getHref)).collect(Collectors.toList());
        ChanDaoTree daoTree = new ChanDaoTree();
        String url = page.getUrl().get();
        for (ChanDaoTree chanDaoTree : treeList) {
            if (url.equals(chanDaoTree.getHref())) {
                BeanUtils.copyProperties(chanDaoTree, daoTree);
            }
        }
        Selectable custom = page.getHtml();

        //正文
        String content = custom.xpath("//div[@class='table-row']").get();
        //附件
        List<String> fujainList = custom.xpath("//div[@class='detail-content']/ul").all();

        page.putField("content", content);
        page.putField("fujainList", fujainList);
        page.putField("chanDaoTree", daoTree);
        //创建目录

        page.addTargetRequests(tree.stream().map(ChanDaoTree::getHref).collect(Collectors.toList()));
    }

    @Override
    public Site getSite() {
        return site;
    }

    public static void main(String[] args) {
        Spider.create(new ChandaoProcessor()).addUrl("http://chandao.freetek.cc/zentao/doc-tablecontents-custom-0-37.html").addPipeline(new ChandaoPipeLine()).thread(1).run();
    }

}

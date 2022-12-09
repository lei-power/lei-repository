package cn.lei.spider.processor;

import cn.hutool.core.bean.BeanUtil;
import cn.lei.spider.model.ChanDaoTree;
import cn.lei.spider.pipeline.ChandaoPipeLine;
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
import lombok.SneakyThrows;
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

    private Site site = Site.me().setRetryTimes(3).setSleepTime(100)
                            .addCookie("Cookie", "lang=zh-cn; device=desktop; keepLogin=on; za=wanglei; theme=default; checkedItem=; preProductID=10; docFilesViewType=card; lastDocModule=417; goback=%7B%22qa%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fbug-browse-4-0-unclosed-0-openedBy_asc-43-20.html%22%2C%22doc%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-388.html%3Ftid%3Dqefoq8tq%23app%3Ddoc%22%2C%22execution%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fbug-view-4432.html%3Ftid%3D9un8fb32%23app%3Dexecution%22%2C%22project%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-219.html%22%7D; preBranch=24; zentaosid=e2ab29bd482ff7e061970c67675aaddd; zp=33758e4bb789be91b2c48563d132af78d984fd01; tab=doc; windowWidth=1920; windowHeight=977");

    private static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
        Set<Object> seen = ConcurrentHashMap.newKeySet();
        return t -> seen.add(keyExtractor.apply(t));
    }


    @SneakyThrows
    @Override
    public void process(Page page) {

        String path = System.getProperty("user.dir") + "/lei-project/lei-top/lei-tool/lei-tool-spider/target/chandao/";
        File[] files = new File(path).listFiles();
        List<ChanDaoTree> tree = new ArrayList<>();
        for (File file : files) {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String currentLine = reader.readLine();
            List<ChanDaoTree> parse = JSON.parseArray(currentLine, ChanDaoTree.class);
            tree.addAll(parse);
            reader.close();
        }
        List<ChanDaoTree> treeList = tree.stream().filter(distinctByKey(ChanDaoTree::getHref))
                                         .collect(Collectors.toList());
        ChanDaoTree daoTree = new ChanDaoTree();
        String url = page.getUrl().get();
        for (ChanDaoTree chanDaoTree : treeList) {
            if (url.equals(chanDaoTree.getHref())) {
                BeanUtil.copyProperties(chanDaoTree, daoTree);
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
        System.err.println(System.getProperty("user.dir"));
        Spider.create(new ChandaoProcessor())
              .addUrl("http://chandao.freetek.cc/zentao/doc-tablecontents-custom-0-37.html")
              .addPipeline(new ChandaoPipeLine()).thread(10).run();
    }
}

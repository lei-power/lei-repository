package cn.lei.spider.processor.chandao;

import cn.lei.spider.model.ChanDaoTree;
import cn.lei.spider.pipeline.ChandaoIndexPipeLine;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;

/***
 *@author wanglei
 *@Date 2022/10/28 17:55
 ***/

public class ChandaoIndexProcessor implements PageProcessor {

    private Site site = Site.me().setRetryTimes(3).setSleepTime(100)
                            .addCookie("Cookie", "lang=zh-cn; device=desktop; keepLogin=on; za=wanglei; theme=default; docFilesViewType=card; lastDocModule=417; lastProject=130; preExecutionID=131; storyPreExecutionID=131; goback=%7B%22qa%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fbug-browse-4-0-unclosed-0-openedBy_asc-43-20.html%22%2C%22doc%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-483.html%3Ftid%3Dlqrwpwmw%23app%3Ddoc%22%2C%22execution%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fbug-view-4432.html%3Ftid%3D9un8fb32%23app%3Dexecution%22%2C%22project%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-219.html%22%7D; preProductID=26; preBranch=all; zentaosid=e1d4121b40c993a85c70decb0e6adee9; zp=740910f93d64ce3dd06225ded0690c5e9e99b2ca; tab=doc; windowWidth=1920; windowHeight=977")
                            .setUserAgent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36");


    @Override
    public void process(Page page) {

        Selectable custom = page.getHtml();
        //目录
        String title = StringUtils.trim(custom.xpath("//button[@id='currentBranch']/text()").get());
        //目录
        List<Selectable> nodes = custom.xpath("//div[@class='detail']/ul/li").nodes();
        List<ChanDaoTree> tree = new ArrayList();
        if (nodes != null && nodes.size() > 0) {
            genNodes(nodes, title, tree);
        }
        page.putField("tree", tree);
    }

    private void genNodes(List<Selectable> nodes, String title, List<ChanDaoTree> tree) {
        String doMain = "http://chandao.freetek.cc";
        String path = title;
        for (Selectable node : nodes) {
            List<Selectable> subNodes = node.xpath("//ul/li").nodes();
            //不需要递归
            if (subNodes == null || subNodes.size() == 0) {
                List<Selectable> docNodes = node.xpath("li[@class='doc']").nodes();
                docNodes.addAll(node.xpath("li[@class='independent']").nodes());
                if (docNodes != null && docNodes.size() > 0) {
                    for (Selectable docNode : docNodes) {
                        String xpath = docNode.xpath("//a/@title").get();
                        System.err.println(path + "/" + StringUtils.trim(xpath));
                        ChanDaoTree chanDaoTree = new ChanDaoTree();
                        chanDaoTree.setName(xpath);
                        chanDaoTree.setPath(path + "/" + StringUtils.trim(xpath));
                        chanDaoTree.setHref(doMain + docNode.xpath("//a/@href").get());
                        tree.add(chanDaoTree);
                    }
                }
            } else {
                String path2 = path + "/" + node.xpath("//a/@title").get();
                genNodes(subNodes, path2, tree);
            }
        }
    }

    @Override
    public Site getSite() {
        return site;
    }


    /**
     * 第一步，先生成url目录链接
     * @param args
     */
    public static void main(String[] args) {
        Spider.create(new ChandaoIndexProcessor())
              .addUrl("http://chandao.freetek.cc/zentao/doc-tablecontents-custom-0-37.html")
              .addUrl("http://chandao.freetek.cc/zentao/doc-tablecontents-custom-0-28.html")
              .addUrl("http://chandao.freetek.cc/zentao/doc-tablecontents-custom-0-53.html")
              .addUrl("http://chandao.freetek.cc/zentao/doc-tablecontents-custom-0-124.html")
              .addPipeline(new ChandaoIndexPipeLine()).thread(10).run();
    }

}

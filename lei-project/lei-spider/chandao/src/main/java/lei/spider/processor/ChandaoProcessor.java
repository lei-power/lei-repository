package lei.spider.processor;

import java.util.List;
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

    private Site site = Site.me().setRetryTimes(3).setSleepTime(100).addCookie("Cookie", "lang=zh-cn; device=desktop; keepLogin=on; za=wanglei; preProductID=1; theme=default; preBranch=24; goback=%7B%22qa%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fbug-browse-4-0-unclosed-0-openedBy_asc-43-20.html%22%2C%22doc%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-389.html%22%2C%22execution%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc%5C%2F%22%2C%22project%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-219.html%22%7D; tab=doc; zentaosid=dkamm4j36e8hceifhgfj35e1a5; zp=b12271bd1d2115234d57ccb725310690eb4c0731; windowWidth=1920; windowHeight=977").setUserAgent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36");


    @Override
    public void process(Page page) {
        Selectable custom = page.getHtml();
        //目录
        String title = custom.xpath("//button[@id='currentBranch']/text()").get();
        //目录
        List<String> titleList = custom.xpath("//div[@class='tree-group']/span").all();
        //正文
        String content = custom.xpath("//div[@class='table-row']").get();
        //附件
        List<String> fujainList = custom.xpath("//div[@class='detail-content']/ul").all();
        page.putField("titleList", titleList);
        page.putField("content", content);
        page.putField("fujainList", fujainList);
        //创建目录
        String path=title;
        for (String target : titleList) {
            if (target.contains("href")) {

            }
        }


        //        PrintWriter printWriter = new PrintWriter(new FileWriter(getFile(filename)));
        //        printWriter.write(ToStringBuilder.reflectionToString(o));
        //        printWriter.close();

    }

    @Override
    public Site getSite() {
        return site;
    }

    public static void main(String[] args) {
        Spider.create(new ChandaoProcessor()).addUrl("http://chandao.freetek.cc/zentao/doc-objectLibs-custom-0-37-334.html").thread(5).run();
    }

}

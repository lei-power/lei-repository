package lei.spider;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

/***
 *@author wanglei
 *@Date 2022/10/28 17:55
 ***/


public class ChandaoProcessor implements PageProcessor {


    private Site site = Site.me().setRetryTimes(3).setSleepTime(100);


    @Override
    public void process(Page page) {
        // 部分二：定义如何抽取页面信息，并保存下来
        page.putField("author", page.getUrl().regex("http://chandao.freetek.cc/(\\w+)/.*").toString());
        page.putField("name", page.getHtml().xpath("//div[@class='btn-group header-btn']").toString());
        System.err.println(page.getResultItems().toString());

        page.putField("readme", page.getHtml().xpath("//div[@id='readme']/tidyText()"));

        // 部分三：从页面发现后续的url地址来抓取
        // page.addTargetRequests(page.getHtml().links().regex("(http://chandao.freetek.cc/[\\w\\-]+/[\\w\\-]+)").all());

    }

    @Override
    public Site getSite() {
        site.addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9");
        site.addHeader("Accept-Language", "zh-CN,zh;q=0.9");
        site.addHeader("Connection", "keep-alive");
        site.addHeader("Cookie", "lang=zh-cn; device=desktop; keepLogin=on; za=wanglei; preProductID=1; theme=default; preBranch=24; goback=%7B%22qa%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fbug-browse-4-0-unclosed-0-openedBy_asc-43-20.html%22%2C%22doc%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-389.html%22%2C%22execution%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc%5C%2F%22%2C%22project%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-219.html%22%7D; zentaosid=edmm6feltv6fk7is33i53mq1h0; zp=3e71dacacc6a996ff301737255b140fa2f266bfe; tab=doc; windowWidth=1920; windowHeight=977");
        site.addHeader("Referer", "http://chandao.freetek.cc/zentao/index-index.html");
        site.addHeader("Upgrade-Insecure-Requests", "1");
        site.addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36");
        return site;
    }

    //    public static void main(String[] args) {
    //        Spider.create(new ChandaoProcessor()).addUrl("http://chandao.freetek.cc/zentao/doc-tableContents-custom.html").thread(1).run();
    //    }

}

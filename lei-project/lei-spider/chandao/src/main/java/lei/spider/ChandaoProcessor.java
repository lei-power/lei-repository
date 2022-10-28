package lei.spider;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Html;

/***
 *@author wanglei
 *@Date 2022/10/28 17:55
 ***/


public class ChandaoProcessor implements PageProcessor {


    private Site site = Site.me().setRetryTimes(3).setSleepTime(100);


    @Override
    public void process(Page page) {
        Html html = page.getHtml();
        System.err.println(html.links());

    }

    @Override
    public Site getSite() {
         site.addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9");
         site.addHeader("Accept-Language", "zh-CN,zh;q=0.9");
         site.addHeader("Connection", "keep-alive");
         site.addHeader("Cookie", "lang=zh-cn; device=desktop; keepLogin=on; za=wanglei; preProductID=1; theme=default; lastProject=51; preBranch=24; goback=%7B%22qa%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fbug-browse-4-0-unclosed-0-openedBy_asc-43-20.html%22%2C%22doc%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-389.html%22%2C%22execution%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc%5C%2F%22%2C%22project%22%3A%22http%3A%5C%2F%5C%2Fchandao.freetek.cc%5C%2Fzentao%5C%2Fdoc-objectLibs-custom-0-37-219.html%22%7D; tab=doc; zentaosid=6v07em6vft9ngcenbm26vsq8t3; zp=eef1d0f8bc57e2a93bec27a51053676980b7bb61; windowWidth=1920; windowHeight=977");
         site.addHeader("Referer", "http://chandao.freetek.cc/zentao/index-index.html");
         site.addHeader("Upgrade-Insecure-Requests", "1");
         site.addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36");
        return site;
    }

//    public static void main(String[] args) {
//        Spider.create(new ChandaoProcessor()).addUrl("http://chandao.freetek.cc/zentao/doc-tableContents-custom.html").thread(1).run();
//    }

}

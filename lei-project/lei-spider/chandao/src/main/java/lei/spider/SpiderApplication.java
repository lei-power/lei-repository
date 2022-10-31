package lei.spider;

import lei.spider.processor.ChandaoProcessor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import us.codecraft.webmagic.Spider;

/**
 * @author PomZWJ
 * @email 1513041820@qq.com
 * @github https://github.com/PomZWJ
 * @describe 数据库导出工具启动类
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class SpiderApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpiderApplication.class, args);

        Spider.create(new ChandaoProcessor()).addUrl("http://chandao.freetek.cc/zentao/doc-objectLibs-custom-0-37-205.html").thread(1).run();

    }
}
//(.*?): (.*)
// '$1': '$2',
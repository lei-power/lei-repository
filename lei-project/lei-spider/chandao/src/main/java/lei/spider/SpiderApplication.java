package lei.spider;

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

        Spider.create(new ChandaoProcessor()).addUrl("http://chandao.freetek.cc/zentao/doc-tableContents-custom.html").thread(10).run();

    }
}
//(.*?): (.*)
// '$1': '$2',
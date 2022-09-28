package com.pomzwj.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类说明:主页跳转控制类
 *
 * @author PomZWJ
 * @email 1513041820@qq.com
 * @github https://github.com/PomZWJ
 * @date 2019/09/12/0029.
 */
@Controller
public class IndexDirectController {

    @Value("${server.index}")
    private String indexHtml;

    @RequestMapping("/")
    public String getIndex2() {
        return indexHtml;
    }

}

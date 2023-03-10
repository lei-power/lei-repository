package com.lei.spanner.core.util;


import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RespUtils {

    private static Logger logger = LoggerFactory.getLogger(RespUtils.class);

    public static void response(HttpServletResponse response, Object obj) {
        String json = JsonUtils.toJson(obj);
        logger.info("json:{}", json);
        response.setHeader("Content-type", "application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(json);
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}

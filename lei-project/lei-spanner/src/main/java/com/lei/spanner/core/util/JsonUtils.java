package com.lei.spanner.core.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import java.util.List;

/**
 * Json转换工具类，该类使用alibaba的fastjson为基础进行
 * 为了统一管理，在进行json转换时，务必使用该类进行，不可以使用其他类或者自己写类进行转换
 * author Ivan Lee
 */
public class JsonUtils {


    /**
     * java对象转json字符串
     *
     * @param obj java类对象
     * @return json字符串
     */
    public static String toJson(Object obj) {
        return JSON.toJSONString(obj);
    }

    /**
     * json字符串转java对象
     *
     * @param jsonStr json字符串
     * @param clazz   java对象一般使用：Person.class
     * @param <T>
     * @return java对象
     */
    public static <T> T toBean(String jsonStr, Class<T> clazz) {
        return JSON.parseObject(jsonStr, clazz);
    }


    public static <T> T toBean(String jsonStr, TypeReference<T> clazz) {
        return JSON.parseObject(jsonStr, clazz);
    }

    /**
     * json字符串转list<class>对象
     *
     * @param jsonStr json字符串
     * @param clazz   列表中的java对象
     * @param <T>
     * @return
     */
    public static <T> List<T> toBeanList(String jsonStr, Class<T> clazz) {
        return JSON.parseArray(jsonStr, clazz);
    }


}

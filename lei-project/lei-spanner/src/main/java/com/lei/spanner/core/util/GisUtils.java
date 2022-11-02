package com.lei.spanner.core.util;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wangkai
 * @date 2022/7/21 16:23
 */
public class GisUtils {
    public static String getShapeStr(List<List<String>> ring) {
        if (ring == null) {
            return null;
        }
        List<String> pointList = new ArrayList<>();
        for (List<String> list : ring) {
            String join = StringUtils.join(list, ",");
            String replace = join.replace(",", " ");
            pointList.add(replace);
        }
        String polygon = StringUtils.join(pointList, ',');
        return "POLYGON ((" + polygon + "))";
    }
}

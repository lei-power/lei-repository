package cn.lei.core.util;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;

/**
 * @author wangkai
 * @date 2022/7/21 16:23
 */
public class GisUtils {

    //国内坐标边界
    private static final double MIN_LON = 72.004D;
    private static final double MAX_LON = 137.8347D;
    private static final double MIN_LAT = 0.8293D;
    private static final double MAX_LAT = 55.8271D;
    // PI 圆周率
    private static final double PI = 3.14159265358979324D;
    // A WGS 长轴半径
    private static final double A = 6378245.0D;
    // EE WGS 偏心率的平方
    private static final double EE = 0.00669342162296594323D;


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

    /**
     * 二维数组转字符串便于存储（一）
     *
     * @param ring
     * @return
     */
    public static String ringToStr(List<List<String>> ring) {
        if (ring == null) {
            return null;
        }
        List<String> pointList = new ArrayList<>();
        for (List<String> list : ring) {
            String join = StringUtils.join(list, ",");
            pointList.add(join);
        }
        String polygon = StringUtils.join(pointList, ';');
        return polygon;
    }

    /**
     * 字符串转二维数组转便于读取（二）
     *
     * @param str
     * @return
     */
    public static List<String> strToPointList(String str) {
        if (str == null) {
            return null;
        }
        List<String> pointList = Arrays.asList(StringUtils.split(str, ";"));
        return pointList;
    }


    /**
     * WGS84转换GCJ02核心方法
     *
     * @param fromLon 转换前的经度
     * @param fromLat 转换前的纬度
     * @return 转换后的经纬度map对象
     */
    public static Map<String, Double> wgs84ToGcj02(double fromLon, double fromLat) {
        HashMap<String, Double> transformRes = new HashMap<>(2);
        // 国外坐标不用进行加密
        if (outOfChina(fromLon, fromLat)) {
            transformRes.put("lon", fromLon);
            transformRes.put("lat", fromLat);
            return transformRes;
        }
        // 计算转换后的经纬度坐标
        double dLat = transformLat(fromLon - 105.0, fromLat - 35.0);
        double dLon = transformLon(fromLon - 105.0, fromLat - 35.0);
        double radLat = fromLat / 180.0 * PI;
        double magic = Math.sin(radLat);
        magic = 1 - EE * magic * magic;
        double sqrtMagic = Math.sqrt(magic);
        dLat = (dLat * 180.0) / ((A * (1 - EE)) / (magic * sqrtMagic) * PI);
        dLon = (dLon * 180.0) / (A / sqrtMagic * Math.cos(radLat) * PI);
        double mgLat = fromLat + dLat;
        double mgLon = fromLon + dLon;
        transformRes.put("lon", new BigDecimal(mgLon + "", new MathContext(9, RoundingMode.HALF_UP)).doubleValue());
        transformRes.put("lat", new BigDecimal(mgLat + "", new MathContext(9, RoundingMode.HALF_UP)).doubleValue());

        return transformRes;
    }

    /**
     * GCJ02转换WGS84
     *
     * @param lon 转换前的经度
     * @param lat 转换后的纬度
     * @return 转换后的经纬度map对象
     */
    public static Map<String, Double> gcj02ToWgs84(double lon, double lat) {
        Map<String, Double> transformRes = new HashMap<>(2);
        double longitude = lon * 2 - wgs84ToGcj02(lon, lat).get("lon");
        double latitude = lat * 2 - wgs84ToGcj02(lon, lat).get("lat");
        transformRes.put("lon", longitude);
        transformRes.put("lat", latitude);
        return transformRes;
    }

    /**
     * 坐标是否在国外
     *
     * @param lon 经度
     * @param lat 纬度
     * @return true 国外坐标 false 国内坐标
     */
    private static boolean outOfChina(double lon, double lat) {
        if (lon < MIN_LON || lon > MAX_LON) {
            return true;
        }
        return lat < MIN_LAT || lat > MAX_LAT;
    }

    /**
     * 转换经度坐标
     *
     * @param x 偏移后的经度
     * @param y 偏移后的纬度
     * @return double 转换经度坐标
     */
    private static double transformLat(double x, double y) {
        double transform = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * Math.sqrt(Math.abs(x));
        transform += (20.0 * Math.sin(6.0 * x * PI) + 20.0 * Math.sin(2.0 * x * PI)) * 2.0 / 3.0;
        transform += (20.0 * Math.sin(y * PI) + 40.0 * Math.sin(y / 3.0 * PI)) * 2.0 / 3.0;
        transform += (160.0 * Math.sin(y / 12.0 * PI) + 320 * Math.sin(y * PI / 30.0)) * 2.0 / 3.0;
        return transform;
    }

    /**
     * 转换纬度坐标
     *
     * @param x 偏移后的经度
     * @param y 偏移后的纬度
     * @return double 转换纬度坐标
     */
    private static double transformLon(double x, double y) {
        double transform = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * Math.sqrt(Math.abs(x));
        transform += (20.0 * Math.sin(6.0 * x * PI) + 20.0 * Math.sin(2.0 * x * PI)) * 2.0 / 3.0;
        transform += (20.0 * Math.sin(x * PI) + 40.0 * Math.sin(x / 3.0 * PI)) * 2.0 / 3.0;
        transform += (150.0 * Math.sin(x / 12.0 * PI) + 300.0 * Math.sin(x / 30.0 * PI)) * 2.0 / 3.0;
        return transform;
    }

}

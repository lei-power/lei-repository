package cn.lei.core.util;

import cn.lei.core.entity.Points;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;

/**
 * @author wangkai
 * @date 2022/7/21 16:23
 */
@Slf4j
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



    //计算内心、质心
    public static Points getCenterOfGravityPoint4(List<Coordinate> CoordinateList) {
        Coordinate[] coordinates = new Coordinate[CoordinateList.size()];
        CoordinateList.toArray(coordinates);
        GeometryFactory geometryFactory = new GeometryFactory();
        //MultiPoint mpoint=geometryFactory.createMultiPointFromCoords(coordinates);//创建多点
        //Point pt=mpoint.getCentroid();//得到多点的质心
        //Point pt=mpoint.getInteriorPoint();//多点内心
        Polygon p=geometryFactory.createPolygon(coordinates);//创建多边形
        //Point pt=p.getCentroid();//多边形质心
        Point pt=p.getInteriorPoint();//多边形内心
        return  new Points(pt.getX(),pt.getY());
    }


    /**
     * 计算多边形中心点
     * 格式：104.44990628434761,31.098708748010381;104.44992346139867,31.098715972264358;104.44990628434761,31.098708748010381
     * @param path 轮廓
     * @return
     */
    public static Points calculationCenterPoint(String path){
        if(TextUtils.isEmpty(path)){
            return null;
        }
        String[] split = path.split(";");
        List<Coordinate>  CoordinateList=new ArrayList<>();
        //CoordinateList.add(new Coordinate("经度","纬度"));
        for (String s : split) {
            String[] split1 = s.split(",");
            CoordinateList.add(new Coordinate(Double.valueOf(split1[0]),Double.valueOf(split1[1])));
        }
        try {
            Points pt = getCenterOfGravityPoint4(CoordinateList);
            return pt;
        }catch (Exception e){
            log.error("计算多边形中心点失败！",e);
        }
        return null;
    }
    public static void main(String[] args){

        String path = "104.5075103619391,31.09541688781541;104.50753181961122,31.09553758722108;104.50760423925462,31.095749481733257;104.50786977794709,31.095781668241436;104.50813263443055,31.09572802406114;104.50838207986894,31.095588549192364;104.50853228357377,31.095377995784695;104.50842767742219,31.095297529514248;104.50827210929933,31.095530881698544;104.50804412153306,31.09562744122308;104.50775444295945,31.095640852268154;104.50766593006196,31.09547589641374;104.50764447238984,31.095313622768337;104.50765251901689,31.09516073685449;104.50762569692674,31.095048084075863;104.5079073288733,31.094994439895565;104.50802534606996,31.09497030001443;104.5079797485167,31.094905926998074;104.5081406810576,31.09484423619073;104.50751572635713,31.094938113506252;104.50748890426698,31.09510172825616;104.50753718402925,31.09521169882577;104.5075103619391,31.09541688781541";
        String[] split = path.split(";");
        List<Coordinate>  CoordinateList=new ArrayList<>();
        //CoordinateList.add(new Coordinate("经度","纬度"));
        for (String s : split) {
            String[] split1 = s.split(",");
            CoordinateList.add(new Coordinate(Double.valueOf(split1[0]),Double.valueOf(split1[1])));
        }
//        CoordinateList.add(new Coordinate(104.4030908924392,31.172708070811638));
//        CoordinateList.add(new Coordinate(104.40502744734795,31.172445214328178));
//        CoordinateList.add(new Coordinate(104.4045875650695,31.171444750365623));
//        CoordinateList.add(new Coordinate(104.40291386664421,31.171820259627708));
//        CoordinateList.add(new Coordinate(104.4030908924392,31.172708070811638));

        Points pt=getCenterOfGravityPoint4(CoordinateList);
        System.out.println(pt.getLng()+" "+pt.getLat());
    }

}

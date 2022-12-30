package cn.lei.all.service;

import static java.util.stream.Collectors.toList;

import cn.hutool.db.Db;
import cn.hutool.db.DbUtil;
import cn.hutool.db.Entity;
import cn.lei.all.entity.BaseResp;
import cn.lei.all.entity.po.AgriProduceLand;
import cn.lei.all.entity.po.GisLandType;
import cn.lei.all.entity.req.DataCleansingAgriproduceLandReq;
import cn.lei.core.entity.Points;
import cn.lei.core.util.DateTimeUtils;
import cn.lei.core.util.GisUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.sql.DataSource;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/***
 *@author wanglei
 *@Date 2022/12/28 15:13
 ***/

@Service
@Slf4j
public class DataCleansingService {

    @SneakyThrows
    public BaseResp cleaningAgriproduceLand(DataCleansingAgriproduceLandReq reqModel) {
        Integer flag = reqModel.getFlag();
        if (flag == null) {
            return BaseResp.failByParamError("输入正确的服务器编码");
        }
        DataSource frpProduce = null;
        DataSource frpGisdataArchive = null;
        DataSource frpAgriproduceland = null;
        if (flag == 100) {
            frpProduce = DbUtil.getDs("mysql_za_snkd_local_frp_produce");
            frpGisdataArchive = DbUtil.getDs("mysql_za_snkd_local_frp_gisdata_archive");
            frpAgriproduceland = DbUtil.getDs("mysql_za_snkd_local_frp_agriproduceland");
        } else if (flag == 103) {
            frpProduce = DbUtil.getDs("mysql_za_snkd_testc_frp_produce");
            frpGisdataArchive = DbUtil.getDs("mysql_za_snkd_testc_frp_gisdata_archive");
            frpAgriproduceland = DbUtil.getDs("mysql_za_snkd_testc_frp_agriproduceland");
        } else {
            return BaseResp.failByParamError("该服务器尚未部署清洗功能");
        }

        //通过关联表知道有多少生产地块关联了
        List<Entity> agriProduceLandRef = Db.use(frpGisdataArchive).query("SELECT DISTINCT agri_produce_land_code FROM `tbl_gisfarm_agri_produce_land_ref`");
        List<String> landCodeList = agriProduceLandRef.stream().map(entity -> {
            return entity.getStr("agri_produce_land_code");
        }).collect(Collectors.toList());

        //查询gistype
        List<Entity> gistypeList = Db.use(frpProduce).findAll("tbl_gis_land_type");
        Map<Long, GisLandType> gisLandTypeMap = gistypeList.stream().map(gisTypeEntity -> {
            Long id = Long.parseLong(gisTypeEntity.getStr("id"));
            String gisLandTypeName = gisTypeEntity.getStr("gis_land_type_name");
            String gisLandTypeColor = gisTypeEntity.getStr("gis_land_type_color");
            String gisLandOutlineCcolor = gisTypeEntity.getStr("gis_land_outline_color");
            GisLandType gisLandType = new GisLandType();
            gisLandType.setId(id);
            gisLandType.setGisLandTypeName(gisLandTypeName);
            gisLandType.setGisLandTypeColor(gisLandTypeColor);
            gisLandType.setGisLandOutlineColor(gisLandOutlineCcolor);
            return gisLandType;
        }).collect(Collectors.toMap(GisLandType::getId, p -> p));

        //查询生产地块
        StringBuilder landCodeStrBuilder = new StringBuilder().append("SELECT land_code,gis_land_type_id,path FROM `tbl_agri_produce_land` WHERE land_code IN (");
        landCodeList.forEach(landcode -> {
            landCodeStrBuilder.append("\'").append(landcode).append("\',");
        });
        String landCodeStr = landCodeStrBuilder.append(")").toString();
        landCodeStr = StringUtils.substring(landCodeStr, 0, landCodeStr.length() - 2) + ");";
        Map<String, AgriProduceLand> agriProduceLandMap = Db.use(frpAgriproduceland).query(landCodeStr).stream().map(agriLand -> {
            AgriProduceLand agriProduceLand = new AgriProduceLand();
            agriProduceLand.setLandCode(agriLand.getStr("land_code"));
            agriProduceLand.setGisLandTypeId(Long.valueOf(agriLand.getStr("gis_land_type_id")));
            agriProduceLand.setGisLandTypeName(gisLandTypeMap.get(agriProduceLand.getGisLandTypeId()).getGisLandTypeName());
            agriProduceLand.setPath(agriLand.getStr("path"));
            //中心点
            Points points = GisUtils.calculationCenterPoint(agriProduceLand.getPath());
            if(points != null){
                Map<String, Double> gcj02 = GisUtils.wgs84ToGcj02(points.getLng(),points.getLat());
                agriProduceLand.setLandCenterLat(String.valueOf(gcj02.get("lat")));
                agriProduceLand.setLandCenterLng(String.valueOf(gcj02.get("lon")));
            }
            //填充色
            agriProduceLand.setFillColor(gisLandTypeMap.get(agriProduceLand.getGisLandTypeId()).getGisLandTypeColor());
            //轮廓色
            agriProduceLand.setStrokeColor(gisLandTypeMap.get(agriProduceLand.getGisLandTypeId()).getGisLandTypeColor());
            //填充透明度
            agriProduceLand.setFillOpacity("0.5");
            //轮廓透明度
            agriProduceLand.setStrokeOpacity("1");
            //轮廓粗细
            agriProduceLand.setStrokeWeight("2");
            agriProduceLand.setLandZoom("16");
            return agriProduceLand;
        }).collect(Collectors.toMap(AgriProduceLand::getLandCode, p -> p));

        //查询produce中已经同步过去的地块
        StringBuilder landIdStrBuilder = new StringBuilder().append("SELECT id,sh_gis_dkid,create_time FROM `tbl_land` WHERE sh_gis_dkid IN (");
        landCodeList.forEach(landcode -> {
            landIdStrBuilder.append("\'").append(landcode).append("\',");
        });
        String landIdStr = landIdStrBuilder.append(")").toString();
        landIdStr = StringUtils.substring(landIdStr, 0, landIdStr.length() - 2) + ");";

        List<GisLandType> landList = Db.use(frpProduce).query(landIdStr).stream().map(landIdVO -> {
            GisLandType gisLandType = new GisLandType();
            gisLandType.setId(Long.parseLong(landIdVO.getStr("id")));
            gisLandType.setGisLandTypeName(landIdVO.getStr("sh_gis_dkid"));
            gisLandType.setCreateTime(landIdVO.getDate("create_time"));
            return gisLandType;
        }).collect(Collectors.toList());

        List<Long> badId = new ArrayList<>();
        List<AgriProduceLand> insetList = new ArrayList<>();
        for (GisLandType re : landList) {
            AgriProduceLand ed = agriProduceLandMap.get(re.getGisLandTypeName());

            if (ed != null) {
                AgriProduceLand rest = new AgriProduceLand();
                BeanUtils.copyProperties(ed, rest);
                rest.setId(re.getId());
                rest.setLandStartTime(re.getCreateTime());
                insetList.add(rest);
            } else {badId.add(re.getId());}
        }

        //更新tbl_land表
        StringBuilder updateBuilder = new StringBuilder();
        insetList.forEach(insert -> {
            String sql = new String();
            sql = "UPDATE `tbl_land` SET `stroke_color`=\'" + insert.getStrokeColor() + "\'," + "`stroke_opacity`='1',`stroke_weight`='2',`fill_color`=\'" + insert.getStrokeColor() + "\'," + "`fill_opacity`='0.5',`land_center_lat`=\'" + insert.getLandCenterLat() + "\'," + "`land_center_lng`=\'"
                    + insert.getLandCenterLng() + "',`gis_land_type_id`=" + insert.getGisLandTypeId() + ",`land_zoom`=\'" + insert.getLandZoom() + "\',`land_start_time`=\'" + DateTimeUtils.convertDate2String(insert.getLandStartTime()) + "\' WHERE `id`=" + insert.getId() + ";\n";
            updateBuilder.append(sql);
        });
        String isertSql = updateBuilder.toString();

        log.error("-------------------------------------------------执行如下sql-----------------------------------------------------------\n{}", isertSql);
        Db.use(frpProduce).execute(isertSql);
        return BaseResp.success(null, "如下的已存在produce库tbl_land表对应的生产地块不存在了" + badId.toString());
    }


    /**
     * 计算多边形中心点
     *
     * @param path
     * @return
     */
    @Deprecated
    public static List<String> getLandCenter(List<List<String>> path) {

        List<List<String>> poList = new ArrayList<>();
        for (List<String> point : path) {
            Map<String, Double> gcj02 = GisUtils.wgs84ToGcj02(Double.parseDouble(point.get(0)), Double.parseDouble(point.get(1)));
            List<String> result = new ArrayList<>();
            result.add(String.valueOf(gcj02.get("lat")));
            result.add(String.valueOf(gcj02.get("lon")));
            poList.add(result);
        }

        List<Double> latList = poList.stream().map(po -> Double.valueOf(po.get(0))).sorted().collect(toList());
        List<Double> lonList = poList.stream().map(po -> Double.valueOf(po.get(1))).sorted().collect(toList());
        //累加取平均数
        double Gx = (latList.get(0) + latList.get(latList.size() - 1)) / 2;
        double Gy = (lonList.get(0) + lonList.get(lonList.size() - 1)) / 2;

        List<String> resultList = new ArrayList<>();
        resultList.add(StringUtils.substring(String.valueOf(Gx), 0, String.valueOf(Gx).indexOf(".") + 14));
        resultList.add(StringUtils.substring(String.valueOf(Gy), 0, String.valueOf(Gx).indexOf(".") + 14));
        return resultList;
    }
}

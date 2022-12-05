package cn.lei.all.entity.po;


import java.util.Date;
import lombok.Data;

@Data
public class AreaLocal {


    //镇id，自增
    private Long id;
    //父级id,level为4，对应的是区域id；level为5，对应的是镇id
    private Long parentId;
    //镇/村名称
    private String name;
    //排序字段，数字越小越靠前
    private Integer sortNum;
    //等级 4：镇  5：村
    private Integer level;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;
    //区域中心点维度值
    private String countyCenterLat;
    //区域中心点经度值
    private String countyCenterLng;
    //上海镇中心点维度值
    private String shTownCenterLat;
    //上海镇中心点经度值
    private String shTownCenterLng;

}
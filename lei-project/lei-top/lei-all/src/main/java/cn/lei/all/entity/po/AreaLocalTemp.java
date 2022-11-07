package cn.lei.all.entity.po;


import java.util.Date;
import lombok.Data;

@Data
public class AreaLocalTemp {

    //主键，自增
    private Long id;
    //权属单位代码
    private String ownCode;
    //权属单位名称
    private String ownName;
    //权级编码
    private String villageCode;
    //省id
    private String provinceId;
    //省名称
    private String provinceName;
    //市id
    private String cityId;
    //市名称
    private String cityName;
    //区id
    private String countyId;
    //区名称
    private String countyName;
    //镇id
    private String townId;
    //镇名称
    private String townName;
    //村id
    private String villageId;
    //村名称
    private String villageName;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

}
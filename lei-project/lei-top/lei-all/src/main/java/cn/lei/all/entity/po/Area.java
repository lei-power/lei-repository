package cn.lei.all.entity.po;


import java.math.BigDecimal;
import lombok.Data;

@Data
public class Area {

    private String id;
    private String areaName;
    private String parentId;
    private String shortName;
    private String areaCode;
    private String zipCode;
    private String pinyin;
    private BigDecimal lng;
    private BigDecimal lat;
    private Integer level;
    private String position;
    private Integer sortNum;


}

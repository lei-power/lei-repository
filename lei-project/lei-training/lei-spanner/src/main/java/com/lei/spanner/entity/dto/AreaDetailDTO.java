package com.lei.spanner.entity.dto;


import java.math.BigDecimal;
import lombok.Data;

@Data
public class AreaDetailDTO {

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

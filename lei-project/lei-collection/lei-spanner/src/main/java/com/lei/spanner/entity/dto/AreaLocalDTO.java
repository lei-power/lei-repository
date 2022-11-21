package com.lei.spanner.entity.dto;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.Date;
import lombok.Data;

@ApiModel
@Data
public class AreaLocalDTO {


    @ApiModelProperty("镇id，自增")
    private Long id;

    @ApiModelProperty("父级id,level为4，对应的是区域id；level为5，对应的是镇id")
    private Long parentId;

    @ApiModelProperty("镇/村名称")
    private String name;

    @ApiModelProperty("排序字段，数字越小越靠前")
    private Integer sortNum;

    @ApiModelProperty("等级 4：镇  5：村")
    private Integer level;

    @ApiModelProperty("创建时间")
    private Date createTime;

    @ApiModelProperty("更新时间")
    private Date updateTime;

    @ApiModelProperty("区域中心点维度值")
    private String countyCenterLat;

    @ApiModelProperty("区域中心点经度值")
    private String countyCenterLng;

    @ApiModelProperty("上海镇中心点维度值")
    private String shTownCenterLat;

    @ApiModelProperty("上海镇中心点经度值")
    private String shTownCenterLng;

}
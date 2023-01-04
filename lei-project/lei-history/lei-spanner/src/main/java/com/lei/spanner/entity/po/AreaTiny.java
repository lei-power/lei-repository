package com.lei.spanner.entity.po;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value = "AreaTiny")
public class AreaTiny {

    @ApiModelProperty(value = "id")
    private String id;
    @ApiModelProperty(value = "区域名称")
    private String areaName;
    @ApiModelProperty(value = "父级区域id")
    private String parentId;

    @ApiModelProperty(value = "区域名称首字母拼音大写")
    private String pinyin;

    @ApiModelProperty(value = "区域等级：1-省份，2-城市，3-区县")
    private Integer level;

    @ApiModelProperty(value = "子区域列表")
    private List<AreaTiny> childList;
}

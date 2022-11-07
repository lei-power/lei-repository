package cn.lei.all.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import java.util.List;
import lombok.Data;

/**
 * Created by z.j on 2022/8/12.
 */
@Data
public class AreaLocalListAllByCountyDTO {

    @ApiModelProperty(value = "id")
    private String id;

    @ApiModelProperty(value = "区域名称")
    private String areaName;

    @ApiModelProperty(value = "父级区域id")
    private String parentId;

    @ApiModelProperty(value = "区域等级：4镇 5村")
    private Integer level;

    @ApiModelProperty(value = "子区域列表")
    private List<AreaLocalListAllByCountyDTO> childList;

}

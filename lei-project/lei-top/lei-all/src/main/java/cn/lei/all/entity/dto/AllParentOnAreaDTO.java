package cn.lei.all.entity.dto;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel
@Data
public class AllParentOnAreaDTO {

    @ApiModelProperty(value = "省id")
    private String provinceId;

    @ApiModelProperty(value = "省名称")
    private String provinceName;

    @ApiModelProperty("市id")
    private String cityId;

    @ApiModelProperty("市名称")
    private String cityName;

    @ApiModelProperty("区id")
    private String countyId;

    @ApiModelProperty("区名称")
    private String countyName;

    @ApiModelProperty("镇id")
    private String townId;

    @ApiModelProperty("镇名称")
    private String townName;

    @ApiModelProperty("村id")
    private String villageId;

    @ApiModelProperty("村名称")
    private String villageName;

    @ApiModelProperty("区域等级")
    private Integer areaLevel;

}
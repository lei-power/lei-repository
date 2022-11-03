package com.lei.spanner.entity.dto;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

@Data
@ApiModel
public class DictTypeDTO implements Serializable {


    @ApiModelProperty("主键id")
    private Long id;

    @ApiModelProperty("字典名称")
    private String dictName;

    @ApiModelProperty("字典类型")
    private String dictType;

    @ApiModelProperty("创建时间")
    private Date createTime;

    @ApiModelProperty("修改时间")
    private Date updateTime;

}

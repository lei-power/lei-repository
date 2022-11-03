package com.lei.spanner.entity.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.util.List;
import lombok.Data;

@ApiModel
@Data
public class AreaListAndLevelDTO implements Serializable {
    @ApiModelProperty("list")
    private List<String> idList;
    @ApiModelProperty("level")
    private Integer level;

}

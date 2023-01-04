package com.lei.spanner.entity.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.List;
import lombok.Data;

@ApiModel
@Data
public class AreaListDTO {

    @ApiModelProperty("list")
    private List<String> idList;
}

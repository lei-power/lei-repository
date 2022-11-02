package com.lei.spanner.core.base.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author junhao
 * 用于返回分页列表统计
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel
public class RespPlus<L,T> implements Serializable {


    @ApiModelProperty(value="列表")
    private List<L> list=new ArrayList<>();

    @ApiModelProperty(value = "计数")
    private T totalCount;

}

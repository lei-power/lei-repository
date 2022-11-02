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
 * Created by Ivan Lee .
 * 用于返回分页列表，用法 new BaseResp<ApiPageResp>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel
public class ApiPageResp<T> implements Serializable {


    @ApiModelProperty(value="列表")
    private List<T> list=new ArrayList<>();


    @ApiModelProperty(value = "总数")
    private long totalCount=0L;


}

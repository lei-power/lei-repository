package com.lei.spanner.core.base.model.req;

import io.swagger.annotations.ApiModelProperty;

/**
 * Created by zhangjun on 2021/3/10.
 */
public class ApiPageReq {

    @ApiModelProperty(value = "分页页码(默认第一页)")
    private Integer pageNo = 1;

    @ApiModelProperty(value = "分页大小(默认十条记录)")
    private Integer pageSize = 10;

    public Integer getOffset() {
        return (pageNo - 1) * pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}

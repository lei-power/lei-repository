package com.lei.spanner.entity.dto;

import lombok.Data;

/**
 * @author wangkai
 * @date 2020/6/8 15:33
 */
@Data
public class GaodeLocationDTO {

    private String province;
    private String city;
    private String adcode;
    private Long provinceId;
    private Long cityId;

    private Long countyId;
    private String countyName;
}

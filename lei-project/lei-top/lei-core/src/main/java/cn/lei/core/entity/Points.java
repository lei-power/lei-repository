package cn.lei.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author wangkai
 * @date 2022/12/30 13:39
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Points {
    private Long index;	//点序列
    private double lng;	//经度
    private double lat;	//纬度

    public Points(double lng, double lat){
        this.lng=lng;
        this.lat=lat;
    }

}

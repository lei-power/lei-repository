package cn.lei.all.entity.po;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.Date;
import lombok.Data;

@Data
@ApiModel
public class AgriProduceLand {

    //地块编码
    private Long id;
    //地块编码
    private String landCode;
    //地块用途id    @ApiModelProperty("上海gis地块类型表id")
    private Long gisLandTypeId;    //地块用途id    @ApiModelProperty("上海gis地块类型表id")
    private String gisLandTypeName;
    //地块轮廓
    private String path;
    //地块状态 0-正常 1：作废

    //数据来源类型 1：生产用地（默认）  2：确权 3：神农口袋  4：遥感识别
    private Integer sourceType;

    @ApiModelProperty("位置描图：线段颜色")
    private String strokeColor;
    @ApiModelProperty("位置描图：线段透明度")
    private String strokeOpacity;
    @ApiModelProperty("位置描图：线段粗细")
    private String strokeWeight;
    @ApiModelProperty("位置描图：填充颜色")
    private String fillColor;
    @ApiModelProperty("位置描图：填充透明度")
    private String fillOpacity;
    @ApiModelProperty("位置描图：地块中心点维度值")
    private String landCenterLat;
    @ApiModelProperty("位置描图：地块中心点经度值")
    private String landCenterLng;

    @ApiModelProperty("缩放比例")
    private String landZoom;
    @ApiModelProperty("地块开始时间，在无提前生成地块逻辑前，理论与create_time相同")
    private Date landStartTime;
}
package cn.lei.all.entity.po;


import java.util.Date;
import lombok.Data;

@Data
public class GisLandType {


    //主键
    private Long id;
    //地块用途名称
    private String gisLandTypeName;
    //地块填充色
    private String gisLandTypeColor;
    //地块轮廓色
    private String gisLandOutlineColor;
    //icon地址
    private String iconUrl;
    //地块用途唯一标识
    private String gisLandTypeIdentifier;
    //排序
    private Integer sortNum;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

}
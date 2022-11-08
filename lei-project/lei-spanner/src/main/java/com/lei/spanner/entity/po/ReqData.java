package com.lei.spanner.entity.po;


import java.util.Date;
import lombok.Data;

@Data
public class ReqData {

    //镇id，自增
    private Long id;
    //地块编码
    private String dkbm;
    //表名
    private String targetTable;
    //文件名
    private String targetName;
    //包名
    private String targetPackage;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

}
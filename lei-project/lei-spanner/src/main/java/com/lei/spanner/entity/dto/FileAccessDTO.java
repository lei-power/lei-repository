package com.lei.spanner.entity.dto;


import java.util.Date;
import lombok.Data;

@Data
public class FileAccessDTO {


    //主键
    private Long id;
    //文件名称--自动生成的名称，带后缀
    private String fileName;
    //文件名称--原始名称，带后缀
    private String fileOriginalName;
    //文件地址-域名 + 路径 + 名称 + 后缀
    private String internetUrl;
    //文件大小
    private Long fileSize;
    //文件类型 1：图片  2：视频  3：音频  4 ：文档  0：其他
    private Integer fileType;
    //后缀名-名称后缀 比如：jpg、mp4
    private String suffix;
    //创建方式 1：web,2:app
    private Integer createMode;
    //上传环境  0：上传本地服务器  1：上传阿里云
    private Integer uploadEnvironment;
    //是否删除 1-是 0-否
    private Integer delFlag;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

}
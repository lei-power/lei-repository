package com.lei.spanner.core.base.model;


import lombok.Data;

/**
 * @author lujianing01@58.com
 * @Description:
 * @date 2015/12/18
 */
@Data
public class ConfigContext {

    private String outputPath;

    private String driver;
    private String url;
    private String userName;
    private String password;


    private String targetTable;
    private String targetName;
    private String targetPackage;
}
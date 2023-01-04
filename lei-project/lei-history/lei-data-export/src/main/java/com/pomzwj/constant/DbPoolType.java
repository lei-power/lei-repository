package com.pomzwj.constant;

import org.apache.commons.lang3.StringUtils;

/**
 * @author zhaowj
 * @date 2021-12-16
 */
public enum DbPoolType {
    DRUID("druid"),
    HIKARICP("hikaricp");
    private String name;

    DbPoolType(String name) {
        this.name = name;
    }

    public static DbPoolType matchType(String name) {
        if (StringUtils.isNotEmpty(name)) {
            for (DbPoolType dbPoolType : DbPoolType.values()) {
                if (dbPoolType.name().equals(name.toUpperCase())) {
                    return dbPoolType;
                }
            }
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

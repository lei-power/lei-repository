package com.lei.spanner.core.util;

import java.util.List;
import java.util.Objects;
import org.springframework.beans.BeanUtils;

/**
 * Description
 * Author JunHao
 * Date 2022/3/31
 * Version 1.0
 */
public class BeanUtil<T> {

    /**
     * @param sourceList
     * @param targetList
     * @param classObj
     */
    public void copyList(List sourceList, List<T> targetList, Class<T> classObj) {
        if (!Objects.isNull(sourceList)) {
            for (Object item : sourceList) {
                try {
                    T data = classObj.newInstance();
                    BeanUtils.copyProperties(item, data);
                    targetList.add(data);
                }
                catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
                catch (InstantiationException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static BeanUtil init() {
        return new BeanUtil();
    }
}

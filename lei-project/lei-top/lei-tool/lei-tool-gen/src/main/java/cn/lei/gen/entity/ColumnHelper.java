package cn.lei.gen.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

/**
 * 表字段信息
 */
public class ColumnHelper {

    public static List<ColumnDefinition> covertColumnDefinition(List<Map<String, Object>> list) {

        List<ColumnDefinition> columnDefinitionList = new ArrayList<ColumnDefinition>();

        for (Map<String, Object> rowMap : list) {
            // 构建columnDefinition
            columnDefinitionList.add(buildColumnDefinition(rowMap));
        }

        return columnDefinitionList;
    }

    public static ColumnDefinition buildColumnDefinition(Map<String, Object> rowMap) {
        //DBUtils 取的MapList中的Map  是不区分key大小写的  所以不用转换
        ColumnDefinition columnDefinition = new ColumnDefinition();

        columnDefinition.setColumnName((String) rowMap.get("Field"));

        boolean isIdentity = "auto_increment".equalsIgnoreCase((String) rowMap.get("EXTRA"));
        columnDefinition.setIsIdentity(isIdentity);

        boolean isPk = "PRI".equalsIgnoreCase((String) rowMap.get("KEY"));
        columnDefinition.setIsPk(isPk);

        String type = buildType((String) rowMap.get("Type"));
        columnDefinition.setType(type);

        columnDefinition.setComment((String) rowMap.get("Comment"));

        return columnDefinition;
    }

    public static String buildType(String type) {
        if (StringUtils.isNotEmpty(type)) {
            int index = type.indexOf("(");
            if (index > 0) {
                return type.substring(0, index).toUpperCase();
            }
            return type;
        }
        return "varchar";
    }

}

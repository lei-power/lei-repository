package cn.lei.gen;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

/***
 *@author wanglei
 *@Date 2022/11/22 15:42
 ***/


public class MapingVillage {

    private final static String[] county_key = {"县", "区"};
    private final static String[] town_key = {"镇", "街道", "乡"};
    private final static String[] village_key = {"村", "社区", "居民居委会", "村民委员会", "村委会"};

    private final static String village = "tbl_area_local表中匹配好的村";
    private final static String source = "QSDWMC原始数据";

    private static void mapingVillage() {
        List<String> sources = Arrays.asList(source.replaceAll("\\s*", "").split(","));
        List<String> villages = Arrays.asList(village.replaceAll("\\s*", "").split(","));
        Map<String, String> map = new HashMap<>();

        for (String target : sources) {
            String key = target;
            try {
                for (String county : county_key) {
                    if (target.contains(county)) {
                        //排除社区关键字干扰
                        if (target.contains("社区")) {
                            if (target.split(county).length > 2) {
                                target = target.split(county)[1];
                            }
                            continue;
                        }
                        target = target.split(county)[1];
                    }
                }
                //去除镇一级干扰
                for (String town : town_key) {
                    //排除社区关键字干扰
                    if (target.contains("镇镇")) {
                        if (target.split("镇镇").length > 2) {
                            target = target.split("镇镇")[1];
                        }
                        break;
                    }
                    if (target.contains(town)) {
                        target = target.split(town)[1];
                    }
                }
                //进行映射村一级
                if (target.endsWith("村") || target.endsWith("社区")) {
                    if (villages.contains(target)) {
                        map.put(key, target);
                    }
                } else if (target.endsWith("居民委员会")) {
                    target = target.split("居民委员会")[0];
                    if (target.endsWith("社区")) {
                        if (villages.contains(target)) {
                            map.put(key, target);
                        }
                    } else {
                        if (villages.contains(target + "社区")) {
                            map.put(key, target + "社区");
                        }
                    }
                } else if (target.endsWith("居委会")) {
                    target = target.split("居委会")[0];
                    if (target.endsWith("社区")) {
                        if (villages.contains(target)) {
                            map.put(key, target);
                        }
                    } else {
                        if (villages.contains(target + "社区")) {
                            map.put(key, target + "社区");
                        }
                    }
                } else if (target.endsWith("村民委员会")) {
                    if (villages.contains(target.split("村民委员会")[0] + "村")) {
                        map.put(key, target.split("村民委员会")[0] + "村");
                    }

                } else if (target.endsWith("村委会")) {
                    if (villages.contains(target.split("村委会")[0] + "村")) {
                        map.put(key, target.split("村委会")[0] + "村");
                    }
                } else {
                    map.put(key, null);
                }

            } catch (Exception e) {
                map.put(key, null);
                System.err.println(key + "匹配出错");
            }
            //去除县一级干扰
        }
        //写入文件
        try {

            BufferedWriter fw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
                    "D:\\村级映射_" + UUID.randomUUID().toString().substring(0, 8) + ".csv"), "GBK"));
            StringBuilder builder = new StringBuilder();
            for (Entry<String, String> entry : map.entrySet()) {
                builder.append(entry.getKey() + "," + entry.getValue() + "\n");
            }
            fw.write(builder.toString());
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        mapingVillage();
    }

}

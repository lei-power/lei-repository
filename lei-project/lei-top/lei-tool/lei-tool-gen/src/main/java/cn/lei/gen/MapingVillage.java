package cn.lei.gen;

import cn.hutool.poi.excel.ExcelWriter;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/***
 *@author wanglei
 *@Date 2022/11/22 15:42
 ***/


public class MapingVillage {

    //区域关键字
    private final static String[] county_key = {"县", "区"};
    private final static String[] town_key = {"镇", "街道", "乡"};
    private final static String[] village_key = {"村", "社区", "居民居委会", "村民委员会", "村委会"};


    //村级映射，在桌面输出：excel文件
    private static void maping() {
        //“市区镇村信息”
        String AREASTR = "";
        //“权属单位名称信息”
        String QSDWMCSTR = "";
        List<List<String>> areaList = new ArrayList<>();
        List<String> villageList = new ArrayList<>();
        List<String> qsdwmcList = new ArrayList<>();
        //读入数据
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\市区镇村信息&&权属单位名称信息.txt"), "GBK"));
            AREASTR = br.readLine();
            QSDWMCSTR = br.readLine();

            //市id,名称；区d,名称；镇d,名称；村d,名称；
            areaList = Arrays.asList(AREASTR.replaceAll("\\s*", "").split(";")).stream().map(area -> Arrays.asList(area.split(","))).collect(Collectors.toList());
            villageList = areaList.stream().map(area -> area.get(area.size() - 1)).collect(Collectors.toList());
            qsdwmcList = Arrays.asList(QSDWMCSTR.replaceAll("\\s*", "").split(","));

        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        Map<String, String> qsdwmcToVillageMap = new HashMap<>();

        for (String qsdwmc : qsdwmcList) {
            String key = qsdwmc;
            qsdwmcToVillageMap.put(key, null);
            try {
                for (String county : county_key) {
                    if (qsdwmc.contains(county)) {
                        //排除社区关键字干扰
                        if (qsdwmc.contains("社区")) {
                            if (qsdwmc.split(county).length > 2) {
                                qsdwmc = qsdwmc.split(county)[1];
                            }
                            continue;
                        }
                        qsdwmc = qsdwmc.split(county)[1];
                    }
                }
                //去除镇一级干扰
                for (String town : town_key) {
                    //排除社区关键字干扰
                    if (qsdwmc.contains("镇镇")) {
                        if (qsdwmc.split("镇镇").length > 2) {
                            qsdwmc = qsdwmc.split("镇镇")[1];
                        }
                        break;
                    }
                    if (qsdwmc.contains(town)) {
                        qsdwmc = qsdwmc.split(town)[1];
                    }
                }
                //进行映射村一级
                if (qsdwmc.endsWith("村")) {
                    if (villageList.contains(qsdwmc)) {
                        qsdwmcToVillageMap.put(key, qsdwmc);
                    } else if (villageList.contains(qsdwmc.replace("村", "社区"))) {
                        qsdwmcToVillageMap.put(key, qsdwmc.replace("村", "社区"));
                    }
                } else if (qsdwmc.endsWith("社区")) {
                    if (villageList.contains(qsdwmc)) {
                        qsdwmcToVillageMap.put(key, qsdwmc);
                    }
                } else if (qsdwmc.endsWith("居民委员会")) {
                    qsdwmc = qsdwmc.split("居民委员会")[0];
                    if (qsdwmc.endsWith("社区")) {
                        if (villageList.contains(qsdwmc)) {
                            qsdwmcToVillageMap.put(key, qsdwmc);
                        }
                    } else {
                        if (villageList.contains(qsdwmc + "社区")) {
                            qsdwmcToVillageMap.put(key, qsdwmc + "社区");
                        }
                    }
                } else if (qsdwmc.endsWith("居委会")) {
                    qsdwmc = qsdwmc.split("居委会")[0];
                    if (qsdwmc.endsWith("社区")) {
                        if (villageList.contains(qsdwmc)) {
                            qsdwmcToVillageMap.put(key, qsdwmc);
                        }
                    } else {
                        if (villageList.contains(qsdwmc + "社区")) {
                            qsdwmcToVillageMap.put(key, qsdwmc + "社区");
                        }
                    }
                } else if (qsdwmc.endsWith("村民委员会")) {
                    if (villageList.contains(qsdwmc.split("村民委员会")[0] + "村")) {
                        qsdwmcToVillageMap.put(key, qsdwmc.split("村民委员会")[0] + "村");
                    }

                } else if (qsdwmc.endsWith("村委会")) {
                    if (villageList.contains(qsdwmc.split("村委会")[0] + "村")) {
                        qsdwmcToVillageMap.put(key, qsdwmc.split("村委会")[0] + "村");
                    }
                } else {
                    qsdwmcToVillageMap.put(key, null);
                }

            } catch (Exception e) {
                System.err.println(key + "匹配出错");
            }
        }
        //写入文件

        ExcelWriter wr = new ExcelWriter("D:\\三调—地块矢量文件镇村数据赋值.xlsx", "省市区镇村信息");
        wr.writeHeadRow(Arrays.asList(new String[]{"市id", "市名称", "区id", "区名称", "镇id", "镇名称", "村id", "村名称"}));
        wr.write(areaList).flush();
//        try {
//
//            BufferedWriter fw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
//                    "D:\\三调—地块矢量文件镇村数据赋值" + StringUtils.right(String.valueOf(System.currentTimeMillis()), 4) + ".csv"), "GBK"));
//            StringBuilder builder = new StringBuilder();
//
//            builder.append("市id,市名称,区id,区名称,镇id,镇名称,村id,村名称,权属单位名称,映射的村名称,SQL语句\n");
//            for (List<String> area : areaList) {
//                boolean containFlag = false;
//                builder.append(StringUtils.join(area, ","));
//                for (Entry<String, String> entry : qsdwmcToVillageMap.entrySet()) {
//                    if (area.get(area.size() - 1).equals(entry.getValue())) {
//                        builder.append("," + entry.getKey()).append("," + entry.getValue()).append("," + "xxx" + "\n");
//                        containFlag = true;
//                        break;
//                    }
//                }
//                if (!containFlag) {
//                    builder.append(",,,\n");
//                }
//            }
//            fw.write(builder.toString());
//            fw.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    //粘贴好数据源 village、source ， 运行main方法
    public static void main(String[] args) {
        maping();
    }

}

package com.lei.spanner.service;

import cn.hutool.core.io.file.FileWriter;
import com.alibaba.fastjson.JSON;
import com.lei.spanner.core.base.constants.DictCons.Level;
import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.base.model.ConfigContext;
import com.lei.spanner.core.base.model.DBHelper;
import com.lei.spanner.core.client.TestcSqlUtil;
import com.lei.spanner.core.util.DateTimeUtils;
import com.lei.spanner.core.util.FileUtil;
import com.lei.spanner.entity.dto.AreaLocalDTO;
import com.lei.spanner.entity.po.AreaLocalTemp;
import com.lei.spanner.entity.po.CBDKXX;
import com.lei.spanner.entity.po.CBF;
import com.lei.spanner.entity.po.FBF;
import com.lei.spanner.mapper.AreaLocalMapper;
import com.lei.spanner.mapper.AreaLocalTempMapper;
import com.lei.spanner.mapper.AreaMapper;
import com.lei.spanner.mapper.CBDKXXMapper;
import com.lei.spanner.mapper.CBFMapper;
import com.lei.spanner.mapper.CBHTMapper;
import com.lei.spanner.mapper.FBFMapper;
import com.lei.spanner.mapper.ReqDataMapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/***
 *@author wanglei
 *@Date 2022/11/3 10:22
 ***/

@Service
@Slf4j
public class GenAreaLocalService {

    @Autowired
    private AreaLocalMapper areaLocalMapper;
    @Autowired
    private AreaLocalTempMapper areaLocalTempMapper;
    @Autowired
    private AreaMapper areaMapper;
    @Autowired
    private CBFMapper cbfMapper;
    @Autowired
    private FBFMapper fbfMapper;
    @Autowired
    private CBDKXXMapper cbdkxxMapper;
    @Autowired
    private CBHTMapper cbhtMapper;
    @Autowired
    private ReqDataMapper reqDataMapper;
    @Autowired
    private TestcSqlUtil testcSqlUtil;

    private final static String outputPath = "D:\\GenFiles";

    //excel ??????
    public static List<AreaLocalTemp> excel(MultipartFile file) {
        //?????????????????????
        List<AreaLocalTemp> list = new ArrayList<>();
        try {
            String[] split = StringUtils.split(file.getOriginalFilename(), ".");
            switch (split[split.length - 1]) {
                case "xls": {
                    //1. ???????????? workbook ??????
                    HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
                    //2. ?????? workbook ??????????????????
                    int numberOfSheets = workbook.getNumberOfSheets();
                    for (int i = 0; i < numberOfSheets; i++) {
                        //3. ??????????????????????????????????????????????????????
                        HSSFSheet sheet = workbook.getSheetAt(i);
                        //4. ????????????????????????
                        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
                        for (int j = 0; j < physicalNumberOfRows; j++) {
                            //5. ???????????????
                            if (j == 0) {
                                continue;//???????????????
                            }
                            //6. ?????????
                            HSSFRow row = sheet.getRow(j);
                            if (row == null) {
                                continue;//???????????????????????????
                            }
                            //7. ????????????
                            int physicalNumberOfCells = row.getPhysicalNumberOfCells();

                            //???????????????????????????????????????
                            AreaLocalTemp temp = new AreaLocalTemp();
                            for (int k = 0; k < physicalNumberOfCells; k++) {
                                HSSFCell cell = row.getCell(k);

                                //pridict?????????excell?????????????????????????????????String??????
                                if (cell != null) {
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                }
                                String cellValue = cell.getStringCellValue();
                                //k????????????????????????switch????????????????????????????????????
                                switch (k) {
                                    case 0:
                                        temp.setOwnCode(cellValue);
                                        break;
                                    case 1:
                                        temp.setOwnName(cellValue);
                                        break;
                                    default:
                                        System.out.println("default!");
                                        break;
                                }
                            }
                            // ?????????????????????????????????csv??????????????????List?????????
                            list.add(temp);
                        }
                    }
                    break;
                }
                case "xlsx": {
                    //1. ???????????? workbook ??????
                    XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
                    //2. ?????? workbook ??????????????????
                    int numberOfSheets = workbook.getNumberOfSheets();
                    for (int i = 0; i < numberOfSheets; i++) {
                        //3. ??????????????????????????????????????????????????????
                        XSSFSheet sheet = workbook.getSheetAt(i);
                        //4. ????????????????????????
                        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
                        for (int j = 0; j < physicalNumberOfRows; j++) {
                            //5. ???????????????
                            if (j == 0) {
                                continue;//???????????????
                            }
                            //6. ?????????
                            XSSFRow row = sheet.getRow(j);
                            if (row == null) {
                                continue;//???????????????????????????
                            }
                            //7. ????????????
                            int physicalNumberOfCells = row.getPhysicalNumberOfCells();

                            //???????????????????????????????????????
                            AreaLocalTemp temp = new AreaLocalTemp();
                            for (int k = 0; k < physicalNumberOfCells; k++) {
                                XSSFCell cell = row.getCell(k);

                                //pridict?????????excell?????????????????????????????????String??????
                                if (cell != null) {
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                }
                                String cellValue = cell.getStringCellValue();
                                //k????????????????????????switch????????????????????????????????????
                                switch (k) {
                                    case 0:
                                        temp.setOwnCode(cellValue);
                                        break;
                                    case 1:
                                        temp.setOwnName(cellValue);
                                        break;
                                    default:
                                        System.out.println("default!");
                                        break;
                                }
                            }
                            // ?????????????????????????????????csv??????????????????List?????????
                            list.add(temp);
                        }
                    }
                    break;
                }
                default: {
                    break;
                }
            }

        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    //gis excel ??????
    public static List<String> gisExcel(MultipartFile file) {
        //?????????????????????
        List<String> list = new ArrayList<>();
        try {
            String[] split = StringUtils.split(file.getOriginalFilename(), ".");
            switch (split[split.length - 1]) {
                case "xls": {
                    //1. ???????????? workbook ??????
                    HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
                    //2. ?????? workbook ??????????????????
                    int numberOfSheets = workbook.getNumberOfSheets();
                    for (int i = 0; i < numberOfSheets; i++) {
                        //3. ??????????????????????????????????????????????????????
                        HSSFSheet sheet = workbook.getSheetAt(i);
                        //4. ????????????????????????
                        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
                        for (int j = 0; j < physicalNumberOfRows; j++) {
                            //5. ???????????????
                            if (j == 0) {
                                continue;//???????????????
                            }
                            //6. ?????????
                            HSSFRow row = sheet.getRow(j);
                            if (row == null) {
                                continue;//???????????????????????????
                            }
                            //7. ????????????
                            int physicalNumberOfCells = row.getPhysicalNumberOfCells();

                            //???????????????????????????????????????
                            String temp = new String();
                            for (int k = 0; k < physicalNumberOfCells; k++) {
                                HSSFCell cell = row.getCell(k);

                                //pridict?????????excell?????????????????????????????????String??????
                                if (cell != null) {
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                }
                                String cellValue = cell.getStringCellValue();
                                //k????????????????????????switch????????????????????????????????????
                                switch (k) {
                                    case 0:
                                        temp = "" + cellValue;
                                        break;
                                    default:
                                        System.out.println("default!");
                                        break;
                                }
                            }
                            // ?????????????????????????????????csv??????????????????List?????????
                            list.add(temp);
                        }
                    }
                    break;
                }
                case "xlsx": {
                    //1. ???????????? workbook ??????
                    XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
                    //2. ?????? workbook ??????????????????
                    int numberOfSheets = workbook.getNumberOfSheets();
                    for (int i = 0; i < numberOfSheets; i++) {
                        //3. ??????????????????????????????????????????????????????
                        XSSFSheet sheet = workbook.getSheetAt(i);
                        //4. ????????????????????????
                        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
                        for (int j = 0; j < physicalNumberOfRows; j++) {
                            //5. ???????????????
                            if (j == 0) {
                                continue;//???????????????
                            }
                            //6. ?????????
                            XSSFRow row = sheet.getRow(j);
                            if (row == null) {
                                continue;//???????????????????????????
                            }
                            //7. ????????????
                            int physicalNumberOfCells = row.getPhysicalNumberOfCells();

                            //???????????????????????????????????????
                            String temp = new String();
                            for (int k = 0; k < physicalNumberOfCells; k++) {
                                XSSFCell cell = row.getCell(k);

                                //pridict?????????excell?????????????????????????????????String??????
                                if (cell != null) {
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                }
                                String cellValue = cell.getStringCellValue();
                                //k????????????????????????switch????????????????????????????????????
                                switch (k) {
                                    case 0:
                                        temp = "" + cellValue;
                                        break;
                                    default:
                                        System.out.println("default!");
                                        break;
                                }
                            }
                            // ?????????????????????????????????csv??????????????????List?????????
                            list.add(temp);
                        }
                    }
                    break;
                }
                default: {
                    break;
                }
            }

        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    private BaseResp<List<AreaLocalTemp>> matching(List<AreaLocalTemp> tempList) {
        List<AreaLocalTemp> poList = new ArrayList<>();
        Set<String> villageNames = new HashSet<>();
        List<String> countyChars = Arrays.asList(new String[]{"???", "???"});
        List<String> townChars = Arrays.asList(new String[]{"???", "??????", "???"});
        List<String> villageChars = Arrays.asList(new String[]{"???", "??????"});

        for (AreaLocalTemp temp : tempList) {
            AreaLocalTemp po = new AreaLocalTemp();
            for (String villageChar : villageChars) {
                //????????????????????????
                if (!StringUtils.endsWith(temp.getOwnName(), villageChar)) {
                    continue;
                }
                //?????????????????????
                for (String townChar : townChars) {
                    if (StringUtils.contains(temp.getOwnName(), townChar)) {
                        temp.setOwnName(StringUtils.replace(temp.getOwnName(), townChar, townChar + ","));
                        break;
                    }
                }
                String[] villageArray = StringUtils.split(temp.getOwnName(), ',');
                if (villageArray.length != Level.TWO) {
                    break;
                }
                //?????????????????????
                for (String countyChar : countyChars) {
                    if (StringUtils.contains(temp.getOwnName(), countyChar)) {
                        temp.setOwnName(StringUtils.replace(temp.getOwnName(), countyChar, countyChar + ","));
                        break;
                    }
                }
                String[] townArray = StringUtils.split(temp.getOwnName(), ',');
                if (townArray.length != Level.THREE) {
                    break;
                }
                po.setVillageName(villageArray[1]);
                po.setTownName(townArray[1]);
                po.setCountyName(townArray[0]);
            }

            if (StringUtils.isBlank(po.getVillageName())) {continue;}
            if (villageNames.contains(po.getVillageName())) {continue;}

            po.setCountyId(StringUtils.substring(temp.getOwnCode(), 0, 6));
            po.setVillageCode(StringUtils.substring(temp.getOwnCode(), 0, 12));
            po.setOwnName(temp.getOwnName());
            po.setOwnCode(temp.getOwnCode());
            po.setCreateTime(new Date());
            poList.add(po);
            villageNames.add(po.getVillageName());
        }

        //????????????
        String countyId = poList.get(0).getCountyId();
        List<Map<String, Object>> area = testcSqlUtil.queryBySql("SELECT id,parent_id,area_name FROM `frp_user`.`sys_area` WHERE id=" + countyId + " ;");
        if (area == null || area.size() == 0) {
            log.error("??????????????????????????????sys_area??????????????????????????????CountyId???" + countyId);
        }

        List<Map<String, Object>> subList = testcSqlUtil.queryBySql(
                "SELECT id,parent_id,`name` FROM `frp_user`.`tbl_area_local` WHERE id=" + countyId + " ;");
        if (subList != null && subList.size() > 0) {
            log.error("tbl_area_local???????????????????????????????????????????????????????????????");
        }

        //????????????
        Long maxIdTown = (Long) testcSqlUtil.queryBySql(
                "SELECT IFNULL(max(a.id),1) maxId FROM `frp_user`.`tbl_area_local` a WHERE a.LEVEL=" + Level.FOUR + " ;").get(0).get("maxId");
        Long maxIdVillage = (Long) testcSqlUtil.queryBySql(
                "SELECT IFNULL(max(a.id),1) maxId FROM `frp_user`.`tbl_area_local` a WHERE a.LEVEL=" + Level.FIVE + " ;").get(0).get("maxId");

        log.info("\n-----------------------------maxIdTown:{}\n-----------------------------maxIdVillage:{}\n", maxIdTown, maxIdVillage);

        Long townId = (maxIdTown == null || maxIdTown < 1000000) ? 1000000 : maxIdTown;
        Long villageId = (maxIdVillage == null || maxIdVillage < 2000000) ? 2000000 : maxIdVillage;
        Map<String, AreaLocalDTO> areaLocalMap = new HashMap<>();

        for (AreaLocalTemp localTemp : poList) {
            AreaLocalDTO villageDTO = new AreaLocalDTO();
            AreaLocalDTO townTarget = areaLocalMap.get(localTemp.getTownName());
            if (townTarget == null) {
                AreaLocalDTO townDTO = new AreaLocalDTO();
                townId = ++townId;
                townDTO.setId(townId);
                townDTO.setName(localTemp.getTownName());
                townDTO.setParentId(Long.parseLong(countyId));
                townDTO.setLevel(Level.FOUR);
                townDTO.setCreateTime(new Date());
                townDTO.setUpdateTime(new Date());
                areaLocalMap.put(localTemp.getTownName(), townDTO);
            }
            villageId = ++villageId;
            villageDTO.setId(villageId);
            villageDTO.setName(localTemp.getVillageName());
            villageDTO.setParentId(areaLocalMap.get(localTemp.getTownName()).getId());
            villageDTO.setLevel(Level.FIVE);
            villageDTO.setCreateTime(new Date());
            villageDTO.setUpdateTime(new Date());
            areaLocalMap.put(localTemp.getVillageName(), villageDTO);

            //??????po????????????
            localTemp.setTownId(String.valueOf(areaLocalMap.get(localTemp.getTownName()).getId()));
            localTemp.setVillageId(String.valueOf(villageId));
            localTemp.setCreateTime(new Date());
            localTemp.setUpdateTime(new Date());

        }
        List<AreaLocalDTO> areaLocalDTOS = areaLocalMap.values().stream().map(value -> {
            AreaLocalDTO areaLocalDTO = new AreaLocalDTO();
            BeanUtils.copyProperties(value, areaLocalDTO);
            return areaLocalDTO;
        }).collect(Collectors.toList());
        log.info("?????????????????????????????????{}", JSON.toJSONString(poList.get(0)));

        StringBuilder stringBuilder = new StringBuilder();
        for (AreaLocalDTO areaLocalDTO : areaLocalDTOS) {
            stringBuilder.append(
                    "INSERT INTO `frp_user`.`tbl_area_local` (`id`, `parent_id`, `name`, `sort_num`, `level`, `create_time`, `update_time`) VALUES ("
                            + areaLocalDTO.getId() + ", " + areaLocalDTO.getParentId() + ", " + "'" + areaLocalDTO.getName() + "', "
                            + areaLocalDTO.getLevel() + ", " + "" + areaLocalDTO.getLevel() + ", '"
                            + DateTimeUtils.convertDate2String(areaLocalDTO.getCreateTime(), DateTimeUtils.DEFAULT_DATE_FORMAT) + "', '"
                            + DateTimeUtils.convertDate2String(areaLocalDTO.getUpdateTime(), DateTimeUtils.DEFAULT_DATE_FORMAT) + "');\n");
        }

        FileUtil.writeFile(outputPath,
                "??????????????????_" + poList.get(0).getCountyName() + "_" + DateTimeUtils.convertDate2String(new Date(), DateTimeUtils.YYYY_MM_DD)
                        + ".sql", stringBuilder.toString());

        return BaseResp.success();
    }

    public static void main(String[] args) {
        new FileWriter("D:\\work\\lei-repository\\lei-project\\lei-spanner\\src\\main\\resources\\josn").write("eeee");
    }

    //?????????????????????
    public BaseResp processSql(String tableName, List<String> dkbmList, StringBuffer stringBuffer) {
        //???????????????
        ThreadPoolExecutor executor = new ThreadPoolExecutor(20, 20, 1L, TimeUnit.SECONDS, new LinkedBlockingQueue<>(10));
        //?????????????????????????????????
        if (CollectionUtils.isEmpty(dkbmList)) {
            return BaseResp.failByParamError("??????????????????????????????.xls??????????????????????????????????????????");
        }
        //????????????????????????????????????
        List<AreaLocalTemp> areaLocalList = areaLocalTempMapper.getAll();
        if (areaLocalList == null || areaLocalList.size() == 0) {
            return BaseResp.failByParamError("???????????????????????????????????????????????????");
        }
        List<FBF> fbfList = fbfMapper.getAll();
        if (fbfList == null || fbfList.size() == 0) {
            return BaseResp.failByParamError("?????????????????????????????????????????????????????????");
        }
        List<CBDKXX> cbdkxxList = cbdkxxMapper.getAll();
        if (cbdkxxList == null || cbdkxxList.size() == 0) {
            return BaseResp.failByParamError("??????????????????????????????????????????????????????????????????");
        }
        List<CBF> cbfList = cbfMapper.getAll();
        if (cbfList == null || cbfList.size() == 0) {
            return BaseResp.failByParamError("?????????????????????????????????????????????????????????");
        }
        //??????map
        Map<String, FBF> fbfMap = fbfList.stream().collect(Collectors.toMap(FBF::getFBFBM, fbf -> fbf));
        Map<String, CBF> cbfMap = cbfList.stream().collect(Collectors.toMap(CBF::getCBFBM, cbf -> cbf));
        Map<String, CBDKXX> cbdkxxMap = cbdkxxList.stream().collect(Collectors.toMap(CBDKXX::getDKBM, cbdkxx -> cbdkxx));
        Map<String, List<AreaLocalTemp>> areaLocalTempMap = areaLocalList.stream().collect(Collectors.groupingBy(AreaLocalTemp::getVillageCode));

        log.info("??????????????????????????????{}????????????????????????????????????{}???????????????????????????????????????{}???", fbfList.size(), cbfList.size(), cbdkxxList.size());

        // ?????????????????????????????????
        int realSize = dkbmList.size();
        int minSize = 10000;
        int count = 20;//?????????
        int rate = 5000;//??????
        for (int i = 1; i < 4; i++) {
            //???????????????
            if (realSize < minSize) {
                rate = 10000;
                break;
            }
            if (realSize >= minSize * Math.pow(10, 3)) {
                return BaseResp.failByParamError("???????????????1000w,??????????????????????????????");
            }
            //????????????
            if (minSize * Math.pow(10, i) <= realSize && minSize * Math.pow(10, i + 1) > realSize) {
                rate = realSize / count;
                for (int j = 0; j < count; j++) {
                    if ((count - j) * minSize * Math.pow(10, i) / count >= rate && (count - j - 1) * minSize * Math.pow(10, i) / count < rate) {
                        rate = (int) ((count - j) * minSize * Math.pow(10, i) / count);
                    }
                }
            }
        }

        //??????????????????
        AtomicInteger index = new AtomicInteger();
        ArrayList<CompletableFuture> futureList = new ArrayList<>();
        for (int i = 0; i < count + 1; i++) {
            if (i * rate > realSize) {
                break;
            }
            int lineCount = i;
            int toIndex = (i + 1) * rate;
            List<String> subList = dkbmList.subList(i * rate, toIndex > dkbmList.size() ? dkbmList.size() : toIndex);
            CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
                int flag = 0;
                for (String sub : subList) {
                    log.info("\n?????????????????????????????????{}?????????{}\n-----------------------?????????{}??????????????????{}?????????;\n-----------------------????????????{}??????????????????{}??????????????????\n", lineCount, Thread.currentThread(), ++flag,
                            subList.size() - flag, index.incrementAndGet(), dkbmList.size() - index.get());
                    List<AreaLocalTemp> villageList = areaLocalTempMap.get(StringUtils.substring(sub, 0, 12));
                    AreaLocalTemp village = new AreaLocalTemp();
                    if (villageList != null && villageList.size() > 0) {
                        village = villageList.get(0);
                    }
                    FBF fbf = fbfMap.get(StringUtils.substring(sub, 0, 14));
                    if (fbf == null) {
                        fbf = new FBF();
                    }
                    CBDKXX cbdkxx = cbdkxxMap.get(sub);
                    CBF cbf = new CBF();
                    if (cbdkxx == null) {
                        cbdkxx = new CBDKXX();
                    }
                    else {
                        cbf = cbfMap.get(cbdkxx.getCBFBM());
                    }
                    String sql = "UPDATE a SET " + "  a.FBFBM = " + (fbf.getFBFBM() == null ? null : "'" + fbf.getFBFBM() + "'") + " ,a.FBFMC = " + (
                            fbf.getFBFMC() == null ? null : "'" + fbf.getFBFMC() + "'") + " ,a.CBFBM = " + (cbf.getCBFBM() == null ? null :
                            "'" + cbf.getCBFBM() + "'") + " ,a.CBFMC = " + (cbf.getCBFMC() == null ? null : "'" + cbf.getCBFMC() + "'") + " ,a.CBFZJHM = "
                            + (cbf.getCBFZJHM() == null ? null : "'" + cbf.getCBFZJHM() + "'") + " ,a.LXDH = " + (cbf.getLXDH() == null ? null :
                            "'" + cbf.getLXDH() + "'") + " ,a.city_id = " + (village.getCityId() == null ? null : "'" + village.getCityId() + "'")
                            + " ,a.city_name = " + (village.getCityName() == null ? null : "'" + village.getCityName() + "'") + " ,a.county_id = " + (
                            village.getCountyId() == null ? null : "'" + village.getCountyId() + "'") + " ,a.county_name = " + (
                            village.getCountyName() == null ? null : "'" + village.getCountyName() + "'") + " ,a.town_id = " + (
                            village.getCountyName() == null ? null : "'" + village.getCountyName() + "'") + " ,a.town_name = " + (
                            village.getTownName() == null ? null : "'" + village.getTownName() + "'") + " ,a.village_id = " + (
                            village.getVillageId() == null ? null : "'" + village.getVillageId() + "'") + " ,a.village_name = " + (
                            village.getVillageName() == null ? null : "'" + village.getVillageName() + "'") + " FROM " + tableName
                            + " AS a WHERE a.DKBM = " + (sub == null ? null : "'" + sub + "'") + " ;\n";
                    stringBuffer.append(sql);
                }
            }, executor);
            futureList.add(future);
        }
        CompletableFuture.allOf(futureList.toArray(new CompletableFuture[futureList.size()])).exceptionally((e) -> {
            log.error("????????????????????????----------{}", e.getCause());
            return null;
        }).join();

        return BaseResp.success();
    }

    /**
     * ??????????????????
     *
     * @param excel
     * @return
     */
    public BaseResp matchingAreaLocal(MultipartFile excel) {
        log.info("??????????????????????????????.xls ???", excel.getOriginalFilename());
        if (excel == null) {
            return BaseResp.failByParamError("??????????????????????????????.xls??????????????????????????????????????????");
        }
        List<AreaLocalTemp> tempList = excel(excel);
        if (tempList == null || tempList.size() == 0) {
            return BaseResp.failByParamError("??????????????????????????????.xls??????????????????????????????????????????");
        }
        //????????????
        BaseResp<List<AreaLocalTemp>> poListResp = matching(tempList);
        if (!poListResp.isSuccess()) {
            return BaseResp.returnResp(poListResp);
        }
        return BaseResp.success("???????????????????????????D:\\GenFiles?????????????????????");

    }


    /**
     * gis????????????
     *
     * @param tableName
     * @param type
     * @return
     */
    public String gisFieldsAdd(String tableName, Integer type) {
        StringBuilder stringBuilder = new StringBuilder();
        switch (type) {
            case 0: {//??????
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [CBFBM] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [CBFMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [CBFZJHM] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [LXDH] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [FBFBM] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [FBFMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [land_type] int  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [sn_land_flag] int  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [sn_land_plant_flag] int  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [shed_flag] int  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [city_id] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [city_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [county_id] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [county_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [town_id] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [town_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [village_id] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [village_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [group_id] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [group_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [sn_farm_id] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [sn_farm_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [sn_legal_person] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [sn_legal_person_phone] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [shelf_status] int NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [del_flag] int NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [shelf_by] int  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [delete_by] int  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [create_by] int  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [update_by] int  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [shelf_time] datetime2(7)  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [delete_time] datetime2(7)  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [create_time] datetime2(7)  NULL;\n");
                stringBuilder.append("ALTER TABLE " + tableName + " ADD [update_time] datetime2(7)  NULL;\n");
                stringBuilder.append("UPDATE " + tableName + " SET [shelf_status]=0;\n");
                stringBuilder.append("UPDATE " + tableName + " SET [del_flag]=0;\n");
                break;
            }
            case 1: {//??????
                break;
            }
            case 2: {//?????????
                break;
            }
            case 3: {//??????
                break;
            }
        }
        log.info("sql:{}", stringBuilder.toString());
        return stringBuilder.toString();
    }


    /**
     * ?????????????????????sql??????
     *
     * @param excel
     * @param tableName
     * @return
     */
    public BaseResp getQueQuanUpdateSql(MultipartFile excel, String tableName) {
        log.info("????????????????????????.xlsx ???{}", excel.getOriginalFilename());
        long start = System.currentTimeMillis();
        if (excel == null) {
            return BaseResp.failByParamError("????????????????????????.xlsx??????????????????????????????????????????");
        }
        List<String> dkbmList = gisExcel(excel);
        if (dkbmList == null || dkbmList.size() == 0) {
            return BaseResp.failByParamError("??????????????????????????????.xls??????????????????????????????????????????");
        }

        StringBuffer stringBuffer = new StringBuffer();
        log.info("????????????????????????.xlsx ??????{}?????????", dkbmList.size());

        processSql(tableName, dkbmList, stringBuffer);

        FileUtil.writeFile(outputPath,
                tableName + "_??????gis?????????sql??????_" + DateTimeUtils.convertDate2String(new Date(), DateTimeUtils.YYYY_MM_DD) + ".sql", stringBuffer.toString());
        long end = System.currentTimeMillis();
        long s = (end - start) / 1000;
        long m = s / 60;
        log.info("????????????????????????????????????{}???{}???", m, s);
        return BaseResp.success("???????????????????????????D:\\GenFiles?????????????????????" + "????????????" + m + "???" + s + "???");
    }

    /**
     * ?????????????????????sql?????? BY DB
     *
     * @param excel
     * @param tableName
     * @return
     */
    public BaseResp getQueQuanUpdateSqlByDB(String tableName) {

        long start = System.currentTimeMillis();
        List<String> dkbmList = reqDataMapper.getDkbm();
        if (dkbmList == null || dkbmList.size() == 0) {
            return BaseResp.failByParamError("??????????????????????????????.xls??????????????????????????????????????????");
        }

        StringBuffer stringBuffer = new StringBuffer();
        log.info("????????????????????????.xlsx ??????{}?????????", dkbmList.size());

        processSql(tableName, dkbmList, stringBuffer);

        FileUtil.writeFile(outputPath,
                tableName + "_??????gis?????????sql??????_" + DateTimeUtils.convertDate2String(new Date(), DateTimeUtils.YYYY_MM_DD) + ".sql", stringBuffer.toString());
        long end = System.currentTimeMillis();
        long s = (end - start) / 1000;
        long m = s / 60;
        log.info("????????????????????????????????????{}???{}???", m, s);
        return BaseResp.success("???????????????????????????D:\\GenFiles?????????????????????" + "????????????" + m + "???" + s + "???");
    }


    public BaseResp updateGisDataQuequan(String tableName, String areaId, String areaLevel) {
        ConfigContext configContext = new ConfigContext();
        configContext.setDriver("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        configContext.setUrl("jdbc:sqlserver://121.41.213.10:1433;databasename=sde");
        configContext.setUserName("sa");
        configContext.setPassword("SNkoudai!@#$<>?");
        configContext.setOutputPath(outputPath + "updateGisDataQuequan_" + new Date());

        configContext.setTargetTable(tableName);

        //?????????DB?????????
        DBHelper dbHelper = new DBHelper(configContext);

        //??????????????????????????????
        List<Map<String, Object>> maps = dbHelper.queryMapList("SELECT DKBM,town_name FROM sde.TBL_XINJIANG_AKESU_QUEQUAN WHERE town_id='1000348';", null);
        System.err.println("ddd");
        return BaseResp.success();
    }

}

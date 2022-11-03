package com.lei.spanner.service;

import com.alibaba.fastjson.JSON;
import com.lei.spanner.core.base.constants.DictCons.Level;
import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.util.DateTimeUtils;
import com.lei.spanner.core.util.FileUtil;
import com.lei.spanner.entity.dto.AreaLocalDTO;
import com.lei.spanner.entity.po.Area;
import com.lei.spanner.entity.po.AreaLocal;
import com.lei.spanner.entity.po.AreaLocalTemp;
import com.lei.spanner.entity.po.CBDKXX;
import com.lei.spanner.entity.po.CBF;
import com.lei.spanner.entity.po.CBHT;
import com.lei.spanner.entity.po.FBF;
import com.lei.spanner.mapper.AreaLocalMapper;
import com.lei.spanner.mapper.AreaLocalTempMapper;
import com.lei.spanner.mapper.AreaMapper;
import com.lei.spanner.mapper.CBDKXXMapper;
import com.lei.spanner.mapper.CBFMapper;
import com.lei.spanner.mapper.CBHTMapper;
import com.lei.spanner.mapper.FBFMapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
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


    private final static String outputPath = "D:\\GenFiles";

    //excel 处理
    public static List<AreaLocalTemp> excel(MultipartFile file) {
        //定义一个空数组
        List<AreaLocalTemp> list = new ArrayList<>();
        try {
            String[] split = StringUtils.split(file.getOriginalFilename(), ".");
            switch (split[split.length - 1]) {
                case "xls": {
                    //1. 创建一个 workbook 对象
                    HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
                    //2. 获取 workbook 中表单的数量
                    int numberOfSheets = workbook.getNumberOfSheets();
                    for (int i = 0; i < numberOfSheets; i++) {
                        //3. 获取表单，先得到每一行，在得到每一列
                        HSSFSheet sheet = workbook.getSheetAt(i);
                        //4. 获取表单中的行数
                        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
                        for (int j = 0; j < physicalNumberOfRows; j++) {
                            //5. 跳过标题行
                            if (j == 0) {
                                continue;//跳过标题行
                            }
                            //6. 获取行
                            HSSFRow row = sheet.getRow(j);
                            if (row == null) {
                                continue;//防止数据中间有空行
                            }
                            //7. 获取列数
                            int physicalNumberOfCells = row.getPhysicalNumberOfCells();

                            //循环获得每一行中每一列数据
                            AreaLocalTemp temp = new AreaLocalTemp();
                            for (int k = 0; k < physicalNumberOfCells; k++) {
                                HSSFCell cell = row.getCell(k);

                                //pridict里边的excell是数字型，要把先转换成String类型
                                if (cell != null) {
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                }
                                String cellValue = cell.getStringCellValue();
                                //k为表示哪一列，用switch选择，把对应值加入对象中
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
                            // 最后将解析后的数据，为csv对象，添加到List集合中
                            list.add(temp);
                        }
                    }
                    break;
                }
                case "xlsx": {
                    //1. 创建一个 workbook 对象
                    XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
                    //2. 获取 workbook 中表单的数量
                    int numberOfSheets = workbook.getNumberOfSheets();
                    for (int i = 0; i < numberOfSheets; i++) {
                        //3. 获取表单，先得到每一行，在得到每一列
                        XSSFSheet sheet = workbook.getSheetAt(i);
                        //4. 获取表单中的行数
                        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
                        for (int j = 0; j < physicalNumberOfRows; j++) {
                            //5. 跳过标题行
                            if (j == 0) {
                                continue;//跳过标题行
                            }
                            //6. 获取行
                            XSSFRow row = sheet.getRow(j);
                            if (row == null) {
                                continue;//防止数据中间有空行
                            }
                            //7. 获取列数
                            int physicalNumberOfCells = row.getPhysicalNumberOfCells();

                            //循环获得每一行中每一列数据
                            AreaLocalTemp temp = new AreaLocalTemp();
                            for (int k = 0; k < physicalNumberOfCells; k++) {
                                XSSFCell cell = row.getCell(k);

                                //pridict里边的excell是数字型，要把先转换成String类型
                                if (cell != null) {
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                }
                                String cellValue = cell.getStringCellValue();
                                //k为表示哪一列，用switch选择，把对应值加入对象中
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
                            // 最后将解析后的数据，为csv对象，添加到List集合中
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

    //gis excel 处理
    public static List<String> gisExcel(MultipartFile file) {
        //定义一个空数组
        List<String> list = new ArrayList<>();
        try {
            String[] split = StringUtils.split(file.getOriginalFilename(), ".");
            switch (split[split.length - 1]) {
                case "xls": {
                    //1. 创建一个 workbook 对象
                    HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
                    //2. 获取 workbook 中表单的数量
                    int numberOfSheets = workbook.getNumberOfSheets();
                    for (int i = 0; i < numberOfSheets; i++) {
                        //3. 获取表单，先得到每一行，在得到每一列
                        HSSFSheet sheet = workbook.getSheetAt(i);
                        //4. 获取表单中的行数
                        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
                        for (int j = 0; j < physicalNumberOfRows; j++) {
                            //5. 跳过标题行
                            if (j == 0) {
                                continue;//跳过标题行
                            }
                            //6. 获取行
                            HSSFRow row = sheet.getRow(j);
                            if (row == null) {
                                continue;//防止数据中间有空行
                            }
                            //7. 获取列数
                            int physicalNumberOfCells = row.getPhysicalNumberOfCells();

                            //循环获得每一行中每一列数据
                            String temp = new String();
                            for (int k = 0; k < physicalNumberOfCells; k++) {
                                HSSFCell cell = row.getCell(k);

                                //pridict里边的excell是数字型，要把先转换成String类型
                                if (cell != null) {
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                }
                                String cellValue = cell.getStringCellValue();
                                //k为表示哪一列，用switch选择，把对应值加入对象中
                                switch (k) {
                                    case 0:
                                        temp = "" + cellValue;
                                        break;
                                    default:
                                        System.out.println("default!");
                                        break;
                                }
                            }
                            // 最后将解析后的数据，为csv对象，添加到List集合中
                            list.add(temp);
                        }
                    }
                    break;
                }
                case "xlsx": {
                    //1. 创建一个 workbook 对象
                    XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
                    //2. 获取 workbook 中表单的数量
                    int numberOfSheets = workbook.getNumberOfSheets();
                    for (int i = 0; i < numberOfSheets; i++) {
                        //3. 获取表单，先得到每一行，在得到每一列
                        XSSFSheet sheet = workbook.getSheetAt(i);
                        //4. 获取表单中的行数
                        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
                        for (int j = 0; j < physicalNumberOfRows; j++) {
                            //5. 跳过标题行
                            if (j == 0) {
                                continue;//跳过标题行
                            }
                            //6. 获取行
                            XSSFRow row = sheet.getRow(j);
                            if (row == null) {
                                continue;//防止数据中间有空行
                            }
                            //7. 获取列数
                            int physicalNumberOfCells = row.getPhysicalNumberOfCells();

                            //循环获得每一行中每一列数据
                            String temp = new String();
                            for (int k = 0; k < physicalNumberOfCells; k++) {
                                XSSFCell cell = row.getCell(k);

                                //pridict里边的excell是数字型，要把先转换成String类型
                                if (cell != null) {
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                }
                                String cellValue = cell.getStringCellValue();
                                //k为表示哪一列，用switch选择，把对应值加入对象中
                                switch (k) {
                                    case 0:
                                        temp = "" + cellValue;
                                        break;
                                    default:
                                        System.out.println("default!");
                                        break;
                                }
                            }
                            // 最后将解析后的数据，为csv对象，添加到List集合中
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
        List<String> countyChars = Arrays.asList(new String[]{"区", "县"});
        List<String> townChars = Arrays.asList(new String[]{"镇", "街道", "乡"});
        List<String> villageChars = Arrays.asList(new String[]{"村", "社区"});

        for (AreaLocalTemp temp : tempList) {
            AreaLocalTemp po = new AreaLocalTemp();
            for (String villageChar : villageChars) {
                //村一级结尾的数据
                if (!StringUtils.endsWith(temp.getOwnName(), villageChar)) {
                    continue;
                }
                //分割镇一级出来
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
                //分割区一级出来
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

        //校验数据
        String countyId = poList.get(0).getCountyId();
        Area area = areaMapper.getById(countyId);
        if (area == null) {
            return BaseResp.failByParamError("未查询到该区，请检查sys_area表中是否有该区县！，CountyId：" + countyId);
        }

        List<AreaLocal> subList = areaLocalMapper.getListByParentId(countyId);
        if (subList != null && subList.size() > 0) {
            return BaseResp.failByParamError("tbl_area_local表中已存在该区县下的镇村信息，请检查数据！");
        }

        //处理数据
        Long maxIdTown = areaLocalMapper.getMaxIdByLevel(Level.FOUR);
        Long maxIdVillage = areaLocalMapper.getMaxIdByLevel(Level.FIVE);

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

            //填入po字段入库
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
        log.info("匹配后的镇村一级信息：{}", JSON.toJSONString(poList.get(0)));

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
                "镇村数据处理_" + poList.get(0).getCountyName() + "_" + DateTimeUtils.convertDate2String(new Date(), DateTimeUtils.YYYY_MM_DD)
                        + ".sql", stringBuilder.toString());

        Area county = areaMapper.getById(countyId);
        Area city = areaMapper.getById(county.getParentId());
        Area province = areaMapper.getById(city.getParentId());

        if (province != null && city != null && province != null) {
            for (AreaLocalTemp po : poList) {
                po.setProvinceId(province.getId());
                po.setProvinceName(province.getAreaName());
                po.setCityId(city.getId());
                po.setCityName(city.getAreaName());
                areaLocalTempMapper.insert(po);
            }
        }

        return BaseResp.success();
    }


    /**
     * 区域数据处理
     *
     * @param excel
     * @return
     */
    public BaseResp matchingAreaLocal(MultipartFile excel) {
        log.info("传入的权属单位代码表.xls ：", excel.getOriginalFilename());
        if (excel == null) {
            return BaseResp.failByParamError("传入的权属单位代码表.xls有误，请核对后再调用该接口！");
        }
        List<AreaLocalTemp> tempList = excel(excel);
        if (tempList == null || tempList.size() == 0) {
            return BaseResp.failByParamError("传入的权属单位代码表.xls有误，请核对后再调用该接口！");
        }
        //数据处理
        BaseResp<List<AreaLocalTemp>> poListResp = matching(tempList);
        if (!poListResp.isSuccess()) {
            return BaseResp.returnResp(poListResp);
        }
        return BaseResp.success("数据处理成功，请到D:\\GenFiles目录查看数据！");

    }


    /**
     * gis数据处理
     *
     * @param tableName
     * @param type
     * @return
     */
    public String gisFieldsAdd(String tableName, Integer type) {
        StringBuilder stringBuilder = new StringBuilder();
        switch (type) {
            case 0: {//确权
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
            case 1: {//三调
                break;
            }
            case 2: {//高标准
                break;
            }
            case 3: {//轮廓
                break;
            }
        }
        log.info("sql:{}", stringBuilder.toString());
        return stringBuilder.toString();
    }


    /**
     * 获取更新需要的sql文件
     *
     * @param excel
     * @param tableName
     * @return
     */
    public BaseResp getQueQuanUpdateSql(MultipartFile excel, String tableName) {
        log.info("传入的地块代码表.xlsx ：", excel.getOriginalFilename());
        if (excel == null) {
            return BaseResp.failByParamError("传入的地块代码表.xlsx有误，请核对后再调用该接口！");
        }
        List<String> dkbmList = gisExcel(excel);
        if (dkbmList == null || dkbmList.size() == 0) {
            return BaseResp.failByParamError("传入的权属单位代码表.xls有误，请核对后再调用该接口！");
        }

        List<String> sqlList = new ArrayList<>();
        int count=0;
        for (String dkbm : dkbmList) {
            log.info("开始处理数据，第{}个地块，还剩{}个地块",++count,dkbmList.size()-count);
            //获取省市信息
            List<AreaLocalTemp> villageList = areaLocalTempMapper.getByVillageCode(StringUtils.substring(dkbm, 0, 12));
            if (villageList == null || villageList.size() == 0) {
                return BaseResp.failByParamError("处理gis数据前，镇村信息应先初始化！");
            }
            AreaLocalTemp village = villageList.get(0);
            CBDKXX cbdkxx = cbdkxxMapper.getBydkbm(dkbm);
            if (cbdkxx == null) {
                log.error("该地块编码：{}未查询到地块信息", dkbm);
                continue;
            }
            CBHT cbht = cbhtMapper.getBycbhtbm(cbdkxx.getCBHTBM());
            if (cbht == null) {
                log.error("该地块编码：{}未查询到承包合同信息", dkbm);
                continue;
            }
            FBF fbf = fbfMapper.getByfbfbm(cbht.getFBFBM());
            if (fbf == null) {
                log.error("该地块编码：{}未查询到发包方信息", dkbm);
                continue;
            }
            CBF cbf = cbfMapper.getBycbfbm(cbht.getCBFBM());
            if (fbf == null) {
                log.error("该地块编码：{}未查询到承包方信息", dkbm);
                continue;
            }
            String sql = "UPDATE a SET "+
                    "  a.FBFBM = " + fbf.getFBFBM() +
                    " ,a.FBFMC = " + fbf.getFBFMC() +
                    " ,a.CBFBM = " + cbf.getCBFBM() +
                    " ,a.CBFMC = " + cbf.getCBFMC() +
                    " ,a.CBFZJHM = " + cbf.getCBFZJHM() +
                    " ,a.LXDH = " + cbf.getLXDH() +
                    " ,a.city_id = " + village.getCityId() +
                    " ,a.city_name = " + village.getCityName() +
                    " ,a.county_id = " + village.getCountyId() +
                    " ,a.county_name = " + village.getCountyName() +
                    " ,a.town_id = " + village.getTownId() +
                    " ,a.town_name = " + village.getTownName() +
                    " ,a.village_id = " + village.getVillageId() +
                    " ,a.village_name = " + village.getVillageName() +
                    " FROM " + tableName + " WHERE a.DKBM = "+ dkbm + " ;\n";
            sqlList.add(sql);
        }
        FileUtil.writeFile(outputPath, "获取确权数据需要更新的数据.sql文件_" + tableName + "_" + DateTimeUtils.convertDate2String(new Date(), DateTimeUtils.YYYY_MM_DD)
                + ".sql", StringUtils.join(sqlList));
        return BaseResp.success("数据处理成功，请到D:\\GenFiles目录查看数据！");
    }
}

package com.lei.spanner.service;

import com.lei.spanner.core.base.model.BaseResp;
import com.lei.spanner.core.util.SnkdGenUtil;
import com.lei.spanner.entity.req.GenCodeSnkoudaiReq;
import com.lei.spanner.mapper.GenCodeServiceMapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/***
 *@author wanglei
 *@Date 2022/11/2 17:43
 ***/

@Service
@Slf4j
public class GenCodeService {

    @Autowired
    private GenCodeServiceMapper genCodeServiceMapper;

    @Autowired
    private SnkdGenUtil snkdGenUtil;


    //sndoudai读取excel

    private List<GenCodeSnkoudaiReq> readexcel(MultipartFile file) {
        log.info("开始读取excel：{}", file.getOriginalFilename());
        List<GenCodeSnkoudaiReq> list = new ArrayList<>();
        try {
            String[] split = StringUtils.split(file.getOriginalFilename(), ".");
            switch (split[split.length - 1]) {
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
                            GenCodeSnkoudaiReq genCodeSnkoudaiReq = new GenCodeSnkoudaiReq();
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
                                        genCodeSnkoudaiReq.setTableName(cellValue);
                                        break;
                                    case 1:
                                        genCodeSnkoudaiReq.setFileName(cellValue);
                                        break;
                                    case 2:
                                        genCodeSnkoudaiReq.setPackageName(cellValue);
                                        break;
                                    default:
                                        System.out.println("default!");
                                        break;
                                }
                            }
                            // 最后将解析后的数据，为csv对象，添加到List集合中
                            list.add(genCodeSnkoudaiReq);
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
        log.info("读取excel的结果：{}", list.toString());
        return list;
    }


    public BaseResp snkdGenByExcel(MultipartFile reqModel) {
        if (reqModel == null || StringUtils.endsWith(reqModel.getOriginalFilename(), "xslx")) {
            return BaseResp.failByParamError("请传入正确的excel！");
        }
        //读取excel
        List<GenCodeSnkoudaiReq> readexcel = readexcel(reqModel);
        if (readexcel == null || readexcel.size() == 0) {
            return BaseResp.failByParamError("excel未读取到数据或读取失败！");
        }

        //调用生成逻辑
        snkdGenUtil.snkdGen(readexcel);

        return BaseResp.success("如下表代码生成成功： " + readexcel.stream().map(GenCodeSnkoudaiReq::getTableName).collect(Collectors.joining(",")));

    }


    public BaseResp snkdGenByJson(List<GenCodeSnkoudaiReq> reqModel) {
        if (reqModel == null||reqModel.size()==0) {
            return BaseResp.failByParamError("请输入正确的表信息！");
        }
        //调用生成逻辑
        snkdGenUtil.snkdGen(reqModel);

        return BaseResp.success("如下表代码生成成功： " + reqModel.stream().map(GenCodeSnkoudaiReq::getTableName).collect(Collectors.joining(",")));
    }
}

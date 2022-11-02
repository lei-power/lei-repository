package com.lei.spanner.core.util;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * @author wangkai
 * @date 2020/9/9 8:14
 */
public class ExportExcelUtil {

    public static final String SHEET_NAME = "sheet1";


    /**
     * 将excel数据写入服务器
     * <p>
     * excel导出 模板固定格式，参考政府端->总览->执法监管明细列表->导出excel
     *
     * @param title         标题
     *                      示例：  private static final String[] TITLE = new String[]{"经营主体名称","区/县","街镇"};
     * @param firstRowName  第一行名称
     * @param secondRowName 第二行名称
     * @param list          导出数据集合
     *                      方法封装实列： Po:数据封装好的对象
     *                      private List<LinkedList<String>> buildContent( List<Po> list) {
     *                      List<LinkedList<String>> resultList = new ArrayList<>();
     *                      for (Po po : list) {
     *                      LinkedList<String> linkedList = new LinkedList<>();
     *                      <p>
     *                      //填充内容，跟标题一致,一一对应
     *                      linkedList.add(po.getCompanyName()); //经营主体名称
     *                      linkedList.add(po.getDistrict());    //区/县
     *                      linkedList.add(po.getTown());        //街镇
     *                      resultList.add(linkedList);
     *                      }
     *                      return resultList;
     *                      }
     * @param fileName      excel导出名称
     * @param time          次数
     */
    public static void exportExcel(String[] title, String firstRowName, String secondRowName, List<LinkedList<String>> list, String fileName, int time) {
        try {
            if (time == 0) {
                SXSSFWorkbook wb = new SXSSFWorkbook();
                CreationHelper createHelper = wb.getCreationHelper();
                OutputStream fileOut = new FileOutputStream(fileName);
                Sheet sheet = wb.createSheet(SHEET_NAME);
                //第一行合并单元格
                CellRangeAddress callRangeAddress29 = new CellRangeAddress(0, 0, 0, title.length - 1);
                // 第二行合并单元格
                CellRangeAddress callRangeAddress30 = new CellRangeAddress(1, 1, 0, title.length - 1);
                sheet.addMergedRegion(callRangeAddress29);
                sheet.addMergedRegion(callRangeAddress30);
                // 创建第一行
                Row row0 = sheet.createRow(0);
                row0.setHeight((short) 0x200);
                Cell cell0 = row0.createCell(0);
                cell0.setCellValue(firstRowName);
                Font headfont = wb.createFont();
                headfont.setFontHeightInPoints((short) 18);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headfont.setFontName("宋体");

                CellStyle headstyle = wb.createCellStyle();   // 单元格样式
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cell0.setCellStyle(headstyle);

                // 使用RegionUtil类为合并后的单元格添加边框
                RegionUtil.setBorderBottom(1, callRangeAddress29, sheet); // 下边框
                RegionUtil.setBorderLeft(1, callRangeAddress29, sheet); // 左边框
                RegionUtil.setBorderRight(1, callRangeAddress29, sheet); // 有边框
                RegionUtil.setBorderTop(1, callRangeAddress29, sheet); // 上边框

                // 创建第二行
                Row row1 = sheet.createRow(1);
                row1.setHeight((short) 0x200);
                Cell cell1 = row1.createCell(0);
                cell1.setCellValue(secondRowName);


                cell1.setCellStyle(headstyle);

                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headstyle = wb.createCellStyle();   // 单元格样式
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cell1.setCellStyle(headstyle);

                // 使用RegionUtil类为合并后的单元格添加边框
                RegionUtil.setBorderBottom(1, callRangeAddress30, sheet);  // 下边框
                RegionUtil.setBorderLeft(1, callRangeAddress30, sheet);    // 左边框
                RegionUtil.setBorderRight(1, callRangeAddress30, sheet);   // 有边框
                RegionUtil.setBorderTop(1, callRangeAddress30, sheet);     // 上边框

                Row row = sheet.createRow(2);
                row.setHeight((short) 0x200);
                Cell cell = null;
                // 第三行
                for (int i = 0; i < title.length; i++) {
                    cell = row.createCell(i);

                    cell.setCellValue(title[i]);

                    headfont = wb.createFont();
                    headfont.setFontName("宋体");
                    headfont.setFontHeightInPoints((short) 12);// 字体大小
                    headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                    headstyle = wb.createCellStyle();
                    headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                    headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                    headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                    headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                    headstyle.setFont(headfont);
                    headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                    headstyle.setLocked(true);
                    headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                    headstyle.setBorderBottom(BorderStyle.THIN);
                    headstyle.setBorderLeft(BorderStyle.THIN);
                    headstyle.setBorderRight(BorderStyle.THIN);
                    headstyle.setBorderTop(BorderStyle.THIN);

                    // 设置列宽度
                    for (int j = 0; j < title.length; j++) {
                        sheet.setColumnWidth(j, 160 * 35 + 323);
                    }
                    cell.setCellStyle(headstyle);
                }
                // 正文内容
                for (int i = 0; i < list.size(); i++) {
                    LinkedList<String> list1 = list.get(i);
                    row = sheet.createRow(i + 3);
                    for (int j = 0; j < title.length; j++) {
                        Cell cell2 = row.createCell(j);
                        cell2.setCellValue(list1.get(j));
//                        System.out.println(list1.get(j));
                    }
                }
                wb.write(fileOut);
                fileOut.flush();
                fileOut.close();
            } else {
                FileInputStream in = new FileInputStream(fileName);
                XSSFWorkbook wb = new XSSFWorkbook(in);
                XSSFSheet sheet = wb.getSheetAt(0);
                int rownum = sheet.getLastRowNum();
                FileOutputStream out = new FileOutputStream(fileName);
                // 正文内容
                for (int i = 0; i < list.size(); i++) {
                    LinkedList<String> list1 = list.get(i);
                    Row row = sheet.createRow(i + rownum);
                    for (int j = 0; j < title.length; j++) {
                        Cell cell2 = row.createCell(j);
                        cell2.setCellValue(list1.get(j));
                    }
                }
                wb.write(out);
                out.flush();
                out.close();
                in.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

/*    public static void main(String[] args) {
        String[] TITLE = new String[]{"经营主体名称", "市", "区/县", "街镇", "村", "播种面积（亩次）-小计", "播种面积（亩次）-粮食",
                "播种面积（亩次）-经作",
                "播种面积（亩次）-水果",
                "采收量（公斤）-小计",
                "采收量（公斤）-粮食",
                "采收量（公斤）-经作",
                "采收量（公斤）-水果"};
        String THIRD_TITLE = "播种面积(),采收量()";
        List<Map<String,String>> list = new ArrayList<>();
        Map<String,String> map1 = new HashMap<>();
        map1.put("1","1value");
        map1.put("2","1value");
        map1.put("3","1value");
        map1.put("4","1value");
        map1.put("5","1value");
        map1.put("6","1value");
        map1.put("7","1value");
        map1.put("8","1value");
        map1.put("9","1value");
        map1.put("10","1value");
        map1.put("11","1value");
        map1.put("12","1value");
        map1.put("13","1value");
        list.add(map1);
        Map<String,String> map2 = new HashMap<>();
       map2.put("1","2value");
       map2.put("2","2value");
       map2.put("3","2value");
       map2.put("4","2value");
       map2.put("5","2value");
       map2.put("6","2value");
       map2.put("7","2value");
       map2.put("8","2value");
       map2.put("9","2value");
       map2.put("10","2value");
       map2.put("11","2value");
       map2.put("12","2value");
       map2.put("13","2value");
        list.add(map2);
        List<LinkedList<String>> resultList = new LinkedList<>();
        for (Map index : list) {
            LinkedList<String> linkedList = new LinkedList<>();
            //填充内容，跟标题一致
            linkedList.add((String) index.get("1"));
            linkedList.add((String) index.get("2"));
            linkedList.add((String) index.get("3"));
            linkedList.add((String) index.get("4"));
            linkedList.add((String) index.get("5"));
            linkedList.add((String) index.get("6"));
            linkedList.add((String) index.get("7"));
            linkedList.add((String) index.get("8"));
            linkedList.add((String) index.get("9"));
            linkedList.add((String) index.get("10"));
            linkedList.add((String) index.get("11"));
            linkedList.add((String) index.get("12"));
            linkedList.add((String) index.get("13"));
            resultList.add(linkedList);
        }
        ExportExcelUtil.exportExcel4Merge(TITLE,"种植业播种采收统计","查询时间",THIRD_TITLE,resultList,
                "D:\\BaiduNetdiskDownload\\york"+String.valueOf(System.currentTimeMillis()+".xlsx"),0);
        System.out.println("export-local-over");
    }*/


    public static void exportExcel4Merge(String[] title, String firstRowName, String secondRowName, String mergeNames, List<LinkedList<String>> list, String fileName, int time) {
        try {
            if (time == 0) {
                SXSSFWorkbook wb = new SXSSFWorkbook();
                CreationHelper createHelper = wb.getCreationHelper();
                OutputStream fileOut = new FileOutputStream(fileName);
                Sheet sheet = wb.createSheet(SHEET_NAME);
                //第一行合并单元格
                CellRangeAddress callRangeAddress29 = new CellRangeAddress(0, 0, 0, title.length - 1);
                // 第二行合并单元格
                CellRangeAddress callRangeAddress30 = new CellRangeAddress(1, 1, 0, title.length - 1);

                //制作分类合并头
                //播种面积
                CellRangeAddress sownAcreMerge = new CellRangeAddress(2, 2, 6, 9);
                //采收量
                CellRangeAddress pickQuantityMerge = new CellRangeAddress(2, 2, 10, 13);

                sheet.addMergedRegion(callRangeAddress29);
                sheet.addMergedRegion(callRangeAddress30);
                sheet.addMergedRegion(sownAcreMerge);
                sheet.addMergedRegion(pickQuantityMerge);

                //经营主体+市、区县、街镇、村merge
                CellRangeAddress companyNameMerge = new CellRangeAddress(2, 3, 0, 0);
                sheet.addMergedRegion(companyNameMerge);
                CellRangeAddress cityMerge = new CellRangeAddress(2, 3, 1, 1);
                sheet.addMergedRegion(cityMerge);
                CellRangeAddress countyMerge = new CellRangeAddress(2, 3, 2, 2);
                sheet.addMergedRegion(countyMerge);
                CellRangeAddress townMerge = new CellRangeAddress(2, 3, 3, 3);
                sheet.addMergedRegion(townMerge);
                CellRangeAddress villageMerge = new CellRangeAddress(2, 3, 4, 4);
                sheet.addMergedRegion(villageMerge);
                CellRangeAddress businessCategoryNames= new CellRangeAddress(2, 3, 5, 5);
                sheet.addMergedRegion(businessCategoryNames);


                // 创建第一行
                Row row0 = sheet.createRow(0);
                row0.setHeight((short) 0x200);
                Cell cell0 = row0.createCell(0);
                cell0.setCellValue(firstRowName);
                Font headfont = wb.createFont();
                headfont.setFontHeightInPoints((short) 18);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headfont.setFontName("宋体");

                CellStyle headstyle = wb.createCellStyle();   // 单元格样式
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cell0.setCellStyle(headstyle);

                // 使用RegionUtil类为合并后的单元格添加边框
                RegionUtil.setBorderBottom(1, callRangeAddress29, sheet); // 下边框
                RegionUtil.setBorderLeft(1, callRangeAddress29, sheet); // 左边框
                RegionUtil.setBorderRight(1, callRangeAddress29, sheet); // 有边框
                RegionUtil.setBorderTop(1, callRangeAddress29, sheet); // 上边框

                // 创建第二行
                Row row1 = sheet.createRow(1);
                row1.setHeight((short) 0x200);
                Cell cell1 = row1.createCell(0);
                cell1.setCellValue(secondRowName);
                CellStyle headstyle2 = wb.createCellStyle();
                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headstyle2 = wb.createCellStyle();   // 单元格样式
                headstyle2.setFont(headfont);
                headstyle2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle2.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // 左右居中
                headstyle2.setBorderBottom(BorderStyle.THIN);
                headstyle2.setBorderLeft(BorderStyle.THIN);
                headstyle2.setBorderRight(BorderStyle.THIN);
                headstyle2.setBorderTop(BorderStyle.THIN);
                cell1.setCellStyle(headstyle2);

                //合并行
                Row rowMerge = sheet.createRow(2);
                rowMerge.setHeight((short) 0x200);
                Cell cell2 = rowMerge.createCell(6);
                cell2.setCellValue(mergeNames.split(",")[0]); //播种面积(亩次)
                cell2.setCellStyle(headstyle);
                Cell cell3 = rowMerge.createCell(10);
                cell3.setCellValue(mergeNames.split(",")[1]); //采收量(公斤)
                cell3.setCellStyle(headstyle);
                RegionUtil.setBorderBottom(1, pickQuantityMerge, sheet); // 下边框
                RegionUtil.setBorderLeft(1, pickQuantityMerge, sheet); // 左边框
                RegionUtil.setBorderRight(1, pickQuantityMerge, sheet); // 有边框
                RegionUtil.setBorderTop(1, pickQuantityMerge, sheet); // 上边框

                headfont.setFontHeightInPoints((short) 18);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headfont.setFontName("宋体");

                Cell cellCompany = rowMerge.createCell(0); //主体
                cellCompany.setCellValue(title[0]); //主体
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cellCompany.setCellStyle(headstyle);
                Cell cellCity = rowMerge.createCell(1); //ctiy
                cellCity.setCellValue(title[1]); //ctiy
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cellCity.setCellStyle(headstyle);
                Cell cellCounty = rowMerge.createCell(2); //county
                cellCounty.setCellValue(title[2]); //county
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cellCounty.setCellStyle(headstyle);

                Cell cellTown = rowMerge.createCell(3); //town
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cellTown.setCellValue(title[3]); //town
                cellTown.setCellStyle(headstyle);
                Cell cellVilige = rowMerge.createCell(4); //vilige
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cellVilige.setCellValue(title[4]); //town
                cellVilige.setCellStyle(headstyle);

                Cell cellBusinessCategoryNames = rowMerge.createCell(5); //经营类目
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
                headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cellBusinessCategoryNames.setCellValue(title[5]); //经营类目
                cellBusinessCategoryNames.setCellStyle(headstyle);

                // 使用RegionUtil类为合并后的单元格添加边框
                RegionUtil.setBorderBottom(1, callRangeAddress30, sheet);  // 下边框
                RegionUtil.setBorderLeft(1, callRangeAddress30, sheet);    // 左边框
                RegionUtil.setBorderRight(1, callRangeAddress30, sheet);   // 有边框
                RegionUtil.setBorderTop(1, callRangeAddress30, sheet);     // 上边框


                Row row = sheet.createRow(3);
                row.setHeight((short) 0x200);
                Cell cell = null;
                // 第三行
                for (int i = 0; i < title.length; i++) {
                    cell = row.createCell(i);
                    cell.setCellValue(title[i]);

                    headfont = wb.createFont();
                    headfont.setFontName("宋体");
                    headfont.setFontHeightInPoints((short) 12);// 字体大小
                    headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                    headstyle = wb.createCellStyle();
                    headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                    headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                    headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                    headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                    headstyle.setFont(headfont);
                    headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                    headstyle.setLocked(true);
                    headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                    headstyle.setBorderBottom(BorderStyle.THIN);
                    headstyle.setBorderLeft(BorderStyle.THIN);
                    headstyle.setBorderRight(BorderStyle.THIN);
                    headstyle.setBorderTop(BorderStyle.THIN);

                    // 设置列宽度
                    for (int j = 0; j < title.length; j++) {
                        sheet.setColumnWidth(j, 160 * 35 + 323);
                    }
                    cell.setCellStyle(headstyle);
                }
                // 正文内容
                for (int i = 0; i < list.size(); i++) {
                    LinkedList<String> list1 = list.get(i);
                    row = sheet.createRow(i + 4);
                    for (int j = 0; j < title.length; j++) {
                        Cell cellTwo = row.createCell(j);
                        cellTwo.setCellValue(list1.get(j));
//                        System.out.println(list1.get(j));
                    }
                }
                wb.write(fileOut);
                fileOut.flush();
                fileOut.close();
            } else {
                FileInputStream in = new FileInputStream(fileName);
                XSSFWorkbook wb = new XSSFWorkbook(in);
                XSSFSheet sheet = wb.getSheetAt(0);
                int rownum = sheet.getLastRowNum();
                FileOutputStream out = new FileOutputStream(fileName);
                // 正文内容
                for (int i = 0; i < list.size(); i++) {
                    LinkedList<String> list1 = list.get(i);
                    Row row = sheet.createRow(i + rownum);
                    for (int j = 0; j < title.length; j++) {
                        Cell cell2 = row.createCell(j);
                        cell2.setCellValue(list1.get(j));
                    }
                }
                wb.write(out);
                out.flush();
                out.close();
                in.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    /**
     * 定制化导出
     *
     * @param title
     * @param firstRowName
     * @param secondRowName
     * @param list
     * @param fileName
     */
    public static void archiveSubsidyFarmYearExportExcel(String[] title, String firstRowName,
                                                         String secondRowName,
                                                         List<LinkedList<String>> list,
                                                         String fileName) {
        try {
            SXSSFWorkbook wb = new SXSSFWorkbook();
            OutputStream fileOut = new FileOutputStream(fileName);
            Sheet sheet = wb.createSheet(SHEET_NAME);
            //第一行合并单元格
            CellRangeAddress callRangeAddress29 = new CellRangeAddress(0, 0, 0, 31);
            // 第二行合并单元格
            CellRangeAddress callRangeAddress30 = new CellRangeAddress(1, 1, 0, 31);
            // 第三行合并单元
            CellRangeAddress callRangeAddress50 = new CellRangeAddress(2, 3, 0, 0);
            CellRangeAddress callRangeAddress51 = new CellRangeAddress(2, 3, 1, 1);
            CellRangeAddress callRangeAddress52 = new CellRangeAddress(2, 3, 2, 2);
            CellRangeAddress callRangeAddress53 = new CellRangeAddress(2, 3, 3, 3);
            CellRangeAddress callRangeAddress54 = new CellRangeAddress(2, 3, 4, 4);
            CellRangeAddress callRangeAddress55 = new CellRangeAddress(2, 3, 5, 5);
            CellRangeAddress callRangeAddress56 = new CellRangeAddress(2, 3, 6, 6);
            CellRangeAddress callRangeAddress57 = new CellRangeAddress(2, 3, 7, 7);

            // 第三行合并单元格
            CellRangeAddress callRangeAddress40 = new CellRangeAddress(2, 2, 8, 9);
            CellRangeAddress callRangeAddress41 = new CellRangeAddress(2, 2, 10, 11);
            CellRangeAddress callRangeAddress42 = new CellRangeAddress(2, 2, 12, 13);
            CellRangeAddress callRangeAddress43 = new CellRangeAddress(2, 2, 14, 15);
            CellRangeAddress callRangeAddress44 = new CellRangeAddress(2, 2, 16, 17);
            CellRangeAddress callRangeAddress45 = new CellRangeAddress(2, 2, 18, 19);
            CellRangeAddress callRangeAddress46 = new CellRangeAddress(2, 2, 20, 21);
            CellRangeAddress callRangeAddress47 = new CellRangeAddress(2, 2, 22, 23);
            CellRangeAddress callRangeAddress48 = new CellRangeAddress(2, 2, 24, 25);
            CellRangeAddress callRangeAddress49 = new CellRangeAddress(2, 2, 26, 27);
            CellRangeAddress callRangeAddress60 = new CellRangeAddress(2, 2, 28, 29);
            CellRangeAddress callRangeAddress61 = new CellRangeAddress(2, 2, 30, 31);

            sheet.addMergedRegion(callRangeAddress29);
            sheet.addMergedRegion(callRangeAddress30);

            sheet.addMergedRegion(callRangeAddress50);
            sheet.addMergedRegion(callRangeAddress51);
            sheet.addMergedRegion(callRangeAddress52);
            sheet.addMergedRegion(callRangeAddress53);
            sheet.addMergedRegion(callRangeAddress54);
            sheet.addMergedRegion(callRangeAddress55);
            sheet.addMergedRegion(callRangeAddress56);
            sheet.addMergedRegion(callRangeAddress57);

            sheet.addMergedRegion(callRangeAddress40);
            sheet.addMergedRegion(callRangeAddress41);
            sheet.addMergedRegion(callRangeAddress42);
            sheet.addMergedRegion(callRangeAddress43);
            sheet.addMergedRegion(callRangeAddress44);
            sheet.addMergedRegion(callRangeAddress45);
            sheet.addMergedRegion(callRangeAddress46);
            sheet.addMergedRegion(callRangeAddress47);
            sheet.addMergedRegion(callRangeAddress48);
            sheet.addMergedRegion(callRangeAddress49);
            sheet.addMergedRegion(callRangeAddress60);
            sheet.addMergedRegion(callRangeAddress61);

            // 创建第一行
            Row row0 = sheet.createRow(0);
            row0.setHeight((short) 0x200);
            Cell cell0 = row0.createCell(0);
            cell0.setCellValue(firstRowName);
            Font headfont = wb.createFont();
            headfont.setFontHeightInPoints((short) 18);// 字体大小
            headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            headfont.setFontName("宋体");

            CellStyle headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell0.setCellStyle(headstyle);


            // 创建第二行
            Row row1 = sheet.createRow(1);
            row1.setHeight((short) 0x200);
            Cell cell1 = row1.createCell(0);
            cell1.setCellValue(secondRowName);


            cell1.setCellStyle(headstyle);

            headfont = wb.createFont();
            headfont.setFontName("宋体");
            headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell1.setCellStyle(headstyle);


            Row row = sheet.createRow(2);
            row.setHeight((short) 0x200);
            Cell cell = null;


            // 第三行
            for (int i = 0; i < title.length; i++) {
                cell = row.createCell(i);
                cell.setCellValue(title[i]);
                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                // 设置列宽度
                for (int j = 0; j < title.length; j++) {
                    sheet.setColumnWidth(j, 160 * 35 + 323);
                }
                cell.setCellStyle(headstyle);
            }


            int createCell = 8;
            for (int i = 1; i < 13; i++) {
                cell = row.createCell(createCell);
                cell.setCellValue(i + "月补贴面积（亩次）");
                createCell = createCell + 2;

                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cell.setCellStyle(headstyle);
            }


            row = sheet.createRow(3);
            row.setHeight((short) 0x200);

            // 第三行
            for (int i = 8; i < 32; i++) {
                cell = row.createCell(i);
                if ((i & 1) == 1) {
                    cell.setCellValue("非绿叶菜");
                } else {
                    cell.setCellValue("绿叶菜");
                }
                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);

                // 设置列宽度
                for (int j = 8; j < 32; j++) {
                    sheet.setColumnWidth(j, 160 * 35 + 323);
                }
                cell.setCellStyle(headstyle);
            }

            setRegionBorder(callRangeAddress29, sheet);
            setRegionBorder(callRangeAddress30, sheet);
            setRegionBorder(callRangeAddress50, sheet);
            setRegionBorder(callRangeAddress51, sheet);
            setRegionBorder(callRangeAddress52, sheet);
            setRegionBorder(callRangeAddress53, sheet);
            setRegionBorder(callRangeAddress54, sheet);
            setRegionBorder(callRangeAddress55, sheet);
            setRegionBorder(callRangeAddress56, sheet);
            setRegionBorder(callRangeAddress57, sheet);
            setRegionBorder(callRangeAddress40, sheet);
            setRegionBorder(callRangeAddress41, sheet);
            setRegionBorder(callRangeAddress42, sheet);
            setRegionBorder(callRangeAddress43, sheet);
            setRegionBorder(callRangeAddress44, sheet);
            setRegionBorder(callRangeAddress45, sheet);
            setRegionBorder(callRangeAddress46, sheet);
            setRegionBorder(callRangeAddress47, sheet);
            setRegionBorder(callRangeAddress48, sheet);
            setRegionBorder(callRangeAddress49, sheet);
            setRegionBorder(callRangeAddress60, sheet);
            setRegionBorder(callRangeAddress61, sheet);

            // 正文内容
            for (int i = 0; i < list.size(); i++) {
                LinkedList<String> list1 = list.get(i);
                row = sheet.createRow(i + 4);
                for (int j = 0; j < 32; j++) {
                    Cell cell2 = row.createCell(j);
                    cell2.setCellValue(list1.get(j));
                }
            }
            wb.write(fileOut);
            fileOut.flush();
            fileOut.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private static void setRegionBorder(CellRangeAddress region, Sheet sheet) {
        RegionUtil.setBorderBottom(1, region, sheet);  // 下边框
        RegionUtil.setBorderLeft(1, region, sheet);    // 左边框
        RegionUtil.setBorderRight(1, region, sheet);   // 有边框
        RegionUtil.setBorderTop(1, region, sheet);     // 上边框
    }

    /**
     * 蔬菜直报补贴面积-区域统计
     *
     * @param title
     * @param firstRowName
     * @param secondRowName
     * @param list
     * @param fileName
     */
    public static void archiveSubsidyAreaYearExportExcel(String[] title, String firstRowName, String secondRowName, List<LinkedList<String>> list, String fileName) {
        try {
            SXSSFWorkbook wb = new SXSSFWorkbook();
            OutputStream fileOut = new FileOutputStream(fileName);
            Sheet sheet = wb.createSheet(SHEET_NAME);
            //第一行合并单元格
            CellRangeAddress callRangeAddress29 = new CellRangeAddress(0, 0, 0, 27);
            // 第二行合并单元格
            CellRangeAddress callRangeAddress30 = new CellRangeAddress(1, 1, 0, 27);
            // 第三行合并单元
            CellRangeAddress callRangeAddress50 = new CellRangeAddress(2, 3, 0, 0);
            CellRangeAddress callRangeAddress51 = new CellRangeAddress(2, 3, 1, 1);
            CellRangeAddress callRangeAddress52 = new CellRangeAddress(2, 3, 2, 2);
            CellRangeAddress callRangeAddress53 = new CellRangeAddress(2, 3, 3, 3);

            // 第三行合并单元格
            CellRangeAddress callRangeAddress40 = new CellRangeAddress(2, 2, 4, 5);
            CellRangeAddress callRangeAddress41 = new CellRangeAddress(2, 2, 6, 7);
            CellRangeAddress callRangeAddress42 = new CellRangeAddress(2, 2, 8, 9);
            CellRangeAddress callRangeAddress43 = new CellRangeAddress(2, 2, 10, 11);
            CellRangeAddress callRangeAddress44 = new CellRangeAddress(2, 2, 12, 13);
            CellRangeAddress callRangeAddress45 = new CellRangeAddress(2, 2, 14, 15);
            CellRangeAddress callRangeAddress46 = new CellRangeAddress(2, 2, 16, 17);
            CellRangeAddress callRangeAddress47 = new CellRangeAddress(2, 2, 18, 19);
            CellRangeAddress callRangeAddress48 = new CellRangeAddress(2, 2, 20, 21);
            CellRangeAddress callRangeAddress49 = new CellRangeAddress(2, 2, 22, 23);
            CellRangeAddress callRangeAddress60 = new CellRangeAddress(2, 2, 24, 25);
            CellRangeAddress callRangeAddress61 = new CellRangeAddress(2, 2, 26, 27);

            sheet.addMergedRegion(callRangeAddress29);
            sheet.addMergedRegion(callRangeAddress30);

            sheet.addMergedRegion(callRangeAddress50);
            sheet.addMergedRegion(callRangeAddress51);
            sheet.addMergedRegion(callRangeAddress52);
            sheet.addMergedRegion(callRangeAddress53);

            sheet.addMergedRegion(callRangeAddress40);
            sheet.addMergedRegion(callRangeAddress41);
            sheet.addMergedRegion(callRangeAddress42);
            sheet.addMergedRegion(callRangeAddress43);
            sheet.addMergedRegion(callRangeAddress44);
            sheet.addMergedRegion(callRangeAddress45);
            sheet.addMergedRegion(callRangeAddress46);
            sheet.addMergedRegion(callRangeAddress47);
            sheet.addMergedRegion(callRangeAddress48);
            sheet.addMergedRegion(callRangeAddress49);
            sheet.addMergedRegion(callRangeAddress60);
            sheet.addMergedRegion(callRangeAddress61);

            // 创建第一行
            Row row0 = sheet.createRow(0);
            row0.setHeight((short) 0x200);
            Cell cell0 = row0.createCell(0);
            cell0.setCellValue(firstRowName);
            Font headfont = wb.createFont();
            headfont.setFontHeightInPoints((short) 18);// 字体大小
            headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            headfont.setFontName("宋体");

            CellStyle headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell0.setCellStyle(headstyle);


            // 创建第二行
            Row row1 = sheet.createRow(1);
            row1.setHeight((short) 0x200);
            Cell cell1 = row1.createCell(0);
            cell1.setCellValue(secondRowName);


            cell1.setCellStyle(headstyle);

            headfont = wb.createFont();
            headfont.setFontName("宋体");
            headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell1.setCellStyle(headstyle);


            Row row = sheet.createRow(2);
            row.setHeight((short) 0x200);
            Cell cell = null;


            // 第三行
            for (int i = 0; i < title.length; i++) {
                cell = row.createCell(i);
                cell.setCellValue(title[i]);
                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                // 设置列宽度
                sheet.setColumnWidth(i, 160 * 35 + 323);

                cell.setCellStyle(headstyle);
            }


            int createCell = 4;
            for (int i = 1; i < 13; i++) {
                cell = row.createCell(createCell);
                cell.setCellValue(i + "月补贴面积（亩次）");
                createCell = createCell + 2;

                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cell.setCellStyle(headstyle);
            }


            row = sheet.createRow(3);
            row.setHeight((short) 0x200);

            // 第三行
            for (int i = 4; i < 28; i++) {
                cell = row.createCell(i);
                if ((i & 1) == 1) {
                    cell.setCellValue("非绿叶菜");
                } else {
                    cell.setCellValue("绿叶菜");
                }
                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);

                // 设置列宽度
                sheet.setColumnWidth(i, 160 * 35 + 323);

                cell.setCellStyle(headstyle);
            }

            setRegionBorder(callRangeAddress29, sheet);
            setRegionBorder(callRangeAddress30, sheet);
            setRegionBorder(callRangeAddress50, sheet);
            setRegionBorder(callRangeAddress51, sheet);
            setRegionBorder(callRangeAddress52, sheet);
            setRegionBorder(callRangeAddress53, sheet);
            setRegionBorder(callRangeAddress40, sheet);
            setRegionBorder(callRangeAddress41, sheet);
            setRegionBorder(callRangeAddress42, sheet);
            setRegionBorder(callRangeAddress43, sheet);
            setRegionBorder(callRangeAddress44, sheet);
            setRegionBorder(callRangeAddress45, sheet);
            setRegionBorder(callRangeAddress46, sheet);
            setRegionBorder(callRangeAddress47, sheet);
            setRegionBorder(callRangeAddress48, sheet);
            setRegionBorder(callRangeAddress49, sheet);
            setRegionBorder(callRangeAddress60, sheet);
            setRegionBorder(callRangeAddress61, sheet);

            // 正文内容
            for (int i = 0; i < list.size(); i++) {
                LinkedList<String> list1 = list.get(i);
                row = sheet.createRow(i + 4);
                for (int j = 0; j < 28; j++) {
                    Cell cell2 = row.createCell(j);
                    cell2.setCellValue(list1.get(j));
                }
            }
            wb.write(fileOut);
            fileOut.flush();
            fileOut.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**蔬菜直报补贴区域统计特定格式
     *
     * @param title
     * @param firstRowName
     * @param secondRowName
     * @param list
     * @param fileName
     * @param time
     */
    public static void VegetablesAreaExportExcel(String[] title, String firstRowName, String secondRowName, List<LinkedList<String>> list, String fileName, int time) {
        try {
            SXSSFWorkbook wb = new SXSSFWorkbook();
            CreationHelper createHelper = wb.getCreationHelper();
            OutputStream fileOut = new FileOutputStream(fileName);
            Sheet sheet = wb.createSheet(SHEET_NAME);
            //第一行合并单元格
            CellRangeAddress callRangeAddress29 = new CellRangeAddress(0, 0, 0, 12);
            // 第二行合并单元格
            CellRangeAddress callRangeAddress30 = new CellRangeAddress(1, 1, 0, 12);

            //制作分类合并头
            //总计
            CellRangeAddress totalMerge = new CellRangeAddress(2, 2, 1, 3);
            //常年菜田常规补贴
            CellRangeAddress merge1 = new CellRangeAddress(2, 2, 4, 6);
            //常年菜田增量补贴
            CellRangeAddress merge2 = new CellRangeAddress(2, 2, 7, 9);
            //季节性菜田补贴
            CellRangeAddress merge3 = new CellRangeAddress(2, 2, 10, 12);

            sheet.addMergedRegion(callRangeAddress29);
            sheet.addMergedRegion(callRangeAddress30);
            sheet.addMergedRegion(totalMerge);
            sheet.addMergedRegion(merge1);
            sheet.addMergedRegion(merge2);
            sheet.addMergedRegion(merge3);

            //区域名称
            CellRangeAddress areaMerge = new CellRangeAddress(2, 3, 0, 0);
            sheet.addMergedRegion(areaMerge);

            // 创建第一行
            Row row0 = sheet.createRow(0);
            row0.setHeight((short) 0x200);
            Cell cell0 = row0.createCell(0);
            cell0.setCellValue(firstRowName);
            Font headfont = wb.createFont();
            headfont.setFontHeightInPoints((short) 18);// 字体大小
            headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            headfont.setFontName("宋体");

            CellStyle headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell0.setCellStyle(headstyle);

            // 创建第二行
            Row row1 = sheet.createRow(1);
            row1.setHeight((short) 0x200);
            Cell cell1 = row1.createCell(0);
            cell1.setCellValue(secondRowName);
            cell1.setCellStyle(headstyle);

            headfont = wb.createFont();
            headfont.setFontName("宋体");
            headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell1.setCellStyle(headstyle);
            Row row = sheet.createRow(2);
            row.setHeight((short) 0x200);
            Cell cell = null;

            //下面这个循环拼接title里面的第一个值
            // 第三行
            cell = row.createCell(0);
            cell.setCellValue(title[0]);
            headfont = wb.createFont();
            headfont.setFontName("宋体");
            headfont.setFontHeightInPoints((short) 12);// 字体大小
            headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            headstyle = wb.createCellStyle();
            headstyle.setTopBorderColor(HSSFColor.BLACK.index);
            headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
            headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
            headstyle.setRightBorderColor(HSSFColor.BLACK.index);
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
            headstyle.setLocked(true);
            headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            // 设置列宽度
            sheet.setColumnWidth(0, 160 * 35 + 323);
            cell.setCellStyle(headstyle);

            // 从第三列开始
            int createCell = 1;
            for (int i = 1; i < 5; i++) {
                cell = row.createCell(createCell);
                cell.setCellValue(title[i]);
                createCell = createCell + 3;

                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cell.setCellStyle(headstyle);
            }


            row = sheet.createRow(3);
            row.setHeight((short) 0x200);

            // 第三行
            // 从第二列开始
            for (int i = 1; i < 13; i++) {
                cell = row.createCell(i);
                if ((i % 3) == 2) {
                    cell.setCellValue("绿叶菜补贴面积（亩次）");
                } else if ((i % 3) == 0) {
                    cell.setCellValue("非绿叶菜补贴面积（亩次）");
                } else if ((i % 3) == 1 && i == 1) {
                    cell.setCellValue("总补贴面积（亩次）");
                } else {
                    cell.setCellValue("补贴面积（亩次）");
                }
                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);

                // 设置列宽度
                sheet.setColumnWidth(i, 160 * 35 + 323);
                cell.setCellStyle(headstyle);
            }

            setRegionBorder(callRangeAddress29, sheet);
            setRegionBorder(callRangeAddress30, sheet);
            setRegionBorder(totalMerge, sheet);
            setRegionBorder(merge1, sheet);
            setRegionBorder(merge2, sheet);
            setRegionBorder(merge3, sheet);
            setRegionBorder(areaMerge, sheet);

            // 正文内容
            for (int i = 0; i < list.size(); i++) {
                LinkedList<String> list1 = list.get(i);
                row = sheet.createRow(i + 4);
                for (int j = 0; j < 13; j++) {
                    Cell cellTwo = row.createCell(j);
                    cellTwo.setCellValue(list1.get(j));
                }
            }
            wb.write(fileOut);
            fileOut.flush();
            fileOut.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**蔬菜直报补贴经营主体统计特定格式
     *
     * @param title
     * @param firstRowName
     * @param secondRowName
     * @param list
     * @param fileName
     * @param time
     */
    public static void VegetablesFarmExportExcel(String[] title, String firstRowName, String secondRowName, List<LinkedList<String>> list, String fileName, int time) {
        try {
            SXSSFWorkbook wb = new SXSSFWorkbook();
            CreationHelper createHelper = wb.getCreationHelper();
            OutputStream fileOut = new FileOutputStream(fileName);
            Sheet sheet = wb.createSheet(SHEET_NAME);
            //第一行合并单元格
            CellRangeAddress callRangeAddress29 = new CellRangeAddress(0, 0, 0, 16);
            // 第二行合并单元格
            CellRangeAddress callRangeAddress30 = new CellRangeAddress(1, 1, 0, 16);

            //制作分类合并头
            //总计
            CellRangeAddress totalMerge = new CellRangeAddress(2, 2, 5, 7);
            //常年菜田常规补贴
            CellRangeAddress merge1 = new CellRangeAddress(2, 2, 8, 10);
            //常年菜田增量补贴
            CellRangeAddress merge2 = new CellRangeAddress(2, 2, 11, 13);
            //季节性菜田补贴
            CellRangeAddress merge3 = new CellRangeAddress(2, 2, 14, 16);

            sheet.addMergedRegion(callRangeAddress29);
            sheet.addMergedRegion(callRangeAddress30);
            sheet.addMergedRegion(totalMerge);
            sheet.addMergedRegion(merge1);
            sheet.addMergedRegion(merge2);
            sheet.addMergedRegion(merge3);

            //经营主体名称，省市区
            CellRangeAddress farmMerge = new CellRangeAddress(2, 3, 0, 0);
            sheet.addMergedRegion(farmMerge);
            CellRangeAddress cityMerge = new CellRangeAddress(2, 3, 1, 1);
            sheet.addMergedRegion(cityMerge);
            CellRangeAddress countyMerge = new CellRangeAddress(2, 3, 2, 2);
            sheet.addMergedRegion(countyMerge);
            CellRangeAddress townMerge = new CellRangeAddress(2, 3, 3, 3);
            sheet.addMergedRegion(townMerge);
            CellRangeAddress villageMerge = new CellRangeAddress(2, 3, 4, 4);
            sheet.addMergedRegion(villageMerge);

            // 创建第一行
            Row row0 = sheet.createRow(0);
            row0.setHeight((short) 0x200);
            Cell cell0 = row0.createCell(0);
            cell0.setCellValue(firstRowName);
            Font headfont = wb.createFont();
            headfont.setFontHeightInPoints((short) 18);// 字体大小
            headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            headfont.setFontName("宋体");

            CellStyle headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell0.setCellStyle(headstyle);

            // 创建第二行
            Row row1 = sheet.createRow(1);
            row1.setHeight((short) 0x200);
            Cell cell1 = row1.createCell(0);
            cell1.setCellValue(secondRowName);
            cell1.setCellStyle(headstyle);

            headfont = wb.createFont();
            headfont.setFontName("宋体");
            headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell1.setCellStyle(headstyle);
            Row row = sheet.createRow(2);
            row.setHeight((short) 0x200);
            Cell cell = null;

            //下面这个循环拼接title里面的未合并值
            // 第三行
            for (int i = 0; i < title.length -4; i++) {
                cell = row.createCell(i);
                cell.setCellValue(title[i]);
                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);

                // 设置列宽度
                sheet.setColumnWidth(i, 160 * 35 + 323);
                cell.setCellStyle(headstyle);
            }

            // 从第三列开始
            int createCell = 5;
            for (int i = 5; i < 9; i++) {
                cell = row.createCell(createCell);
                cell.setCellValue(title[i]);
                createCell = createCell + 3;

                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);
                cell.setCellStyle(headstyle);
            }


            row = sheet.createRow(3);
            row.setHeight((short) 0x200);

            // 第三行
            // 从第五列开始
            for (int i = 5; i < 17; i++) {
                cell = row.createCell(i);
                if ((i % 3) == 0) {
                    cell.setCellValue("绿叶菜补贴面积（亩次）");
                } else if ((i % 3) == 1) {
                    cell.setCellValue("非绿叶菜补贴面积（亩次）");
                } else if ((i % 3) == 2 && i == 5) {
                    cell.setCellValue("总补贴面积（亩次）");
                } else {
                    cell.setCellValue("补贴面积（亩次）");
                }
                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);

                // 设置列宽度
                sheet.setColumnWidth(i, 160 * 35 + 323);
                cell.setCellStyle(headstyle);
            }
            setRegionBorder(callRangeAddress29, sheet);
            setRegionBorder(callRangeAddress30, sheet);
            setRegionBorder(totalMerge, sheet);
            setRegionBorder(merge1, sheet);
            setRegionBorder(merge2, sheet);
            setRegionBorder(merge3, sheet);
            setRegionBorder(farmMerge, sheet);
            setRegionBorder(cityMerge, sheet);
            setRegionBorder(countyMerge, sheet);
            setRegionBorder(townMerge, sheet);
            setRegionBorder(villageMerge, sheet);

            // 正文内容
            for (int i = 0; i < list.size(); i++) {
                LinkedList<String> list1 = list.get(i);
                row = sheet.createRow(i + 4);
                for (int j = 0; j < 17; j++) {
                    Cell cellTwo = row.createCell(j);
                    cellTwo.setCellValue(list1.get(j));
                }
            }
            wb.write(fileOut);
            fileOut.flush();
            fileOut.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * flag: 肥料导出和农药导出合并的行数不一样
     * 农业使用统计导出
     */
    public static void pesticUsedFarmExport(String[] title,
                                            String firstRowName,
                                            String secondRowName,
                                            String mergeNames,
                                            List<LinkedList<String>> list,
                                            String fileName,int flag) {
        try {
            SXSSFWorkbook wb = new SXSSFWorkbook();
            OutputStream fileOut = new FileOutputStream(fileName);
            Sheet sheet = wb.createSheet(SHEET_NAME);
            //第一行合并单元格
            CellRangeAddress callRangeAddress29 = new CellRangeAddress(0, 0, 0, title.length - 1);
            // 第二行合并单元格
            CellRangeAddress callRangeAddress30 = new CellRangeAddress(1, 1, 0, title.length - 1);

            //制作分类合并头
            //主要农业用量
            CellRangeAddress principalMerge = new CellRangeAddress(2, 2, 9, 12);
            //亩均用量
            CellRangeAddress avgMerge = new CellRangeAddress(2, 2, 13, 16);

            //折存量
            CellRangeAddress pureMerge=new CellRangeAddress(2, 2, 17, 20);//农药
             if (flag==2){
                pureMerge = new CellRangeAddress(2, 2, 21, 24);//肥料
            }


            sheet.addMergedRegion(callRangeAddress29);
            sheet.addMergedRegion(callRangeAddress30);
            sheet.addMergedRegion(principalMerge);
            sheet.addMergedRegion(avgMerge);
            sheet.addMergedRegion(pureMerge);

            //经营主体+市、区县、街镇、村merge 必须要，不然会展示两行一样的！！
            CellRangeAddress companyNameMerge = new CellRangeAddress(2, 3, 0, 0);
            sheet.addMergedRegion(companyNameMerge);
            CellRangeAddress cityMerge = new CellRangeAddress(2, 3, 1, 1);
            sheet.addMergedRegion(cityMerge);
            CellRangeAddress countyMerge = new CellRangeAddress(2, 3, 2, 2);
            sheet.addMergedRegion(countyMerge);
            CellRangeAddress townMerge = new CellRangeAddress(2, 3, 3, 3);
            sheet.addMergedRegion(townMerge);
            CellRangeAddress villageMerge = new CellRangeAddress(2, 3, 4, 4);
            sheet.addMergedRegion(villageMerge);
            CellRangeAddress companyCategoryMerge = new CellRangeAddress(2, 3, 5, 5);
            sheet.addMergedRegion(companyCategoryMerge);
            CellRangeAddress businessCategoryMerge = new CellRangeAddress(2, 3, 6, 6);
            sheet.addMergedRegion(businessCategoryMerge);
            CellRangeAddress missionUsedMerge = new CellRangeAddress(2, 3, 7, 7);
            sheet.addMergedRegion(missionUsedMerge);
            CellRangeAddress sowAcreSum = new CellRangeAddress(2, 3, 8, 8);
            sheet.addMergedRegion(sowAcreSum);

            /**
             * 创建第一行
             */
            Row row0 = sheet.createRow(0);
            row0.setHeight((short) 0x200);
            Cell cell0 = row0.createCell(0);
            cell0.setCellValue(firstRowName);

            Font headfont = wb.createFont();
            headfont.setFontHeightInPoints((short) 18);// 字体大小
            headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            headfont.setFontName("宋体");

            CellStyle headstyle = wb.createCellStyle();   // 单元格样式
            headstyle.setFont(headfont);
            headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 左右居中
            headstyle.setBorderBottom(BorderStyle.THIN);
            headstyle.setBorderLeft(BorderStyle.THIN);
            headstyle.setBorderRight(BorderStyle.THIN);
            headstyle.setBorderTop(BorderStyle.THIN);
            cell0.setCellStyle(headstyle);

            // 使用RegionUtil类为合并后的单元格添加边框
            RegionUtil.setBorderBottom(1, callRangeAddress29, sheet); // 下边框
            RegionUtil.setBorderLeft(1, callRangeAddress29, sheet); // 左边框
            RegionUtil.setBorderRight(1, callRangeAddress29, sheet); // 右边框
            RegionUtil.setBorderTop(1, callRangeAddress29, sheet); // 上边框
            /**
             * 第一行结束
             */

            /**
             * 创建第二行
             */
            Row row1 = sheet.createRow(1);
            row1.setHeight((short) 0x200);
            Cell cell1 = row1.createCell(0);
            cell1.setCellValue(secondRowName);
            Font timeFont = wb.createFont();
            timeFont.setFontName("宋体");
            CellStyle timeStyle = wb.createCellStyle();   // 单元格样式
            timeStyle.setFont(headfont);
            timeStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  // 上下居中
            timeStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // 左右居中
            timeStyle.setBorderBottom(BorderStyle.THIN);
            timeStyle.setBorderLeft(BorderStyle.THIN);
            timeStyle.setBorderRight(BorderStyle.THIN);
            timeStyle.setBorderTop(BorderStyle.THIN);
            cell1.setCellStyle(timeStyle);
            /**
             * 创建第二行结束
             */

            /**
             * 创建第三行需要拆分两行的部分
             */
            //合并行
            Row rowMerge = sheet.createRow(2);
            rowMerge.setHeight((short) 0x200);

            Cell cell2 = rowMerge.createCell(9);
            cell2.setCellValue(mergeNames.split(",")[0]); //主要农业用量
            cell2.setCellStyle(headstyle);

            Cell cell3 = rowMerge.createCell(13);
            cell3.setCellValue(mergeNames.split(",")[1]); //亩均用量
            cell3.setCellStyle(headstyle);

            Cell cell4 = rowMerge.createCell(17);
            cell4.setCellValue(mergeNames.split(",")[2]); //折纯量
            cell4.setCellStyle(headstyle);

            /**
             * 第三行需要拆分两行的部分完成
             */

            /**
             * 第三行无需拆分两行的部分
             */
            Cell cellCompany = rowMerge.createCell(0); //主体
            cellCompany.setCellValue(title[0]); //主体
            cellCompany.setCellStyle(headstyle);

            Cell cellCity = rowMerge.createCell(1); //ctiy
            cellCity.setCellValue(title[1]); //ctiy
            cellCity.setCellStyle(headstyle);

            Cell cellCounty = rowMerge.createCell(2); //county
            cellCounty.setCellValue(title[2]); //county
            cellCounty.setCellStyle(headstyle);

            Cell cellTown = rowMerge.createCell(3); //town
            cellTown.setCellValue(title[3]); //town
            cellTown.setCellStyle(headstyle);

            Cell cellVilige = rowMerge.createCell(4); //vilige
            cellVilige.setCellValue(title[4]); //town
            cellVilige.setCellStyle(headstyle);


            Cell companyCategory = rowMerge.createCell(5); //主体类型
            companyCategory.setCellValue(title[5]);
            companyCategory.setCellStyle(headstyle);

            Cell businessCategory = rowMerge.createCell(6); //经营类目
            businessCategory.setCellValue(title[6]);
            businessCategory.setCellStyle(headstyle);

            Cell missionUsed = rowMerge.createCell(7); //农药总用量
            missionUsed.setCellValue(title[7]);
            missionUsed.setCellStyle(headstyle);

            Cell sowAcre = rowMerge.createCell(8); //施用面积
            sowAcre.setCellValue(title[8]);
            sowAcre.setCellStyle(headstyle);

            // 使用RegionUtil类为合并后的单元格添加边框
            RegionUtil.setBorderBottom(1, callRangeAddress30, sheet);  // 下边框
            RegionUtil.setBorderLeft(1, callRangeAddress30, sheet);    // 左边框
            RegionUtil.setBorderRight(1, callRangeAddress30, sheet);   // 右边框
            RegionUtil.setBorderTop(1, callRangeAddress30, sheet);     // 上边框

            // 使用RegionUtil类为合并后的单元格添加边框
            RegionUtil.setBorderBottom(1, pureMerge, sheet); // 下边框
            RegionUtil.setBorderLeft(1, pureMerge, sheet); // 左边框
            RegionUtil.setBorderRight(1, pureMerge, sheet); // 有边框
            RegionUtil.setBorderTop(1, pureMerge, sheet); // 上边框

            /**
             * 第三行无需拆分两行的部分完成
             */

            Row row = sheet.createRow(3);
            row.setHeight((short) 0x200);
            Cell cell = null;
            // 第三行
            for (int i = 0; i < title.length; i++) {
                cell = row.createCell(i);
                cell.setCellValue(title[i]);

                headfont = wb.createFont();
                headfont.setFontName("宋体");
                headfont.setFontHeightInPoints((short) 12);// 字体大小
                headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                headstyle = wb.createCellStyle();
                headstyle.setTopBorderColor(HSSFColor.BLACK.index);
                headstyle.setBottomBorderColor(HSSFColor.BLACK.index);
                headstyle.setLeftBorderColor(HSSFColor.BLACK.index);
                headstyle.setRightBorderColor(HSSFColor.BLACK.index);
                headstyle.setFont(headfont);
                headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
                headstyle.setLocked(true);
                headstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                headstyle.setBorderBottom(BorderStyle.THIN);
                headstyle.setBorderLeft(BorderStyle.THIN);
                headstyle.setBorderRight(BorderStyle.THIN);
                headstyle.setBorderTop(BorderStyle.THIN);

                // 设置列宽度
                for (int j = 0; j < title.length; j++) {
                    sheet.setColumnWidth(j, 160 * 35 + 323);
                }
                cell.setCellStyle(headstyle);
            }
            // 正文内容
            for (int i = 0; i < list.size(); i++) {
                LinkedList<String> list1 = list.get(i);
                row = sheet.createRow(i + 4);
                for (int j = 0; j < title.length; j++) {
                    Cell cellTwo = row.createCell(j);
                    cellTwo.setCellValue(list1.get(j));
//                        System.out.println(list1.get(j));
                }
            }
            wb.write(fileOut);
            fileOut.flush();
            fileOut.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

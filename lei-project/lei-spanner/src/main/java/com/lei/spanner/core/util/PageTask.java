package com.lei.spanner.core.util;

import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;


public class PageTask implements Runnable {

    private CountDownLatch countDownLatch;
    private Sheet sheet;
    private SXSSFWorkbook wb;
    private String[] title;
    private String firstRowName;
    private String secondRowName;
    private List<LinkedList<String>> list;

    public PageTask(CountDownLatch countDownLatch, SXSSFWorkbook wb, Sheet sheet, String[] title, String firstRowName, String secondRowName,
                    List<LinkedList<String>> list) {
        this.countDownLatch = countDownLatch;
        this.sheet = sheet;
        this.wb = wb;
        this.title = title;
        this.firstRowName = firstRowName;
        this.secondRowName = secondRowName;
        this.list = list;
    }

    @Override
    public void run() {
        try {
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
                LinkedList<String> list1 = this.list.get(i);
                row = sheet.createRow(i + 3);
                for (int j = 0; j < title.length; j++) {
                    Cell cell2 = row.createCell(j);

                    cell2.setCellValue(list1.get(j));

                }

            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (countDownLatch != null) {
                countDownLatch.countDown();
            }
        }
    }
}

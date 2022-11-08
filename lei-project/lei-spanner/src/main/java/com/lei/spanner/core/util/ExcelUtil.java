package com.lei.spanner.core.util;

import static java.util.concurrent.Executors.newFixedThreadPool;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

/**
 * @author wangkai
 * @date 2020/9/9 8:14
 */
public class ExcelUtil {

    public static final String SHEET_NAME = "sheet1";

    /**
     * excel导出 模板固定格式，参考政府端->总览->执法监管明细列表->导出excel
     *
     * @param response      响应流
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
     */
    public static void exportExcel(HttpServletResponse response, String[] title, String firstRowName, String secondRowName, List<LinkedList<String>> list,
                                   String fileName) {
        SXSSFWorkbook wb = new SXSSFWorkbook();
        int count = 1;
        CountDownLatch downLatch = new CountDownLatch(count);
        Executor executor = newFixedThreadPool(count);
        SXSSFSheet sheet = wb.createSheet(SHEET_NAME);

        executor.execute(new PageTask(downLatch, wb, sheet, title, firstRowName, secondRowName, list));
        try {
            downLatch.await();
        }
        catch (InterruptedException e) {
            e.printStackTrace();
        }
        writeAndClose(response, fileName, wb);
        wb.dispose();
    }

    /**
     * 写入和关闭
     *
     * @param response
     * @param fileName
     * @param wb
     */
    public static void writeAndClose(HttpServletResponse response, String fileName, Workbook wb) {
        try {
            setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(), "UTF-8");
            }
            catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}

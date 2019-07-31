package com.hiyoung.manage.contract.util;

import com.hiyoung.manage.contract.annotation.Excel;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.IndexedColors;

import javax.servlet.http.HttpServletResponse;
import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.Collection;

public class PoiUtils {


    /**
     *
     * 功能描述:
     * 需要导出的属性要加Excel注解，实现Excel导出功能
     * @param: [list, fileName, sheetName, response, clazz]
     * @return: void
     * @auther: wang
     * @date: 2019/1/18 15:31
     */
    public static <T> void export(Collection<T> collection, String fileName, String sheetName, HttpServletResponse response, Class<?> clazz) throws IOException, IllegalAccessException, IntrospectionException, InvocationTargetException {

        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个Excel表单,参数为sheet的名字
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //创建表头
        setTitle(workbook, sheet, clazz);
        //新增数据行，并且设置单元格数据
        int rowNum = 1;
        for (T t : collection) {
            HSSFRow row = sheet.createRow(rowNum);
            Field[] fields = clazz.getDeclaredFields();
            for (Field field : fields) {
                if (field.isAnnotationPresent(Excel.class)) {
                    PropertyDescriptor pd = new PropertyDescriptor(field.getName(),
                            clazz);
                    Method getMethod = pd.getReadMethod();//获得get方法
                    Excel excel = field.getAnnotation(Excel.class);
                    row.createCell(excel.orderNum()).setCellValue(String.valueOf(getMethod.invoke(t)));

                }

            }
            rowNum++;
        }
        //清空response
        response.reset();
        // 告诉浏览器用什么软件可以打开此文件
        response.setHeader("content-Type", "application/vnd.ms-excel");
        // 下载文件的默认名称
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName + ".xls", "utf-8"));
        OutputStream os;
        //可以将生成Excel默认下载到某个目录下
        //os = new BufferedOutputStream(new FileOutputStream("D:\\bmj\\target\\bmj128-0.0.1\\" + fileName));
        //也可以通过response得到输出流，写到输出流中，在页面中进行下载
        os = new BufferedOutputStream(response.getOutputStream());
        //将excel写入到输出流中
        workbook.write(os);
        os.flush();
        os.close();

    }


    /***
     * 设置表头
     * @param workbook
     * @param sheet
     */
    private static void setTitle(HSSFWorkbook workbook, HSSFSheet sheet, Class clazz) {
        HSSFRow row = sheet.createRow(0);
        Field[] fields = clazz.getDeclaredFields();
        //设置为居中加粗
        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont font = workbook.createFont();
        //设置字体
        font.setFontName("宋体");
        //设置粗体
        font.setBold(true);
        //设置字号
        font.setFontHeightInPoints((short) 14);
        //设置颜色
        font.setColor(IndexedColors.BLACK.index);
        style.setFont(font);
        HSSFCell cell;
        for (Field field : fields) {
            if (field.isAnnotationPresent(Excel.class)) {
                Excel excel = field.getAnnotation(Excel.class);
                cell = row.createCell(excel.orderNum());
                cell.setCellValue(excel.name());
                cell.setCellStyle(style);
                sheet.setColumnWidth(excel.orderNum(), 30*256);
            }
        }


    }




}
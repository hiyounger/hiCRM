package com.hiyoung.manage.contract.util;

import com.hiyoung.manage.contract.entity.Contacts1;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.Predicate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <p>
 *     excel工具类
 * </p>
 *
 * @author: Mr.xiang
 * @date: 2019-04-22 10:45
 **/
public class ExcelUtil {

    /**
     * 导出excel
     * @param list
     * @param path
     */
    public static void excelExport(List<Contacts1> list, String path) {
        WritableWorkbook book = null;
        try {
            // 创建一个Excel文件对象
            book = Workbook.createWorkbook(new File(path));
            // 创建Excel第一个选项卡对象
            WritableSheet sheet = book.createSheet("第一页", 0);
            // 设置表头，第一行内容
            // Label参数说明：第一个是列，第二个是行，第三个是要写入的数据值，索引值都是从0开始
            Label label1 = new Label(0, 0, "订单号");// 对应为第1列第1行的数据
            Label label2 = new Label(1, 0, "发货单号");// 对应为第2列第1行的数据
            // 添加单元格到选项卡中
            sheet.addCell(label1);
            sheet.addCell(label2);
            // 遍历集合并添加数据到行，每行对应一个对象
            for (int i = 0; i < list.size(); i++) {
                Contacts1 Contacts1 = list.get(i);
                // 表头占据第一行，所以下面行数是索引值+1
                // 跟上面添加表头一样添加单元格数据，这里为了方便直接使用链式编程
                sheet.addCell(new Label(0, i + 1, Contacts1.getBusinessname()));
                sheet.addCell(new Label(1, i + 1, Contacts1.getContactname()));
            }
            // 写入数据到目标文件
            book.write();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // 关闭
                book.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 导入excel
     * @param path
     * @return
     */
    public static List<Contacts1> excelImport(String path) {
        List<Contacts1> list = new ArrayList<>();
        Workbook book = null;
        try {
            // 获取Excel对象
            book = book.getWorkbook(new File(path));
            // 获取Excel第一个选项卡对象
            Sheet sheet = book.getSheet(0);
            // 遍历选项卡，第一行是表头，所以索引数-1
            for (int i = 0; i < sheet.getRows() - 1; i++) {
                Contacts1 Contacts1 = new Contacts1();
                // 获取第一列第二行单元格对象
                Cell cell = sheet.getCell(0, i + 1);
                Contacts1.setBusinessname(cell.getContents());
                // 获取第二行其他数据
                Contacts1.setContactname(sheet.getCell(1, i + 1).getContents());
                list.add(Contacts1);
            }
            // 返回导入的数据集合
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // 关闭
                book.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }


    public static void main(String[] args) {
        List<Contacts1> list=new ArrayList<>();

        // 创建数据
        for (int i = 0; i <10; i++) {
            Contacts1 Contacts1 = new Contacts1();
            Contacts1.setContactname("隔壁老王_" + i);
            Contacts1.setBusinessname("就是那么6");
            list.add(Contacts1);
        }
        String path = "D:\\eclelTest\\xs.xls";
        if (!(new File(path)).getParentFile().exists()) {//判断该路径是否存在如果不存在就创建一个
            (new File(path)).getParentFile().mkdirs();
        }
        System.out.println("开始导出...");
        long s1 = new Date().getTime();
        // 开始导出
        excelExport(list, path);
        long s2 = new Date().getTime();
        long time = s2 - s1;
        System.out.println("导出完成！消耗时间：" + time + "毫秒");
    }

//    public static void main(String[] args) {
//        String path = "D:\\xs.xls";
//        List<Contacts1> list = excelImport(path);
//        list.stream().filter((e)->e.getContactname().equals("")).forEach(System.out::println);
//        deleteFile(path);
//    }

    /**
     * 删除单个文件
     *
     * @param fileName
     *            要删除的文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static boolean deleteFile(String fileName) {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                System.out.println("删除单个文件" + fileName + "成功！");
                return true;
            } else {
                System.out.println("删除单个文件" + fileName + "失败！");
                return false;
            }
        } else {
            System.out.println("删除单个文件失败：" + fileName + "不存在！");
            return false;
        }
    }

}
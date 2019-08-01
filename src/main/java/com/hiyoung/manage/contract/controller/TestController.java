package com.hiyoung.manage.contract.controller;

import com.hiyoung.manage.contract.entity.Contacts1;
import com.hiyoung.manage.contract.service.IContacts1;
import com.hiyoung.manage.contract.util.PoiUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.beans.IntrospectionException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 合同
 */
@Controller
@RequestMapping("/manage/contract")
public class TestController {

    private static final Logger LOG = LoggerFactory.getLogger(TestController .class);

    @Resource
    IContacts1 iContacts1;

    @RequestMapping("/test")
    @ResponseBody
    public String testData(){
        return "aaa";
    }

    @RequestMapping("/test2")
    @ResponseBody
    public Contacts1 testData2(){
        return iContacts1.selectByPrimaryKey(1);
    }

    @RequestMapping("/test3")
    @ResponseBody
    public List<Contacts1> testData3(){
        return iContacts1.getAll();
    }

    @RequestMapping("/test4")
    @ResponseBody
    public int testData4(){
        return iContacts1.getCount("合同");
    }

    /**
     * 分页展示信息
     * @param page
     * @param rows
     * @return
     */
    //用easyui实现分页展示信息:jsp传入参数为page和rows,controller返回参数为total和rows
    @RequestMapping("/listByPage")
    @ResponseBody
    public Map<String, Object> listByPage(String page, String rows,String contactName,String isSingle){
        int total=iContacts1.getCount(contactName);
        if(isSingle=="1"){
           total=1;
        }
System.out.println("c="+contactName);
        List<Contacts1> cs=iContacts1.listByPage(Integer.valueOf(page), Integer.valueOf(rows),contactName,isSingle);
        Map<String, Object> map=new HashMap<>();
        map.put("total", total);
        map.put("rows", cs);
        return map;
    }

    @RequestMapping("/add")
    @ResponseBody
    public Integer add( Contacts1 contacts1) throws ParseException {
        contacts1.setCreationtime(new Date());
        System.out.println(contacts1);
        int num=iContacts1.addContacts1(contacts1);
        System.out.println("合同修改行num="+num);
        return num;
    }

    /**
     * 逻辑删除
     * @param ids
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Boolean delete(String ids){
        System.out.println("ids="+ids);
        int num=iContacts1.deleteById(ids);
        return num>0?true:false;
    }

    @RequestMapping("/export")
    public void export(HttpServletResponse response) {

        List<Contacts1> Contacts1List = iContacts1.getAll();

        try {
            PoiUtils.export(Contacts1List, "导出的文件", "Contact", response,Contacts1.class);
        } catch (IOException | IntrospectionException | InvocationTargetException | IllegalAccessException e) {
//                LOG.error("审计日志错误{}",e);
        }

    }


    /**
     * excle导入数据并保存到数据库
     *
     * @param file
     * @return
     */
    @RequestMapping("/import")
    @ResponseBody
    public String batchImport(@RequestParam("file") MultipartFile file) throws Exception {
        System.out.println("import连接成功");
        List<Contacts1> cs = new ArrayList<Contacts1>();
        // 编写解析代码逻辑
        // 基于.xls 格式解析 HSSF
        // 1、 加载Excel文件对象
        System.out.println("file------------------->"+file);
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(file.getInputStream());
        // 2、 读取一个sheet
        HSSFSheet sheet = hssfWorkbook.getSheetAt(0);

        System.out.println("sheet---------------->"+sheet);
        System.out.println("sheet[0]---------------->"+sheet.getRow(0));
        System.out.println("sheet[1]---------------->"+sheet.getRow(1));
        System.out.println("sheet[1]---------------->"+sheet.getRow(1).getPhysicalNumberOfCells());
        String contentType=file.getContentType();
        String fileName=file.getOriginalFilename();
        if(file.isEmpty()){
            return "文件为空";
        }
        // 3、 读取sheet中每一行
        HSSFRow row=null;
        for (int i=1;i<sheet.getPhysicalNumberOfRows();i++) {
            row =sheet.getRow(i);
            System.out.println("开始读取");
//            // 一行数据 对应 一个区域对象
//            if (row.getRowNum() == 0) {
//                // 第一行 跳过
//                continue;
//            }
//            // 跳过空行
//            if (row.getCell(0) == null || StringUtils.isBlank(row.getCell(0).getStringCellValue())) {
//                continue;
//            }
            Contacts1 c = new Contacts1();
           // c.setId(Integer.valueOf((int)row.getCell(0).getNumericCellValue()));
            c.setCustomername(row.getCell(1).getStringCellValue());
            c.setNumber(Integer.valueOf(row.getCell(2).getStringCellValue()));
            c.setContactname(row.getCell(3).getStringCellValue());
            c.setCustomername(row.getCell(4).getStringCellValue());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
            c.setOrdertime(sdf.parse(sdf.format(HSSFDateUtil.getJavaDate(row.getCell(5).getNumericCellValue()))));

            cs.add(c);
            System.out.println("c------------------->"+c);
            iContacts1.addContacts1(c);
        }
        // 调用业务层
       // cs.forEach(c->{ iContacts1.addContacts1(c);});

        return "yes";
    }



}

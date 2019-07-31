package com.hiyoung.manage.contacts.controller;

import com.hiyoung.manage.contacts.entity.Contacts;
import com.hiyoung.manage.contacts.service.ContactsService;
import com.hiyoung.manage.contacts.util.Timer1;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/manage/Contacts")
public class ContactsController {
    @Resource
    ContactsService contactsService;
    @RequestMapping("/list")
    @ResponseBody
    public Map<String,Object> getLIst( String page,String rows){

        //从请求中获取当前页面和每页展示的条数
        List<Contacts> list= contactsService.listBYPage(page,rows,null);
        Integer zs= contactsService.getCount(null);
        Map<String,Object> map=new HashMap<>();
        map.put("total",zs);
        map.put("rows",list);
        return map;
    }

    @RequestMapping("/import")
    @ResponseBody
    public  boolean batchImport(MultipartFile file)throws Exception{
        List<Contacts> contactsList=new ArrayList<>();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // 编写解析代码逻辑   基于.xls 格式解析 HSSF
        // 1、 加载Excel文件对象
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(file.getInputStream());
        // 2、 读取一个sheet
        HSSFSheet sheet = hssfWorkbook.getSheetAt(0);
        // 3、 读取sheet中每一行
        for (Row row : sheet) {
            // 一行数据 对应 一个区域对象
            if (row.getRowNum() == 0) {
                // 第一行 跳过
                continue;
            }

            // 跳过空行
            if (row.getCell(0) == null || StringUtils.isBlank(row.getCell(0).getStringCellValue())) {
                continue;
            }
            Contacts contacts=new Contacts();
            if(row.getCell(0).getStringCellValue()!=null&&row.getCell(0).getStringCellValue().trim()!=""){
                contacts.setName(row.getCell(0).getStringCellValue());
            }
            if(row.getCell(1).getStringCellValue()!=null&&row.getCell(1).getStringCellValue().trim()!=""){
                contacts.setCustomerName(row.getCell(1).getStringCellValue());
            }
          /*  if(row.getCell(2).getStringCellValue()!=null&&row.getCell(2).getStringCellValue().trim()!=""){
                contacts.setTelephone(row.getCell(2).getStringCellValue());
            }
            if(row.getCell(3).getStringCellValue()!=null&&row.getCell(3).getStringCellValue().trim()!=""){
                contacts.setPhone(row.getCell(3).getStringCellValue());
            }
            if(row.getCell(4).getStringCellValue()!=null&&row.getCell(4).getStringCellValue().trim()!=""){
                contacts.setEmail(row.getCell(4).getStringCellValue());
            }
            if(row.getCell(5).getStringCellValue()!=null&&row.getCell(5).getStringCellValue().trim()!=""){
                contacts.setJob(row.getCell(5).getStringCellValue());
            }
            if(row.getCell(6).getStringCellValue()!=null&&row.getCell(6).getStringCellValue().trim()!=""){
                contacts.setAddress(row.getCell(6).getStringCellValue());
            }
            if(row.getCell(7).getStringCellValue()!=null&&row.getCell(7).getStringCellValue().trim()!=""){
                contacts.setNextContactTime(sdf.parse(row.getCell(7).getStringCellValue()));
            }
            if(row.getCell(8).getStringCellValue()!=null&&row.getCell(8).getStringCellValue().trim()!=""){
                contacts.setRemarks(row.getCell(8).getStringCellValue());
            }
            if(row.getCell(9).getStringCellValue()!=null&&row.getCell(9).getStringCellValue().trim()!=""){
                contacts.setCreater(row.getCell(9).getStringCellValue());
            }
            if(row.getCell(10).getStringCellValue()!=null&&row.getCell(10).getStringCellValue().trim()!=""){
                contacts.setUpdateTime(sdf.parse(row.getCell(10).getStringCellValue()));
            }
            if(row.getCell(11).getStringCellValue()!=null&&row.getCell(11).getStringCellValue().trim()!=""){
                contacts.setIsKeyMaker(row.getCell(11).getStringCellValue());
            }
            if(row.getCell(12).getStringCellValue()!=null&&row.getCell(12).getStringCellValue().trim()!=""){
                contacts.setSex(row.getCell(12).getStringCellValue());
            }*/
            contactsList.add(contacts);
        }
        System.out.println(contactsList.get(1)+"--"+contactsList.size());
       int num= contactsService.batchInsert(contactsList);
        if(num!=0){
            return true;
        }
        return false;
    }

    @RequestMapping("/listpart")
    @ResponseBody
    public Map<String,Object> listPart(String page, String rows, String word){
        //从请求中获取当前页面和每页展示的条数
        List<Contacts> list= contactsService.listBYPage(page,rows,word.trim());
        Integer zs= contactsService.getCount(word.trim());
        Map<String,Object> map=new HashMap<>();
        map.put("total",zs);
        map.put("rows",list);
        return map;
    }

    @RequestMapping("/listone")
    @ResponseBody
    public Map<String,Object> getLIstOne(Integer id){
       // System.out.println(name);
        List<Contacts> list=new ArrayList<>();
        //从请求中获取当前页面和每页展示的条数
        Contacts Contacts= contactsService.selectById(id);
        //System.out.println(Contacts);
        list.add(Contacts);
        int zs=1;
        Map<String,Object> map=new HashMap<>();
        map.put("total",zs);
        map.put("rows",list);
        return map;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Boolean deleteById(HttpServletRequest request){
        String ids0=request.getParameter("ids");
        String[] ids=ids0.split(",");
        for(String id:ids){
         int num= contactsService.deleteById(Integer.parseInt(id));
         if(num==0){
             return false;
         }
        }
        return true;
    }

    @RequestMapping("/add")
    @ResponseBody
 public Map<String,Object> addData(Contacts contacts){
       //System.out.println(contacts);
        Map<String,Object> map=new HashMap<>();
        int num= contactsService.insert(contacts);
        if(num!=0){
            Integer id=contacts.getId();
           // System.out.println(id);
            map.put("success",true);
            map.put("id",id);
        }else {
            map.put("success",false);
        }

        return map;
    }

    @RequestMapping("/add.cns")
    public String add(){
        return "contacts/add_contacts";
    }
    @RequestMapping("/list.cns")
    public String list(){
        return "contacts/list_contacts";
    }

}

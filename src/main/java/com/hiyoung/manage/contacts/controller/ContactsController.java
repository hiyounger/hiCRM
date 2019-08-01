package com.hiyoung.manage.contacts.controller;

import com.hiyoung.manage.contacts.entity.Contacts;
import com.hiyoung.manage.contacts.service.ContactsService;
import com.hiyoung.utils.BeanUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
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

package com.hiyoung.manage.contacts.controller;

import com.hiyoung.manage.contacts.entity.Contacts;
import com.hiyoung.manage.contacts.service.ContactsService;
import com.hiyoung.utils.BeanUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
    public Map<String,Object> listPart( String page,String rows,String word){
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
    public Map<String,Object> getLIstOne(String name){
       // System.out.println(name);
        List<Contacts> list=new ArrayList<>();
        //从请求中获取当前页面和每页展示的条数
        Contacts Contacts= contactsService.selectByName(name);
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
 public Boolean addData(HttpServletRequest request, HttpSession session){
        Contacts Contacts=new Contacts();
        Map<String,String[]> map0=request.getParameterMap();
        Map<String,Object> map=new HashMap<>();
        map0.forEach((key,value)->{
            if(key.equals("nextContactTime")){
                if(value[0].trim().length()!=0&&value[0]!=null){
                    Date date= null;
                    try {
                        date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value[0]);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    map.put(key,date);
                }
            }else{
                map.put(key,value[0]);
            }

        });
        BeanUtil.mapTOBean(Contacts,map);
        int num= contactsService.insert(Contacts);
        if(num!=0){

            session.setAttribute("onlyone",Contacts.getName());
            return true;
        }
        return false;
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

package com.hiyoung.manage.contact.controller;

import com.hiyoung.manage.contact.entity.Contacts1;
import com.hiyoung.manage.contact.service.IContacts1;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TestController {

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
        return iContacts1.getCount();
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
    public Map<String, Object> listByPage(String page, String rows){
        int total=iContacts1.getCount();
        List<Contacts1> cs=iContacts1.listByPage(Integer.valueOf(page), Integer.valueOf(rows));
        Map<String, Object> map=new HashMap<>();
        map.put("total", total);
        map.put("rows", cs);
        return map;
    }

    @RequestMapping("/add")
    @ResponseBody
    public Contacts1 add(@RequestBody Contacts1 contacts1){
        System.out.println(contacts1);
        return contacts1;
    }

}

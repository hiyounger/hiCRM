package com.hiyoung.manage.contract.controller;

import com.hiyoung.manage.contract.entity.Contacts1;
import com.hiyoung.manage.contract.service.IContacts1;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 合同
 */
@Controller
@RequestMapping("/manage/contract")
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

}

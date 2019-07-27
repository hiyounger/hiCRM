package com.hiyoung.manage.customer.controller;

import com.hiyoung.manage.customer.entity.Customer;
import com.hiyoung.manage.customer.service.CustomerIf;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@SuppressWarnings("all")
@Controller
@RequestMapping("/manage/customer")
public class CustomerController {

    @Resource
    CustomerIf customerImp ;

    @RequestMapping("/listCustomerByPage")
    @ResponseBody
    public Map<String, Object>  getCustomerByPage(@RequestParam(name = "page") Integer page, @RequestParam(name = "rows") Integer rows,  @RequestParam(name = "id")Integer id) {
        Map<String, Object> map = new HashMap<>() ;
        Integer total = customerImp.getCount();
        List<Customer> customers = customerImp.getCustomerByPage(page,rows,id);
        map.put("total", total);
        map.put("rows", customers);
        System.out.println(map);
        return map ;
    }


    //不能转换Data格式的参数，只需要加上下面这段即可，注意不能忘记注解
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        //转换日期 注意这里的转化要和传进来的字符串的格式一直 如2015-9-9 就应该为yyyy-MM-dd/yyyy-MM-dd HH:mm:ss
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        // CustomDateEditor为自定义日期编辑器
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("/addCustomer")
    @ResponseBody
    public  int addCustomer(Customer customer){
        System.out.println(customer);
        int num = customerImp.addCustomer(customer);
        int id=-1;//添加失败
        if(num != 0) {
            //添加成功
             id= customer.getId();
            System.out.println("id====="+id);
        }
        return id;
    }

    @RequestMapping("/delCustomer")
    @ResponseBody
    public boolean delCustomer(String id){
        System.out.println(id);
        String[] ids=id.split(",");
        boolean success=true;
        for (String i:ids){
            int num = customerImp.delCustomer(Integer.valueOf(i));
            if(num==0){
                success=false;
            }
        }
        //默认没删除成功
        return success;
    }



}

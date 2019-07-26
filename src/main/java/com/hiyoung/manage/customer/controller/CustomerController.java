package com.hiyoung.manage.customer.controller;

import com.hiyoung.manage.customer.entity.Customer;
import com.hiyoung.manage.customer.service.CustomerIf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage/customer")
public class CustomerController {

    @Resource
    CustomerIf customerImp ;

    @RequestMapping("/listCustomerByPage")
    @ResponseBody
    public Map<String, Object>  getCustomerByPage(Integer page,Integer rows) {
        Map<String, Object> map = new HashMap<>() ;
        Integer total = customerImp.getCount();
        List<Customer> customers = customerImp.getCustomerByPage(page,rows);
        map.put("total", total);
        map.put("rows", customers);
        System.out.println(map);
        return map ;
    }


    @RequestMapping("/addCustomer")
    @ResponseBody
    public  String addCustomer(Customer customer){
        System.out.println(customer);
        Map<String,Object> map = new HashMap<>();
        int num = customerImp.addCustomer(customer);
        boolean success=false; //默认没添加成功
        if(num != 0) {
            //添加成功
            success=true;
        }
        map.put("success",success);
        System.out.println(map);
        return "success";
    }

}

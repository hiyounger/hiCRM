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
@RequestMapping("/customer")
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

}

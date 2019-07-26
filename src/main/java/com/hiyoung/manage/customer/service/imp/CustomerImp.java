package com.hiyoung.manage.customer.service.imp;

import com.hiyoung.manage.customer.dao.CustomerMapper;
import com.hiyoung.manage.customer.entity.Customer;
import com.hiyoung.manage.customer.service.CustomerIf;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CustomerImp implements CustomerIf {

    @Resource
    CustomerMapper customerMapper ;

    @Override
    public List<Customer> getCustomerByPage(Integer page, Integer rows) {
        //调用customerMapper的查询的方法
        //先判断page的合法性
        double count = customerMapper.getCount();
        System.out.println(page+rows);
        //计算总页数
        int pageCount =  (int) Math.ceil(count/rows);
        if(page > pageCount) {
            page = pageCount;
        }
        if(page <1) {
            page = 1 ;
        }
        //计算offerset
        Integer offerset = (page-1)*rows ;

        return customerMapper.getCustomerByPage(offerset, rows);
    }

    @Override
    public Integer getCount() {
        return customerMapper.getCount();
    }

    @Override
    public Integer addCustomer(Customer customer) {
        return customerMapper.addCustomer(customer);
    }
}

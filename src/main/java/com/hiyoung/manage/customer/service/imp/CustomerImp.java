package com.hiyoung.manage.customer.service.imp;

import com.hiyoung.manage.customer.dao.CustomerMapper;
import com.hiyoung.manage.customer.entity.Customer;
import com.hiyoung.manage.customer.service.CustomerIf;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerImp implements CustomerIf {

    @Resource
    CustomerMapper customerMapper ;

    @Override
    public List<Customer> getCustomerByPage(Integer page, Integer rows,Integer id,String word) {
        //调用customerMapper的查询的方法
        //先判断page的合法性
        double count = customerMapper.getCount(word);
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

        if(id==0){
            return customerMapper.getCustomerByPage(offerset, rows,word);
        }else {
            List<Customer> list = new ArrayList<>();
            list.add(customerMapper.selectById(id));
            return list;
        }

    }

    @Override
    public Integer getCount(String word) {
        return customerMapper.getCount(word);
    }

    @Override
    public Integer addCustomer(Customer customer) {
        return customerMapper.addCustomer(customer);
    }

    @Override
    public Integer delCustomer(Integer id) {
        return customerMapper.delCustomer(id);
    }


}

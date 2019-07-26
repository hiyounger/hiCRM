package com.hiyoung.manage.customer.service;


import com.hiyoung.manage.customer.entity.Customer;

import java.util.List;

public interface CustomerIf {

    /**
     * 分页查询客户信息
     * @param page 当前页码
     * @param rows 每页展示的数据的条数
     * @return
     */
    List<Customer> getCustomerByPage(Integer page, Integer rows);
    /**
     * 获得总记录数
     * @return
     */
    Integer getCount();

    /**
     * 添加客户
     * @param customer
     * @return
     */
    Integer addCustomer(Customer customer);

    /**
     * 删除/批量删除客户
     * @param id
     * @return
     */
    Integer delCustomer(Integer id);

}

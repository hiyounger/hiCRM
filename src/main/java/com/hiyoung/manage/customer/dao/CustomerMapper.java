package com.hiyoung.manage.customer.dao;

import com.hiyoung.manage.customer.entity.Customer;
import com.hiyoung.manage.product.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper {
   // int insert(Product record);

    List<Customer> selectAll();

    /**
     * 分页查询客户信息
     * @param offerset 从第几项数据开始查询
     * @param rows 每页展示的数据的条数
     * @return
     */
    List<Customer> getCustomerByPage(@Param("offerset") Integer offerset, @Param("rows") Integer rows,@Param("word") String word);
    /**
     * 获得所有记录总数
     * @return
     */
    Integer getCount(@Param("word") String word);

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

    /**
     * 通过客户id一条数据
     * @param id
     * @return
     */
    Customer selectById(Integer id);



}
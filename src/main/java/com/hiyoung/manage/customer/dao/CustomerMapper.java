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
    List<Customer> getCustomerByPage(@Param("offerset") Integer offerset, @Param("rows") Integer rows);
    /**
     * 获得所有记录总数
     * @return
     */
    Integer getCount();

    /**
     * 添加客户
     * @param customer
     * @return
     */
    Integer addCustomer(Customer customer);
}
package com.hiyoung.manage.product.dao;

import com.hiyoung.manage.product.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

public interface ProductMapper {
    int insert(Product record);

    int insertSelective(Product record);

    /**
     * 分页展示产品信息
     * @param offset  从哪一页开始展示数据
     * @param rows  展示多少条数据
     * @return
     */
    List<Product> listProductByPage(@Param("offset") Integer offset, @Param("rows") Integer rows);

    /**
     * 获得总条数
     * @return
     */
    int getCount();

    /**
     * 创建产品
     * @param product
     * @return
     */
    int  addProduct(Product product);
}
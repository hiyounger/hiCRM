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

    /**
     * 条件查询获得总条数
     * @return
     */
    int getCount1(String productName);


    /**
     * 根据条件查询分页展示产品信息
     * @param offset
     * @param rows
     * @param productName
     * @return
     */
    List<Product> listByPageByCondition(@Param("offset") Integer offset,@Param("rows") Integer rows,@Param("productName") String productName);


    /**
     * 根据条件查询分页展示产品信息
     * @param offset
     * @param rows
     * @param productName
     * @return
     */
    List<Product> listProductCondition(@Param("offset") Integer offset,@Param("rows") Integer rows,@Param("productName") String productName);

    /**
     * 条件查询获得总条数
     * @return
     */
    int getCount2(String productName);
}
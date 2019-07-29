package com.hiyoung.manage.product.service;


import com.hiyoung.manage.product.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductIf {

    /**
     * 分页展示产品信息
     * @param pageStr  从哪一页开始展示数据
     * @param rowsStr  展示多少条数据
     * @return
     */
    List<Product> listProductByPage(String pageStr, String rowsStr);

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
     * @param pageStr  从哪一条数据开始展示
     * @param rowsStr 每页展示多少条数据
     * @param productName 查询条件 待查询的产品名称
     * @return
     */
    List<Product> listByPageByCondition(String pageStr,String rowsStr,String productName);

    /**
     * 根据条件查询分页展示产品信息
     * @param pageStr
     * @param rowsStr
     * @param productName
     * @return
     */
    List<Product> listProductCondition(String pageStr,String rowsStr,String productName);

    /**
     * 条件查询获得总条数
     * @return
     */
    int getCount2(String productName);

    /**
     * 批量下架  伪删除
     * @param id  待下架产品的id
     * @return
     */
    int downProduct(Integer id);

    /**
     * 据id添加产品的下架原因
     * @param id   待下架产品的id
     * @param downReason  下架原因
     * @return
     */
    int addDownReasonById(Integer id,String downReason);

    /**
     * 据id添加产品的上架原因
     * @param id   待上架产品的id
     * @param onReason  上架原因
     * @return
     */
    int addOnReasonById(Integer id,String onReason);


}

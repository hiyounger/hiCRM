package com.hiyoung.manage.product.service;


import com.hiyoung.manage.product.entity.Product;

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


}

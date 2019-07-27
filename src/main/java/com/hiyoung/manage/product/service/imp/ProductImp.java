package com.hiyoung.manage.product.service.imp;

import com.hiyoung.manage.product.dao.ProductMapper;
import com.hiyoung.manage.product.entity.Product;
import com.hiyoung.manage.product.service.ProductIf;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductImp implements ProductIf {
    @Resource
    ProductMapper productMapper;
    /**
     * 分页展示产品信息
     * @param pageStr  从哪一页开始展示数据
     * @param rowsStr  展示多少条数据
     * @return
     */
    @Override
    public List<Product> listProductByPage(String pageStr, String rowsStr) {
        //判断合法性
        int page=pageStr == null?1:Integer.parseInt(pageStr);
        int rows=rowsStr == null?20:Integer.parseInt(rowsStr);
        //最大页数
        double count=productMapper.getCount();  //为什么count数据类型是double？
        int pageCount=(int) Math.ceil(count/rows);
        //最大页码
        if(page > pageCount){
            page = pageCount;
        }
        //最小页码
        if(page < 1){
            page = 1 ;
        }
        return productMapper.listProductByPage((page-1)*rows,rows);
    }



    /**
     * 获得总条数
     * @return
     */
    @Override
    public int getCount() {
        return productMapper.getCount();
    }

    /**
     * 创建产品
     * @param product  待创建的产品
     * @return
     */
    @Override
    public int addProduct(Product product) {
        if(product == null){
          return 0;
        }
        return productMapper.addProduct(product);
    }

    /**
     * 条件查询获得总条数
     * @param productName  查询条件 待查询的产品名称
     * @return
     */
    @Override
    public int getCount1(String productName) {
        if(productName == null || productName == ""){
            return 0 ;
        }
        return productMapper.getCount1(productName);
    }

    /**
     * 根据条件查询分页展示产品信息
     * @param pageStr  从哪一条数据开始展示
     * @param rowsStr 每页展示多少条数据
     * @param productName 查询条件 待查询的产品名称
     * @return
     */
    @Override
    public List<Product> listByPageByCondition(String pageStr, String rowsStr, String productName) {
        //判断合法性
        int page=pageStr == null?1:Integer.parseInt(pageStr);
        int rows=rowsStr == null?20:Integer.parseInt(rowsStr);

        double count=productMapper.getCount();  //为什么count数据类型是double？
        int pageCount=(int) Math.ceil(count/rows);
        //最大页码
        if(page > pageCount){
            page = pageCount;
        }
        //最小页码
        if(page < 1){
            page = 1 ;
        }

        if(productName == null || productName == ""){
            return null ;
        }

        return productMapper.listByPageByCondition((page-1)*rows, rows, productName);
    }

    /**
     * 根据条件查询分页展示产品信息
     * @param pageStr
     * @param rowsStr
     * @param productName
     * @return
     */
    @Override
    public List<Product> listProductCondition(String pageStr, String rowsStr, String productName) {
        //判断合法性
        int page=pageStr == null?1:Integer.parseInt(pageStr);
        int rows=rowsStr == null?20:Integer.parseInt(rowsStr);

        double count=productMapper.getCount();  //为什么count数据类型是double？
        int pageCount=(int) Math.ceil(count/rows);
        //最大页码
        if(page > pageCount){
            page = pageCount;
        }
        //最小页码
        if(page < 1){
            page = 1 ;
        }
        if(productName == null || productName == ""){
            return null ;
        }
        return productMapper.listProductCondition((page-1)*rows, rows, productName);
    }

    /**
     * 条件查询获得总条数
     * @return
     */
    @Override
    public int getCount2(String productName) {
        if(productName == null || productName == ""){
            return 0 ;
        }
        return productMapper.getCount2(productName);
    }

    /**
     * 批量下架  伪删除
     * @param id  待下架产品的id
     * @return
     */
    @Override
    public int downProduct(Integer id) {
        return productMapper.downProduct(id);
    }

    /**
     * 据id添加产品的下架原因
     * @param id   待下架产品的id
     * @param downReason  下架原因
     * @return
     */
    @Override
    public int addDownReasonById(Integer id, String downReason) {
        return productMapper.addDownReasonById(id, downReason);
    }
}

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
           throw  new NullPointerException("产品不能为空");
        }
        return productMapper.addProduct(product);
    }
}

package com.hiyoung.manage.product.controller;

import com.hiyoung.manage.product.entity.Product;
import com.hiyoung.manage.product.service.ProductIf;
import com.hiyoung.manage.product.service.imp.ProductImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage/product")
public class ProductController {
    @Resource
    ProductIf productService;

    /**
     * 分页展示产品信息
     * @param pageStr
     * @param rowsStr
     * @return
     * //manage/product/listProductByPage.do
     */
    @RequestMapping("/listProductByPage.do")
    @ResponseBody
    public Map<String,Object>  listProductByPage(String pageStr,String rowsStr){
        int total = productService.getCount();
        List<Product> products = productService.listProductByPage(pageStr, rowsStr);
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("rows",products);
        return map;
    }

    /**
     * 创建产品
     * @param product  待创建的产品
     * @return
     */
    @RequestMapping("/addProduct.do")
    @ResponseBody
    public  Map<String,Object> addProduct( Product product){
        System.out.println(product);
        Map<String,Object> map = new HashMap<>();
        /*boolean success = false;  //默认添加不成功
        String msg = "新建产品失败" ;
        //可以新建产品时
        int num = productService.addProduct(product);
        if(num == 1){
            //添加成功
            success = true ;
            msg = "新建产品成功" ;
        }
        map.put("msg",msg);
        map.put("success",success);
        System.out.println(map);
        return map;*/
        int num = productService.addProduct(product);
        boolean success=false; //默认没添加成功
        if(num != 0) {
            //添加成功
            success=true;
        }
        map.put("success",success);
        return map;
    }
}

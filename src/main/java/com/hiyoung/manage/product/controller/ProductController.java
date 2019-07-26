package com.hiyoung.manage.product.controller;


import com.hiyoung.manage.product.entity.Product;
import com.hiyoung.manage.product.service.ProductIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    public Map<String,Object>  listProductByPage(@RequestParam("page") String pageStr, @RequestParam("rows") String rowsStr){
        int total = productService.getCount();
        List<Product> products = productService.listProductByPage(pageStr, rowsStr);
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("rows",products);
        System.out.println(map);
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

    /**
     * 展示单条产品信息
     * @param pageStr
     * @param rowsStr
     * @return
     */
    @RequestMapping("/listSingleProduct.do")
    @ResponseBody
    public Map<String,Object>  listSingleProduct(@RequestParam("page") String pageStr, @RequestParam("rows") String rowsStr){
        int total = productService.getCount();
        List<Product> products = productService.listProductByPage(pageStr, rowsStr);
        Product product = products.get(0);
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("rows",product);
        System.out.println(map);
        return map;

    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        //转换日期 注意这里的转化要和传进来的字符串的格式一直 如2015-9-9 就应该为yyyy-MM-dd/yyyy-MM-dd HH:mm:ss
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        // CustomDateEditor为自定义日期编辑器
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

}

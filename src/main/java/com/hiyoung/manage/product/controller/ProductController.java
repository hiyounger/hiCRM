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
import java.util.*;

@Controller
@RequestMapping("/manage/product")
public class ProductController {
    @Resource
    ProductIf productService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        //转换日期 注意这里的转化要和传进来的字符串的格式一直 如2015-9-9 就应该为yyyy-MM-dd/yyyy-MM-dd HH:mm:ss
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        // CustomDateEditor为自定义日期编辑器
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * 分页展示产品信息
     * @param pageStr  从哪一页开始展示的字符串
     * @param rowsStr  每页展示多少条数据的字符串
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
        //System.out.println(map);
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
        int num = productService.addProduct(product);
        boolean success=false; //默认没添加成功 num = 0
        if(num != 0) {
            //添加成功
            success=true;
        }
        map.put("success",success);
        System.out.println(map);
        return map;
    }

    /**
     * 展示单条产品信息
     * @param pageStr  从哪一页开始展示
     * @param rowsStr  每页展示多少条数据的字符串
     * @return
     */
    @RequestMapping("/listSingleProduct.do")
    @ResponseBody
    public Map<String,Object>  listSingleProduct(@RequestParam("page") String pageStr, @RequestParam("rows") String rowsStr){
        int total = 1 ;
        //List<Product> products = productService.listProductByPage(pageStr, rowsStr);
        Product product = productService.listProductByPage(pageStr, rowsStr).get(0);  //根据创建时间来排序分页展示，获取第一条数据
        List<Product> list = new ArrayList<>();
        list.add(product);   //单个产品也必须放在list集合中，这是easyui 的分页的规定
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("rows",list);
        System.out.println(map);
        return map;

    }

    /**
     * 根据条件查询分页展示产品信息
     * @param pageStr  从哪一页开始展示
     * @param rowsStr 每页展示多少条数据的字符串
     * @param productName 查询条件 待查询的产品名称
     * @return
     */
    @RequestMapping("/listByPageByCondition.do")
    @ResponseBody
    public Map<String,Object> listByPageByCondition(@RequestParam("page") String pageStr,@RequestParam("rows") String rowsStr, String productName){
        int total = productService.getCount1(productName);
        List<Product> products = productService.listByPageByCondition(pageStr, rowsStr, productName);
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("rows",products);
        System.out.println(map);
        return map;

    }

    /**
     * 根据条件查询分页展示产品信息
     * @param pageStr 从哪一页开始展示
     * @param rowsStr   每页展示多少条数据的字符串
     * @param productName  查询条件 待查询的产品名称
     * @return
     */
    @RequestMapping("/listProductCondition.do")
    @ResponseBody
    public Map<String,Object>  listProductCondition(@RequestParam("page") String pageStr, @RequestParam("rows") String rowsStr,String productName){
        int total = productService.getCount2(productName);
        List<Product> products = productService.listProductCondition(pageStr, rowsStr, productName);
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("rows",products);
        return map;
    }

    /**
     * 根据产品id 下架产品  逻辑删除
     * @param id   前端返回过来的多个产品的id 字符串
     * @return
     */
    @RequestMapping("/downProduct.do")
    @ResponseBody
    public Map<String,Object> downProduct(String id){
        Map<String,Object> map = new HashMap<>();
        String[] ids = id.split(",");   //将id字符串切割
        for(String i : ids){
            //遍历id字符串组成的数组
            //i 表示待下架产品的id字符串
            int num = productService.downProduct(Integer.valueOf(i));
            boolean success = false ;
            if(num != 0){
                //逻辑删除成功
                success = true ;
                map.put("success",success);
            }
        }
        return map;
    }

    /**
     * 据id添加产品的下架原因
     * @param id  前端返回过来的多个产品的id 字符串
     * @param downReason  前端返回过来的下架原因的字符串
     * @return
     */
    @RequestMapping("/addDownReasonById.do")
    @ResponseBody
    public Map<String,Object> addDownReasonById(String id,String downReason){
        Map<String,Object> map = new HashMap<>();
        String[] ids = id.split(",");   //将id字符串切割
        for(String i : ids){
            //遍历id字符串组成的数组
            //i 表示待下架产品的id字符串
            int num = productService.addDownReasonById(Integer.valueOf(i),downReason);
            boolean success = false ;
            if(num != 0){
                //逻辑删除成功
                success = true ;
                map.put("success",success);
            }
        }
        return map;
    }

}

package com.hiyoung.manage.contracts.controller;

import com.hiyoung.manage.contracts.entity.Contracts;
import com.hiyoung.manage.contracts.service.ContractsService;
import com.hiyoung.utils.BeanUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cns")
public class ContactsController {
    private Contracts contracts=new Contracts();
    @Resource
    ContractsService contractsService;
    @RequestMapping("/list")
    @ResponseBody
    public Map<String,Object> getLIst(HttpServletRequest request){
        String pageStr=request.getParameter("page");
        String rowsStr=request.getParameter("rows");
        //从请求中获取当前页面和每页展示的条数
        List<Contracts> list=contractsService.listBYPage(pageStr,rowsStr);
        Integer zs=contractsService.getCount();
        Map<String,Object> map=new HashMap<>();
        map.put("total",zs);
        map.put("rows",list);
        return map;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Boolean deleteById(HttpServletRequest request){
        String ids0=request.getParameter("ids");
        String[] ids=ids0.split(",");
        System.out.println(ids0);
        for(String id:ids){
         int num=contractsService.deleteById(Integer.parseInt(id));
         if(num==0){
             return false;
         }
        }
        return true;
    }

    @RequestMapping("/add")
    @ResponseBody
 public Boolean addData(HttpServletRequest request){
        Map<String,String[]> map0=request.getParameterMap();
        Map<String,Object> map=new HashMap<>();
        map0.forEach((key,value)->{
            if(key.equals("nextContactTime")){
                if(value[0].trim().length()!=0&&value[0]!=null){
                    Date date= null;
                    try {
                        date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value[0]);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    map.put(key,date);
                }
            }else{
                map.put(key,value[0]);
            }

        });
        BeanUtil.mapTOBean(contracts,map);
        System.out.println(contracts.getNextContactTime());
        int num=contractsService.insert(contracts);
        if(num!=0){
            return true;
        }
        return false;
    }

    @RequestMapping("/add.cns")
    public String add(){
        return "manage/contracts/add_contracts";
    }
    @RequestMapping("/list.cns")
    public String list(){
        return "manage/contracts/list_contracts";
    }
}

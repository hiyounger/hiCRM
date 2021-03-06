package com.hiyoung.manage.bussiness.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.hiyoung.manage.bussiness.entity.Buiness;
import com.hiyoung.manage.bussiness.service.imp.BuinessImp;
//import com.mysql.fabric.xmlrpc.base.Data;



@SessionAttributes(value= {"buiness"})
@Controller
//@RequestMapping("/manage/bussiness")
public class BuinessContoller {
	@Resource
	BuinessImp  buinessImp;
	
	@RequestMapping("/manage/bussiness/get")
	@ResponseBody
	public Map<String, Object> get() {
		Map<String, Object> map=new HashMap<>();
		map.put("oo1", "anfkan");
		return map;
	}
	
	@RequestMapping("/manage/bussiness/newlist")
	@ResponseBody
	public Map<String, Object> newList(@Param("page")Integer page,@Param("rows")Integer rows,Buiness bu){
		System.out.println("name为"+bu.getName());
		
		int count=buinessImp.getcount();
		Map<String, Object> map2=new HashMap<>();
		map2.put("total", count);
		map2.put("rows", buinessImp.newget(page, rows, bu));
		
		return map2;
	}
	
	
	@RequestMapping("/manage/bussiness/lll2")
	public String gettwoo(@Param("theone")String theone) {
		System.out.println(theone);
		return "bussiness/list_business2";
	}
	
	@RequestMapping("/manage/bussiness/lll")
	public String gettwo() {
		
		return "bussiness/list_business";
	}
	
	@RequestMapping("/manage/bussiness/buinessInfo")
	@ResponseBody
	public Map<String, Object> listBuiness(@Param("page")Integer page,@Param("rows")Integer rows){
		
		int  count=buinessImp.getcount();
		Map<String, Object> map=new HashMap<>();
		map.put("total", count);
		map.put("rows", buinessImp.getbyPage(page, rows));
		System.out.println("能不能");
		
		return map;
	}
	
	@RequestMapping("/manage/bussiness/buinessInfosee")
	@ResponseBody
	public Map<String, Object> listBuiness(@Param("page")Integer page,@Param("rows")Integer rows,@Param("action")String action){
	
		System.out.println("page的值"+page+"rows的值"+rows);
		int  count=buinessImp.getcount();
		Map<String, Object> map=new HashMap<>();
		map.put("total", count);
		System.out.println(action);
		map.put("rows", buinessImp.getbyPageAnd(page, rows, action));
		
		System.out.println("能不能");
		
		return map;
	}
	
	
	@RequestMapping("/manage/bussiness/buinessInfofo")
	@ResponseBody
	public Map<String, Object> listBuiness(@ModelAttribute("buiness")Buiness theone ){
		System.out.println("到前天显示单条");
		List<Buiness> list=new ArrayList<>();
		list.add(theone);
		Map<String, Object> map=new HashMap<>();
		map.put("total", 1);
		map.put("rows", list);
		
		
		return map;
	}
	
	
	
	
	
	@RequestMapping("/manage/bussiness/addone")
	@ResponseBody
	public ModelAndView add(Buiness buiness) {
	//	String name=buiness.getName();
	Date date1=buiness.getPreDate();
	if(date1.equals("")) {
		buiness.setPreDate(new Date());
	}
			
		buinessImp.insert(buiness);
		List<Buiness> list=new ArrayList<Buiness>();
		list.add(buiness);
		ModelAndView view=new ModelAndView();
		view.setViewName("text/list_business2");
		view.addObject("buiness", buiness);
		
		return view;
	}
	
	@RequestMapping("/manage/bussiness/delete")
	@ResponseBody
	public String delete( String iid ) {
		
		String[]  ids=iid.split(",");
		for(String idd:ids) {
			
			buinessImp.deletebyid(Integer.valueOf(idd));
			
		}
		return "success";
		
	}
	
	
}

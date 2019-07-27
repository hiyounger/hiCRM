package com.hiyoung.manage.bussiness.controller;


import java.util.ArrayList;


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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hiyoung.manage.bussiness.entity.Buiness;
import com.hiyoung.manage.bussiness.service.imp.BuinessImp;



@SessionAttributes(value= {"bean"})
@Controller
@RequestMapping("/manage/bussiness")
public class BuinessContoller {
	@Resource
	BuinessImp  buinessImp;
	
	@RequestMapping("/get")
	@ResponseBody
	public Map<String, Object> get() {
		Map<String, Object> map=new HashMap<>();
		map.put("oo1", "anfkan");
		return map;
	}
	
	
	@RequestMapping("/lll2")
	public String gettwoo(@Param("theone")String theone) {
		System.out.println(theone);
		return "bussiness/list_business2";
	}
	
	@RequestMapping("/lll")
	public String gettwo() {
		
		return "bussiness/list_business";
	}
	
	@RequestMapping("/buinessInfo")
	@ResponseBody
	public Map<String, Object> listBuiness(@Param("page")Integer page,@Param("rows")Integer rows){
		
		int  count=buinessImp.getcount();
		Map<String, Object> map=new HashMap<>();
		map.put("total", count);
		map.put("rows", buinessImp.getbyPage(page, rows));
		System.out.println("能不能");
		
		return map;
	}
	
	@RequestMapping("/buinessInfosee")
	@ResponseBody
	public Map<String, Object> listBuiness(@Param("page")Integer page,@Param("rows")Integer rows,String action){
		
		int  count=buinessImp.getcount();
		Map<String, Object> map=new HashMap<>();
		map.put("total", count);
		System.out.println(action);
		map.put("rows", buinessImp.getbyPageAnd(page, rows, action));
		System.out.println(buinessImp.getbyPageAnd(page, rows, action));
		
		System.out.println("能不能得到");
		
		return map;
	}
	
	
	@RequestMapping("/buinessInfofo")
	@ResponseBody
	public Map<String, Object> listBuiness(@ModelAttribute("bean")Buiness theone ){
		
		List<Buiness> list=new ArrayList<>();
		list.add(theone);
		Map<String, Object> map=new HashMap<>();
		map.put("total", 1);
		map.put("rows", list);
		
		
		return map;
	}
	
	
	
	
	
	@RequestMapping("/addone")
	@ResponseBody
	public ModelAndView add(Buiness buiness) {
	String name=buiness.getName();
	buinessImp.insert(buiness);
	List<Buiness> list=new ArrayList<Buiness>();
	list.add(buiness);
	ModelAndView view=new ModelAndView();
	view.setViewName("jsp/bussiness/list_business2");
	view.addObject("bean", buiness);
	
	return view;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete( String iid ) {
		
		String[]  ids=iid.split(",");
		for(String idd:ids) {
			
			buinessImp.deletebyid(Integer.valueOf(idd));
			
		}
		return "success";
		
	}
	
	
}

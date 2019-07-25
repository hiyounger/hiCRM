package com.hiyoung.manage.bussiness.controller;


import java.util.HashMap;


import java.util.Map;

import javax.annotation.Resource;

import com.hiyoung.manage.bussiness.entity.Buiness;
import com.hiyoung.manage.bussiness.service.imp.BuinessImp;
import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("/manage/bussiness")
public class BuinessContoller {
	@Resource
	BuinessImp buinessImp;
	
	@RequestMapping("/get")
	@ResponseBody
	public Map<String, Object> get() {
		Map<String, Object> map=new HashMap<>();
		map.put("oo1", "anfkan");
		return map;
	}
	
	
	@RequestMapping("/lll")
	public String gettwo() {
		
		return "text/list_business";
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
	
	@RequestMapping("/addone")
	@ResponseBody
	public Buiness add(Buiness buiness) {
		String name=buiness.getName();
		System.out.println("nfafea");
		
		return buiness;
	}
	
}

package com.hiyoung.manage.bussiness.service.imp;

import java.util.List;



import javax.annotation.Resource;

import com.hiyoung.manage.bussiness.dao.BuinessDao;
import com.hiyoung.manage.bussiness.entity.Buiness;
import com.hiyoung.manage.bussiness.service.BuinessIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class BuinessImp implements BuinessIf {
    @Resource
	BuinessDao dao;
	
	@Override
	public int getcount() {
		// TODO Auto-generated method stub
		return dao.getcount();
	}

	@Override
	public List<Buiness> getbyPage(int page, int rows) {
		int count=dao.getcount();
		int offer=(page-1)*rows;
		int pagecount=(int) Math.ceil(count/rows);
		if(page>pagecount) {
			page=pagecount;
		}
		if(page<1) {
			page=1;
		}
		
		List<Buiness>  list=dao.selectByPage(offer, rows);
		return list;
	}


}

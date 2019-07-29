package com.hiyoung.manage.bussiness.service.imp;

import java.util.List;




import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hiyoung.manage.bussiness.dao.BuinessDao;
import com.hiyoung.manage.bussiness.entity.Buiness;
import com.hiyoung.manage.bussiness.service.BuinessIf;





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

	@Override
	public int insert(Buiness record) {
		// TODO Auto-generated method stub
		return dao.insert(record);
	}

	@Override
	public int deletebyid(Integer id) {
		// TODO Auto-generated method stub
		return dao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Buiness> getbyPagetheone(int page, int rows, int theone) {
		// TODO Auto-generated method stub
		return dao.selectByPagetheone(page, rows, theone);
	}

	@Override
	public List<Buiness> getbyPageAnd(int page, int rows, String name) {
		// TODO Auto-generated method stub
		int count=dao.getcount();
		int offer=(page-1)*rows;
		int pagecount=(int) Math.ceil(count/rows);
		if(page>pagecount) {
			page=pagecount;
		}
		if(page<1) {
			page=1;
		}
		
	
		return dao.selectByPageAnd(offer, rows, name);
	}

}

package com.hiyoung.manage.bussiness.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.hiyoung.manage.bussiness.entity.Buiness;





public interface BuinessIf {
int getcount();

List<Buiness> getbyPage(int page,int rows);
List<Buiness> getbyPagetheone(int page,int rows,int theone);
List<Buiness> getbyPageAnd(int page,int rows,String name);
int insert(Buiness record);
int deletebyid(Integer id);
}

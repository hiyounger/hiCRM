package com.hiyoung.manage.bussiness.service;

import java.util.List;

import com.hiyoung.manage.bussiness.entity.Buiness;
import org.springframework.stereotype.Service;




public interface BuinessIf {
int getcount();

List<Buiness> getbyPage(int page, int rows);

}

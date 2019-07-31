package com.hiyoung.system.user.service;

import com.hiyoung.system.user.dao.UserMapper;
import com.hiyoung.system.user.entity.User;

import java.util.List;

public interface UserServiceIf {
    User getUser(String phone);
    List<User> listUsers(int page,int count ,int id,String name,int status);
    int getCount(int id,String name,int status);
    int insert(User user);
}

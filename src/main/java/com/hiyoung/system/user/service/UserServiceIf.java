package com.hiyoung.system.user.service;

import com.hiyoung.system.user.entity.User;

import java.util.List;

public interface UserServiceIf {
    User getUser(String username,String password);
    List<User> listUsers(Integer page,Integer count ,int id);
    int getCount(int id);
}

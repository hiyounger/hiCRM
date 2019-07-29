package com.hiyoung.system.user.service.imp;

import com.hiyoung.system.user.service.UserServiceIf;
import com.hiyoung.system.user.dao.UserMapper;
import com.hiyoung.system.user.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImp implements UserServiceIf {
    @Resource
    UserMapper userMapper;
    @Override
    public User getUser(int phone, String password) {
        return userMapper.getUser(phone, password);
    }

    @Override
    public List<User> listUsers(int page, int count ,int id,String name,int status) {
        return userMapper.listUsers((page-1)*count,count,id,name,status);
    }

    @Override
    public int getCount(int id,String name,int status) {
        return userMapper.getCount(id,name,status);
    }
}

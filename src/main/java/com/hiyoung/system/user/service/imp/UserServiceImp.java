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
    public User getUser(String username, String password) {
        return userMapper.getUser(username, password);
    }

    @Override
    public List<User> listUsers(Integer page, Integer count) {
        return userMapper.listUsers((page-1)*count,count);
    }

    @Override
    public int getCount() {
        return userMapper.getCount();
    }
}

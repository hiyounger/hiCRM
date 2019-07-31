package com.hiyoung.system.user.service.imp;

import com.hiyoung.system.user.service.UserServiceIf;
import com.hiyoung.system.user.dao.UserMapper;
import com.hiyoung.system.user.entity.User;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImp implements UserServiceIf {
    @Resource
    UserMapper userMapper;
    @Override
    public User getUser(String phone) {
        return userMapper.getUser(phone);
    }

    @Override
    public List<User> listUsers(int page, int count ,int id,String name,int status) {
        return userMapper.listUsers((page-1)*count,count,id,name,status);
    }

    @Override
    public int getCount(int id,String name,int status) {
        return userMapper.getCount(id,name,status);
    }

    @Override
    public int insert(User user) {
        String password=user.getPassword();
        String name=user.getName();
        String hashAlgorithName = "MD5";
        int hashIterations = 1024;
        ByteSource credentialsSalt = ByteSource.Util.bytes(name);
        Object obj = new SimpleHash(hashAlgorithName, password, credentialsSalt, hashIterations);
        user.setPassword(obj.toString());
        if("-1".equals(user.getSex())){
            user.setSex(null);
        }
        if("-1".equals(user.getSupervisor())){
            user.setSupervisor(null);
        }
        return userMapper.insert(user);
    }
}

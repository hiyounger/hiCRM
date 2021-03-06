package com.hiyoung.system.user.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hiyoung.system.user.dao.UserMapper;
import com.hiyoung.system.user.service.UserServiceIf;
import com.hiyoung.system.user.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;

@RestController
public class UserController {

    @Resource
    UserServiceIf userService;
    @Resource
    UserMapper userMapper;
    @PostMapping(value = "/login")
    public boolean user( String phone, String password){
        System.out.println("登录");
        Subject subject= SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(phone, password);
        try {
            subject.login(token);
            return true;
        } catch (AuthenticationException e) {
            return false;
        }
    }

    @PostMapping("/system/user/list")
    public Map<String,Object> getUsers(int page,int rows,int id,String name,int status){
        Map<String, Object> map = new HashMap<>();
        List<User> users = userService.listUsers(page, rows,id,name,status);
        int total=userService.getCount(id,name,status);
        map.put("total",total );
        map.put("rows",users );
        System.out.println(users);
        return map;
    }

    @PostMapping("/system/user/insert")
    public int insert(User user){
        userService.insert(user);
        return user.getId();
    }

    @PostMapping("/system/user/deleteByIds")
    public int deleteById(String ids) throws Exception{
        ObjectMapper mapper = new ObjectMapper();
        List<Integer> list = mapper.readValue(ids, new TypeReference<List<Integer>>(){});
        return  userMapper.deleteByIds(list);
    }
    @PostMapping("/system/user/validatePhone")
    public int validatePhone(String phone){
        return userMapper.validatePhone(phone);
    }
}

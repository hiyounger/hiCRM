package com.hiyoung.system.user.controller;

import com.hiyoung.system.user.service.UserServiceIf;
import com.hiyoung.system.user.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @Resource
    UserServiceIf userService;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public boolean user( String username, String password){
        System.out.println("登录");
        Subject subject= SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        try {
            subject.login(token);
            return true;
        } catch (AuthenticationException e) {
            return false;
        }
    }

    @GetMapping("/system/list")
    public List<User> getUsers(){
        List<User> users = new ArrayList<>();

        return users;
    }
}

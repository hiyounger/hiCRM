package com.hiyoung.manage.leads.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/test")
public class TestHtml {
   /* @Resource
    UserMapper dao1;*/

    @RequestMapping("/t1")
    public String hello(){
        System.out.println("hellosdfs");
        return "one";

    }

  /*  @RequestMapping("/t2")
    @ResponseBody
    public String ttt(){
        User user=dao1.selectByPrimaryKey(2);
        return  user.getUsername()+"->"+user.getPassword();

    }*/

}

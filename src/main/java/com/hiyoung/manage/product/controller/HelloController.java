package com.hiyoung.manage.product.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 工作接口，可以访问hello的url 则表示可以前后端工作
 */
@RestController
public class HelloController {
    @RequestMapping("/hello")
    @ResponseBody
    public String hello() {
        return "hello,this is a springboot demo";
    }
}

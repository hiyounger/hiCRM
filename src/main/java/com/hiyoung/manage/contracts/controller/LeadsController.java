package com.hiyoung.manage.contracts.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lead")
public class LeadsController {
    @RequestMapping("/list")
    public String list(){
        return "manage/announcement/edit_announcement";
    }
}

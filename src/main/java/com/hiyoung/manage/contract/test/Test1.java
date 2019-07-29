package com.hiyoung.manage.contract.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test1 {
    public static void main(String[] args) throws ParseException {
        //设置创建日期格式
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

      System.out.println(new Date());
        System.out.println(sdf.format(new Date()));

    }
}

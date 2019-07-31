package com.hiyoung.manage.contacts.util;

import java.util.Timer;
import java.util.TimerTask;

/**
 * 定时器
 */
public class Timer1 {
    Timer timer;
    public Timer1(int sec){
        timer=new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println(sec+"秒的等待结束");
                //终止Timer线程
                timer.cancel();
            }
        },sec*1000);
    }
}

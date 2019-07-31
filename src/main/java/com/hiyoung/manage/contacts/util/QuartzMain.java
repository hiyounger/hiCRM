package com.hiyoung.manage.contacts.util;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

public class QuartzMain {
    public static void main(String[] args) {
        /*jobdetail 就是对job的定义，而job是具体执行的逻辑内容。 具体的执行的逻辑需要实现 job类，并实现execute方法。
这里为什么需要有个JobDetai来作为job的定义，为什么不直接使用job？
解释：如果使用jobdetail来定义，那么每次调度都会创建一个new job实例，这样带来的好处就是任务并发执行的时候，互不干扰，
不会对临界资源造成影响。
         定义任务具体执行的逻辑 */
        JobDetail detail= JobBuilder.newJob(Quartz1.class)
                .withIdentity("job1","group1")
                //job需要传递的内容
                .usingJobData("name1","大道无止境")
                .build();
        //定义一个触发器，定义任务执行的方式、间隔。
        Trigger trigger= TriggerBuilder.newTrigger()
                .withIdentity("trigger1","group1")
                .startNow()   //加入调度器之后立即执行
                .withSchedule(SimpleScheduleBuilder.simpleSchedule()
                        .withIntervalInSeconds(3) //定时 ，每3秒执行一次
                        .repeatForever()).build(); //重复执行
        //创建任务调度器，所有的任务都是从这里开始。
        try {
            Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
            scheduler.scheduleJob(detail, trigger);
            scheduler.start(); //运行一段时间后关闭
            try {
                Thread.sleep(9000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            scheduler.shutdown();
        } catch (SchedulerException e) {
            e.printStackTrace();
        }


    }
}

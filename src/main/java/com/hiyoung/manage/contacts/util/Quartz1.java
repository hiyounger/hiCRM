package com.hiyoung.manage.contacts.util;

import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.Date;

public class Quartz1 implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        JobDetail detail=jobExecutionContext.getJobDetail();
        String name=detail.getJobDataMap().getString("name1");
        System.out.println("quartz的测试中name="+name+"---"+new Date());
    }
}

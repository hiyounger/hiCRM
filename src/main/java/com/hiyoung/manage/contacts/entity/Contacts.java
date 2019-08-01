package com.hiyoung.manage.contacts.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
public class Contacts implements Serializable {
    private Integer id;

    private String name;

    private String customerName;

    private String telephone;

    private String phone;

    private String email;

    private String job;

    private String address;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date nextContactTime;

    private String remarks;

    private String creater;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private String isKeyMaker;

    private String sex;

    private  Integer deleteState;

    public Integer getDeleteState() {
        return deleteState;
    }

    public void setDeleteState(Integer deleteState) {
        this.deleteState = deleteState;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getNextContactTime() {
        return nextContactTime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setNextContactTime(Date nextContactTime) {
        this.nextContactTime = nextContactTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }


    public String getIsKeyMaker() {
        return isKeyMaker;
    }

    public void setIsKeyMaker(String isKeyMaker) {
        this.isKeyMaker = isKeyMaker == null ? null : isKeyMaker.trim();
    }

    public String getSex() {
        return sex;
    }

    @Override
    public String toString() {
        return "Contacts{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", customerName='" + customerName + '\'' +
                ", telephone='" + telephone + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", job='" + job + '\'' +
                ", address='" + address + '\'' +
                ", nextContactTime=" + nextContactTime +
                ", remarks='" + remarks + '\'' +
                ", creater='" + creater + '\'' +
                ", updateTime=" + updateTime +
                ", isKeyMaker='" + isKeyMaker + '\'' +
                ", sex='" + sex + '\'' +
                ", deleteState=" + deleteState +
                '}';
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }
}
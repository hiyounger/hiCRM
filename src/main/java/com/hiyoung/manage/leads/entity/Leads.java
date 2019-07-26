package com.hiyoung.manage.leads.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Leads implements Serializable {
    private Integer id;
    private String leadsName;
    private String mobil;
    private String telephone;
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date updateTime;
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date createTime;

    private String blame;

    private String address;
     @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date nextContactTime;

    private String createPerson;

    private String leadsOrgin;

    private Integer customerLevel;

    private String remark;

   private int state;

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getLeadsName() {
        return leadsName;
    }

    public void setLeadsName(String leadsName) {
        this.leadsName = leadsName;
    }

    public Date getNextContactTime() {
        return nextContactTime;
    }

    public void setNextContactTime(Date nextContactTime) {
        this.nextContactTime = nextContactTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMobil() {
        return mobil;
    }

    public void setMobil(String mobil) {
        this.mobil = mobil;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getBlame() {
        return blame;
    }

    public void setBlame(String blame) {
        this.blame = blame == null ? null : blame.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }


    public String getCreatePerson() {
        return createPerson;
    }

    public void setCreatePerson(String createPerson) {
        this.createPerson = createPerson == null ? null : createPerson.trim();
    }

    public String getLeadsOrgin() {
        return leadsOrgin;
    }

    public void setLeadsOrgin(String leadsOrgin) {
        this.leadsOrgin = leadsOrgin == null ? null : leadsOrgin.trim();
    }

    public Integer getCustomerLevel() {
        return customerLevel;
    }

    public void setCustomerLevel(Integer customerLevel) {
        this.customerLevel = customerLevel;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}
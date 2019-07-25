package com.hiyoung.manage.leads.entity;

import java.io.Serializable;
import java.util.Date;

public class Leads implements Serializable {
    private Integer id;
    private String leadsName;
    private Integer mobil;
    private Integer telephone;
    private Date updateTime;

    private Date createTime;

    private String blame;

    private String address;

    private Date nextContacttime;

    private String createPerson;

    private String leadsOrgin;

    private Integer customerLevel;

    private String remark;

    public String getLeadsName() {
        return leadsName;
    }

    public Integer getTelephone() {
        return telephone;
    }

    public void setTelephone(Integer telephone) {
        this.telephone = telephone;
    }

    public void setLeadsName(String leadsName) {
        this.leadsName = leadsName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMobil() {
        return mobil;
    }

    public void setMobil(Integer mobil) {
        this.mobil = mobil;
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

    public Date getNextContacttime() {
        return nextContacttime;
    }

    public void setNextContacttime(Date nextContacttime) {
        this.nextContacttime = nextContacttime;
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
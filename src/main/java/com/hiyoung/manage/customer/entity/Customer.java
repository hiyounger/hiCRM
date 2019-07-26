package com.hiyoung.manage.customer.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Customer {
    private Integer id;

    private String name;

    private Integer transactionStatus;

    private String tel;

    private String phone;

    private Date nextContectTime;

    private String creator;

    private Date updateTime;

    private Date createTime;

    private String leader;

    private String remarks;

    private Integer deleteStatus;

    private String customerLevel;

    private String customerSource;

    private String customerIndustry;

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

    public Integer getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(Integer transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getNextContectTime() {
        return nextContectTime;
    }

    public void setNextContectTime(Date nextContectTime) {
        this.nextContectTime = nextContectTime;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
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

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader == null ? null : leader.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }

    public String getCustomerLevel() {
        return customerLevel;
    }

    public void setCustomerLevel(String customerLevel) {
        this.customerLevel = customerLevel == null ? null : customerLevel.trim();
    }

    public String getCustomerSource() {
        return customerSource;
    }

    public void setCustomerSource(String customerSource) {
        this.customerSource = customerSource == null ? null : customerSource.trim();
    }

    public String getCustomerIndustry() {
        return customerIndustry;
    }

    public void setCustomerIndustry(String customerIndustry) {
        this.customerIndustry = customerIndustry == null ? null : customerIndustry.trim();
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", transactionStatus=" + transactionStatus +
                ", tel='" + tel + '\'' +
                ", phone='" + phone + '\'' +
                ", nextContectTime=" + nextContectTime +
                ", creator='" + creator + '\'' +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                ", leader='" + leader + '\'' +
                ", remarks='" + remarks + '\'' +
                ", deleteStatus=" + deleteStatus +
                ", customerLevel='" + customerLevel + '\'' +
                ", customerSource='" + customerSource + '\'' +
                ", customerIndustry='" + customerIndustry + '\'' +
                '}';
    }
}
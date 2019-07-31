package com.hiyoung.manage.contract.entity;

import com.hiyoung.manage.contract.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public class Contacts1 {

    @Excel(name = "id")
    private Integer id;

    @Excel(name = "客户名称",orderNum = 1)
    private String customername;

    @Excel(name = "合同编号",orderNum = 2)
    private Integer number;

    @Excel(name = "合同名称",orderNum = 3)
    private String contactname;

    @Excel(name = "商机名称",orderNum = 4)
    private String businessname;

    @Excel(name = "下单时间",orderNum = 5)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ordertime;

    @Excel(name = "客户姓名",orderNum = 6)
    private Double contractamount;

    @Excel(name = "客户姓名",orderNum = 7)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startingtimecontract;

    @Excel(name = "客户姓名",orderNum = 8)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endtimecontract;

    @Excel(name = "客户姓名",orderNum = 9)
    private String customercontractor;

    @Excel(name = "客户姓名",orderNum = 10)
    private String companycontractor;

    @Excel(name = "客户姓名",orderNum = 11)
    private String remarks;

    @Excel(name = "客户姓名",orderNum = 12)
    private String founder;

    @Excel(name = "客户姓名",orderNum = 13)
   // @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Integer mxtime;

    @Excel(name = "客户姓名",orderNum = 14)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatetime;

    @Excel(name = "客户姓名",orderNum = 15)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date creationtime;

    @Excel(name = "客户姓名",orderNum = 16)
    private String personincharge;

    @Excel(name = "客户姓名",orderNum = 17)
    private Integer status;


    public Integer getMxtime() {
        return mxtime;
    }

    public void setMxtime(Integer mxtime) {
        this.mxtime = mxtime;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname == null ? null : contactname.trim();
    }

    public String getBusinessname() {
        return businessname;
    }

    public void setBusinessname(String businessname) {
        this.businessname = businessname == null ? null : businessname.trim();
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Double getContractamount() {
        return contractamount;
    }

    public void setContractamount(Double contractamount) {
        this.contractamount = contractamount;
    }

    public Date getStartingtimecontract() {
        return startingtimecontract;
    }

    public void setStartingtimecontract(Date startingtimecontract) {
        this.startingtimecontract = startingtimecontract;
    }

    public Date getEndtimecontract() {
        return endtimecontract;
    }

    public void setEndtimecontract(Date endtimecontract) {
        this.endtimecontract = endtimecontract;
    }

    public String getCustomercontractor() {
        return customercontractor;
    }

    public void setCustomercontractor(String customercontractor) {
        this.customercontractor = customercontractor == null ? null : customercontractor.trim();
    }

    public String getCompanycontractor() {
        return companycontractor;
    }

    public void setCompanycontractor(String companycontractor) {
        this.companycontractor = companycontractor == null ? null : companycontractor.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getFounder() {
        return founder;
    }

    public void setFounder(String founder) {
        this.founder = founder == null ? null : founder.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Date getCreationtime() {
        return creationtime;
    }

    public void setCreationtime(Date creationtime) {
        this.creationtime = creationtime;
    }

    public String getPersonincharge() {
        return personincharge;
    }

    public void setPersonincharge(String personincharge) {
        this.personincharge = personincharge == null ? null : personincharge.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Contacts1{" +
                "id=" + id +
                ", customername='" + customername + '\'' +
                ", number=" + number +
                ", contactname='" + contactname + '\'' +
                ", businessname='" + businessname + '\'' +
                ", ordertime=" + ordertime +
                ", contractamount=" + contractamount +
                ", startingtimecontract=" + startingtimecontract +
                ", endtimecontract=" + endtimecontract +
                ", customercontractor='" + customercontractor + '\'' +
                ", companycontractor='" + companycontractor + '\'' +
                ", remarks='" + remarks + '\'' +
                ", founder='" + founder + '\'' +
                ", updatetime=" + updatetime +
                ", creationtime=" + creationtime +
                ", personincharge='" + personincharge + '\'' +
                ", status=" + status +
                '}';
    }
}
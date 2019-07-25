package com.hiyoung.manage.contact.entity;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import java.util.Date;
@Repository
public class Contacts1 {

    private Integer id;

    private String customername;

    private Integer number;

    private String contactname;

    private String businessname;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ordertime;

    private Double contractamount;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startingtimecontract;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endtimecontract;

    private String customercontractor;

    private String companycontractor;

    private String remarks;

    private String founder;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatetime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date creationtime;

    private String personincharge;

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

    @Override
    public String toString() {
        return super.toString();
    }
}
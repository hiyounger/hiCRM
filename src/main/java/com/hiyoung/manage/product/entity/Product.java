package com.hiyoung.manage.product.entity;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.Date;

@Repository
public class Product implements Serializable {
    private Integer id;    //

    private Integer productId;

    private String productType;

    private String productName;

    private Integer creatorUserId;

    private Float standardPrice;

    private Integer leaderId;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private Date updateTime;

    private String description;

    private Integer productState;

    private String productUnit;

    private String onReason;

    private String downReason;

    public Product() {
        super();
    }

    public Product(Integer id,Integer productId, String productType, String productName, Integer creatorUserId, Float standardPrice, Integer leaderId, Date createTime, Date updateTime, String description, Integer productState, String productUnit, String onReason, String downReason) {
        this.id = id;
        this.productId = productId;
        this.productType = productType;
        this.productName = productName;
        this.creatorUserId = creatorUserId;
        this.standardPrice = standardPrice;
        this.leaderId = leaderId;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.description = description;
        this.productState = productState;
        this.productUnit = productUnit;
        this.onReason = onReason;
        this.downReason = downReason;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType == null ? null : productType.trim();
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public Integer getCreatorUserId() {
        return creatorUserId;
    }

    public void setCreatorUserId(Integer creatorUserId) {
        this.creatorUserId = creatorUserId;
    }

    public Float getStandardPrice() {
        return standardPrice;
    }

    public void setStandardPrice(Float standardPrice) {
        this.standardPrice = standardPrice;
    }

    public Integer getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(Integer leaderId) {
        this.leaderId = leaderId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getOnReason() {
        return onReason;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setOnReason(String onReason) {
        this.onReason = onReason;
    }

    public String getDownReason() {
        return downReason;
    }

    public void setDownReason(String downReason) {
        this.downReason = downReason;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getProductState() {
        return productState;
    }

    public void setProductState(Integer productState) {
        this.productState = productState;
    }

    public String getProductUnit() {
        return productUnit;
    }

    public void setProductUnit(String productUnit) {
        this.productUnit = productUnit == null ? null : productUnit.trim();
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", productId=" + productId +
                ", productType='" + productType + '\'' +
                ", productName='" + productName + '\'' +
                ", creatorUserId=" + creatorUserId +
                ", standardPrice=" + standardPrice +
                ", leaderId=" + leaderId +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", description='" + description + '\'' +
                ", productState=" + productState +
                ", productUnit='" + productUnit + '\'' +
                ", onReason='" + onReason + '\'' +
                ", downReason='" + downReason + '\'' +
                '}';
    }
}
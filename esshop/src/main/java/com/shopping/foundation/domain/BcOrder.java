package com.shopping.foundation.domain;

import com.shopping.core.domain.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Entity
@Table(name = "bc_order")
public class BcOrder extends IdEntity {
    private static final long serialVersionUID = 5915411486060876503L;
    private String orderAddress;

    private Integer orderType;

    private String userAddressFrom;

    private String userAddressTo;

    private String allMoney;

    private String saasMoney;

    private String realMoney;

    private Integer payStateSaas;

    private Integer payStateUser;

    private String orderAddressSaas;

    private String orderAddressUser;

    private String remark;

    private Date updateTime;

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress == null ? null : orderAddress.trim();
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    public String getUserAddressFrom() {
        return userAddressFrom;
    }

    public void setUserAddressFrom(String userAddressFrom) {
        this.userAddressFrom = userAddressFrom == null ? null : userAddressFrom.trim();
    }

    public String getUserAddressTo() {
        return userAddressTo;
    }

    public void setUserAddressTo(String userAddressTo) {
        this.userAddressTo = userAddressTo == null ? null : userAddressTo.trim();
    }

    public String getAllMoney() {
        return allMoney;
    }

    public void setAllMoney(String allMoney) {
        this.allMoney = allMoney == null ? null : allMoney.trim();
    }

    public String getSaasMoney() {
        return saasMoney;
    }

    public void setSaasMoney(String saasMoney) {
        this.saasMoney = saasMoney == null ? null : saasMoney.trim();
    }

    public String getRealMoney() {
        return realMoney;
    }

    public void setRealMoney(String realMoney) {
        this.realMoney = realMoney == null ? null : realMoney.trim();
    }

    public Integer getPayStateSaas() {
        return payStateSaas;
    }

    public void setPayStateSaas(Integer payStateSaas) {
        this.payStateSaas = payStateSaas;
    }

    public Integer getPayStateUser() {
        return payStateUser;
    }

    public void setPayStateUser(Integer payStateUser) {
        this.payStateUser = payStateUser;
    }

    public String getOrderAddressSaas() {
        return orderAddressSaas;
    }

    public void setOrderAddressSaas(String orderAddressSaas) {
        this.orderAddressSaas = orderAddressSaas == null ? null : orderAddressSaas.trim();
    }

    public String getOrderAddressUser() {
        return orderAddressUser;
    }

    public void setOrderAddressUser(String orderAddressUser) {
        this.orderAddressUser = orderAddressUser == null ? null : orderAddressUser.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
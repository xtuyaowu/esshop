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
@Table(name = "bc_user")
public class BcUser extends IdEntity {
    private static final long serialVersionUID = -7454653953072297530L;
    private String bcType;

    private String bcAccount;

    private String bcBalance;

    private String bcTokenBalance;

    private String saasUserId;

    private String saasUserName;

    private String saasUserPass;

    private String accountToken;

    private String refreshToken;

    private String createBy;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    public String getBcType() {
        return bcType;
    }

    public void setBcType(String bcType) {
        this.bcType = bcType == null ? null : bcType.trim();
    }

    public String getBcAccount() {
        return bcAccount;
    }

    public void setBcAccount(String bcAccount) {
        this.bcAccount = bcAccount == null ? null : bcAccount.trim();
    }

    public String getBcBalance() {
        return bcBalance;
    }

    public void setBcBalance(String bcBalance) {
        this.bcBalance = bcBalance == null ? null : bcBalance.trim();
    }

    public String getSaasUserId() {
        return saasUserId;
    }

    public String getBcTokenBalance() {
        return bcTokenBalance;
    }

    public void setBcTokenBalance(String bcTokenBalance) {
        this.bcTokenBalance = bcTokenBalance;
    }

    public void setSaasUserId(String saasUserId) {
        this.saasUserId = saasUserId == null ? null : saasUserId.trim();
    }

    public String getSaasUserName() {
        return saasUserName;
    }

    public void setSaasUserName(String saasUserName) {
        this.saasUserName = saasUserName == null ? null : saasUserName.trim();
    }

    public String getSaasUserPass() {
        return saasUserPass;
    }

    public void setSaasUserPass(String saasUserPass) {
        this.saasUserPass = saasUserPass == null ? null : saasUserPass.trim();
    }

    public String getAccountToken() {
        return accountToken;
    }

    public void setAccountToken(String accountToken) {
        this.accountToken = accountToken == null ? null : accountToken.trim();
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken == null ? null : refreshToken.trim();
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}
package com.shopping.foundation.service;

import com.shopping.core.query.support.IPageList;
import com.shopping.core.query.support.IQueryObject;
import com.shopping.foundation.domain.BcUser;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public abstract interface IBcUserService
{
  public abstract boolean save(BcUser paramGoods);

  public abstract BcUser getObjById(Long paramLong);

  public abstract boolean delete(Long paramLong);

  public abstract boolean batchDelete(List<Serializable> paramList);

  public abstract IPageList list(IQueryObject paramIQueryObject);

  public abstract boolean update(BcUser paramGoods);

  public abstract List<BcUser> query(String paramString, Map paramMap, int paramInt1, int paramInt2);

  public abstract BcUser getObjByProperty(String paramString, Object paramObject);
}



 
 
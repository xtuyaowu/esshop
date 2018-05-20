 package com.shopping.foundation.service.impl;

 import com.shopping.core.dao.IGenericDAO;
 import com.shopping.core.query.GenericPageList;
 import com.shopping.core.query.PageObject;
 import com.shopping.core.query.support.IPageList;
 import com.shopping.core.query.support.IQueryObject;
 import com.shopping.core.tools.Wallet;
 import com.shopping.foundation.domain.BcUser;
 import com.shopping.foundation.service.IBcUserService;
 import org.springframework.stereotype.Service;
 import org.springframework.transaction.annotation.Transactional;

 import javax.annotation.Resource;
 import java.io.Serializable;
 import java.util.Date;
 import java.util.List;
 import java.util.Map;
 import java.util.UUID;

 @Service
 @Transactional
 public class BcUserServiceImpl
   implements IBcUserService
 {
 
   @Resource(name="bcUserDAO")
   private IGenericDAO<BcUser> bcUserDAO;
 
   public boolean save(BcUser bcUser)
   {
     try
     {
        String bcAccount = "test";//Wallet.createAccounts("", "health + userUuid");
        bcUser.setBcBalance("0");
        bcUser.setBcType("ethereum");
        bcUser.setBcAccount(bcAccount);
        bcUser.setCreateBy("1");
        bcUser.setAddTime(new Date());
        bcUser.setUpdateBy("1");
        bcUser.setUpdateDate(new Date());
        this.bcUserDAO.save(bcUser);
        return true;
     } catch (Exception e) {
       e.printStackTrace();
     }return false;
   }
 
   public BcUser getObjById(Long id)
   {
       BcUser goods = (BcUser)this.bcUserDAO.get(id);
     if (goods != null) {
       return goods;
     }
     return null;
   }
 
   public boolean delete(Long id) {
     try {
       this.bcUserDAO.remove(id);
       return true;
     } catch (Exception e) {
       e.printStackTrace();
     }return false;
   }
 
   public boolean batchDelete(List<Serializable> goodsIds)
   {
     for (Serializable id : goodsIds) {
       delete((Long)id);
     }
     return true;
   }
 
   public IPageList list(IQueryObject properties) {
     if (properties == null) {
       return null;
     }
     String query = properties.getQuery();
     Map params = properties.getParameters();
     GenericPageList pList = new GenericPageList(BcUser.class, query,
       params, this.bcUserDAO);
     if (properties != null) {
       PageObject pageObj = properties.getPageObj();
       if (pageObj != null)
         pList.doList(pageObj.getCurrentPage() == null ? 0 : pageObj
           .getCurrentPage().intValue(), pageObj.getPageSize() == null ? 0 : 
           pageObj.getPageSize().intValue());
     } else {
       pList.doList(0, -1);
     }return pList;
   }
 
   public boolean update(BcUser goods) {
     try {
       this.bcUserDAO.update(goods);
       return true;
     } catch (Exception e) {
       e.printStackTrace();
     }return false;
   }
 
   public List<BcUser> query(String query, Map params, int begin, int max) {
     return this.bcUserDAO.query(query, params, begin, max);
   }
 
   public BcUser getObjByProperty(String propertyName, Object value)
   {
     return (BcUser)this.bcUserDAO.getBy(propertyName, value);
   }
 }



 
 
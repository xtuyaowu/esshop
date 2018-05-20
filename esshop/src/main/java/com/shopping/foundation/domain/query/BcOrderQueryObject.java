 package com.shopping.foundation.domain.query;

 import com.shopping.core.query.QueryObject;
 import org.springframework.web.servlet.ModelAndView;

 import java.util.Map;

 public class BcOrderQueryObject extends QueryObject
 {
   public BcOrderQueryObject(String currentPage, ModelAndView mv, String orderBy, String orderType)
   {
     super(currentPage, mv, orderBy, orderType);
   }

   public BcOrderQueryObject(String currentPage, Map<String, Object> map, String orderBy, String orderType)
   {
     super(currentPage, map, orderBy, orderType);
   }

   public BcOrderQueryObject()
   {
   }
 }



 
 
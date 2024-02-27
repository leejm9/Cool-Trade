<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/service/ProductService.java
package com.cooltrade.product.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;

<<<<<<< HEAD
=======
import com.cooltrade.member.model.dao.MemberDao;
>>>>>>> jm
import com.cooltrade.product.dao.ProductDao;
import com.cooltrade.product.vo.Product;
=======
package com.cooltrade.product.model.service;

import java.sql.Connection;

import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.vo.Product;

import static com.cooltrade.common.JDBCTemplate.*;
>>>>>>> origin/cr:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/service/ProductService.java

public class ProductService {
	public Product countSalesRate() {
		Connection conn = getConnection();
		
		Product p = new ProductDao().countSalesRate(conn);
		
		close(conn);
		return p;
	}
<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/service/ProductService.java
	
	public Product todayStockGoods() {
		Connection conn = getConnection();
		
		Product p = new ProductDao().todayStockGoods(conn);
		
		close(conn);
		return p;
	}
	
	public Product countReportedProduct() {
		Connection conn = getConnection();
		
		Product p = new ProductDao().countReportedProduct(conn);
		
		close(conn);
		return p;
	}
}
=======
}
>>>>>>> origin/cr:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/service/ProductService.java

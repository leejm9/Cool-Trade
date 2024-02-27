<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/dao/ProductDao.java
package com.cooltrade.product.dao;
=======
package com.cooltrade.product.model.dao;
>>>>>>> origin/cr:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/dao/ProductDao.java

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/dao/ProductDao.java
import static com.cooltrade.common.JDBCTemplate.*;
import com.cooltrade.product.vo.Product;
=======
import com.cooltrade.product.model.vo.Product;

import static com.cooltrade.common.JDBCTemplate.*;
>>>>>>> origin/cr:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/dao/ProductDao.java

public class ProductDao {
	Properties prop = new Properties();
	
	public ProductDao() {
		String filePath = ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Product countSalesRate(Connection conn) {
		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countSalesRate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p.setSalesRate(rset.getInt("salesRate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public Product todayStockGoods(Connection conn) {
		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("todayStockGoods");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p.setTstockgoods(rset.getInt("tstockgoods"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public Product countReportedProduct(Connection conn) {
		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countReportedProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p.setReportedProduct(rset.getInt("reportedproduct"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
		
		
		
	}
	
	
	
}

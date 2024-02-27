package com.cooltrade.product.model.service;

import java.sql.Connection;

import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.vo.Product;

import static com.cooltrade.common.JDBCTemplate.*;

public class ProductService {
	public Product countSalesRate() {
		Connection conn = getConnection();
		
		Product p = new ProductDao().countSalesRate(conn);
		
		close(conn);
		return p;
	}
	
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

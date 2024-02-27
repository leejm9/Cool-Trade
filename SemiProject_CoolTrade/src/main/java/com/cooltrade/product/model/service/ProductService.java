package com.cooltrade.product.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

<<<<<<< HEAD
=======
import com.cooltrade.common.PageInfo;
import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.vo.Product;
>>>>>>> ds

import com.cooltrade.product.dao.ProductDao;
import com.cooltrade.product.vo.Product;

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
	
	public int selectProductCount() {
		Connection conn = getConnection();
		
		int result = new ProductDao().selectProductCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Product> selectProduct(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProduct(conn, pi);
		
		close(conn);
		
		return list;
	}
}

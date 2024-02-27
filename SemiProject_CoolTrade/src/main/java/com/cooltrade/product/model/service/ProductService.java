package com.cooltrade.product.model.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.cooltrade.common.PageInfo;
import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.vo.Category;
import com.cooltrade.product.model.vo.Product;


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
	
	public ArrayList<Product> selectRandomProduct(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectRandomProduct(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Category> selectCategoryList(){
		Connection conn = getConnection();
		
		ArrayList<Category> list = new ProductDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> searchProductList(String search){
		Connection conn = getConnection();
		
		ArrayList<Product> plist = new ProductDao().searchProductList(conn, search);
		
		close(conn);
		
		return plist;
	}
	
	public ArrayList<Category> searchCatList(String search){
		Connection conn = getConnection();
		
		ArrayList<Category> catList = new ProductDao().searchCatList(conn, search);
		
		close(conn);
		
		return catList;
	}
}

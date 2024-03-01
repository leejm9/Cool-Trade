package com.cooltrade.product.model.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.cooltrade.common.Images;
import com.cooltrade.common.PageInfo;
import com.cooltrade.member.model.dao.MemberDao;
import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.vo.Category;
import com.cooltrade.product.model.vo.Images;
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

	public ArrayList<Product> selectRandomProduct(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Product> list = new ProductDao().selectRandomProduct(conn, pi);

		close(conn);

		return list;
	}

	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();

		ArrayList<Category> list = new ProductDao().selectCategoryList(conn);

		close(conn);

		return list;
	}

	public ArrayList<Product> searchProductList(String search) {
		Connection conn = getConnection();

		ArrayList<Product> plist = new ProductDao().searchProductList(conn, search);

		close(conn);

		return plist;
	}

	public ArrayList<Category> searchCatList(String search) {
		Connection conn = getConnection();

		ArrayList<Category> catList = new ProductDao().searchCatList(conn, search);

		close(conn);

		return catList;
	}

	public int countProduct(String search) {
		Connection conn = getConnection();

		int pCount = new ProductDao().countProduct(conn, search);

		close(conn);

		return pCount;
	}

	public ArrayList<Product> selectRecentList() {
		Connection conn = getConnection();
		
		ArrayList<Product> recentList = new ProductDao().selectRecentList(conn);
		
		close(conn);
		
		return recentList;
	}
	
	public Product selectProductDetail(int pno) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectProductDetail(conn,pno);
		
		close(conn);
		
		return p;
	}
	
	public ArrayList<Product> selectMonthSales(){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectMonthSales(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectCategorySales(){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectCategorySales(conn);
		close(conn);
		return list;
	}
	
	public int increaseCount(int pno) {
		Connection conn = getConnection();
		
		int result = new ProductDao().increaseCount(conn, pno);
		
		if(result>0) {
			commit(conn);
		}else {
	public int insertProductSell(Product p, ArrayList<Images> list) {
		Connection conn = getConnection();
		
		int result1 = new ProductDao().insertProductSell(conn, p); // 상품테이블 저장
		int result2 = new ProductDao().insertImagesList(conn, list); // 이미지테이블에 저장
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
<<<<<<< HEAD
		
		return result;
	}
	
	public ArrayList<Images> selectImages(int pno) {
		Connection conn = getConnection();
		
		ArrayList<Images> imglist = new ProductDao().selectImages(conn, pno);
		
		close(conn);
		
		return imglist;
	}
	
	public ArrayList<Product> searchKeywords(ArrayList<String> extractedKeywords, String cpCategory){
		Connection conn = getConnection();
		
		ArrayList<Product> plist = new ProductDao().searchKeywords(conn, extractedKeywords, cpCategory);
		
		close(conn);
		
		return plist;
	}
	
	public ArrayList<Images> getTitleImg(ArrayList<Product> plist){
		Connection conn = getConnection();
		
		ArrayList<Images> imglist = new ProductDao().getTitleImg(conn, plist);
		
		close(conn);
		
		return imglist;
	}
=======
		return result1 * result2;
		
	}
	
>>>>>>> cr
}

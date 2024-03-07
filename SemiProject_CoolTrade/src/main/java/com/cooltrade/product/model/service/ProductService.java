package com.cooltrade.product.model.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.cooltrade.common.PageInfo;
import com.cooltrade.member.model.dao.MemberDao;
import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.vo.Category;
import com.cooltrade.product.model.vo.Images;
import com.cooltrade.product.model.vo.Product;
import com.cooltrade.product.model.vo.Search;

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

   public ArrayList<Product> selectRandomProduct() {
      Connection conn = getConnection();

      ArrayList<Product> list = new ProductDao().selectRandomProduct(conn);

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
            rollback(conn);
         }
         
         close(conn);
         
         return result;
   }

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
      return result1 * result2;
   }

   public int insertPopularWord(String search) {
      Connection conn = getConnection();
      
      int result = new ProductDao().insertPopularWord(conn, search);
      
      if(result > 0) {
         commit(conn);
      }else {
         rollback(conn);
      }
      
      close(conn);
      return result;
   }
   
   public ArrayList<Search> selectPopularWord() {
      Connection conn = getConnection();
      
      ArrayList<Search> list = new ProductDao().selectPopularWord(conn);
      
      close(conn);
      return list;
   }
   
   public int countPopularWord() {
      Connection conn = getConnection();
      
      int endValue = new ProductDao().countPopularWord(conn);
      
      close(conn);
      return endValue;
      
   }

    public ArrayList<Product> updateSellForm(int pno) {
		Connection conn = getConnection();
		System.out.println("서비스 pno : " + pno);
		ArrayList<Product> pList = new ProductDao().updateSellForm(conn, pno);
		
		close(conn);
		return pList;
	}
	
	public int deleteProductSellImage(int pno) {
		Connection conn = getConnection();
		int result = new ProductDao().deleteProductSellImage(conn, pno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		System.out.println("딜리트서비스리절트 : " + result);
		close(conn);
		return result;
	}
	
	public int updateProductSell(Product p, ArrayList<Images> list, int pno, int userNo) {
		Connection conn = getConnection();
		
		int result1 = new ProductDao().updateProductSell(conn, p, pno); // 상품테이블 업데이트
		int result2 = new ProductDao().insertNewImagesList(conn, list, pno, userNo); // 이미지테이블에 인서트
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
		
	}
	
	public int deletePopularSearch() {
		Connection conn = getConnection();
		
		int result = new ProductDao().deletePopularSearch(conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertPopularSearch(String[] s) {
		Connection conn = getConnection();
		
		int result = new ProductDao().insertPopularSearch(conn, s);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Images> selectImages(int pno) {
		Connection conn = getConnection();
		
		ArrayList<Images> imglist = new ProductDao().selectImages(conn, pno);
		
		close(conn);
		
		return imglist;
	}
	
	public ArrayList<Product> searchKeywords(ArrayList<String> extractedKeywords, String cpCategory, int pno){
		Connection conn = getConnection();
		
		ArrayList<Product> plist = new ProductDao().searchKeywords(conn, extractedKeywords, cpCategory, pno);
		
		close(conn);
		
		return plist;
	}
	
	public ArrayList<Images> getTitleImg(ArrayList<Product> plist){
		Connection conn = getConnection();
		
		ArrayList<Images> imglist = new ProductDao().getTitleImg(conn, plist);
		
		close(conn);
		
		return imglist;
	}
	
	public ArrayList<Product> selectRecommendProduct(int pno){
		Connection conn = getConnection();
		
		ArrayList<Product> plist = new ProductDao().selectRecommendProduct(conn, pno);
		
		close(conn);
		
		return plist;
	}
	public int countUserPopwList() {
		Connection conn = getConnection();
		
		int result = new ProductDao().countUserPopwList(conn);
		
		close(conn);
		
		return result;
			
	}
	
	public ArrayList<Search> selectUserPopwList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Search> list = new ProductDao().selectUserPopwList(conn,pi);
		
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectDaySales(){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectDaySales(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> searchByCategory(String cno){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().searchByCategory(conn, cno);
		
		close(conn);
		
		return list;
	}
	
	public String getCategoryName(String cno) {
		Connection conn = getConnection();
		
		String CategoryName = new ProductDao().getCategoryName(conn, cno);
		
		close(conn);
		
		return CategoryName;
	}
	
	public int countProductByCat(String cno) {
		Connection conn = getConnection();
		
		int pCount = new ProductDao().countProductByCat(conn, cno);
		
		close(conn);
		
		return pCount;
	}
	
	public ArrayList<Product> arrangeByDateC(String cno){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().arrangeByDateC(conn, cno);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> arrangePriceHighC(String cno){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().arrangePriceHighC(conn, cno);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> arrangePriceLowC(String cno){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().arrangePriceLowC(conn, cno);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> arrangeByDateS(String search){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().arrangeByDateS(conn, search);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> arrangePriceHighS(String search){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().arrangePriceHighS(conn, search);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> arrangePriceLowS(String search){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().arrangePriceLowS(conn, search);
		
		close(conn);
		
		return list;
	public int deleteBoard(int pno) {
		Connection conn = getConnection();
		
		int result = new ProductDao().deleteBoard(conn, pno);
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}

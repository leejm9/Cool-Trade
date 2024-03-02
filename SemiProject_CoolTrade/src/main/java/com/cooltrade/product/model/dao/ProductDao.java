package com.cooltrade.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.cooltrade.common.JDBCTemplate.*;

import com.cooltrade.common.PageInfo;
import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.vo.Category;
import com.cooltrade.product.model.vo.Product;
import com.cooltrade.product.model.vo.Search;

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

			if (rset.next()) {
				p.setSalesRate(rset.getInt("salesRate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

			if (rset.next()) {
				p.setTstockgoods(rset.getInt("tstockgoods"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

			if (rset.next()) {
				p.setReportedProduct(rset.getInt("reportedproduct"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	public int selectProductCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int productCount = 0;
		String sql = prop.getProperty("selectProductCount");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				productCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return productCount;
	}

	public ArrayList<Product> selectRandomProduct(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		String sql = prop.getProperty("selectProduct");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setSellerNo(rset.getString("seller_no"));
				p.setProductName(rset.getString("product_name"));
				p.setZone(rset.getString("zone"));
				p.setPrice(rset.getInt("price"));
				p.setUploadDate(rset.getString("upload_date"));
				p.setTimeDiff(rset.getString("time_diff"));

				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Category> selectCategoryList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = new ArrayList<Category>();

		String sql = prop.getProperty("selectCategoryList");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Category(rset.getString("category_no"), rset.getString("category_name"),
						rset.getInt("count")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Product> searchProductList(Connection conn, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> plist = new ArrayList<Product>();
		String sql = prop.getProperty("searchProductList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, search);
			pstmt.setString(2, search);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setSellerNo(rset.getString("seller_no"));
				p.setProductName(rset.getString("product_name"));
				p.setPrice(rset.getInt("price"));
				p.setZone(rset.getString("zone"));
				p.setUploadDate(rset.getString("upload_date"));
				p.setTimeDiff(rset.getString("time_diff"));
				
				plist.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return plist;
	}

	public ArrayList<Category> searchCatList(Connection conn, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> catList = new ArrayList<Category>();
		String sql = prop.getProperty("searchCatList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, search);
			pstmt.setString(2, search);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Category c = new Category();
				c.setCategoryName(rset.getString("category_name"));
				c.setCategoryNo(rset.getString("category_no"));
				c.setCategoryCount(rset.getInt("count"));

				catList.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return catList;
	}

	public int countProduct(Connection conn, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int pCount = 0;
		String sql = prop.getProperty("countProduct");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, search);
			pstmt.setString(2, search);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				pCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pCount;
	}
	
	public ArrayList<Product> selectRecentList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> recentList = new ArrayList<Product>();
		String sql = prop.getProperty("selectRecentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setSellerNo(rset.getString("seller_no"));
				p.setProductName(rset.getString("product_name"));
				p.setPrice(rset.getInt("price"));
				p.setZone(rset.getString("zone"));
				p.setUploadDate(rset.getString("upload_date"));
				p.setTimeDiff(rset.getString("time_diff"));
				
				recentList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return recentList;
	}
	
	public Product selectProductDetail(Connection conn, int pno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductDetail");
		Product p = new Product();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p.setProductNo(rset.getInt("product_no"));
				p.setSellerNo(rset.getString("user_id"));
				p.setCategoryNo(rset.getString("category_name"));
				p.setProductName(rset.getString("product_name"));
				p.setPrice(rset.getInt("price"));
				p.setProductDesc(rset.getString("product_desc"));
				p.setZone(rset.getString("zone"));
				p.setOndo(rset.getDouble("ondo"));
				p.setProductStatus(rset.getString("pstatus"));
				p.setTradeType(rset.getInt("trade_type"));
				p.setUploadDate(rset.getString("upload_date"));
				p.setCount(rset.getInt("count"));
				p.setTimeDiff(rset.getString("time_diff"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public ArrayList<Product> selectMonthSales(Connection conn){
		ArrayList<Product> list = new ArrayList<Product>();
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMonthSales");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("price"),
									 rset.getString("sell_date")
									 ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> selectCategorySales(Connection conn){
		ArrayList<Product> list = new ArrayList<Product>();
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategorySales");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getString("categoryname"),
									 rset.getInt("count")
									 ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int increaseCount(Connection conn, int pno) {
		PreparedStatement pstmt = null; 
		int result = 0;
		String sql = prop.getProperty("increaseCount");
		
		try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, pno);
	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return result;
	   
	}	
	public int insertPopularWord(Connection conn, String search) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPopularWord");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, search);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Images> selectImages(Connection conn, int pno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Images> imglist = new ArrayList<Images>();
		String sql = prop.getProperty("selectImages");
		
		try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, pno);
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            Images img = new Images();
	            img.setImgNo(rset.getInt("img_no"));
	            img.setOriginName(rset.getString("origin_name"));
	            img.setChangeName(rset.getString("change_name"));
	            img.setImgPath(rset.getString("img_path"));
	            
	            imglist.add(img);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return imglist;
	}
	
	public ArrayList<Search> selectPopularWord(Connection conn) {
		ArrayList<Search> list = new ArrayList<Search>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPopularWord");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Search(rset.getString("popw_word"),
									rset.getInt("wordcnt")
									));				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> searchKeywords(Connection conn, ArrayList<String> extractedKeywords, String cpCategory){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> plist = new ArrayList<Product>();
		
		StringBuilder sql = new StringBuilder("SELECT * FROM (");
		sql.append("SELECT PRODUCT_NO, PRODUCT_NAME, ROWNUM RNUM FROM PRODUCT JOIN CATEGORY USING (CATEGORY_NO) WHERE ");
		for(int i = 0; i < extractedKeywords.size(); i++) {
		    sql.append("PRODUCT_NAME LIKE '%'|| ? || '%' OR PRODUCT_DESC LIKE '%'|| ? || '%'");
		    if(i < extractedKeywords.size() - 1) {
		        sql.append(" OR ");
		    }
		}
		sql.append(" AND CATEGORY_NAME = '").append(cpCategory).append("' ");
		sql.append("ORDER BY DBMS_RANDOM.VALUE");
		sql.append(") WHERE RNUM <= 20");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			
			for(int i = 0, j = 1; i < extractedKeywords.size(); i++) {
				pstmt.setString(j++, extractedKeywords.get(i));
                pstmt.setString(j++, extractedKeywords.get(i));
			}
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setProductName(rset.getString("product_name"));
				plist.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return plist;
	}
	
	public int countPopularWord(Connection conn) {
		int endValue = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countPopularWord");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				endValue = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return endValue;
	}
	
	public ArrayList<Images> getTitleImg(Connection conn, ArrayList<Product> plist){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getTitleImg");
		ArrayList<Images> imglist = new ArrayList<Images>();
		try {
			for(Product p : plist) {
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setInt(1, p.getProductNo());
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					Images img = new Images();
					img.setImgNo(rset.getInt("img_no"));
					img.setRefPno(rset.getInt("ref_pno"));
					img.setOriginName(rset.getString("origin_name"));
					img.setChangeName(rset.getString("change_name"));
					img.setImgPath(rset.getString("img_path"));
					
					imglist.add(img);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return imglist;
	}
	public int insertProductSell(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProductSell");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(p.getSellerNo()));
			pstmt.setString(2, p.getCategoryNo());
			pstmt.setString(3, p.getProductName());
			pstmt.setInt(4, p.getPrice());
			pstmt.setString(5, p.getProductDesc());
			pstmt.setInt(6, p.getPieces());
			pstmt.setString(7, p.getZone());
			pstmt.setString(8, p.getProductStatus());
			pstmt.setInt(9, p.getDeliveryCharge());
			pstmt.setInt(10, p.getTradeType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}
	
	public int insertImagesList(Connection conn, ArrayList<Images> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertImagesList");
		
		try {
			
			for(Images img : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, img.getImgLevel());
				pstmt.setString(2, img.getOriginName());
				pstmt.setString(3, img.getChangeName());
				pstmt.setString(4, img.getImgPath());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	

	
	
	public int deletePopularSearch(Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deletePopularSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertPopularSearch(Connection conn, String[] list) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPopularSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(String s : list) {
				pstmt.setString(1, s );
				result = pstmt.executeUpdate();
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
		
	}
	
}

package com.cooltrade.report.model.dao;

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
import com.cooltrade.report.model.vo.Report;

public class ReportDao {
	private Properties prop = new Properties();
	
	
	public ReportDao() {
		String filePath = ProductDao.class.getResource("/db/sql/report-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Report> selectRecentReport(Connection conn){
		ArrayList<Report> list = new ArrayList<Report>();
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecentReport");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Report(rset.getString("report_cate"),
									rset.getDate("report_date"),
									rset.getString("user_name"),
									rset.getString("product_name")
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
	
	public int insertReport(Connection conn,int pno,int reporterNo,int reportCate,String reportContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			pstmt.setInt(2, reporterNo);
			pstmt.setInt(3, reportCate);
			pstmt.setString(4, reportContent);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int checkReport(Connection conn, int reporterNo,int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reporterNo);
			pstmt.setInt(2, pno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int countReportList(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countReportList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Report> selectReportList(Connection conn, PageInfo pi){
		ArrayList<Report> list = new ArrayList<Report>();
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReportList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	        int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("report_no"),
									rset.getInt("product_no"),
									rset.getString("user_name"),
								    rset.getString("report_cate"),
								    rset.getDate("report_date"),
								    rset.getString("product_name")
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

}

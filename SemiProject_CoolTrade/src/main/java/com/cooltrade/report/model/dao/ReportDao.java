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
	
	public int insertReport(Connection conn,int pno,String reporter,int reportCate,String reportContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			pstmt.setString(2, reporter);
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

}

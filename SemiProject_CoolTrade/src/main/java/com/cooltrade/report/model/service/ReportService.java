package com.cooltrade.report.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.cooltrade.common.JDBCTemplate.*;

import com.cooltrade.report.model.dao.ReportDao;
import com.cooltrade.report.model.vo.Report;

public class ReportService {
	public ArrayList<Report> selectRecentReport(){
		Connection conn = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectRecentReport(conn);
		
		close(conn);
		return list;
	}
	
	public int insertReport(int pno, int reporterNo, int reportCate, String reportContent) {
		Connection conn = getConnection();
		
		int result = new ReportDao().insertReport(conn, pno,reporterNo,reportCate,reportContent);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int checkReport(int reporterNo,int pno) {
		Connection conn = getConnection();
		
		int result = new ReportDao().checkReport(conn,reporterNo,pno);
		close(conn);
		return result;
	}
}

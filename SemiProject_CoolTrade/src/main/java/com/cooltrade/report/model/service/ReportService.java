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
}

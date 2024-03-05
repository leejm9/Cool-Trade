package com.cooltrade.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.cooltrade.common.PageInfo;
import com.cooltrade.notice.model.dao.NoticeDao;
import com.cooltrade.notice.model.vo.Notice;

import static com.cooltrade.common.JDBCTemplate.*;

public class NoticeService {
	public int countNoticeList() {
		Connection conn = getConnection();
		
		int result = new NoticeDao().countNoticeList(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn,pi);
		close(conn);
		return list;
	}
	
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		
		close(conn);
		return n;
	}
	
	public int updateNotice(int noticeNo, String title, String content) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn,noticeNo, title,content);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn,noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int InsertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().InsertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}

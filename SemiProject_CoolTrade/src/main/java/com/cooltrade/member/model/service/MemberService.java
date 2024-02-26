package com.cooltrade.member.model.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.util.ArrayList;

import com.cooltrade.common.PageInfo;
import com.cooltrade.member.model.dao.MemberDao;
import com.cooltrade.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn,userId, userPwd);
		
		close(conn);
		
		return m;
		
	}
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Member> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
//	public int insertMember(Member m) {
//		Connection conn = getConnection();
//		
//		int result = new MemberDao().insertMember(conn, m);
//		
//		if(result >0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		
//		close(conn);
//		return result;
//	}
	
	public Member countMember() {
		Connection conn = getConnection();
		
		Member m = new MemberDao().countMember(conn);
		close(conn);
		return m;
	}
	
	public int updateUserLevel(int userNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateUserLevel(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int selectBlackListCount() {
		Connection conn = getConnection();
		
		int result = new MemberDao().selectBlackListCount(conn);
		
		close(conn);
		return result;
	}
	
	public ArrayList<Member> selectBlackList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectBlackList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
}

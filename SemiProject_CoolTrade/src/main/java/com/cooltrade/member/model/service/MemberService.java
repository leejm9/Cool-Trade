package com.cooltrade.member.model.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;

import com.cooltrade.member.model.dao.MemberDao;
import com.cooltrade.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn,userId, userPwd);
		
		close(conn);
		
		return m;
		
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public Member countMember() {
		Connection conn = getConnection();
		
		Member m = new MemberDao().countMember(conn);
		close(conn);
		return m;
	}
	
	
	
}

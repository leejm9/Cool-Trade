package com.kh.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId );
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("mem_no"),
							   rset.getString("mid"),
							   rset.getString("mpw"),
							   rset.getString("mname"),
							   rset.getString("nickname"),
							   rset.getString("phone"),
							   rset.getString("email"),
							   rset.getDate("enrolldate"),
							   rset.getDouble("ondo"),
							   rset.getString("mlevel"),
							   rset.getString("mstatus"),
							   rset.getInt("caution"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);		
			close(pstmt);
		}
		return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmId());
			pstmt.setString(2, m.getmPw());
			pstmt.setString(3, m.getmName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());

			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member countMember(Connection conn) {
		Member m = null; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("count"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
}

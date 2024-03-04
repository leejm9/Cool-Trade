package com.cooltrade.member.model.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.cooltrade.common.PageInfo;
import com.cooltrade.member.model.dao.MemberDao;
import com.cooltrade.member.model.vo.Member;
import com.cooltrade.product.model.vo.Product;
import com.cooltrade.product.model.vo.Trade;

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
	
	public Member idMember(String userId) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().idMember(conn, userId);
		
		close(conn);
		
		return m;
		
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
	
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
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
	
	public int selectTradeTypeCount(Member m) {
		Connection conn = getConnection();
		int count = new MemberDao().selectTradeTypeCount(conn, m);
		
		close(conn);
		return count;
	}
	
	public int countBoardList() {
		Connection conn = getConnection();
		
		int result = new MemberDao().countBoardList(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<Member> selectBoardList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectBoardList(conn,pi);
		close(conn);
		return list;
	}
	
	public int deleteMember(int userNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn,userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int recoveryMember(int userNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().recoveryMember(conn,userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	public ArrayList<Member> selectEnrollMonth(){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectEnrollMonth(conn);
		close(conn);
		return list;
	}	
	
	public int sellListCountPo(int userNo) {
		Connection conn = getConnection();
		int listCount = new MemberDao().sellListCountPo(conn, userNo);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Product> sellListPo(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Product> list = new MemberDao().sellListPo(conn, pi, userNo);
		
		close(conn);
		return list;
				
	}
	
	public int buyListCountPo(int userNo) {
		Connection conn = getConnection();
		int listCount = new MemberDao().buyListCountPo(conn, userNo);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Trade> buyListPo(PageInfo pi, int userNo) {
		System.out.println("서비스유저넘버" + userNo);
		Connection conn = getConnection();
		ArrayList<Trade> list = new MemberDao().buyListPo(conn, pi, userNo);
		System.out.println("서비스 리스트 : " + list);
		close(conn);
		return list;
				
	}
	
	public int updateSellStatus(int pNo, String sellStatus) {
		Connection conn = getConnection();
		int result = new MemberDao().updateSellStatus(conn, pNo, sellStatus);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteProductSell(int pno) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteProductSell(conn, pno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int sellListStatusCo(int userNo, String sellStatus) {
		Connection conn = getConnection();
		int listCount = new MemberDao().sellListStatusCo(conn, userNo, sellStatus);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Product> sellListStatusPo(PageInfo pi, int userNo, String sellStatus) {
		Connection conn = getConnection();
		ArrayList<Product> list = new MemberDao().sellListStatusPo(conn, pi, userNo, sellStatus);
		
		close(conn);
		return list;
				
	} 
	
	public ArrayList<Product> sellListSearch(PageInfo pi, int userNo, String word) {
		System.out.println("서비스에 키워드오나?" + word);
		Connection conn = getConnection();
		ArrayList<Product> list = new MemberDao().sellListSearch(conn, pi, userNo, word);
		
		close(conn);
		return list;
				
	} 
	
	public int sellListSearchCount(int userNo, String word) {
		Connection conn = getConnection();
		int listCount = new MemberDao().sellListSearchCount(conn, userNo, word);
		
		close(conn);
		return listCount;
		
	}
	
	public int buyListSelectCo(int userNo) {
		Connection conn = getConnection();
		int listCount = new MemberDao().buyListSelectCo(conn, userNo);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Trade> buyListSelectPo(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Trade> list = new MemberDao().buyListSelectPo(conn, pi, userNo);
		close(conn);
		return list;
				
	}
	
	public int buyListSearchCount(int userNo, String word) {
		Connection conn = getConnection();
		int listCount = new MemberDao().buyListSearchCount(conn, userNo, word);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Trade> buyListSearchPo(PageInfo pi, int userNo, String word) {
		Connection conn = getConnection();
		ArrayList<Trade> list = new MemberDao().buyListSearchPo(conn, pi, userNo, word);
		close(conn);
		return list;
				
	}
	
}

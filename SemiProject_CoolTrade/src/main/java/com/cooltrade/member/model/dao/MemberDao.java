package com.cooltrade.member.model.dao;

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
import com.cooltrade.member.model.vo.Member;
import com.cooltrade.product.model.vo.Product;
import com.cooltrade.product.model.vo.Trade;
import com.cooltrade.product.model.vo.Images;
import com.cooltrade.product.model.vo.Review;
import com.cooltrade.product.model.vo.ReviewType;

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
            m = new Member(rset.getInt("user_no"),
                        rset.getString("user_id"),
                        rset.getString("user_pwd"),
                        rset.getString("user_name"),
                        rset.getString("nickname"),
                        rset.getString("phone"),
                        rset.getString("email"),
                        rset.getDate("enroll_date"),
                        rset.getDouble("ondo"),
                        rset.getString("user_level"),
                        rset.getString("user_status"),
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
   
   
   
   public int selectListCount(Connection conn) {
      int listCount = 0;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectListCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt("count");
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return listCount;
   }
   
   public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
      
      ArrayList<Member> list = new ArrayList<Member>();
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("user_no"),
                           rset.getString("user_id"),
                           rset.getString("user_name"),
                           rset.getDate("enroll_date"),
                           rset.getDouble("ondo"),
                           rset.getString("user_level"),
                           rset.getInt("caution")
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
   
   public Member idMember(Connection conn, String userId) {
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("idMember");
      
      try {
         
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userId);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            m = new Member(rset.getInt("user_no"),
                        rset.getString("user_id"),
                        rset.getString("user_pwd"),
                        rset.getString("user_name"),
                        rset.getString("nickname"),
                        rset.getString("phone"),
                        rset.getString("email"),
                        rset.getDate("enroll_date"),
                        rset.getDouble("ondo"),
                        rset.getString("user_level"),
                        rset.getString("user_status"),
                        rset.getInt("caution"));
         }
         
         System.out.println(m);
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);      
         close(pstmt);
      }
      return m;
   }
//   public int insertMember(Connection conn, Member m) {
//      int result = 0;
//      PreparedStatement pstmt = null;
//      
//      String sql = prop.getProperty("insertMember");
//      try {
//         pstmt = conn.prepareStatement(sql);
//         
//         pstmt.setString(1, m.getmId());
//         pstmt.setString(2, m.getmPw());
//         pstmt.setString(3, m.getmName());
//         pstmt.setString(4, m.getPhone());
//         pstmt.setString(5, m.getEmail());
//
//         
//         result = pstmt.executeUpdate();
//      } catch (SQLException e) {
//         e.printStackTrace();
//      }finally {
//         close(pstmt);
//      }
//      
//      return result;
//   }
   
   
   
   public int insertMember(Connection conn, Member m) {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("insertMember");
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, m.getUserId());      // USER_ID
         pstmt.setString(2, m.getUserPwd());      // USER_PWD
         pstmt.setString(3, m.getUserName());   // USER_NAME
         pstmt.setString(4, m.getPhone());      // PHONE
         pstmt.setString(5, m.getNickName());   // NICKNAME
         pstmt.setString(6, m.getEmail());      // EMAIL
         
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
   
   public int updateUserLevel(Connection conn, int userNo) {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("updateUserLevel");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, userNo);
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
      
   }
   
   public int selectBlackListCount(Connection conn) {
      int result = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectBlackListCount");
      
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
   
   public ArrayList<Member> selectBlackList(Connection conn, PageInfo pi){
      ArrayList<Member> list = new ArrayList<Member>();
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectBlackList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("user_no"),
                           rset.getString("user_id"),
                           rset.getString("user_name"),
                           rset.getString("user_status"),
                           rset.getInt("caution")
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
   
   public int selectTradeTypeCount(Connection conn, Member m) {
      // select문 => ResultSet
      int count = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectTradeTypeCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, m.getUserNo());
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            count = rset.getInt("count");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      
      return count;
   }
         
   public int countBoardList(Connection conn) {
      int result = 0;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("countBoardList");
      
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
   
   public ArrayList<Member> selectBoardList(Connection conn, PageInfo pi){
      ArrayList<Member> list = new ArrayList<Member>();
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectBoardList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("user_no"),
                           rset.getString("user_name"),
                           rset.getInt("caution"),
                           rset.getString("product_name"),
                           rset.getDate("upload_date")
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
   
   public int deleteMember(Connection conn, int userNo) {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteMember");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, userNo);
         
         result = pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }
   
   public int recoveryMember(Connection conn, int userNo) {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("recoveryMember");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, userNo);
         
         result = pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }
   
   public ArrayList<Member> selectEnrollMonth(Connection conn){
      ArrayList<Member> list = new ArrayList<Member>();
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectEnrollMonth");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("count"),
                           rset.getString("enroll_date")
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
   
   public int sellListCountPo(Connection conn, int userNo) {
      int listCount = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("sellListCountPo");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, userNo);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt("count");
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return listCount;
      
   }
   
   public ArrayList<Product> sellListPo(Connection conn, PageInfo pi, int userNo) {
      ArrayList<Product> list = new ArrayList<Product>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("sellListPo");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, userNo);
         pstmt.setInt(2, startRow);
         pstmt.setInt(3, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            Product p = new Product();
            p.setProductNo(rset.getInt("product_no"));
            p.setProductName(rset.getString("product_name"));
            p.setStrPrice(rset.getString("price"));
            p.setTradeType(rset.getInt("trade_type"));
            p.setSellStatus(rset.getString("sell_status"));
            p.setTitleImg(rset.getString("titleimg"));
            p.setUploadDate(rset.getString("upload_date"));
            
            list.add(p);
            
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
      
   }
   
   public int buyListCountPo(Connection conn, int userNo) {
      int listCount = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("buyListCountPo");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, userNo);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt("count");
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return listCount;
      
   }
   
   public ArrayList<Trade> buyListPo(Connection conn, PageInfo pi, int userNo) {
      ArrayList<Trade> list = new ArrayList<Trade>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("buyListPo");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, userNo);
         pstmt.setInt(2, startRow);
         pstmt.setInt(3, endRow);
         
         rset = pstmt.executeQuery();
         
        while(rset.next()) {
				Trade t = new Trade();
				t.setTradeNo(rset.getInt("trade_no"));
				t.setProductNo(rset.getInt("product_no"));
				t.setSellerNo(rset.getInt("seller_no"));
				t.setNickname(rset.getString("nickname"));
				t.setProductName(rset.getString("product_name"));
				t.setStrPrice(rset.getString("price"));
				t.setDeliveryStatus(rset.getString("delivery_status"));
				t.setTradeDate(rset.getString("trade_date"));
				t.setTitleImg(rset.getString("titleimg"));
				t.setUploadType(rset.getString("upload_type"));
				
				list.add(t);
				System.out.println(t);
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
      
   }
   
   public int countOndoList(Connection conn) {
      int result = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("countOndoList");
      
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
   
   public int countCbtnList(Connection conn) {
      int result = 0;
      PreparedStatement pstmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("countCbtnList");
      
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
   
   public int countSearchList(Connection conn, String search) {
      int result = 0;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("countSearchList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, search);
         pstmt.setString(2, search);
         
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
   public ArrayList<Member> selectOndoList(Connection conn, PageInfo pi){
      ArrayList<Member> list = new ArrayList<Member>();
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectOndoList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("user_no"),
                           rset.getString("user_id"),
                           rset.getString("user_name"),
                           rset.getDate("enroll_date"),
                           rset.getDouble("ondo"),
                           rset.getString("user_level"),
                           rset.getInt("caution")
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
   
   public ArrayList<Member> selectCbtnList(Connection conn, PageInfo pi){
      ArrayList<Member> list = new ArrayList<Member>();
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectCbtnList");
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("user_no"),
                           rset.getString("user_id"),
                           rset.getString("user_name"),
                           rset.getDate("enroll_date"),
                           rset.getDouble("ondo"),
                           rset.getString("user_level"),
                           rset.getInt("caution")
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
   
   public ArrayList<Member> selectSearchList(Connection conn,PageInfo pi, String search){
      ArrayList<Member> list = new ArrayList<Member>();
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectSearchList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setString(1, search);
         pstmt.setString(2, search);
         pstmt.setInt(3, startRow);
         pstmt.setInt(4, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("user_no"),
                           rset.getString("user_id"),
                           rset.getString("user_name"),
                           rset.getDate("enroll_date"),
                           rset.getDouble("ondo"),
                           rset.getString("user_level"),
                           rset.getInt("caution")
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
   
   public int countBListSearch(Connection conn,String bsearch) {
      int result = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("countBListSearch");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, bsearch);
         pstmt.setString(2, bsearch);
         
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
   
   public ArrayList<Member> selectBListSearch(Connection conn,PageInfo pi,String bsearch){
      ArrayList<Member> list = new ArrayList<Member>();
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectBListSearch");
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setString(1, bsearch);
         pstmt.setString(2, bsearch);
         pstmt.setInt(3, startRow);
         pstmt.setInt(4, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("user_no"),
                           rset.getString("user_id"),
                           rset.getString("user_name"),
                           rset.getString("user_status"),
                           rset.getInt("caution")
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
   
   public int countSearchBoard(Connection conn,String search) {
      int result = 0;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("countSearchBoard");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, search);
         pstmt.setString(2, search);
         
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
   
   public ArrayList<Member> selectSearchBoard(Connection conn, PageInfo pi, String search){
      ArrayList<Member> list = new ArrayList<Member>();
      
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectSearchBoard");
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setString(1, search);
         pstmt.setString(2, search);
         pstmt.setInt(3, startRow);
         pstmt.setInt(4, endRow);
         System.out.println(startRow);
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Member(rset.getInt("user_no"),
                           rset.getString("user_name"),
                           rset.getInt("caution"),
                           rset.getString("product_name"),
                           rset.getDate("upload_date")
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
   
   public Member selectMember(Connection conn, int uno) {
      Member m = null;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectMember");
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, uno);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            m = new Member(rset.getInt("user_no"),
                     rset.getString("user_id"),
                     rset.getString("user_pwd"),
                     rset.getString("user_name"),
                     rset.getString("nickname"),
                     rset.getString("phone"),
                     rset.getString("email"),
                     rset.getDate("enroll_date"),
                     rset.getDouble("ondo"),
                     rset.getString("user_level"),
                     rset.getString("user_status"),
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

    public int updateSellStatus(Connection conn, int pNo, String sellStatus) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateSellStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellStatus);
			pstmt.setInt(2, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProductSell(Connection conn, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProductSell");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int sellListStatusCo(Connection conn, int userNo, String sellStatus) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sellListStatusCo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, sellStatus);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Product> sellListStatusPo(Connection conn, PageInfo pi, int userNo, String sellStatus) {
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sellListStatusPo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, sellStatus);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setProductName(rset.getString("product_name"));
				p.setStrPrice(rset.getString("price"));
				p.setTradeType(rset.getInt("trade_type"));
				p.setSellStatus(rset.getString("sell_status"));
				p.setTitleImg(rset.getString("titleimg"));
				p.setUploadDate(rset.getString("upload_date"));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int sellListSearchCount(Connection conn, int userNo, String word) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sellListSearchCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, word);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Product> sellListSearch(Connection conn, PageInfo pi, int userNo, String word) {
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sellListSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, word);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setProductName(rset.getString("product_name"));
				p.setStrPrice(rset.getString("price"));
				p.setTradeType(rset.getInt("trade_type"));
				p.setSellStatus(rset.getString("sell_status"));
				p.setTitleImg(rset.getString("titleimg"));
				p.setUploadDate(rset.getString("upload_date"));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println(list);
		return list;
		
	}
	
	public int buyListSelectCo(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("buyListSelectCo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	public ArrayList<Trade> buyListSelectPo(Connection conn, PageInfo pi, int userNo) {
		ArrayList<Trade> list = new ArrayList<Trade>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("buyListSelectPo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Trade t = new Trade();
				t.setTradeNo(rset.getInt("trade_no"));
				t.setProductNo(rset.getInt("product_no"));
				t.setSellerNo(rset.getInt("seller_no"));
				t.setNickname(rset.getString("nickname"));
				t.setProductName(rset.getString("product_name"));
				t.setStrPrice(rset.getString("price"));
				t.setDeliveryStatus(rset.getString("delivery_status"));
				t.setTradeDate(rset.getString("trade_date"));
				t.setTitleImg(rset.getString("titleimg"));
				t.setUploadType(rset.getString("upload_type"));
				
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int buyListSearchCount(Connection conn, int userNo, String word) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("buyListSearchCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, word);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	public ArrayList<Trade> buyListSearchPo(Connection conn, PageInfo pi, int userNo, String word) {
		ArrayList<Trade> list = new ArrayList<Trade>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("buyListSearchPo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, word);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Trade t = new Trade();
				t.setTradeNo(rset.getInt("trade_no"));
				t.setProductNo(rset.getInt("product_no"));
				t.setSellerNo(rset.getInt("seller_no"));
				t.setNickname(rset.getString("nickname"));
				t.setProductName(rset.getString("product_name"));
				t.setStrPrice(rset.getString("price"));
				t.setDeliveryStatus(rset.getString("delivery_status"));
				t.setTradeDate(rset.getString("trade_date"));
				t.setTitleImg(rset.getString("titleimg"));
				t.setUploadType(rset.getString("upload_type"));
				
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertReview(Connection conn, Review r, int uno, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, uno);
			pstmt.setString(3, r.getReviewDetail());
			pstmt.setInt(4, r.getScore());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("리뷰 : " + result);
		return result;
	}
	
	public int insertReviewType(Connection conn, ArrayList<ReviewType> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewType");
		
		try {
			
			for(ReviewType reType : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, reType.getReviewType());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("리뷰타입 : " + result);
		return result;
	}
	
	public int insertReviewImg(Connection conn, Images img) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, img.getOriginName());
			pstmt.setString(2, img.getChangeName());
			pstmt.setString(3, img.getImgPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("리뷰이미지 : " + result);
		return result;
	}   
	
	public int reviewCount(Connection conn, int uno) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<ReviewType> reviewTypeCount(Connection conn, int uno) {
		ArrayList<ReviewType> list = new ArrayList<ReviewType>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reviewTypeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReviewType rt = new ReviewType();
				rt.setReviewType(rset.getString("review_type"));
				rt.setCount(rset.getInt("count"));
				
				list.add(rt);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Review> reviewList(Connection conn, int uno) {
		ArrayList<Review> list = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setUserNo(rset.getInt("user_no"));
				r.setNickName(rset.getString("nickname"));
				r.setScore(rset.getInt("score"));
				r.setProductNo(rset.getInt("product_no"));
				r.setProductName(rset.getString("product_name"));
				r.setTitleImg(rset.getString("titleimg"));
				r.setReviewDetail(rset.getString("review_detail"));
				r.setReviewDate(rset.getString("review_date"));
				
				list.add(r);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Review starAvg(Connection conn, int uno) {
		Review r = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("starAvg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r.setScore(rset.getInt("score"));
				r.setReviewType(rset.getString("avg"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
   
}
package com.cooltrade.member.model.dao;

import static com.cooltrade.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.cooltrade.member.model.vo.DeliveryAddress;
import com.cooltrade.member.model.vo.Member;

public class DeliveryAddressDao {
  private Properties prop = new Properties();

  public DeliveryAddressDao() {
    String filePath = DeliveryAddressDao.class.getResource("/db/sql/delivery-address-mapper.xml").getPath();
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

      pstmt.setString(1, userId);
      pstmt.setString(2, userPwd);

      rset = pstmt.executeQuery();

      if (rset.next()) {
        m = new Member(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_pwd"),
            rset.getString("user_name"), rset.getString("nickname"), rset.getString("phone"), rset.getString("email"),
            rset.getDate("enroll_date"), rset.getDouble("ondo"), rset.getString("user_level"),
            rset.getString("user_status"), rset.getInt("caution"));
      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }
    return m;
  }

  public ArrayList<DeliveryAddress> selectList(Connection conn, Integer userNo) {

    ArrayList<DeliveryAddress> list = new ArrayList<DeliveryAddress>();

    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectList");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, userNo);

      rset = pstmt.executeQuery();

      while (rset.next()) {
        DeliveryAddress deliveryAddress = new DeliveryAddress();
        deliveryAddress.setDeliveryAddressNo(rset.getInt("delivery_address_no"));
        deliveryAddress.setUserNo(rset.getInt("user_no"));
        deliveryAddress.setAddress(rset.getString("address"));
        deliveryAddress.setDetail(rset.getString("detail"));
        deliveryAddress.setPostcode(rset.getString("postcode"));
        deliveryAddress.setTitle(rset.getString("title"));
        deliveryAddress.setName(rset.getString("name"));
        deliveryAddress.setPhone(rset.getString("phone"));
        deliveryAddress.setMainYn(rset.getString("main_yn"));
        list.add(deliveryAddress);
      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }

    return list;
  }

  public int insert(Connection conn, DeliveryAddress deliveryAddress) {
    int result = 0;
    PreparedStatement pstmt = null;

    String sql = prop.getProperty("insert");
    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, deliveryAddress.getUserNo());
      pstmt.setString(2, deliveryAddress.getAddress());
      pstmt.setString(3, deliveryAddress.getDetail());
      pstmt.setString(4, deliveryAddress.getPostcode());
      pstmt.setString(5, deliveryAddress.getTitle());
      pstmt.setString(6, deliveryAddress.getName());
      pstmt.setString(7, deliveryAddress.getPhone());
      pstmt.setString(8, deliveryAddress.getMainYn());

      result = pstmt.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }

    return result;
  }

  public int delete(Connection conn, int deliveryAddressNo, int userNo) {
    int result = 0;
    PreparedStatement pstmt = null;

    String sql = prop.getProperty("delete");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, deliveryAddressNo);
      pstmt.setInt(2, userNo);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;

  }

  public int updateMain(Connection conn, int deliveryAddressNo, int userNo) {
    int result = 0;
    PreparedStatement pstmt = null;

    String sql = prop.getProperty("updateMain");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, deliveryAddressNo);
      pstmt.setInt(2, userNo);

      result = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    return result;

  }

  public DeliveryAddress selectMainOne(Connection conn, int userNo) {

    DeliveryAddress deliveryAddress = null;

    PreparedStatement pstmt = null;
    ResultSet rset = null;

    String sql = prop.getProperty("selectMainOne");

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, userNo);

      rset = pstmt.executeQuery();

      if (rset.next()) {
        deliveryAddress = new DeliveryAddress();
        deliveryAddress.setDeliveryAddressNo(rset.getInt("delivery_address_no"));
        deliveryAddress.setUserNo(rset.getInt("user_no"));
        deliveryAddress.setAddress(rset.getString("address"));
        deliveryAddress.setDetail(rset.getString("detail"));
        deliveryAddress.setPostcode(rset.getString("postcode"));
        deliveryAddress.setTitle(rset.getString("title"));
        deliveryAddress.setName(rset.getString("name"));
        deliveryAddress.setPhone(rset.getString("phone"));
        deliveryAddress.setMainYn(rset.getString("main_yn"));
      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }

    return deliveryAddress;
  }
}

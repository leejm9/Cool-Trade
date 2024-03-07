package com.cooltrade.member.model.service;

import static com.cooltrade.common.JDBCTemplate.close;
import static com.cooltrade.common.JDBCTemplate.commit;
import static com.cooltrade.common.JDBCTemplate.getConnection;
import static com.cooltrade.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.cooltrade.member.model.dao.DeliveryAddressDao;
import com.cooltrade.member.model.vo.DeliveryAddress;

public class DeliveryAddressService {

  public ArrayList<DeliveryAddress> selectList(int userNo) {
    Connection conn = getConnection();

    ArrayList<DeliveryAddress> list = new DeliveryAddressDao().selectList(conn, userNo);
    close(conn);
    return list;
  }

  public int insert(DeliveryAddress m) {
    Connection conn = getConnection();

    DeliveryAddressDao DeliveryAddressDao = new DeliveryAddressDao();
    int result = DeliveryAddressDao.insert(conn, m);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }

    close(conn);
    return result;
  }

  public int delete(int deliveryAddressNo, int userNo) {
    Connection conn = getConnection();

    int result = new DeliveryAddressDao().delete(conn, deliveryAddressNo, userNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }

    return result;
  }

  public int updateMain(int deliveryAddressNo, int userNo) {
    Connection conn = getConnection();

    int result = new DeliveryAddressDao().updateMain(conn, deliveryAddressNo, userNo);

    if (result > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }

    return result;
  }

  public DeliveryAddress selectMainOne(int userNo) {
    Connection conn = getConnection();
    DeliveryAddress selectMainOne = new DeliveryAddressDao().selectMainOne(conn, userNo);
    close(conn);
    return selectMainOne;
  }

}

package com.kh.product.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.model.dao.MemberDao;
import com.kh.product.dao.ProductDao;
import com.kh.product.vo.Product;

public class ProductService {
	public Product countSalesRate() {
		Connection conn = getConnection();
		
		Product p = new ProductDao().countSalesRate(conn);
		
		close(conn);
		return p;
	}
}

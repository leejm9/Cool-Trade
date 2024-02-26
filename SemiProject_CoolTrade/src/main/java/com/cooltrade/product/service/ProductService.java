package com.cooltrade.product.service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;

import com.cooltrade.product.dao.ProductDao;
import com.cooltrade.product.vo.Product;

public class ProductService {
	public Product countSalesRate() {
		Connection conn = getConnection();
		
		Product p = new ProductDao().countSalesRate(conn);
		
		close(conn);
		return p;
	}
}

package com.cooltrade.product.model.vo;

public class ProductStatus {

	private String pstatusNo;
	private String pstatus;
	
	public ProductStatus() {}

	public ProductStatus(String pstatusNo, String pstatus) {
		super();
		this.pstatusNo = pstatusNo;
		this.pstatus = pstatus;
	}

	public String getPstatusNo() {
		return pstatusNo;
	}

	public void setPstatusNo(String pstatusNo) {
		this.pstatusNo = pstatusNo;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	@Override
	public String toString() {
		return "ProductStatus [pstatusNo=" + pstatusNo + ", pstatus=" + pstatus + "]";
	}
	
}

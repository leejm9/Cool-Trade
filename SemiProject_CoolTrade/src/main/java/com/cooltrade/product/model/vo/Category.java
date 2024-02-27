package com.cooltrade.product.model.vo;

public class Category {

	private String categoryNo;
	private String categoryName;
	private int categoryCount;
	
	public Category() {}

	public Category(String categoryNo, String categoryName, int categoryCount) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryCount = categoryCount;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryCount() {
		return categoryCount;
	}

	public void setCategoryCount(int categoryCount) {
		this.categoryCount = categoryCount;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryCount="
				+ categoryCount + "]";
	}

		
}

package com.cooltrade.product.model.vo;

import java.sql.Date;

public class Search {
	private String popwWord;
	private Date popwDate;
	private int count;
	
	
	public Search() {}

	public Search(int count) {
		super();
		this.count = count;
	}

	public Search(String popwWord, Date popwDate) {
		super();
		this.popwWord = popwWord;
		this.popwDate = popwDate;
	}
	
	public Search(String popwWord, int count) {
		super();
		this.popwWord = popwWord;
		this.count = count;
	}

	public String getPopwWord() {
		return popwWord;
	}

	public void setPopwWord(String popwWord) {
		this.popwWord = popwWord;
	}

	public Date getPopwDate() {
		return popwDate;
	}

	public void setPopwDate(Date popwDate) {
		this.popwDate = popwDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	

	@Override
	public String toString() {
		return "Search [popwWord=" + popwWord + ", popwDate=" + popwDate + "]";
	}
	
	
}

package com.hanzhou.www;

public class BasePage {
	
	// 当前页码
	public Integer page = 1;

	// 每页显示数量
	public Integer rows = 10;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

}

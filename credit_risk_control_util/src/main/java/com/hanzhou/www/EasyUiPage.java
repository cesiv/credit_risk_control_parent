package com.hanzhou.www;

import java.util.List;

public class EasyUiPage {
	// 总记录数
	private Integer total;

	// 数据
	private List<?> rows;

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

	public EasyUiPage(Integer total, List<?> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	
}

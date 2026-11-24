package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

public class PagerDataVo<T> {
	// 分页的数据(当前页面的数据)
	private T[] rows;
	// 数据总数
	 @JsonAlias("TOTAL")
     private int total;

	public T[] getRows() {
		return rows;
	}

	public void setRows(T[] rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}

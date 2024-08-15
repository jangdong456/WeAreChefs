package com.chef.app.recipe;

public class ListOption {
	private String account_number;
	private Integer order; // 0이면 desc 1 asc
	private Integer io;

	public Integer getIo() {
		return io;
	}

	public void setIo(Integer io) {
		this.io = io;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

}

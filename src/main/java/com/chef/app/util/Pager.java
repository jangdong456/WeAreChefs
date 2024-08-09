package com.chef.app.util;

public class Pager {
	private String kind;
	private String search;
	private String order;
	private Long startRow;
	private Long lastRow;
	private Long page;

	private Long startNum;
	private Long lastNum;
	private boolean pre;
	private boolean next;


//	row 갯수를 계산하는 메서드

	public void makeRow(Long perPage) throws Exception {
		this.startRow = 1 + (perPage * (this.getPage() - 1));
		this.lastRow = page * perPage;
	}

//	페이징 처리 메서드
	public void makeNum(Long totalCount,Long perPage, Long perBlock) throws Exception {
//		보여줄 db의 시작행, 마지막행 구하기

//		1. 총 갯수(PK컬럼의 갯수) 총 페이지수 구하기, 내가 한 페이지에 몇개를 보여줄건지->그럼 몇 페이지가 나오는지

		long totalPage = totalCount / perPage;

		if (totalCount % perPage != 0) {
			totalPage = totalCount / perPage + 1;
		} else {
			totalPage = totalCount / perPage;
		}

//		2. 블럭의 수 구하기, 5개짜리 페이지가 몇 묶음이냐, 몇 블럭이냐
//		한번에 보여질 페이지의 갯수

//		총 블럭의 수(5개짜리 페이지가 몇 묶음이냐, 몇 블럭이냐)
		long totalBlock = 0;

		if (totalPage % perBlock != 0) {
			totalBlock = totalPage / perBlock + 1;
		} else {
			totalBlock = totalPage / perBlock;
		}

//		3. 현재페이지번호로 현재블럭 번호 구하기

		long curBlock = 0;

		if (page % perBlock != 0) {
			curBlock = page / perBlock + 1;
		} else {
			curBlock = page / perBlock;
		}

//		4. 현재 블럭 번호로 시작번호와 끝번호를 구하기

//		curBlock
		this.startNum = 1 + (perBlock * (curBlock - 1));
		this.lastNum = curBlock * perBlock;

//		5. 이전블럭, 다음블럭 유무 판단
		this.pre = true; // true면 이전블럭 존재, false면 이전블럭 존재x
		this.next = true; // true면 다음블럭 존재, false면 다음블럭 존재x
		if (curBlock == 1) {
			pre = false;
		}

		if (curBlock == totalBlock) {
			next = false;
			lastNum = totalPage;
		}

	}
	

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Long getPage() {
		if (this.page == null || this.page < 1) {
			this.page = 1L;
		}
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {

		if (this.search == null) {
			this.search = "";
		}

		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getLastRow() {
		return lastRow;
	}

	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}


}

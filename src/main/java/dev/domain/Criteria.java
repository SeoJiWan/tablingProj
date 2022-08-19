package dev.domain;

public class Criteria {
	//-------------Criteria
	
	private int pageNum;
	private int postNum;
	
	
	//--------생성자
	public Criteria(int pageNum, int postNum) {
		this.pageNum = pageNum;
		this.postNum = postNum;
	}
	
	//기본세팅값: 1page, 10ea
	public Criteria() {
		this(1, 5);
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	@Override
	public String toString() {
		return "페이지번호:" + pageNum + " || 글 수:" + postNum;
	}
}

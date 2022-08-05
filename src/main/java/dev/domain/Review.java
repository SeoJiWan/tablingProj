package dev.domain;

public class Review {
	private int reviewId;
	private String memberId;
	private String storeName;
	private String content;
	private String createDate;
	private int tasteScore;
	//
	private int avgScore;
	
	public int getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(int avgScore) {
		this.avgScore = avgScore;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getStoreName() {
		return storeName;
	}
	
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	public int getTasteScore() {
		return tasteScore;
	}
	
	public void setTasteScore(int tasteScore) {
		this.tasteScore = tasteScore;
	}


	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", memberId=" + memberId + ", storeName=" + storeName + ", content="
				+ content + ", createDate=" + createDate + ", tasteScore=" + tasteScore + "]";
	}
	
}

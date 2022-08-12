package dev.domain;

public class Board {
	//-------------Board
	private int boardId;
	private String memberId;
	private String title;
	private String content;
	private String createDate;
	private int hits;
	// -- 조인문 활용
	private String nickName;
	private String profile;
   


//--------생성자
   public Board(){};
   
   
   public Board(int boardId, String memberId, String nickName, String title, String content, String createDate, int hits) {
      super();
      this.boardId = boardId;
      this.memberId = memberId;
      this.nickName = nickName;
      this.title = title;
      this.content = content;
      this.createDate = createDate;
      this.hits = hits;
   }
   
   //--------getter setter
   public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
   public String getNickName() {
      return nickName;
   }

   public void setNickName(String nickName) {
      this.nickName = nickName;
   }
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", memberId=" + memberId + ", title=" + title + ", content=" + content
				+ ", createDate=" + createDate + ", hits=" + hits + ", nickName=" + nickName + "]";
	}
	
	
	
}

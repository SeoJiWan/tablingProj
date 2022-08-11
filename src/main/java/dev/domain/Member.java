package dev.domain;

public class Member {

	/*
	 * Field
	 */
	private String memberId;
	private String password;
	private String phoneNum;
	private String nickName;
	private int role; // 0: 시스템 관리자, 1: 점주, 2: 일반사용자 
	private String profileImgUrl;
	

	/*
	 * Method
	 */
	
	public String getMemberId() {
		return memberId;
	}
	public String getProfileImgUrl() {
		return profileImgUrl;
	}
	public void setProfileImgUrl(String profileImgUrl) {
		this.profileImgUrl = profileImgUrl;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", phoneNum=" + phoneNum + ", nickName="
				+ nickName + ", role=" + role + "]";
	}
}

package dev.domain;

import java.util.List;

public class Store {
	/*
	 * Field
	 */
	private int storeId;
	private String storeName;
	private String memberId;
	private String storeAddress;
	private String telephone;
	private int sitCapacity;
	private String availableTime;
	private int holiday;
	private double score;
	
	//별점
	
	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	//   private String representMenu;
	// 수정
	private List<String> representMenu;
	//
	private List<String> storeImgUrl;
	private String foodCategory;
	private int approvalStatus;
	// 카운트
	private int countingStores;
	
	public int getCountingStores() {
		return countingStores;
	}

	public void setCountingStores(int countingStores) {
		this.countingStores = countingStores;
	}

	/*
	 * Method
	 */
	// 수정
	public void setRepresentMenu(List<String> representMenu) {
		this.representMenu = representMenu;
	}

	public List<String> getRepresentMenu() {
		return representMenu;
	}
	//

	public List<String> getStoreImgUrl() {
		return storeImgUrl;
	}

	public void setStoreImgUrl(List<String> storeImgUrl) {
		this.storeImgUrl = storeImgUrl;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public int getSitCapacity() {
		return sitCapacity;
	}

	public void setSitCapacity(int sitCapacity) {
		this.sitCapacity = sitCapacity;
	}

	public String getAvailableTime() {
		return availableTime;
	}

	public void setAvailableTime(String availableTime) {
		this.availableTime = availableTime;
	}

	public int getHoliday() {
		return holiday;
	}

	public void setHoliday(int holiday) {
		this.holiday = holiday;
	}

//   public String getRepresentMenu() {
//      return representMenu;
//   }
//
//   public void setRepresentMenu(String representMenu) {
//      this.representMenu = representMenu;
//   }

	public String getFoodCategory() {
		return foodCategory;
	}

	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}

	public int getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(int approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storeName=" + storeName + ", memberId=" + memberId + ", storeAddress="
				+ storeAddress + ", telephone=" + telephone + ", sitCapacity=" + sitCapacity + ", availableTime="
				+ availableTime + ", holiday=" + holiday + ", representMenu=" + representMenu + ", storeImgUrl="
				+ storeImgUrl + ", foodCategory=" + foodCategory + ", approvalStatus=" + approvalStatus + "]";
	}

	

}

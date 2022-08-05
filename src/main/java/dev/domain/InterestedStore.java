package dev.domain;

public class InterestedStore {
	/*
	 * Field
	 */
	private String membeId;
	private String storeName;
	private int storeId;
	private String storeImgUrl;

	
	/*
	 * Method
	 */
	public String getMembeId() {
		return membeId;
	}
	public void setMembeId(String membeId) {
		this.membeId = membeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public String getStoreImgUrl() {
		return storeImgUrl;
	}
	public void setStoreImgUrl(String storeImgUrl) {
		this.storeImgUrl = storeImgUrl;
	}
	@Override
	public String toString() {
		return "InterestedStore [membeId=" + membeId + ", storeName=" + storeName + ", storeId=" + storeId
				+ ", storeImgUrl=" + storeImgUrl + "]";
	}
	
	
	
	

}

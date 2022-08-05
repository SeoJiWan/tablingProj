package dev.domain;

public class Reservations {
	/*
	 * Field
	 */
	private int reservationId;
	private String memberId;
	private String storeName;
	private int peopleNum;
	private String reservationTime;
	private String deposit;


	/*
	 * Method
	 */
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
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
	public int getPeopleNum() {
		return peopleNum;
	}
	public void setPeopleNum(int peopleNum) {
		this.peopleNum = peopleNum;
	}
	public String getReservationTime() {
		return reservationTime;
	}
	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	@Override
	public String toString() {
		return "Reservation [reservationId=" + reservationId + ", memberId=" + memberId + ", storeName=" + storeName
				+ ", peopleNum=" + peopleNum + ", reservationTime=" + reservationTime + ", deposit=" + deposit + "]";
	}
	

	

}

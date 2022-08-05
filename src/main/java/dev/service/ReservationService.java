package dev.service;

import java.util.List;

import dev.domain.Reservations;
import dev.repository.ReservationRepository;

public class ReservationService {

	/*
	 * Field
	 */
	// 싱글톤
	private static ReservationService reservationService = new ReservationService();
	ReservationRepository reservationRepository = new ReservationRepository();

	/*
	 * Constructor
	 */
	private ReservationService() {}

	/*
	 * Method
	 */
	public static ReservationService getReservationService() {
		return reservationService;
	}
	
	// 예약하기
	public void makeReservation(Reservations reservation) {
		reservationRepository.insert(reservation);
	}
	
	// 예약삭제
	public void deleteReservation(int reservationId) {
		reservationRepository.delete(reservationId);
	}
	
	// 예약 단건 조회
	public Reservations findOneReservation(int reservationId) {
		return reservationRepository.selectOne(reservationId);
	}
	
	// 회원이 예약한 내역 조회
	public List<Reservations> findReservationsByMemberId(String memberId) {
		return reservationRepository.selectByMemberId(memberId);
	}
	
	// 점포에 예약된 내역 조회 - 점주가 사용
	public List<Reservations> findReservationsByStoreName(String storeName) {
		return reservationRepository.selectByStoreName(storeName);
	}
}

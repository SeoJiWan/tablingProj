package dev.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dev.domain.Reservations;

public class ReservationRepository extends DAO {

	/*
	 * Method
	 */
	// 삽입
	public void insert(Reservations reservation) {
		String sql = "insert into reservations values (reservation_id_seq.nextval, ?, ?, ?, ?)";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, reservation.getMemberId());
			ps.setString(2, reservation.getStoreName());
			ps.setInt(3, reservation.getPeopleNum());
			ps.setString(4, reservation.getReservationTime());

			int result = ps.executeUpdate();

			if (result > 0) {
				System.out.println(result + " 건 입력.");
			} else {
				System.out.println("입력 실패.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 삭제
	public void delete(int reservationId) {
		String sql = "delete from reservations where reservation_id = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reservationId);

			int result = ps.executeUpdate();

			if (result > 0) {
				System.out.println(result + " 건 삭제.");
			} else {
				System.out.println("삭제 실패.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 단건조회
	public Reservations selectOne(int reservationId) {
		Reservations reservation = null;
		String sql = "select * from reservations where reservation_id = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reservationId);

			rs = ps.executeQuery();

			if (rs.next()) {
				reservation = new Reservations();
				reservation.setReservationId(rs.getInt(1));
				reservation.setMemberId(rs.getString(2));
				reservation.setStoreName(rs.getString(3));
				reservation.setPeopleNum(rs.getInt(4));
				reservation.setReservationTime(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return reservation;
	}

	// 회원 아이디로 조회
	public List<Reservations> selectByMemberId(String memberId) {
		List<Reservations> list = new ArrayList<Reservations>();
		String sql = "select * from reservations where member_id = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberId);

			rs = ps.executeQuery();

			while (rs.next()) {
				Reservations reservation = new Reservations();
				reservation = new Reservations();
				reservation.setReservationId(rs.getInt(1));
				reservation.setMemberId(rs.getString(2));
				reservation.setStoreName(rs.getString(3));
				reservation.setPeopleNum(rs.getInt(4));
				reservation.setReservationTime(rs.getString(5));
				
				list.add(reservation);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	// 점포 이름으로 조회
	public List<Reservations> selectByStoreName(String storeName) {
		List<Reservations> list = new ArrayList<Reservations>();
		String sql = "select * from reservations where store_name = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, storeName);

			rs = ps.executeQuery();

			while (rs.next()) {
				Reservations reservation = new Reservations();
				reservation = new Reservations();
				reservation.setReservationId(rs.getInt(1));
				reservation.setMemberId(rs.getString(2));
				reservation.setStoreName(rs.getString(3));
				reservation.setPeopleNum(rs.getInt(4));
				reservation.setReservationTime(rs.getString(5));
				reservation.setDeposit(rs.getString(6));
				
				list.add(reservation);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
}

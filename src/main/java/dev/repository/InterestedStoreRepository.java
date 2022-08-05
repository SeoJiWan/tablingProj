package dev.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dev.domain.InterestedStore;

public class InterestedStoreRepository extends DAO {

	/*
	 * Method
	 */
	// 삽입
	public void insert(InterestedStore interestedStore) {
		String sql = "insert into interested_stores values(?, ?)";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, interestedStore.getMembeId());
			ps.setString(2, interestedStore.getStoreName());

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
	public void delete(InterestedStore interestedStore) {
		String sql = "delete from interested_stores where member_id = ? and store_name = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, interestedStore.getMembeId());
			ps.setString(2, interestedStore.getStoreName());

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

	// 멤버아이디로 전체조회
	public List<InterestedStore> selectAllByMemberId(String memberId) {
		List<InterestedStore> list = new ArrayList<InterestedStore>();
		String sql = "select i.member_id, i.store_name, s.store_id, s.store_img_url "
					+ "from interested_stores i "
					+ "join stores s on (i.store_name = s.store_name) "
					+ "where i.member_id = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberId);

			rs = ps.executeQuery();
			
			while (rs.next()) {
				InterestedStore interestedStore = new InterestedStore();
				interestedStore.setMembeId(rs.getString(1));
				interestedStore.setStoreName(rs.getString(2));
				interestedStore.setStoreId(rs.getInt(3));
				interestedStore.setStoreImgUrl(rs.getString(4));
				
				list.add(interestedStore);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

}

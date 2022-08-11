package dev.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dev.domain.Criteria;
import dev.domain.Reservations;
import dev.domain.Store;

public class StoreRepository extends DAO {

	/*
	 * Method
	 */
	// 단건조회
	public Store selectOne(int storeId) {
		Store store = null;
		String sql = "select * from stores where store_id = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, storeId);

			rs = ps.executeQuery();

			if (rs.next()) {
				store = new Store();
				store.setStoreId(rs.getInt(1));
				store.setStoreName(rs.getString(2));
				store.setMemberId(rs.getString(3));
				store.setStoreAddress(rs.getString(4));
				store.setTelephone(rs.getString(5));
				store.setSitCapacity(rs.getInt(6));
				store.setAvailableTime(rs.getString(7));
				store.setHoliday(rs.getInt(8));
//            store.setRepresentMenu(rs.getString(9));
				// 수정
				List<String> menuList = new ArrayList<String>();
				menuList.add(rs.getString(9));
				store.setRepresentMenu(menuList);
				//
				List<String> urlList = new ArrayList<String>();
				urlList.add(rs.getString(10));
				store.setStoreImgUrl(urlList);
				store.setFoodCategory(rs.getString(11));
				store.setApprovalStatus(rs.getInt(12));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return store;
	}

	public Store selectOne(String storeName) {
		Store store = null;
		String sql = "select * from stores where store_name = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, storeName);

			rs = ps.executeQuery();

			if (rs.next()) {
				store = new Store();
				store.setStoreId(rs.getInt(1));
				store.setStoreName(rs.getString(2));
				store.setMemberId(rs.getString(3));
				store.setStoreAddress(rs.getString(4));
				store.setTelephone(rs.getString(5));
				store.setSitCapacity(rs.getInt(6));
				store.setAvailableTime(rs.getString(7));
				store.setHoliday(rs.getInt(8));
//	            store.setRepresentMenu(rs.getString(9));
				// 수정
				List<String> menuList = new ArrayList<String>();
				menuList.add(rs.getString(9));
				store.setRepresentMenu(menuList);
				//
				List<String> urlList = new ArrayList<String>();
				urlList.add(rs.getString(10));
				store.setStoreImgUrl(urlList);
				store.setFoodCategory(rs.getString(11));
				store.setApprovalStatus(rs.getInt(12));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return store;
	}

	// 전체조회
	public List<Store> selectAll() {
		List<Store> list = new ArrayList<Store>();
		String sql = "select * from stores";
		connect();

		try {
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				Store store = new Store();
				store.setStoreId(rs.getInt(1));
				store.setStoreName(rs.getString(2));
				store.setMemberId(rs.getString(3));
				store.setStoreAddress(rs.getString(4));
				store.setTelephone(rs.getString(5));
				store.setSitCapacity(rs.getInt(6));
				store.setAvailableTime(rs.getString(7));
				store.setHoliday(rs.getInt(8));
//            store.setRepresentMenu(rs.getString(9));
				// 수정
				List<String> menuList = new ArrayList<String>();
				menuList.add(rs.getString(9));
				store.setRepresentMenu(menuList);

				List<String> urlList = new ArrayList<String>();
				urlList.add(rs.getString(10));
				store.setStoreImgUrl(urlList);
				store.setFoodCategory(rs.getString(11));
				store.setApprovalStatus(rs.getInt(12));

				list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	/* 검색 */
	// 키워드 조회
	public List<Store> searchKeyword(String keyword) {
		String sql = "SELECT * FROM stores" + " WHERE store_name like '%" + keyword + "%'" + " OR store_address like '%"
				+ keyword + "%'" + " OR represent_menu like '%" + keyword + "%'" + " OR food_category like '%" + keyword
				+ "%'";
		// ORDER BY 별점순 구현
		List<Store> list = new ArrayList<>();
		connect();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Store store = new Store();
				store.setStoreId(rs.getInt("store_id"));
				store.setStoreName(rs.getString("store_name"));
				store.setMemberId(rs.getString("member_id"));
				store.setStoreAddress(rs.getString("store_address"));
				store.setTelephone(rs.getString("telephone"));
				store.setSitCapacity(rs.getInt("sit_capacity"));
				store.setAvailableTime(rs.getString("available_time"));
				store.setHoliday(rs.getInt("holiday"));
				// store.setRepresentMenu(rs.getString("represent_menu"));
				store.setFoodCategory(rs.getString("food_category"));
				List<String> urlList = new ArrayList<String>();
				urlList.add(rs.getString("store_img_url"));
				store.setStoreImgUrl(urlList);
				store.setApprovalStatus(rs.getInt("approval_status"));
				list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	// 필터 조회
	public List<Store> searchFilter(String keyword, String[] area, String[] food) {
		String sql = "SELECT * FROM" + "(SELECT * FROM stores WHERE store_name like '%" + keyword + "%'"
				+ " OR store_address like '%" + keyword + "%'" + " OR represent_menu like '%" + keyword + "%'"
				+ " OR food_category like '%" + keyword + "%')";
		sql += "WHERE approval_status = 1 ";
		if (area.length > 1) {
			sql += "AND( store_address LIKE '%" + area[1] + "%'";
			for (int i = 2; i < area.length; i++) {
				sql += " OR food_category LIKE '%" + area[i] + "%'";
			}
			sql += ")";
		}
		if (food.length > 1) {
			sql += "AND( food_category LIKE '%" + food[1] + "%'";
			for (int i = 2; i < food.length; i++) {
				sql += " OR food_category LIKE '%" + food[i] + "%'";
			}
			sql += ")";
		}
//		if (area.length > 1 || food.length > 1) {
//			sql += "WHERE store_address ='" + area[0] + "' OR food_category='" + food[0] + "'";
//			for (int i = 1; i < area.length; i++) {
//				sql += " OR store_address LIKE '%" + area[i] + "%'";
//			}
//			for (int i = 1; i < food.length; i++) {
//				sql += " OR food_category='" + food[i] + "'";
//			}
//		}

		List<Store> list = new ArrayList<>();
		connect();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Store store = new Store();
				store.setStoreId(rs.getInt("store_id"));
				store.setStoreName(rs.getString("store_name"));
				store.setMemberId(rs.getString("member_id"));
				store.setStoreAddress(rs.getString("store_address"));
				store.setTelephone(rs.getString("telephone"));
				store.setSitCapacity(rs.getInt("sit_capacity"));
				store.setAvailableTime(rs.getString("available_time"));
				store.setHoliday(rs.getInt("holiday"));
				// store.setRepresentMenu(rs.getString("represent_menu"));
				store.setFoodCategory(rs.getString("food_category"));
				List<String> urlList = new ArrayList<String>();
				urlList.add(rs.getString("store_img_url"));
				store.setStoreImgUrl(urlList);
				store.setApprovalStatus(rs.getInt("approval_status"));
				list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		// System.out.println("페이징x:"+sql);
		return list;
	}

	// 키워드 조회-페이징
	public List<Store> searchPagingkeyword(Criteria cri, String keyword) {
		String sql = "SELECT " + "    * " + "FROM " + "    ( " + "        SELECT " + "            ROWNUM rn, "
				+ "            a.store_id, " + "            a.store_name, " + "            a.member_id, "
				+ "            a.store_address, " + "            a.telephone, " + "            a.sit_capacity, "
				+ "            a.available_time, " + "            a.holiday, " + "            a.represent_menu, "
				+ "            a.store_img_url, " + "            a.food_category, " + "            a.approval_status, "
				+ "            round(nvl(b.score, 0),2) s " + "        FROM " + "            ( " + "                SELECT "
				+ "                    * " + "                FROM " + "                    ( "
				+ "                        SELECT " + "                            * " + "                        FROM "
				+ "                            stores " + "                        WHERE "
				+ "                            store_name LIKE '%'||?||'%' "
				+ "                            OR store_address LIKE '%'||?||'%' "
				+ "                            OR represent_menu LIKE '%'||?||'%' "
				+ "                            OR food_category LIKE '%'||?||'%' " + "                    ) "
				+ "            ) a, " + "            ( " + "                SELECT "
				+ "                    store_name, " + "                    SUM(taste_score) / COUNT(*) score "
				+ "                FROM " + "                    reviews " + "                GROUP BY "
				+ "                    store_name " + "            ) b " + "        WHERE "
				+ "                a.store_name = b.store_name(+) " + "            AND ROWNUM <= ? " + "    ) "
				+ "WHERE " + "    rn > ? ORDER BY s desc";
//		String sql = "select * from(select rownum rn, store_id, store_name, member_id, store_address, telephone, sit_capacity, available_time, holiday, represent_menu, store_img_url, food_category, approval_status"
//				+ " from (SELECT *" + " from stores" + " where store_name like '%'||?||'%' "
//				+ " or store_address like '%'||?||'%' " + " or represent_menu like '%'||?||'%' "
//				+ " or food_category like '%'||?||'%' )" + " where rownum <= ?)" + " where rn > ?";
		// ORDER BY 별점순 구현
		List<Store> list = new ArrayList<>();
		connect();
		int cnt = 1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(cnt++, keyword);
			ps.setString(cnt++, keyword);
			ps.setString(cnt++, keyword);
			ps.setString(cnt++, keyword);
			ps.setInt(cnt++, cri.getPostNum() * cri.getPageNum());
			ps.setInt(cnt++, cri.getPostNum() * (cri.getPageNum() - 1));
			rs = ps.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				store.setStoreId(rs.getInt("store_id"));
				store.setStoreName(rs.getString("store_name"));
				store.setMemberId(rs.getString("member_id"));
				store.setStoreAddress(rs.getString("store_address"));
				store.setTelephone(rs.getString("telephone"));
				store.setSitCapacity(rs.getInt("sit_capacity"));
				store.setAvailableTime(rs.getString("available_time"));
				store.setHoliday(rs.getInt("holiday"));
				// store.setRepresentMenu(rs.getString("represent_menu"));
				store.setFoodCategory(rs.getString("food_category"));
				List<String> urlList = new ArrayList<String>();
				urlList.add(rs.getString("store_img_url"));
				store.setStoreImgUrl(urlList);
				store.setApprovalStatus(rs.getInt("approval_status"));
				store.setScore(rs.getDouble("s"));
				list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		//System.out.println(sql);
		return list;
	}

	// 필터 조회-페이징
	public List<Store> searchPagingkeywordFilter(Criteria cri, String keyword, String[] area, String[] food) {
//		String sql = "select * from(select rownum rn, store_id, store_name, member_id, store_address, telephone, sit_capacity, available_time, holiday, represent_menu, store_img_url, food_category, approval_status"
//				+ " from (" + "SELECT * FROM" + "(SELECT * FROM stores WHERE store_name like '%" + keyword + "%'"
//				+ " OR store_address like '%" + keyword + "%'" + " OR represent_menu like '%" + keyword + "%'"
//				+ " OR food_category like '%" + keyword + "%')"
//				+ "WHERE store_address ='" + area[0] + "' OR food_category='" + food[0] + "'";
//		if (area.length > 1 || food.length > 1) {
//			for (int i = 1; i < area.length; i++) {
//				sql += " OR store_address LIKE '%" + area[i] + "%'";
//			}
//			for (int i = 1; i < food.length; i++) {
//				sql += " OR food_category='" + food[i] + "'";
//			}
//		}
//		sql += ") where rownum <= " + cri.getPostNum() * cri.getPageNum() + ")" + " where rn > "
//				+ cri.getPostNum() * (cri.getPageNum() - 1);
//		
//		System.out.println(sql);
		String sql = "SELECT " + "* " + "FROM " + "(" + "SELECT " + "ROWNUM rn, " + "a.store_id, " + "a.store_name, "
				+ "a.member_id, " + "a.store_address, " + "a.telephone, " + "a.sit_capacity, " + "a.available_time, "
				+ "a.holiday, " + "a.represent_menu, " + "a.store_img_url, " + "a.food_category, "
				+ "a.approval_status, " + "round(nvl(b.score, 0),2) s " + "FROM " + "( " + "SELECT " + "* " + "FROM " + "( "
				+ "SELECT " + "* " + "FROM " + "stores " + "WHERE " + "store_name LIKE '%" + keyword + "%' "
				+ "OR store_address LIKE '%" + keyword + "%' " + "OR represent_menu LIKE '%" + keyword + "%' "
				+ "OR food_category LIKE '%" + keyword + "%' ) ";
		sql += "WHERE approval_status = 1 ";
		if (area.length > 1) {
			sql += "AND( store_address LIKE '%" + area[1] + "%'";
			for (int i = 2; i < area.length; i++) {
				sql += " OR food_category LIKE '%" + area[i] + "%'";
			}
			sql += ")";
		}
		if (food.length > 1) {
			sql += "AND( food_category LIKE '%" + food[1] + "%'";
			for (int i = 2; i < food.length; i++) {
				sql += " OR food_category LIKE '%" + food[i] + "%'";
			}
			sql += ")";
		}
//			if (area.length > 1 || food.length > 1) {
//                	sql += "WHERE store_address ='"+area[0]+"' OR food_category='"+food[0]+"'";
//      			for (int i = 1; i < area.length; i++) {
//       				sql += " OR store_address LIKE '%" + area[i] + "%'";
//      			}
//       			for (int i = 1; i < food.length; i++) {
//       				sql += " OR food_category='" + food[i] + "')";
//        			}
//       		}
		sql += ") a, (select store_name, sum(taste_score)/count(*) score from reviews group by store_name) b "
				+ "WHERE " + "a.store_name = b.store_name(+) " + "and ROWNUM <= " + cri.getPostNum() * cri.getPageNum()
				+ ") WHERE " + "rn >" + cri.getPostNum() * (cri.getPageNum() - 1) + " ORDER BY s desc";
		//System.out.println("페이징:" + sql);
		List<Store> list = new ArrayList<>();
		connect();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Store store = new Store();
				store.setStoreId(rs.getInt("store_id"));
				store.setStoreName(rs.getString("store_name"));
				store.setMemberId(rs.getString("member_id"));
				store.setStoreAddress(rs.getString("store_address"));
				store.setTelephone(rs.getString("telephone"));
				store.setSitCapacity(rs.getInt("sit_capacity"));
				store.setAvailableTime(rs.getString("available_time"));
				store.setHoliday(rs.getInt("holiday"));
				// store.setRepresentMenu(rs.getString("represent_menu"));
				store.setFoodCategory(rs.getString("food_category"));
				List<String> urlList = new ArrayList<String>();
				urlList.add(rs.getString("store_img_url"));
				store.setStoreImgUrl(urlList);
				store.setApprovalStatus(rs.getInt("approval_status"));
				store.setScore(rs.getDouble("s"));
				list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		// System.out.println(sql);
		return list;
	}

	// 랜덤 리스트 조회
	public Store getStore() {
//		String sql = "SELECT * "
//				+ "FROM (SELECT ROWNUM AS rownumber, store_id, store_name, member_id, store_address, telephone, sit_capacity, available_time, holiday, represent_menu, store_img_url, food_category, approval_status "
//				+ "FROM stores) s " + "WHERE s.rownumber = ?";
		String sql ="SELECT "
				+ "    * "
				+ "FROM "
				+ "    ( "
				+ "        SELECT "
				+ "            ROWNUM rn, "
				+ "            a.store_id, "
				+ "            a.store_name, "
				+ "            a.member_id, "
				+ "            a.store_address, "
				+ "            a.telephone, "
				+ "            a.sit_capacity, "
				+ "            a.available_time, "
				+ "            a.holiday, "
				+ "            a.represent_menu, "
				+ "            a.store_img_url, "
				+ "            a.food_category, "
				+ "            a.approval_status, "
				+ "            round(nvl(b.score, 0), 2) s "
				+ "            FROM stores a "
				+ "            , "
				+ "            ( "
				+ "                SELECT "
				+ "                    store_name, "
				+ "                    SUM(taste_score) / COUNT(*) score "
				+ "                FROM "
				+ "                    reviews "
				+ "                GROUP BY "
				+ "                    store_name "
				+ "            ) b "
				+ "        WHERE\n"
				+ "                a.store_name = b.store_name (+) "
				+ "             "
				+ "    ) "
				+ "WHERE "
				+ "    rn = ?";
		Store store = new Store();
//		connect();
		int randomStoreId = (int) (Math.random() * countStores()) + 1;
		// Store store = new Store();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, randomStoreId);
			rs = ps.executeQuery();
			while (rs.next()) {
				store.setStoreId(rs.getInt("store_id"));
				store.setStoreName(rs.getString("store_name"));
				store.setMemberId(rs.getString("member_id"));
				store.setStoreAddress(rs.getString("store_address"));
				store.setTelephone(rs.getString("telephone"));
				store.setSitCapacity(rs.getInt("sit_capacity"));
				store.setAvailableTime(rs.getString("available_time"));
				store.setHoliday(rs.getInt("holiday"));
				// store.setRepresentMenu(rs.getString("represent_menu"));
				store.setFoodCategory(rs.getString("food_category"));
				List<String> urlList = new ArrayList<String>();
				urlList.add(rs.getString("store_img_url"));
				store.setStoreImgUrl(urlList);
				store.setApprovalStatus(rs.getInt("approval_status"));
				store.setScore(rs.getDouble("s"));
				// list.add(store);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return store;
	}

	// 전체 가게 수 조회
	public int countStores() {
		String sql = "SELECT NVL(MAX(ROWNUM),0) FROM stores";
		connect();
		Store store = new Store();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				store.setCountingStores(rs.getInt("NVL(MAX(ROWNUM),0)"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}
		return store.getCountingStores();
	}

	public List<Store> getList() {
		List<Store> list = new ArrayList<>();
		String sql = "select store_name, store_address, telephone, AVAILABLE_TIME, food_category from stores where APPROVAL_STATUS = 0";

		try {
			connect();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Store st = new Store();

				st.setStoreName(rs.getString("store_name"));
				st.setStoreAddress(rs.getString("store_address"));
				st.setTelephone(rs.getString("telephone"));
				st.setAvailableTime(rs.getString("AVAILABLE_TIME"));
				st.setFoodCategory(rs.getString("food_category"));

				list.add(st);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	public boolean deleteStore(String store_name) {
		String sql = "delete stores where store_name = ?";

		try {
			connect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, store_name);

			int result = ps.executeUpdate();
			System.out.println(result + " 건이 거절되었습니다.");
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}

	public boolean updateStore(String store_name) {
		String sql = "UPDATE stores SET approval_status = 1 where store_name= ?";

		try {
			connect();
			ps = conn.prepareStatement(sql);

			ps.setString(1, store_name);

			int result = ps.executeUpdate();
			System.out.println(result + " 건 등록되었습니다");

			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return false;
	}

	public List<Store> getacceptList() {
		List<Store> list = new ArrayList<>();
		String sql = "select store_name, store_address, telephone, AVAILABLE_TIME, food_category from stores where APPROVAL_STATUS = 1";

		try {
			connect();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Store st = new Store();

				st.setStoreName(rs.getString("store_name"));
				st.setStoreAddress(rs.getString("store_address"));
				st.setTelephone(rs.getString("telephone"));
				st.setAvailableTime(rs.getString("AVAILABLE_TIME"));
				st.setFoodCategory(rs.getString("food_category"));

				list.add(st);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	public List<Store> getacceptListPaging(Criteria cri) {
		List<Store> listPage = new ArrayList<>();
		String sql = "select store_name, store_address, telephone, available_time, food_category "
				+ "from(select rownum rn, store_name, store_address, telephone, available_time, food_category "
				+ "from(select store_name, store_address, telephone, available_time, food_category from stores where approval_status=1 order by rownum) "
				+ "where rownum <= ?) " + "where rn > ?";

		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cri.getPostNum() * cri.getPageNum()); // 10 * 1;
			ps.setInt(2, cri.getPostNum() * (cri.getPageNum() - 1)); // 0

			rs = ps.executeQuery();
			while (rs.next()) {
				Store st = new Store();
				st.setStoreName(rs.getString("store_name"));
				st.setStoreAddress(rs.getString("store_address"));
				st.setTelephone(rs.getString("telephone"));
				st.setAvailableTime(rs.getString("available_time"));
				st.setFoodCategory(rs.getString("food_category"));

				listPage.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return listPage;
	}

	public List<Store> getListPaging(Criteria cri) {
		List<Store> listPage = new ArrayList<>();
		String sql = "select store_name, store_address, telephone, available_time, food_category "
				+ "from(select rownum rn, store_name, store_address, telephone, available_time, food_category "
				+ "from(select store_name, store_address, telephone, available_time, food_category from stores where approval_status=0 order by rownum) "
				+ "where rownum <= ?) " + "where rn > ?";

		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cri.getPostNum() * cri.getPageNum()); // 10 * 1;
			ps.setInt(2, cri.getPostNum() * (cri.getPageNum() - 1)); // 0

			rs = ps.executeQuery();
			while (rs.next()) {
				Store st = new Store();
				st.setStoreName(rs.getString("store_name"));
				st.setStoreAddress(rs.getString("store_address"));
				st.setTelephone(rs.getString("telephone"));
				st.setAvailableTime(rs.getString("available_time"));
				st.setFoodCategory(rs.getString("food_category"));

				listPage.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return listPage;
	}

	public void mypageupdatestore(Store st) {
		connect();
		String sql = "UPDATE stores SET store_name = ?, store_address = ?, FOOD_CATEGORY = ? where member_id = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, st.getStoreName());
			ps.setString(2, st.getStoreAddress());
			ps.setString(3, st.getFoodCategory());
			ps.setString(4, st.getMemberId());

			int result = ps.executeUpdate();

			if (result > 0) {
				System.out.println(result + "건 수정 완료");
			} else {
				System.out.println("수정 실패");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

	}

	public Store storemanagement(String member_id) {
		Store store = null;
		String sql = "select * from stores where member_id = ?";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member_id);

			rs = ps.executeQuery();

			if (rs.next()) {
				store = new Store();
				store.setStoreName(rs.getString(2));
				store.setMemberId(rs.getString(3));
				store.setStoreAddress(rs.getString(4));
				store.setTelephone(rs.getString(5));
				store.setAvailableTime(rs.getString(7));
				store.setFoodCategory(rs.getString(11));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return store;
	}

	// 삽입
	public void insert(Store store) {
		String sql = "insert into stores values(store_id_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, store.getStoreName());
			ps.setString(2, store.getMemberId());
			ps.setString(3, store.getStoreAddress());
			ps.setString(4, store.getTelephone());
			ps.setInt(5, store.getSitCapacity());
			ps.setString(6, store.getAvailableTime());
			ps.setInt(7, store.getHoliday());
			ps.setString(8, store.getRepresentMenu().get(0));
			ps.setString(9, store.getStoreImgUrl().get(0));
			ps.setString(10, store.getFoodCategory());

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

	public List<Reservations> getstorereservation(Criteria cri, String stroeName) {
		List<Reservations> listPage = new ArrayList<>();
		String sql = "select member_id, store_name, people_num, reservation_time "
				+ "from(select rownum rn, member_id, store_name, people_num, reservation_time "
				+ "from(select member_id, store_name, people_num, reservation_time from reservations where store_name= ? order by rownum) "
				+ "where rownum <= ?) " + "where rn > ?";

		connect();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, stroeName);
			ps.setInt(2, cri.getPostNum() * cri.getPageNum()); // 10 * 1;
			ps.setInt(3, cri.getPostNum() * (cri.getPageNum() - 1)); // 0

			rs = ps.executeQuery();
			
			while (rs.next()) {
				Reservations rv = new Reservations();
				rv.setStoreName(rs.getString("store_name"));
				rv.setMemberId(rs.getString("member_id"));
				rv.setPeopleNum(rs.getInt("people_num"));
				rv.setReservationTime(rs.getString("reservation_time"));

				listPage.add(rv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return listPage;
	}

	public List<Reservations> reservationList(String stroeName) {
		List<Reservations> list = new ArrayList<>();
		String sql = "select member_id, store_name, people_num, reservation_time from  reservations where store_name= ?";

		try {
			connect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, stroeName);
			rs = ps.executeQuery();

			while (rs.next()) {
				Reservations rv = new Reservations();
				rv.setStoreName(rs.getString("store_name"));
				rv.setMemberId(rs.getString("member_id"));
				rv.setPeopleNum(rs.getInt("people_num"));
				rv.setReservationTime(rs.getString("reservation_time"));

				list.add(rv);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

}

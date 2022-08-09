package dev.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dev.domain.Review;

public class ReviewRepository extends DAO {

	// 리뷰 글 등록
	public void insertReview(Review vo) {
		String sql = "Insert Into reviews values(REVIEW_ID_SEQ.nextval, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD-HH12:MI'), ?)";
		try {
			connect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMemberId());
			ps.setString(2, vo.getStoreName());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getTasteScore());

			System.out.println(vo.getMemberId());
			System.out.println(vo.getStoreName());
			System.out.println(vo.getContent());
			System.out.println(vo.getTasteScore());

			int result = ps.executeUpdate();
			if (result > 0) {
				System.out.println(result + "건 등록");
			} else {
				System.out.println("등록 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

	}

	// 리뷰 리스트 전체조회
	public List<Review> reviewList(String storeName) {
		List<Review> list = new ArrayList<>();
		String sql = "SELECT * FROM reviews WHERE store_name=?";
		connect();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, storeName);
			rs = ps.executeQuery();
			while (rs.next()) {
				Review vo = new Review();
				vo.setReviewId(rs.getInt("review_id"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setContent(rs.getString("content"));
				vo.setStoreName(rs.getString("store_name"));
				vo.setTasteScore(rs.getInt("taste_score"));
				vo.setCreateDate(rs.getString("create_date"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	// 유저별 쓴 리뷰 리스트 조회
	public List<Review> selectAllByMemberId(String memberId) {
		List<Review> list = new ArrayList<>();
		String sql = "SELECT * FROM reviews WHERE member_id = ? order by 5";
		connect();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberId);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				Review vo = new Review();
				vo.setReviewId(rs.getInt("review_id"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setContent(rs.getString("content"));
				vo.setStoreName(rs.getString("store_name"));
				vo.setTasteScore(rs.getInt("taste_score"));
				vo.setCreateDate(rs.getString("create_date"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	

	public boolean deleteReview(int reviewId) {
		String sql = "DELETE FROM reviews WHERE review_id = ?";

		connect();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reviewId);

			int result = ps.executeUpdate();
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

	public boolean updateReview(String content, int reviewID) {

		String sql = "UPDATE reviews SET content = ? WHERE review_id =? ";
		connect();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, content);
			ps.setInt(2, reviewID);

			int result = ps.executeUpdate();
			if (result > 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	// 리뷰 별점 출력
	// 별점 평균 조회
	public Review reviewAvgTateScore(String storeName) {
		String sql = "select (sum(taste_score) / count(*)) from reviews where sotre_name = ?";
		connect();
		Review vo = new Review();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, storeName);
			rs = ps.executeQuery();
			if (rs.next()) {
				vo.setAvgScore(rs.getInt("select (sum(taste_score) / count(*))"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return vo;
	}

	//수정
	public void reviewupdate(Review rv) {
		// TODO Auto-generated method stub
		connect();
		String sql = "UPDATE reviews SET CONTENT = ?, taste_score = ? WHERE review_id= ? and store_name = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, rv.getContent());
			ps.setInt(2, rv.getTasteScore());
			ps.setInt(3, rv.getReviewId());
			ps.setString(4, rv.getStoreName());

			int result = ps.executeUpdate();

			if (result > 0) {
				System.out.println(result + "건 댓글 수정완료");
			} else {
				System.out.println("댓글 수정 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
}

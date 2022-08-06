package dev.service;

import java.util.List;

import dev.domain.Review;
import dev.repository.DAO;
import dev.repository.ReviewRepository;

public class ReviewService {
	ReviewRepository reviewrepo =new ReviewRepository();
	private static ReviewService instance = new ReviewService();
	private ReviewService() {}
	public static ReviewService getInstance() {
		return instance;
	}
	
	//리뷰 등록
	public void addReview(Review vo) {
		reviewrepo.insertReview(vo);
	}
	
	//리뷰리스트 전체조회
	public List<Review> listReview(String storeName){
		return reviewrepo.reviewList(storeName);
	}
	
	//리뷰 삭제
	public boolean delReview(int reviewId) {
		return reviewrepo.deleteReview(reviewId);
	}
	public boolean updateReview(String content, int reviewID) {
		return reviewrepo.updateReview(content, reviewID);
	}
	
	//가게 당 별점 조회
	public int getAvgTasteScore(String storeName) {
		return reviewrepo.reviewAvgTateScore(storeName).getAvgScore();
	}
	
	// 유저별 리뷰리스트 조회
	public List<Review> findAllReviewsByMemberId(String memberId){
		return reviewrepo.selectAllByMemberId(memberId);
	}
}

package dev.controller.review;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.domain.Review;

public class ReviewListByMemberIdController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// 멤버 아이디별 리뷰 조회 -> 내 리뷰 조회 기능
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
		
		System.out.println("loginMember = " + loginMember);
		
		List<Review> list = reviewService.findAllReviewsByMemberId(loginMember.getMemberId());
//		list.forEach(System.out::println);
		
		req.setAttribute("reviews", list);
		Utils.forward(req, resp, "mypage/mypage.tiles");
		
	}

}

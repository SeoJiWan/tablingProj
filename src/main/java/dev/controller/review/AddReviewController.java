package dev.controller.review;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.domain.Review;
public class AddReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException{
		resp.setContentType("text/jsp; charset=utf-8");
	
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
	    String loginMemberId = loginMember.getMemberId();
		
		String content = req.getParameter("content");
		String storeName = req.getParameter("storeName");
		System.out.println("storeName: "+storeName);
		int tasteScore = Integer.parseInt(req.getParameter("tasteScore"));		
		
	
		Review vo = new Review();
		vo.setContent(content);
		vo.setMemberId(loginMemberId);
		vo.setTasteScore(tasteScore);
		vo.setStoreName(storeName);

		reviewService.addReview(vo);
		
//		resp.sendRedirect("WEB-INF/jsp/detail/detailTestPage.jsp");
		req.setAttribute("storeName", storeName);
		Utils.forward(req, resp, "detailPage.do");
	
	}

}

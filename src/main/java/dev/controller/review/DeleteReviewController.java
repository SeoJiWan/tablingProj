package dev.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;

public class DeleteReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setContentType("text/json; charset=utf-8");
		int reviewId = Integer.parseInt(req.getParameter("review_id"));
		
		boolean isDeleted = reviewService.delReview(reviewId);
		try {
			if (isDeleted) //isDeleted라면
			resp.getWriter().print("{\"retCode\" : \"Success\"}");
			else
			resp.getWriter().print("{\"retCode\" : \"Fail\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//Utils.forward(req, resp, "detail/DetailMainPage.tiles");
	}

}

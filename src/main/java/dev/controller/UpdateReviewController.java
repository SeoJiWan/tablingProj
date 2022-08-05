package dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.service.ReviewService;

public class UpdateReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String content = req.getParameter("reviewContent");
		int reviewID = Integer.parseInt(req.getParameter("reviewId"));
	
		boolean isUpdate = reviewService.updateReview(content, reviewID);
	
	
	}

}

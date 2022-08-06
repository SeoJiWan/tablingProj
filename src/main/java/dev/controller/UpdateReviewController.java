package dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String content = req.getParameter("reviewContent");
		int reviewID = Integer.parseInt(req.getParameter("reviewId"));
	
		boolean isUpdate = reviewService.updateReview(content, reviewID);
		
		try {
			if(isUpdate)
			resp.getWriter().print("{\"retCode\" : \"Success\"}");
			else
			resp.getWriter().print("{\"retCode\" : \"Fail\"}");
		} catch(IOException e) {
			e.printStackTrace();
		}
	
	}

}

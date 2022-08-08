package dev.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Review;
import dev.service.ReviewService;

public class updatereview implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		
		int upno = Integer.parseInt(req.getParameter("upno"));
		String upstore = req.getParameter("upstore");
		String content = req.getParameter("content");
		
		Review rv = new Review();
		rv.setReviewId(upno);
		rv.setContent(content);
		rv.setStoreName(upstore);
		
		System.out.println(upno + "::" + content + "::" + upstore);
		
		ReviewService service = ReviewService.getInstance();
		service.reviewupdate(rv);
		
		System.out.println(rv.getContent());
		
		req.setAttribute("upstore", upstore);
		Utils.forward(req, resp, "/detail/popupset.tiles");
//		String nextPage = "detailPage.do?storeName=" + upstore; 
//		Utils.forward(req, resp, nextPage);
	}

}

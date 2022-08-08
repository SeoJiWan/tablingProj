package dev.controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Review;

public class ReviewListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException {
		//List를 보여줌
		String storeName = req.getParameter("storeName");
		
		List<Review> list =  reviewService.listReview(storeName);
		list.forEach(System.out::println);
		
		
		req.setAttribute("list", reviewService.listReview(storeName));
		req.setAttribute("storeName", storeName);
		Utils.forward(req, resp, "detailMain.do");

	}

}

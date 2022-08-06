package dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.domain.InterestedStore;

public class LikeStoreController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String storeName = req.getParameter("storeName");
		int like = Integer.parseInt(req.getParameter("like"));
		int unlike = Integer.parseInt(req.getParameter("unlike"));
		String memberId = (String) req.getSession().getAttribute("loginId");
		
		
		//객체 세팅해서 넘겨주기
		InterestedStore interestStore = new InterestedStore();
		interestStore.setStoreName(storeName);
		//찜 안누른 상태
		if(like == 0) {
			interestStore.setLike(like);
		} else {
			//1
			interestStore.setLike(unlike);			
		}
		interestStore.setMembeId(memberId);
		
		boolean isLiked = interestedStoreService.addLike(interestStore);
//		try {
//			if(isLiked) {
//				resp.getWriter().print("success");
//			}
//		} catch(IOException e) {
//			e.printStackTrace();
//		}
	}

}

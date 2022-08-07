package dev.controller.interestedStore;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.domain.InterestedStore;

public class LikeStoreController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		int like = 0;
		int unlike = 0;
		String storeName = req.getParameter("storeName");
		String memberId = (String) req.getSession().getAttribute("loginId");
		
		if(!req.getParameter("like").equals("")) {
			like = Integer.parseInt(req.getParameter("like"));
		} else {
			unlike = Integer.parseInt(req.getParameter("unlike"));
		}
		

		//객체 세팅해서 넘겨주기
		InterestedStore interestStore = new InterestedStore();
		interestStore.setStoreName(storeName);
		
		//찜 안누른 상태
		if(like == 0) {
			interestedStoreService.addLike(interestStore);
			interestStore.setLike(like);
		} else {
			//1
			interestedStoreService.deleteStoreInMyPage(interestStore);
			interestStore.setLike(unlike);	
		}
		interestStore.setMembeId(memberId);
		interestStore.setStoreName(storeName);
		
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

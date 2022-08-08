package dev.controller.interestedStore;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.domain.InterestedStore;
import dev.domain.Member;

public class LikeStoreController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String status = req.getParameter("status");
		String storeName = req.getParameter("storeName");
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
		

		//객체 세팅해서 넘겨주기
		InterestedStore interestStore = new InterestedStore();
		interestStore.setStoreName(storeName);
		interestStore.setMembeId(loginMember.getMemberId());
		//찜 안누른 상태
		if(status.equals("1")) {
			interestedStoreService.addLike(interestStore);
		} else if(status.equals("0")){
			interestedStoreService.deleteStore(interestStore);	
		}
	}
}

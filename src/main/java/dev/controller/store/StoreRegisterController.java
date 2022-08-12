package dev.controller.store;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.domain.Store;

public class StoreRegisterController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// 로그인 세션
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");

		// 사진 데이터 전처리
		int len = req.getParameterValues("store_img").length;
		String img = "";
		List<String> imgArr = new ArrayList<String>();
		for (int i = 0; i < len; i++) {
			img += req.getParameter("store_name") + (i + 1)  + ".jpg-";
		}
		imgArr.add(img);
		
		// 대표 메뉴 데이터 리스트로 변환
		List<String> menu = new ArrayList<String>();
		menu.add(req.getParameter("represent_menu"));

		// storeRegisterForm.jsp 로부터 파라미터 값 받기
		Store store = new Store();
		store.setStoreName(req.getParameter("store_name"));
		store.setMemberId(loginMember.getMemberId());
		store.setStoreAddress(req.getParameter("store_address"));
		store.setTelephone(req.getParameter("telephone"));
		store.setSitCapacity(Integer.parseInt(req.getParameter("sit_capacity")));
		store.setAvailableTime(req.getParameter("available_time"));
		store.setRepresentMenu(menu);
		store.setStoreImgUrl(imgArr);
		store.setFoodCategory(req.getParameter("food_category"));
		
		storeService.registerStore(store);
		
		Utils.forward(req, resp, "storereservation.do?pageNum=1&postNum=10");
		
	}

}
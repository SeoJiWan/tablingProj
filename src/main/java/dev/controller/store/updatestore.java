package dev.controller.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Store;
import dev.service.StoreService;

public class updatestore implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
//		String memberId = (String)req.getSession().getAttribute("loginId");
//		System.out.println("로그인 멤버 = " + memberId);
		
		String memberId = "store2";
		String storeName = req.getParameter("store_name");
		String storeaddress = req.getParameter("storeaddress");
		String telephone = req.getParameter("telephone");
		String foodcategory = req.getParameter("foodcategory");
		
		Store st = new Store();
		st.setStoreName(storeName);
		st.setStoreAddress(storeaddress);
		st.setTelephone(telephone);
		st.setFoodCategory(foodcategory);
		st.setMemberId(memberId);

		StoreService service = StoreService.getInstance();
		service.mypageupdatestore(st);

		Store store = storeService.storemanagement(memberId);
		
		System.out.println("member = " + memberId);
		
		req.setAttribute("stores", store);
		
		Utils.forward(req, resp, "/store/storeupdatemanager.tiles");
	}

}
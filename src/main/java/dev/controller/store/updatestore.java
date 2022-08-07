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
//		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
//	    String loginMemberId = loginMember.getMemberId();
		
		String loginMemberId = "store2";
		String storeName = req.getParameter("store_name");
		String storeaddress = req.getParameter("storeaddress");
		String telephone = req.getParameter("telephone");
		String foodcategory = req.getParameter("foodcategory");
		
		Store st = new Store();
		st.setStoreName(storeName);
		st.setStoreAddress(storeaddress);
		st.setTelephone(telephone);
		st.setFoodCategory(foodcategory);
		st.setMemberId(loginMemberId);

		StoreService service = StoreService.getInstance();
		service.mypageupdatestore(st);

		Store store = storeService.storemanagement(loginMemberId);
		
		System.out.println("member = " + loginMemberId);
		
		req.setAttribute("stores", store);
		
		Utils.forward(req, resp, "/store/storeupdatemanager.tiles");
	}

}
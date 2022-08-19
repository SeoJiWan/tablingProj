package dev.controller.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.domain.Store;

public class StoreListByOwnerController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
		
		List<Store> stores = storeService.findStoresByOwner(loginMember.getMemberId());
		stores.forEach(System.out::println);
		
		req.setAttribute("stores", stores);
		
		Utils.forward(req, resp, "store/storeListByOwner.tiles");
		
	}

}

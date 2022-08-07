package dev.controller.detail;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Store;

public class DetailMainController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException {
		
		String storeName = req.getParameter("storeName");
		
		Store store = storeService.findOneStore(storeName);
		System.out.println("store = " + store);
		
		
		store.getRepresentMenu().forEach(System.out::println);
		req.setAttribute("storeDetail", store);
		
		Utils.forward(req, resp, "detail/DetailMainPage.tiles");
		
	}

}

package dev.controller.interestedStore;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Utils;
import dev.controller.Controller;
import dev.domain.InterestedStore;

public class InterestedStoreListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String loginId = (String) req.getSession().getAttribute("loginId");
		
		// 테스트용
//		loginId = "user1";
		
		List<InterestedStore> list = interestedStoreService.findAllPickStore(loginId);
//		list.forEach(System.out::println);
		
		req.setAttribute("list", list);
		
		Utils.forward(req, resp, "/interested_store/interestedStoreList.tiles");
	}

}

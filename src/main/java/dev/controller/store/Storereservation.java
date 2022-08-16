package dev.controller.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Criteria;
import dev.domain.Member;
import dev.domain.Page;
import dev.domain.Reservations;
import dev.domain.Store;
import dev.service.StoreService;

public class Storereservation implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
		String loginMemberId = loginMember.getMemberId();

		String pageNum = req.getParameter("pageNum");
		String postNum = req.getParameter("postNum");

		Criteria cri = new Criteria();
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setPostNum(Integer.parseInt(postNum));

		Store store = storeService.storemanagement(loginMemberId);

		// store null 예외처리
		if (store != null) {
			String storeName = store.getStoreName();

			StoreService service = StoreService.getInstance();
			List<Reservations> pageList = service.getstorereservations(cri, storeName);

			req.setAttribute("list", pageList);

			List<Reservations> totalList = service.reservationList(storeName);
			int total = totalList.size();
			req.setAttribute("pageInfo", new Page(cri, total));

			Utils.forward(req, resp, "store/storereservation.tiles");
		}
		
		else {
			Utils.forward(req, resp, "store/storereservation.tiles");
		}

	}

}

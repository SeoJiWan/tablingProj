package dev.controller.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Criteria;
import dev.domain.Page;
import dev.domain.Store;
import dev.service.StoreService;

public class StoreSearchPagingController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		//페이지
		String pageNum = req.getParameter("pageNum");
		String postNum = req.getParameter("postNum");
		Criteria cri = new Criteria();
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setPostNum(Integer.parseInt(postNum));
		
		//키워드
		HttpSession session = req.getSession();
		String keyword = req.getParameter("keyword");
		if(keyword.equals("중앙로")) {
			keyword="중앙대로";
		}
		session.setAttribute("keyword", keyword);
		//리스트 저장
		StoreService storeService = StoreService.getStoreService();
		List<Store> pageList = storeService.findAllPagingStores(cri, keyword);
		req.setAttribute("list", pageList);
		//별점
		
		//페이지
		List<Store> list = storeService.findAllStores(keyword);
		int total = list.size();
		req.setAttribute("pageInfo", new Page(cri, total));
		Utils.forward(req, resp, "WEB-INF/jsp/store/storeSearchOutput.jsp");
	}

}

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

public class storeFilterSearchPagingController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		//필터 조건
		String job = req.getParameter("job");
		req.setAttribute("job", job);
		//페이지 
		String pageNum = req.getParameter("pageNum");
		String postNum = req.getParameter("postNum");
		Criteria cri = new Criteria();
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setPostNum(Integer.parseInt(postNum));		
		//지역, 음식 선택
		String[] area = req.getParameterValues("area");
		String[] food = req.getParameterValues("food");
		
		String areaStr = "";
		for (String str : area) {
			areaStr += "&area=" + str;
		}
		
		String foodStr = "";
		for (String str : food) {
			foodStr += "&food=" + str;
		}
		session.setAttribute("areaStr", areaStr);
		session.setAttribute("foodStr", foodStr);
		
		//세션에서 키워드 불러오기
		String keyword = (String)session.getAttribute("keyword");
		if(keyword.equals("중앙로")) {
			keyword="중앙대로";
		}
		session.setAttribute("keyword", keyword);
		//리스트 저장
		StoreService storeService = StoreService.getStoreService();
		List<Store> pageFilterList = storeService.findAllFilterPagingStores(cri, keyword, area, food);
		session.setAttribute("list", pageFilterList);
		
		//페이지
		List<Store> list = storeService.findFilterStores(keyword, area, food);
		int total = list.size();
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "WEB-INF/jsp/store/storeSearchOutput.jsp");
	}

}

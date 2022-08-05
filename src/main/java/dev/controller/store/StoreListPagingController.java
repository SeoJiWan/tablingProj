package dev.controller.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Criteria;
import dev.domain.Page;
import dev.domain.Store;
import dev.service.StoreService;

public class StoreListPagingController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageNum = req.getParameter("pageNum");
		String postNum = req.getParameter("postNum");
		
		Criteria cri = new Criteria();
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setPostNum(Integer.parseInt(postNum));
		
		StoreService service = StoreService.getInstance();
		List<Store> pageList = service.getListPaging(cri);
		
		req.setAttribute("list", pageList);
		
		List<Store> totalList = service.storeList();
		int total = totalList.size();
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "store/StoreAccept.tiles");

	}

}

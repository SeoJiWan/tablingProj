package dev.controller.store;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.service.StoreService;

public class updateStoreAjaxController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json; charset=utf-8");
		String store_name = req.getParameter("store_name");		
		StoreService service = StoreService.getInstance();
		boolean isDeleted = service.updateStore(store_name);
		
		try {
			if (isDeleted) 
			resp.getWriter().print("{\"retCode\" : \"Success\"}");
			else
				resp.getWriter().print("{\"retCode\" : \"Fail\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

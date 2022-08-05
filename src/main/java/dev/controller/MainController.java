package dev.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.domain.Store;


public class MainController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
  
		List<Store> list = storeService.findRandomStore();
		req.setAttribute("list", list);
		System.out.println("test");
		Utils.forward(req, resp, "main/main.tiles");
	}

}

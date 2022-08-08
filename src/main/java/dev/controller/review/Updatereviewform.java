package dev.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;

public class Updatereviewform implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		
		String upno = req.getParameter("upno");
		String upstore = req.getParameter("upstore");

		req.setAttribute("upno", upno);
		req.setAttribute("upstore", upstore);
		
		Utils.forward(req, resp, "WEB-INF/jsp/detail/popup.jsp");

	}

}

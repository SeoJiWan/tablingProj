package dev.controller.reservation;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.domain.Reservations;

public class ReservationListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
		
		// 테스트용
//		loginId = "ccc";
		
		List<Reservations> list = reservationService.findReservationsByMemberId(loginMember.getMemberId());
			
		list.forEach(System.out::println);
		
		req.setAttribute("reservationList", list);
		
		Utils.forward(req, resp, "/reservation/reservationListResult.tiles");
	
	
	
	}
}

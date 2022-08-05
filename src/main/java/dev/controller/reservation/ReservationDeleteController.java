package dev.controller.reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;
import dev.domain.Reservations;

public class ReservationDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String id = req.getParameter("id");
		
		reservationService.deleteReservation(Integer.parseInt(id));
		
		Reservations reservation = reservationService.findOneReservation(Integer.parseInt(id));
		System.out.println("deleteReservation = " + reservation);
		
		resp.getWriter().write("deleteSuccess");
		
		
	}

}

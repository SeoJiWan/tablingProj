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

public class ReservationCompleteController implements Controller {

   @Override
   public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
      
      Reservations reservation = (Reservations) req.getAttribute("reservation");
      
      //Reservations reservationInfo = reservationService.findOneReservation(reservations.getReservationId());
      
      req.setAttribute("reservation", reservation);
      Utils.forward(req, resp, "reservation/completeReservation.tiles");
   }

}
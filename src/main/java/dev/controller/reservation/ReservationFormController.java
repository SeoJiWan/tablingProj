package dev.controller.reservation;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Reservations;

public class ReservationFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException {
		resp.setContentType("text/jsp; charset=utf-8");
		
		//String memberId = (String) req.getSession().getAttribute("loginId");
		//String storeName = (String) req.getSession().getAttribute("storeName");
		String memberId = "store11";
		String storeName = "다전칼국수";
		String time = req.getParameter("timeZone");
		String date = req.getParameter("date");
		String peopleNum = req.getParameter("peopleNum");
		String reservationTime = date.concat(" "+time);
		
		//System.out.println(reservationTime);
		
		Reservations reservations = new Reservations();
		reservations.setPeopleNum(Integer.parseInt(peopleNum));
		reservations.setReservationTime(reservationTime);
		reservations.setMemberId(memberId);
		reservations.setStoreName(storeName);
		reservations.setReservationId(1);
		System.out.println(peopleNum);
		System.out.println(reservationTime);
		System.out.println(memberId);
		System.out.println(storeName);
		
		reservationService.makeReservation(reservations);
		
		System.out.println("peopleNum:"+reservations.getPeopleNum());
		req.setAttribute("reservation", reservations);
		Utils.forward(req, resp, "/reservationComplete.do");
		
	}

}

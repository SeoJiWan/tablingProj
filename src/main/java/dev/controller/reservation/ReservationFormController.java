package dev.controller.reservation;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.domain.Reservations;

public class ReservationFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException {
		resp.setContentType("text/jsp; charset=utf-8");
		
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
	    String loginMemberId = loginMember.getMemberId();
	    
		//String storeName = (String) req.getSession().getAttribute("storeName");
	    String storeName = req.getParameter("storeName");
	    System.out.println("wwwwwww: " + storeName);
		String time = req.getParameter("timeZone");
		String date = req.getParameter("date");
		String peopleNum = req.getParameter("peopleNum");
		String reservationTime = date.concat(" "+time);
		
		//System.out.println(reservationTime);
		
		Reservations reservations = new Reservations();
		reservations.setPeopleNum(Integer.parseInt(peopleNum));
		reservations.setReservationTime(reservationTime);
		reservations.setMemberId(loginMemberId);
		reservations.setStoreName(storeName);
//		System.out.println(peopleNum);
//		System.out.println(reservationTime);
//		System.out.println(loginMemberId);
//		System.out.println(storeName);
		
		reservationService.makeReservation(reservations);
		
		System.out.println("peopleNum:"+reservations.getPeopleNum());
		req.setAttribute("reservation", reservations);
		
		Utils.forward(req, resp, "/reservationComplete.do");
		
	}

}

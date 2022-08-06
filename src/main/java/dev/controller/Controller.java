package dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.service.BoardService;
import dev.service.CommentService;
import dev.service.InterestedStoreService;
import dev.service.MemberService;
import dev.service.ReservationService;
import dev.service.ReviewService;
import dev.service.StoreService;


public interface Controller{

	MemberService memberService = MemberService.getMemberService();
	ReservationService reservationService = ReservationService.getReservationService();
	StoreService storeService = StoreService.getStoreService();
	InterestedStoreService interestedStoreService = InterestedStoreService.getInterestedStoreService();
	BoardService boardService = BoardService.getBoardService();
	CommentService commentService = CommentService.getCommentService();
	ReviewService reviewService =ReviewService.getInstance();
	
	void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException;
}
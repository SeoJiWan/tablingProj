package dev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Utils {
	public static void forward(HttpServletRequest req, HttpServletResponse resp, String uri) {
		
		// 디스패처를 통해 정보 보낼 파일 경로 설정
		RequestDispatcher rd = req.getRequestDispatcher(uri);
		try {
			// 요청 정보를 포워딩 --> 자원 전달, 페이지 전환
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

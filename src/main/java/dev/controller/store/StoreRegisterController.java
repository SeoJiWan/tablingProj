package dev.controller.store;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.domain.Store;

public class StoreRegisterController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
//		// 사진 데이터 전처리
//		int len = req.getParameterValues("store_img").length;
//		String img = "";
//		List<String> imgArr = new ArrayList<String>();
//		for (int i = 0; i < len; i++) {
//			img += req.getParameter("store_name") + (i + 1)  + ".jpg-";
//		}
//		imgArr.add(img);
//		
//		
//		// 사진 서버 폴더에 저장
//		String realPath = req.getSession().getServletContext().getRealPath("/");
//		System.out.println("realPath1 = " + realPath);
//		realPath += "\\img\\store_img";
//		System.out.println("realPath = " + realPath);
//
//		File DirPath = new File(realPath);
//		String millis = String.valueOf(System.currentTimeMillis());
//		String fileName = req.getParameter("store_name") + "_" + millis + ".jpg";
//		boolean isInput = false;
//
//		DiskFileItemFactory factory = new DiskFileItemFactory();
//		factory.setRepository(DirPath);
//		// 파일크기 5메가
//		factory.setSizeThreshold(5 * 1024 * 1024);
//		ServletFileUpload upload = new ServletFileUpload(factory);
//
//		try {
//			List<FileItem> items = upload.parseRequest(req);
//			items.forEach(System.out::println);
//			for (int i = 0; i < items.size(); i++) {
//				FileItem fileItem = (FileItem) items.get(i);
//				if (fileItem.isFormField()) {
//					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString("utf-8"));
//				} else {
//					if (fileItem.getSize() > 0) {
//						int idx = fileItem.getName().lastIndexOf("\\");
//						if (idx == -1) {
//							idx = fileItem.getName().lastIndexOf("/");
//						}
//						File uploadFile = new File(DirPath + "\\" + fileName);
//						fileItem.write(uploadFile);
//						isInput = true;
//					}
//				}
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		// db에 insert하는 코드필요
//
//		if (isInput) {
//			// 로그인 세션
//			Member loginMember = (Member) req.getSession().getAttribute("loginMember");
////
////			// 사진 데이터 전처리
////			int len = req.getParameterValues("store_img").length;
////			String img = "";
////			List<String> imgArr = new ArrayList<String>();
////			for (int i = 0; i < len; i++) {
////				img += req.getParameter("store_name") + (i + 1)  + ".jpg-";
////			}
////			imgArr.add(img);
//			
//			// 대표 메뉴 데이터 리스트로 변환
//			List<String> menu = new ArrayList<String>();
//			menu.add(req.getParameter("represent_menu"));
//
//			// storeRegisterForm.jsp 로부터 파라미터 값 받기
//			Store store = new Store();
//			store.setStoreName(req.getParameter("store_name"));
//			store.setMemberId(loginMember.getMemberId());
//			store.setStoreAddress(req.getParameter("store_address"));
//			store.setTelephone(req.getParameter("telephone"));
//			store.setSitCapacity(Integer.parseInt(req.getParameter("sit_capacity")));
//			store.setAvailableTime(req.getParameter("available_time"));
//			store.setRepresentMenu(menu);
//			store.setStoreImgUrl(imgArr);
//			store.setFoodCategory(req.getParameter("food_category"));
//			
//			storeService.registerStore(store);
//			
//			Utils.forward(req, resp, "storereservation.do?pageNum=1&postNum=10");
//		}
		
		
		
		
		// 사진 서버 폴더 저장 x -> img/store_img 에 있는 사진 첨부시 사용 가능
		// 로그인 세션
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");

		// 사진 데이터 전처리
		System.out.println("store_img = " + req.getParameterValues("store_img"));
		
		int len = req.getParameterValues("store_img").length;
		String img = "";
		List<String> imgArr = new ArrayList<String>();
		for (int i = 0; i < len; i++) {
			img += req.getParameter("store_name") + (i + 1)  + ".jpg-";
		}
		imgArr.add(img);
		
		// 대표 메뉴 데이터 리스트로 변환
		List<String> menu = new ArrayList<String>();
		menu.add(req.getParameter("represent_menu"));

		// storeRegisterForm.jsp 로부터 파라미터 값 받기
		Store store = new Store();
		store.setStoreName(req.getParameter("store_name"));
		store.setMemberId(loginMember.getMemberId());
		store.setStoreAddress(req.getParameter("store_address"));
		store.setTelephone(req.getParameter("telephone"));
		store.setSitCapacity(Integer.parseInt(req.getParameter("sit_capacity")));
		store.setAvailableTime(req.getParameter("available_time"));
		store.setRepresentMenu(menu);
		store.setStoreImgUrl(imgArr);
		store.setFoodCategory(req.getParameter("food_category"));
		
		storeService.registerStore(store);
		
		Utils.forward(req, resp, "storereservation.do?pageNum=1&postNum=10");
		
	}

}
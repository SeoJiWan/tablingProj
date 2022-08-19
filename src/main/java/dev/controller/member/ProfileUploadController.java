package dev.controller.member;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;


public class ProfileUploadController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		// 로그인 계정 정보 가져오기
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");

		String realPath = req.getSession().getServletContext().getRealPath("/");
		System.out.println("realPath1 = " + realPath);
		realPath +=  "img\\profile_img";
		System.out.println("realPath = " + realPath);
		
		File DirPath = new File(realPath);
		String millis = String.valueOf(System.currentTimeMillis());
		String fileName = loginMember.getMemberId() + "_profile" + millis + ".jpg";
		System.out.println("fileName = " + fileName);
		boolean isInput = false;

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(DirPath);
		// 파일크기 5메가
		factory.setSizeThreshold(5 * 1024 * 1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		System.out.println("upload = " + upload);
		
		try {
			List<FileItem> items = upload.parseRequest(req);
			System.out.println("items");
			items.forEach(System.out::println);
			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString("utf-8"));
				} else {
					if (fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						File uploadFile = new File(DirPath + "\\" + fileName);
						fileItem.write(uploadFile);
						isInput = true;
						System.out.println("isINput = true");
						System.out.println("uploadFile = " + uploadFile);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// db에 insert하는 코드필요

		if (isInput) {
			loginMember.setProfileImgUrl(fileName);
			System.out.println("fileName2 = " + fileName);
		}
		memberService.changeProfile(loginMember);

//		// 이미지 src 넘겨주기
//		req.setAttribute("src", fileName);
//		System.out.println("fileName = " + fileName);
		Utils.forward(req, resp, "mypage/mypage.tiles");

	}

}

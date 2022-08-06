package dev.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD:src/main/java/dev/controller/member/MemberInfoMyPageController.java
import dev.controller.Controller;
import dev.controller.Utils;

public class MemberInfoMyPageController implements Controller {
=======

public class MemberMyPageController implements Controller {
>>>>>>> 934ca77123a7666810b34a82bcc64e99a786b51f:src/main/java/dev/controller/MemberMyPageController.java

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// 내 정보를 보여주는 컨트롤러
		Utils.forward(req, resp, "interestedStoreList.do");
		
		
		
	}

}

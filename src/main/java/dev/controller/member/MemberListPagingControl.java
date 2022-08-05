package dev.controller.member;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Criteria;
import dev.domain.Member;
import dev.domain.Page;

public class MemberListPagingControl implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)  {
		// 페이징 처리 된 리스트 
		// 서비스 -> dao 구현	
		String pageNum = req.getParameter("pageNum");
		String postNum = req.getParameter("postNum");
		
		Criteria cri = new Criteria();
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setPostNum(Integer.parseInt(postNum));
		
		List<Member> pageList = memberService.getMemberList(cri);
		
		req.setAttribute("list", pageList);
		
		List<Member> totalList = memberService.findAllMembers();
		int total = totalList.size();
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "WEB-INF/jsp/member/MemberList.jsp");		
		
	}

}

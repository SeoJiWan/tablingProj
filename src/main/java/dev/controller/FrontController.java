package dev.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.board.CommentAddController;
import dev.controller.board.PostAddController;
import dev.controller.board.PostAddFormController;
import dev.controller.board.PostDeleteController;
import dev.controller.board.PostDetailController;
import dev.controller.board.PostListController;
import dev.controller.board.PostListPagingController;
import dev.controller.board.PostUpdateController;
import dev.controller.board.PostUpdateFormController;
import dev.controller.detail.DetailMainController;
import dev.controller.interestedStore.InterestedStoreListController;
import dev.controller.interestedStore.LikeStoreController;
import dev.controller.member.MemberCheckIdDuplController;
import dev.controller.member.MemberDeleteController;
import dev.controller.member.MemberInfoMyPageController;
import dev.controller.member.MemberInsertController;
import dev.controller.member.MemberListPagingControl;
import dev.controller.member.MemberLoginController;
import dev.controller.member.MemberLoginFormController;
import dev.controller.member.MemberLogoutController;
import dev.controller.member.MemberUpdateController;
import dev.controller.member.MemberUpdateFormController;
import dev.controller.member.MemberadminDeleteController;
import dev.controller.reservation.ReservationCompleteController;
import dev.controller.reservation.ReservationDeleteController;
import dev.controller.reservation.ReservationFormController;
import dev.controller.reservation.ReservationListController;
import dev.controller.review.AddReviewController;
import dev.controller.review.DeleteReviewController;
import dev.controller.review.ReviewListByMemberIdController;
import dev.controller.review.ReviewListController;
import dev.controller.store.StoreRegisterFormController;
import dev.controller.review.UpdateReviewController;
import dev.controller.store.StoreAcceptListPagingControl;
import dev.controller.store.StoreListPagingController;
import dev.controller.store.StoreRegisterController;
import dev.controller.store.StoreSearchPagingController;
import dev.controller.store.Storereservation;
import dev.controller.store.degreeStoreAjaxController;
import dev.controller.store.storeFilterSearchPagingController;
import dev.controller.store.updateStoreAjaxController;
import dev.controller.store.updatemanagement;
import dev.controller.store.updatestore;

// .
public class FrontController extends HttpServlet {

	/*
	 * Field
	 */
	String enc;
	Map<String, Controller> mappings;

	/*
	 * Method
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {

		// web.xml 에서 init-param > param-name 이 charset 인 값을 들고옴
		enc = config.getInitParameter("charset");
		
		mappings = new HashMap<>();
		
		// main
		mappings.put("/main.do", new MainController());
		
		//Member
		mappings.put("/memberLoginForm.do", new MemberLoginFormController());
		mappings.put("/memberLogout.do", new MemberLogoutController());
		mappings.put("/memberInsert.do", new MemberInsertController());
		mappings.put("/memberCheckIdDupl.do", new MemberCheckIdDuplController());
		mappings.put("/memberLogin.do", new MemberLoginController());
		mappings.put("/memberUpdateForm.do", new MemberUpdateFormController());
		mappings.put("/memberUpdate.do", new MemberUpdateController());
		mappings.put("/memberDelete.do", new MemberDeleteController());
		mappings.put("/memberListPaging.do", new MemberListPagingControl());
		mappings.put("/memberadminDelete.do", new MemberadminDeleteController());
		
		// my page --> 순서대로 컨트롤러 로직 실행 후 마지막에 mypage.jsp 로 데이터 뿌려줌 
		mappings.put("/memberInfoMyPage.do", new MemberInfoMyPageController());
		mappings.put("/interestedStoreList.do", new InterestedStoreListController());
		mappings.put("/reservationList.do", new ReservationListController());
		mappings.put("/reviewListByMemberId.do", new ReviewListByMemberIdController());
		
		//Reservation
		mappings.put("/reservationDelete.do", new ReservationDeleteController());
		mappings.put("/reserve.do", new ReservationFormController());
		mappings.put("/reservationComplete.do", new ReservationCompleteController());
		
		//Store
		mappings.put("/storeSearchPaging.do", new StoreSearchPagingController());
		mappings.put("/storeFilterSearchPaging.do", new storeFilterSearchPagingController());
		mappings.put("/admin_main.do", new StoreListPagingController());
		mappings.put("/StoreAcceptListPaging.do", new StoreAcceptListPagingControl());
		mappings.put("/degreeStoreAjax.do", new degreeStoreAjaxController());
		mappings.put("/updateStoreAjax.do", new updateStoreAjaxController());
		mappings.put("/updatemanagement.do", new updatemanagement());
		mappings.put("/ownerupdate.do", new updatemanagement());
		mappings.put("/updatestore.do", new updatestore());
		mappings.put("/storeRegisterForm.do", new StoreRegisterFormController());
		mappings.put("/storeRegister.do", new StoreRegisterController());
		mappings.put("/StoreReserVation.do", new Storereservation());
		
		//InterestedStore

		//Review
		mappings.put("/interestedStoreList.do", new InterestedStoreListController());
		mappings.put("/likeStoreAjax.do", new LikeStoreController());
		
		//DetailReview
		
		mappings.put("/addReview.do", new AddReviewController());
		//은하와 연결 - 
		mappings.put("/detailPage.do", new ReviewListController());
		//mappings.put("/reviewList.do", new ReviewListController());
		mappings.put("/detailPage.do", new ReviewListController());
		
		mappings.put("/deleteReviewAjax.do", new DeleteReviewController());
		mappings.put("/updateReviewAjax.do", new UpdateReviewController());
			
		//Board
		mappings.put("/postListPaging.do", new PostListPagingController()); //게시판 첫페이지->postList.tiles
		mappings.put("/postList.do", new PostListController()); //게시판 목록->postList.tiles
		mappings.put("/postDetail.do", new PostDetailController()); //게시글->postDetail.tiles
		mappings.put("/postAddForm.do", new PostAddFormController()); //addForm->addPostForm.tiles
		mappings.put("/postAdd.do", new PostAddController()); //List->게시글 등록->postListPaging.do
		mappings.put("/postUpdateForm.do", new PostUpdateFormController());//게시글->게시글 수정폼
		mappings.put("/postUpdate.do", new PostUpdateController()); //게시글 수정폼->게시글 수정
		mappings.put("/postDelete.do", new PostDeleteController());//글 삭제 -> 목록으로 연결
		
		//Comment
		mappings.put("/commentAdd.do", new CommentAddController());
		
		//Detail
		mappings.put("/detailMain.do", new DetailMainController());

	}

	// 호출될 때마다 실행
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(enc);
		
		String uri = req.getRequestURI();
		System.out.println("uri = " + uri);
		String contextPath = req.getContextPath();
		String path = uri.substring(contextPath.length());
		System.out.println("path = " + path);
		
		Controller controller = mappings.get(path);
		controller.execute(req, resp);

	}
}

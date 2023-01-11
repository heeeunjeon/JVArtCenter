package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class MypageReviewDetailController
 */
@WebServlet("/detali.re")
public class MypageReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    //해당 게시글 번호 먼저 뽑기
	    int reviewNo = Integer.parseInt(request.getParameter("re"));
        /*
         * Notice n = new NoticeService().selectNotice(noticeNo);
         * 
         * 
         * request.setAttribute("n", n);
         */
	    //게시글 조회
	    ReviewService Rservice = new ReviewService();
	    
	    Rservice.selectReview(reviewNo);
	    // 1. 조회수증가
	    /* int result =  Rservice.increaseCount(reviewNo);
	    
	    if(result >0) { //조회수 증가 성공
	        
	        
	    }else {//조회수 증가에 실패
	        
	        //에러문구
	    }
	    */
	 
	    // 게시글 상세조회 요청 후 ReviewDetailView.jsp 가 보여지도록 포워딩
       
        Review n = Rservice.selectReview(reviewNo);
        
        
        request.setAttribute("n", n);
        
	    
	    request.getRequestDispatcher("views/member/mypageReviewDetail.jsp").forward(request, response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

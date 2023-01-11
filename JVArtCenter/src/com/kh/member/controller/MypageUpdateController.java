package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class MypageUpdateController
 */
@WebServlet("/update.re")
public class MypageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        
          //인코딩 설정
          request.setCharacterEncoding("UTF-8");
          
         // 글번호 "rno"
          int reviewNo = Integer.parseInt(request.getParameter("rno"));
          // 평점:rating
          int reviewrating = Integer.parseInt(request.getParameter("rating"));
          //내용:content
         String reviewcontent =request.getParameter("content");
          
          Review n = new Review();
          n.setReviewNo(reviewNo);
          n.setRating(reviewrating);
          n.setReviewContent(reviewcontent);
          
          int result = new ReviewService().updateReview(n);
         
         if(result>0) { // 성공 후 해당 게시글의 상세조회페이지로 url 요청
          
          request.getSession().setAttribute("alertMsg", "성공적으로 리뷰를 수정했습니다.");
          
          response.sendRedirect(request.getContextPath()+"/detali.re?re="+ reviewNo);
          
         }else {
          request.setAttribute("alertMsg", " 리뷰 수정 실패");
          request.getRequestDispatcher("/mypageReviewList").forward(request,response);
         }
         
	   
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}



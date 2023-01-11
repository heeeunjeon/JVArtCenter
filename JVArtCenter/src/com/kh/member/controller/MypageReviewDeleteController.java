package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;

/**
 * Servlet implementation class MypageReviewDeleteController
 */
@WebServlet("/delete.re")
public class MypageReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   //삭제하고자하는 글번호
	    
	    int reviewNo = Integer.parseInt(request.getParameter("rno"));
	    System.out.println("글번호 ########### : "+reviewNo);
	    try {
	        //삭제 요청 및 결과 받기
            int result = new ReviewService().deleteReview(reviewNo);
	        
	        if(result >0) {//성공 => alertMSg 담기, 공지사항리스트페이지로 url 요청
	            
	            request.getSession().setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
	            
	            response.sendRedirect(request.getContextPath()+"/mypageReview.me?currentPage=1");
	            //mypageReview.me?currentPage=1
	        }else {
	            
	            request.setAttribute("errorMsg","삭제를 실패했습니다.");
	            
	            
	        }
        } catch (Exception e) {
            request.setAttribute("errorMsg","시스템 오류.");
            // TODO: handle exception
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

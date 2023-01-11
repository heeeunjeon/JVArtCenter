package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qna.model.service.QnaService;

/**
 * Servlet implementation class mypageQnadeleteController
 */
@WebServlet("/mypageQnadelete.me")
public class mypageQnadeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageQnadeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int qnaNo = Integer.parseInt(request.getParameter("qno"));
        
		int result = new QnaService().mypageQnadelete(qnaNo);
		
		
		if (result > 0) { // 성공 => aletMsg 담기, 공지사항의 리스트 페이지로 url 요청 
			request.getSession().setAttribute("alertMsg", " 성공적으로 문의내역이 삭제되었습니다."); 
			
			response.sendRedirect(request.getContextPath() + "/mypageQnA.me");
			
			
		} else { // 실패 => 에러문구 담아서 에러페이지로 포워딩 
			request.setAttribute("errorMsg", "문의내역 삭제 실패");
			response.sendRedirect(request.getContextPath() + "/mypageQnA.me");
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

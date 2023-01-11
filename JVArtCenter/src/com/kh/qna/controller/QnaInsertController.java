package com.kh.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaInsertController
 */
@WebServlet("/insert.qna")
public class QnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    request.setCharacterEncoding("UTF-8");
	    
	    String memNo = request.getParameter("memNo");
	    String qnaCategory = request.getParameter("category");
	    String qnaTitle = request.getParameter("title");
	    String qnaContent = request.getParameter("content");
	    
	    Qna q = new Qna();
	    q.setMemNo(memNo);
	    q.setQnaCategory(qnaCategory);
	    q.setQnaTitle(qnaTitle);
	    q.setQnaContent(qnaContent);
	    
	    int result  = new QnaService().insertQna(q);
	    
	    if(result > 0) {
	        request.getSession().setAttribute("alertMsg", "1대1문의 작성에 성공했습니다."); 
	        response.sendRedirect(request.getContextPath()); 
	    } else {
	        request.setAttribute("errorMsg", "1대1문의 작성에 실패했습니다.");
	        
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

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
 * Servlet implementation class AdminQnaInsertController
 */
@WebServlet("/admin_insert.qna")
public class AdminQnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    request.setCharacterEncoding("UTF-8");
	    
        int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
        String answer = request.getParameter("answer");

        Qna q = new Qna();
        q.setQnaNo(qnaNo);
        q.setAnswer(answer);
        
        int result  = new QnaService().insertQnaAnswer(q);
        
        if(result > 0) {
            request.getSession().setAttribute("alertMsg", "답변 작성에 성공했습니다.");
            response.sendRedirect(request.getContextPath() + "/admin_list.qna?currentPage=1");
        } else {
            request.setAttribute("errorMsg", "답변 작성에 실패했습니다.");
            
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

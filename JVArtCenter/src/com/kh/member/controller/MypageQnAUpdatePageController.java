package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class mypageQnAUpdatePageController
 */
@WebServlet("/mypageQnAUpdatePage.me")
public class MypageQnAUpdatePageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageQnAUpdatePageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNo = Integer.parseInt(request.getParameter("qno"));
//        String qnaCategory = request.getParameter("category");
//        String qnaTitle = request.getParameter("title");
//        String qnaContent = request.getParameter("content");
//
//        Qna q = new Qna();
//        q.setQnaCategory(qnaCategory);
//        q.setQnaTitle(qnaTitle);
//        q.setQnaContent(qnaContent);

        
        Qna q = new QnaService().selectQna(qnaNo);
        
        request.setAttribute("q", q);

		request.getRequestDispatcher("views/member/mypageQnAUpdate.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

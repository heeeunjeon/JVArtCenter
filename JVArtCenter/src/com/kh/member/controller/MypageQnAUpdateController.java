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
 * Servlet implementation class MypageQnAUpdateController
 */
@WebServlet("/MypageQnAUpdate.me")
public class MypageQnAUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageQnAUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		// 요청시 전달할 값 
		int qnaNo = Integer.parseInt(request.getParameter("qno"));
        String qnaCategory = request.getParameter("category");
        String qnaTitle = request.getParameter("title");
        String qnaContent = request.getParameter("content");
        
        Qna q = new Qna();
        q.setQnaNo(qnaNo);
        q.setQnaCategory(qnaCategory);
        q.setQnaTitle(qnaTitle);
        q.setQnaContent(qnaContent);
        
        int result = new QnaService().mypageUpdateQna(q);
        
        if(result > 0) {
            request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
            response.sendRedirect(request.getContextPath() + "/mypageQnA.me");
            
        } else {
            request.setAttribute("errorMsg", "수정에 실패했습니다.");
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

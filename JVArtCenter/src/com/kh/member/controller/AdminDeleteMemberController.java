package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class adminDeleteMemberController
 */
@WebServlet("/deletemember.admin")
public class adminDeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   
        request.setCharacterEncoding("UTF-8");
        // 삭제하고자 하는 회원번호
        int memNo = Integer.parseInt(request.getParameter("mno"));
        
        // 서비스단으로 번호를 넘기면서 삭제 요청 및 결과 받기
        int result = new MemberService().deleteMember(memNo);
        
        System.out.println(result);
        
        if(result > 0) { // 성공 => alertMsg 담기, 공지사항 리스트 페이지로 url 요청
            
            request.getSession().setAttribute("alertMsg", "성공적으로 탈퇴 처리되었습니다.");
            response.sendRedirect(request.getContextPath() + "/selectmember.admin?currentPage=1");
        }
        else { // 실패 => 에러문구를 담아서 에러페이지로 포워딩
            
            request.getSession().setAttribute("errortMsg", "회원삭제에 실패했습니다.");
            request.getRequestDispatcher("views/admin/adminSelectMember.jsp");
            
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

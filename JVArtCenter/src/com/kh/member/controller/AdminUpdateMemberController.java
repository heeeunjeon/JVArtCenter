package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class adminUpdateMemberController
 */
@WebServlet("/updatemember.admin")
public class AdminUpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    request.setCharacterEncoding("UTF-8");
	    //뽑아야할 값 - 회원등급, 아이디, 비밀번호, 이름, 전화번호, 이메일
	    int memNo = Integer.parseInt(request.getParameter("mno"));
	    String grCode = request.getParameter("grCode");
	    String memId = request.getParameter("memId");
	    String memPwd = request.getParameter("memPwd");
	    String memName = request.getParameter("memName");
	    String phone = request.getParameter("phone");
	    String email = request.getParameter("email");
	    
	    Member m = new Member(memNo, grCode, memId, memPwd, memName, phone, email);
	    
	    Member updateMem = new MemberService().updateMember(m);
	            
	    if(updateMem == null) { // 실패시
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("alertMsg", "정보수정에 실패했습니다.");
	        response.sendRedirect(request.getContextPath() + "/selectmember.admin?currentPage=1");
	        
	    } else { //성공
	        HttpSession session = request.getSession();
	        session.setAttribute("updateMem", updateMem);
            session.setAttribute("alertMsg", "정보수정에 성공했습니다.");
            response.sendRedirect(request.getContextPath() + "/selectmember.admin?currentPage=1");
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

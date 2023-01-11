package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FindIdController
 */
@WebServlet("/findId.me")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    request.setCharacterEncoding("UTF-8");
	    
	    String memName = request.getParameter("memName");
	    String phone = request.getParameter("phone");
	    
	   Member m = new Member();
	   m.setMemName(memName);
	   m.setPhone(phone);
	
	   String memId = new MemberService().findId(m); 
	   
	   if(memId != "" ) {
	       request.setAttribute("memId", memId); 
	       request.getRequestDispatcher("views/member/findIdResult.jsp").forward(request, response);
	      // System.out.println(memId);
	   } else {
	       
	       HttpSession session = request.getSession();
	       session.setAttribute("alertMsg", "성함과 휴대폰번호가 존재하지 않습니다.");
           
           RequestDispatcher view = request.getRequestDispatcher("views/member/findId.jsp");
           view.forward(request, response);
	       
	   }
	   
      
       
      // System.out.println(findUserId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

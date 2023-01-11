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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    request.setCharacterEncoding("UTF-8");
	    //뽑아야할 값 - 아이디, 패스워드, 이름, 휴대폰번호, 이메일, 성별, 생년월일
	    String memId = request.getParameter("memId");
	    String memPwd = request.getParameter("memPwd");
	    String memName = request.getParameter("memName");
	    String phone1 = request.getParameter("phone1");
	    String phone2 = request.getParameter("phone2");
	    String phone3 = request.getParameter("phone3");
	    String email = request.getParameter("email");
	    String gender = request.getParameter("gender");
	   // String birthDate = request.getParameter("birthDate");
	    String year = request.getParameter("year");
	    String month = request.getParameter("month");
	    String day = request.getParameter("day");
	    
	    if(month.length() == 1) {
	        month = "0" + month;
	    }
	    
	    String phone = phone1 + "-" + phone2 + "-" + phone3;
	    String birthDate = year + month + day;
	   
	    
	    Member m = new Member(memId, memPwd, memName, phone, email, gender, birthDate);
	    
	    //서비스에 전달하면서 요청처리
	   int result = new MemberService().insertMember(m);
	  
	    // 처리결과
	    if(result>0) {
	        
	       HttpSession session = request.getSession();
	       session.setAttribute("alertMsg", "회원가입이 성공적으로 이루어졌습니다.");
	       
	       response.sendRedirect(request.getContextPath());
	        
	       System.out.println(m);
	        
	    } else {
	        
	        request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
	        response.sendRedirect(request.getContextPath());    
	        
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

package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Grade;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    //인코딩처리
	    request.setCharacterEncoding("UTF-8");
	    String memId = request.getParameter("memId");
	    String memPwd = request.getParameter("memPwd");
	    String saveId = request.getParameter("saveId");
	    
	    //아이디 저장
	    if(saveId != null && saveId.equals("y")) {
	        
	     Cookie cookie = new Cookie("saveId", memId);
	     cookie.setMaxAge(1 * 24 * 60 * 60);
	     response.addCookie(cookie);
	        
	        
	    } else {
	        
	        Cookie cookie = new Cookie("saveId", memId);
	        cookie.setMaxAge(0);
	        response.addCookie(cookie);
	    }
	    
	    Member m = new Member();
	    m.setMemId(memId);
	    m.setMemPwd(memPwd);
	    
	    Member loginUser = new MemberService().loginMember(m);
	    
	    // System.out.println("controller : " + loginUser);
	    
	    HttpSession session = request.getSession();
	    
	    if(loginUser == null) { //로그인 실패시 
	        
	        // session.setAttribute("errorMsg","잘못된 아이디 혹은 잘못된 비밀번호입니다.");
	        
	        response.setContentType("text/html; charset=UTF-8");
	        response.getWriter().println("<script>");
	        response.getWriter().println("alert('잘못된 아이디 혹은 잘못된 비밀번호입니다.');");
	        response.getWriter().println("history.back();");
	        response.getWriter().println("</script>");
	       
	    } else if(loginUser != null && loginUser.getMemId().equals("admin")) {
             
             response.sendRedirect(request.getContextPath() + "/admin");
             
         } else { //로그인 성공시 
             
             String grCode = loginUser.getGrCode();
             
             Grade g = new MemberService().selectGrade(grCode);
             
             session.setAttribute("loginUser", loginUser);
             session.setAttribute("grade", g);
             
             // 성공메세지도 담기
             session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");
             
             // 로그아웃아이콘이 붙은 메인페이지로 이동
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

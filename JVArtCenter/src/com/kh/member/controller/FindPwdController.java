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
 * Servlet implementation class FindPwdController
 */
@WebServlet("/findPwd.me")
public class FindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   request.setCharacterEncoding("UTF-8");
 
	    String memId = request.getParameter("memId");
	    String memName = request.getParameter("memName");
	    String phone = request.getParameter("phone");
	    
	    //전달값 가공처리
	    Member m = new Member();
	    m.setMemId(memId);
	    m.setMemName(memName);
	    m.setPhone(phone);
	    
	    String memPwd = new MemberService().findPwd(m);
	    
    // System.out.println(findPwd);
        //출력
        if(memPwd != "" ) {//결과가 있으면(정보가 맞다면)
           
            //   HttpSession session = request.getSession();
               
            //   session.setAttribute("memId", memId);
           
               // request.setAttribute("alertMsg", "회원님의 아이디는 "+m.getMemId()+ "입니다.");
               request.setAttribute("memPwd", memPwd);
               request.getRequestDispatcher("views/member/findPwdResult.jsp").forward(request, response);
               
              // System.out.println("비밀번호 :"+ memPwd);
        }
        else {//결과가 없으면(정보가 맞지 않으면)
            HttpSession session = request.getSession();
            session.setAttribute("alertMsg", "성함과 휴대폰번호가 존재하지 않습니다.");
            
            RequestDispatcher view = request.getRequestDispatcher("views/member/findPwd.jsp");
            view.forward(request, response);
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

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
 * Servlet implementation class mypageMemUpdateController
 */
@WebServlet("/mypageMemUpdate.me")
public class MypageMemUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMemUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정 
		request.setCharacterEncoding("UTF-8");
		
		
		// 요청시 전달할 값 
		String memId = request.getParameter("memId"); // 로그인한 아이디
		

		String memPwd = request.getParameter("updatePwd"); // 바꿀 비밀번호
		
		
		String updateEmail1 = request.getParameter("updateEmail1"); // 바꿀 이메일 값 1
		String updateEmail2 = request.getParameter("updateEmail2"); // 바꿀 이메일 값 2
		
		String email = updateEmail1 + "@" + updateEmail2; // 바꿀 이메일값 이어준것 

		
		// 원래 태어난 년도
		String birthYear = request.getParameter("year");
		
		// 바꿀 생일 (월)
		String updateBirthDateMonth = request.getParameter("updateBirthDateMonth");
		
		// 바꿀 생일 (일)
		String updateBirthDateDay = request.getParameter("updateBirthDateDay");
		
		// 생년월일 합친거 
		String birthDate = birthYear + updateBirthDateMonth + updateBirthDateDay;
		
		
		
		// 바꿀 핸드폰 번호 
		String updatePhone1 = request.getParameter("updatePhone1");
		String updatePhone2 = request.getParameter("updatePhone2");
		String updatePhone3 = request.getParameter("updatePhone3");
		
		String phone = updatePhone1 + "-" + updatePhone2 + "-" + updatePhone3; 

		
		Member updateM = new Member(memId, memPwd, email, birthDate, phone);
		
		Member updateMem = new MemberService().updateMember(updateM);
		
		HttpSession session = request.getSession();
		
		
		if (updateMem == null) {
			
			session.setAttribute("alertMsg", "회원정보 변경에 실패했습니다.");
			
		} else {
			
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "회원정보가 변경되었습니다.");
			
		}
		
		request.getRequestDispatcher("views/member/mypagePwdConfirm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

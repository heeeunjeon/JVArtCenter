package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class MypageTicketingController
 */
@WebServlet("/mypageTicketing.me")
public class MypageTicketingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageTicketingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    // 나의 예매내역 조회하기
	    // memNo;
	    Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	    int memNo = loginUser.getMemNo();
	    int month = -1;
	    
	    ArrayList<Reservation> list = new ReservationService().selectMyResvList(memNo, month);
	    
	    request.setAttribute("list", list);
	    
	    request.getRequestDispatcher("views/member/mypageTicketing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

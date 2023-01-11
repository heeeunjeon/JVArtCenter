package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.exhibition.model.vo.Exhibition;
import com.kh.member.model.vo.Grade;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class mypageTicketingDetailController
 */
@WebServlet("/mypageTicketingDetail.bo")
public class MypageTicketingDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MypageTicketingDetailController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    int resvNo = Integer.parseInt(request.getParameter("rno"));
	    
	    Reservation rv = new ReservationService().selectMyResvOne(resvNo);
	    
	    int exNo = Integer.parseInt(rv.getExNo());
	    
	    Exhibition ex = new ReservationService().selectExOne(exNo);
	    
	    double discount = ((Grade)request.getSession().getAttribute("grade")).getDiscount();
	    
	    request.setAttribute("rv", rv);
	    request.setAttribute("ex", ex);
	    request.setAttribute("discount", discount);
	    
		request.getRequestDispatcher("views/member/mypageTicketingDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

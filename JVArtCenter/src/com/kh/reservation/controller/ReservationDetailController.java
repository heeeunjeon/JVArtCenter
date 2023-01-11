package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.exhibition.model.vo.Exhibition;
import com.kh.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationStep1Controller
 */
@WebServlet("/detail.resv")
public class ReservationDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    if(request.getSession().getAttribute("loginUser") == null) {
	        
	        request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
	        response.sendRedirect(request.getContextPath() + "/login");
	    } else {
	        
	        int exNo = Integer.parseInt(request.getParameter("exno"));
	        
	        Exhibition ex = new ReservationService().selectExOne(exNo);
	        
	        request.setAttribute("ex", ex);
	        
	        request.getRequestDispatcher("views/reservation/reservationDetailView.jsp").forward(request, response);
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

package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationInsertController
 */
@WebServlet("/update.resv")
public class ReservationUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    // 전달값 뽑기
	    // resvNo, payment, impUid, status, receipt
	    int resvNo = Integer.parseInt(request.getParameter("resvNo"));
	    int payment = Integer.parseInt(request.getParameter("payment"));
	    String impUid = request.getParameter("impUid");
	    String status = request.getParameter("status");
	    String receipt = request.getParameter("receipt");
	    
	    Reservation rv = new Reservation(resvNo, payment, impUid, status, receipt);
	    
	    int result = 0;
	    
	    if(status.equals("paid")) { 
	        
	        // 아임포트의 결제여부가 paid == 결제 성공이라면 결제 정보를 DB에 업데이트하고 결제여부를 Y로 변경
	        rv.setPayStatus("Y");
	        result = new ReservationService().updateReservation(rv);
	    }
	    
	    response.setContentType("text/html; charset=UTF-8"); 
        response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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
 * Servlet implementation class ReservationStep3Controller
 */
@WebServlet("/insert.resv")
public class ReservationInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    request.setCharacterEncoding("UTF-8");
	    
	    // memNo, exNo, exTitle, location, price, date, time, count
	    
	    // 다음 화면에서 보여주기용 정보
	    String exTitle = request.getParameter("exTitle");
	    String location = request.getParameter("location");
	    int price = Integer.parseInt(request.getParameter("price"));
	    String time = request.getParameter("time");
	    
	    // Reservation 에 insert
	    // memNo, exNo, date, count
	    String memNo = request.getParameter("memNo");
	    String exNo = request.getParameter("exNo");
	    String date = request.getParameter("date");
	    int count = Integer.parseInt(request.getParameter("count"));
	    
	    // 필요한 전달값
	    // Member 등급별 할인율
	    // memNo 로 Member, Grade 조인해서 등급별 할인율 가져와야 함
	    // SELECT
	    double discount = new ReservationService().getDiscount(Integer.parseInt(memNo));
	    int discountPrice = (int)(price * count * discount);
	    // 최종 결제할 금액
	    int payment = (price * count) - discountPrice;
	    Reservation rv = new Reservation();
	    rv.setMemNo(memNo);
	    rv.setExNo(exNo);
	    rv.setResvDate(date);
	    rv.setCount(count);
	    rv.setPayment(payment);
	    
	    // 결제 정보 insert
        int result = new ReservationService().insertReservation(rv);
        
        // insert한 결제 정보의 resvNo 가져오기
        int resvNo = new ReservationService().selectResvNo();
        rv.setResvNo(resvNo);
	    
        if(result > 0) {
            request.setAttribute("exTitle", exTitle);
            request.setAttribute("location", location);
            request.setAttribute("price", price);
            request.setAttribute("time", time); 
            request.setAttribute("discountPrice", discountPrice);
            request.setAttribute("rv", rv);
            
            request.getRequestDispatcher("views/reservation/reservationPayView.jsp").forward(request, response);
        } else {
            
            request.setAttribute("errorMsg", "예매 정보 저장에 실패했습니다. 처음으로 돌아갑니다.");
            response.sendRedirect(request.getContextPath() + "/list.resv");
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

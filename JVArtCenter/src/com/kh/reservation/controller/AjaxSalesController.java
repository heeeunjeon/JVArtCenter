package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Sales;

/**
 * Servlet implementation class AjaxSalesDataController
 */
@WebServlet("/sales.st")
public class AjaxSalesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSalesController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    Sales todaySales = new ReservationService().selectTodaySales();
	    Sales weekSales = new ReservationService().selectWeekSales();
	    
	    response.setContentType("application/json; charset=UTF-8");
	    
	    JSONObject json = new JSONObject();
	    
	    json.put("todaySales", todaySales.getTotal());
	    json.put("weekSales", weekSales.getTotal());
	    
	    response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.kh.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Sales;

/**
 * Servlet implementation class AjaxSalesPerMonController
 */
@WebServlet("/salesPerMon.st")
public class AjaxSalesPerMonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSalesPerMonController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    ArrayList<Sales> list = new ReservationService().selectSalesPerMonth();
	    
	    response.setContentType("application/json; charset=UTF-8");
	    
	    new Gson().toJson(list,response.getWriter()); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

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
import com.kh.reservation.model.vo.Rate;

/**
 * Servlet implementation class AjaxReservationPerGenderController
 */
@WebServlet("/ratePerGen.st")
public class AjaxRateByGenderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRateByGenderController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//	    들어가야 하는 것

//	    1. cirecleConfig.data.labels[] <- 10대 남성, 10대 여성, 20대 남성, 20대 여성 ... 데이터 이름
//	    2. circleConfig.data.data[] <- 10대 남성 예매율, 10대 여성 예매율, ... 예매율

//	    ArrayList<Rate>로 받아옴
        response.setCharacterEncoding("UTF-8");
        
        ArrayList<Rate> list = new ReservationService().selectResvRatePerGen();

        response.setContentType("application/json; UTF-8");
        
        new Gson().toJson(list, response.getWriter());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

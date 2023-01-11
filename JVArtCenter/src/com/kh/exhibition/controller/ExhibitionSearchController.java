package com.kh.exhibition.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.exhibition.model.service.ExhibitionService;
import com.kh.exhibition.model.vo.Exhibition;

/**
 * Servlet implementation class exhibitionSearchController
 */
@WebServlet("/search.ex")
public class ExhibitionSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExhibitionSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String searchWord = request.getParameter("searchWord");
	    String exlist = request.getParameter("exlist");
        
        //전시게시판 리스트 페이지에 필요한 정보들을 먼저 조회해 와야함
        ArrayList<Exhibition> list = new ExhibitionService().selectExhibitionSearch(searchWord, exlist);
        
        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(list, response.getWriter());
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

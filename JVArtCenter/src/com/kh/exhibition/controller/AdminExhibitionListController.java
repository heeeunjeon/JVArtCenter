package com.kh.exhibition.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.exhibition.model.service.ExhibitionService;
import com.kh.exhibition.model.vo.Exhibition;

/**
 * Servlet implementation class AdminExhibitionListController
 */
@WebServlet("/admin_list.ex")
public class AdminExhibitionListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminExhibitionListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    int listCount = new ExhibitionService().selectAllCount();
        int currentPage;
        int pageLimit = 10;
        int boardLimit = 10;
        int maxPage;
        int startPage;
        int endPage;
        
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
        maxPage = (int)Math.ceil((double)listCount/boardLimit);
        startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        endPage = startPage + pageLimit - 1;
        if(endPage > maxPage) {
            endPage = maxPage;
        }
        PageInfo pi =  new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        
	    ArrayList<Exhibition> list = new ExhibitionService().selectExhibitionListAll(pi);
	    
	    request.setAttribute("list", list);
        request.setAttribute("pi", pi);
         
        request.getRequestDispatcher("views/admin/adminExhibitionListView.jsp").forward(request,  response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.exhibition.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.exhibition.model.service.ExhibitionService;
import com.kh.exhibition.model.vo.Exhibition;

/**
 * Servlet implementation class AdminExhibitionDetailController
 */
@WebServlet("/admin_detail.ex")
public class AdminExhibitionDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminExhibitionDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int exNo = Integer.parseInt(request.getParameter("eno"));

        Exhibition ex = new ExhibitionService().selectExhibitionDetail(exNo);
        
        File file = new File(request.getSession().getServletContext().getRealPath("/") + File.separator + ex.getExImage());
        if(!file.exists()) {
            ex.setExImage(null);
        }
        if(ex != null) {
            request.setAttribute("ex", ex);
            request.getRequestDispatcher("views/admin/adminExhibitionDetailView.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "전시 상세조회 실패");
           
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

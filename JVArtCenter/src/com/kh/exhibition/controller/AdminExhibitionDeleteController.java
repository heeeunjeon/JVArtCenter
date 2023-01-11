package com.kh.exhibition.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.exhibition.model.service.ExhibitionService;

/**
 * Servlet implementation class AdminNoticeDeleteController
 */
@WebServlet("/admin_delete.ex")
public class AdminExhibitionDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminExhibitionDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
        int eno = Integer.parseInt(request.getParameter("eno"));
        
        int result = new ExhibitionService().deleteExhibition(eno);
  
        if(result > 0) {
            request.getSession().setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/admin_list.ex?currentPage=1");
        } else {
            request.setAttribute("errorMsg", "삭제에 실패했습니다.");
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

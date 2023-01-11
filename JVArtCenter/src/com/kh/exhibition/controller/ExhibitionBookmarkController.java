package com.kh.exhibition.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.exhibition.model.service.ExhibitionService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ExhibitionLikeController
 */
@WebServlet("/bookmark.ex")
public class ExhibitionBookmarkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExhibitionBookmarkController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
	    int exNo = Integer.parseInt(request.getParameter("exNo"));
	    boolean isBM = Boolean.parseBoolean(request.getParameter("isBM"));
	    
	    Member loginUser = (Member)request.getSession().getAttribute("loginUser");
        
        if(loginUser != null) {
            
            int memNo = loginUser.getMemNo();
            int result = 0;
            
            if(isBM) {
                result = new ExhibitionService().deleteBookmark(memNo, exNo);
                if(result > 0) {
                    isBM = false;
                }
                
            } else {
                result = new ExhibitionService().insertBookmark(memNo, exNo);
                if(result > 0) {
                    isBM = true;
                }
            }
            
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().print(isBM);
            
        } else {
            
            request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
            response.sendRedirect(request.getContextPath() + "/login");
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

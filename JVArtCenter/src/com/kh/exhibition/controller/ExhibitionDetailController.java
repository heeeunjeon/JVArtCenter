package com.kh.exhibition.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.exhibition.model.service.ExhibitionService;
import com.kh.exhibition.model.vo.Exhibition;
import com.kh.member.model.vo.Member;
import com.kh.review.model.vo.Review;
/**
 * Servlet implementation class ExhibitionDetailController
 */
@WebServlet("/detail.ex")
public class ExhibitionDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExhibitionDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    int exNo = Integer.parseInt(request.getParameter("eno"));

	    Exhibition ex = new ExhibitionService().selectExhibitionDetail(exNo); //디테일 가져옴
        
        File file = new File(request.getSession().getServletContext().getRealPath("/") + File.separator + ex.getExImage());
        
        if(!file.exists()) {
            ex.setExImage(null);
        }
        
        request.setAttribute("ex", ex);
        
        Member loginUser = (Member)request.getSession().getAttribute("loginUser");
        boolean isBM = false;
        
        if(loginUser != null) {
            
            int memNo = loginUser.getMemNo();
            
            //checked bookmark
            isBM = new ExhibitionService().checkExhibitionBookMarked(memNo , exNo); // 북마크가 있는지 없는지 가져옴 
        }
        
        request.setAttribute("isBM", isBM ); //ISBM이라는 변수를 JSP 에서 사용가능하다 
        ArrayList<Review> review = new ExhibitionService().selectExhibitionReview(exNo); //리뷰리스트를 가져옴
        
        request.setAttribute("review", review ); //리뷰정보를 줌
        
	    request.getRequestDispatcher("views/exhibition/exhibitionDetailView.jsp").forward(request, response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
 }


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
 * Servlet implementation class ExhibitionListController
 */
@WebServlet("/list.ex")
public class ExhibitionListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExhibitionListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String exlist = request.getParameter("term");
	    
	    // 페이징 처리
        int listCount = new ExhibitionService().selectListCount(exlist);
        int currentPage;
        int pageLimit = 5;
        int boardLimit = 5;
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
	       
        //전시게시판 리스트 페이지에 필요한 정보들을 먼저 조회해 와야함
        ArrayList<Exhibition> list = new ExhibitionService().selectExhibitionList(exlist, pi);
        
	    request.setAttribute("exlist", exlist);
	    request.setAttribute("list", list );  // list 라는 키값으로 list 를 그대로 뿌려준다
	    request.setAttribute("pi", pi);
		 
	    request.getRequestDispatcher("views/exhibition/exhibitionListView.jsp").forward(request,  response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

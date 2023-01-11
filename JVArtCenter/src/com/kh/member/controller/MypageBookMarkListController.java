package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.exhibition.model.vo.Exhibition;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MypageBookMarkListController
 */
@WebServlet("/mypageBookMarkList")
public class MypageBookMarkListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageBookMarkListController() {
        super();
        // TODO Auto-generated constructor stub
    } 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    //북마크 리스트페이지에 필요한 데이터를 먼저 조회
	    Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	    int memNo = loginUser.getMemNo();
	    
	    ArrayList<Integer> exNoList = new MemberService().selectMyBookmarkList(memNo);
	    
	    ArrayList<Exhibition> list = new ArrayList<Exhibition>();
	    
	    if(exNoList != null) {
	        
	        for(Integer i : exNoList) {
	            
	            int exNo = i;
	            
	            Exhibition ex = new MemberService().selectMyBookmarkEx(exNo);
	            list.add(ex);
	        }
	    }
	    
	    request.setAttribute("list", list);
       
	    request.getRequestDispatcher("views/member/mypageBookMarkList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

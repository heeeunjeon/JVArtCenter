package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class adminSelectMemberController
 */
@WebServlet("/selectmember.admin")
public class AdminSelectMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelectMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
        String keyword = request.getParameter("keyword");
        String searchword = request.getParameter("searchword");
        
	    int listCount;
	    int currentPage;
	    int pageLimit;
	    int boardLimit;
	    int maxPage;
	    int startPage;
	    int endPage;
	    
        if(keyword != null && keyword.equals("memName")) {
            listCount = new MemberService().selectMemNameListCount(searchword);
        } else if(keyword != null && keyword.equals("phone")) {
            listCount = new MemberService().selectPhoneListCount(searchword);
        } else {
            listCount = new MemberService().selectListCount();
        }

	    currentPage = Integer.parseInt(request.getParameter("currentPage"));
	    pageLimit = 10;
	    boardLimit = 10;
	    maxPage = (int)Math.ceil((double)listCount / boardLimit);
	    startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	    endPage = startPage + pageLimit - 1;


	    if(endPage > maxPage) {
            endPage = maxPage;
        }
	    
	    //페이징바 만들때 필요
	    PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	    
	    ArrayList<Member> list = new ArrayList<>();
        if(keyword != null && searchword != null) {
            list = new MemberService().selectList(pi, keyword, searchword);
        } else {
            list = new MemberService().selectList(pi);
        };
        request.setAttribute("list", list);

        
        if(list != null) {
            request.setAttribute("pi", pi);
            request.setAttribute("list", list);
            request.setAttribute("keyword", keyword);
            request.setAttribute("searchword", searchword);
        }
        
	    request.getRequestDispatcher("views/admin/adminSelectMember.jsp").forward(request, response);
       
        
    }
	    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

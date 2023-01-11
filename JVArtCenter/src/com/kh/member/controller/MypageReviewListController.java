package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class mypageReviewList
 */
@WebServlet("/mypageReview.me")
public class MypageReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
        HttpSession session = request.getSession();
        
	    //System.out.println("세션값 ######### ;" + session.getAttribute("loginUser").toString());
//	    Review review = new Review();
	    
	    Member loginUser = (Member)session.getAttribute("loginUser");
	    int memNo = loginUser.getMemNo();
//	    review.setMemNo(String.valueOf(loginUser.getMemNo())); // session에 memNo 가져오고싶은데 어떻데 가져와야하는지... memno를 보내서 리스트에 보내주니깐
	    //Member loginUser = (Member)session.getAttribute("2");
	  //  int memNo = Integer.parseInt(request.getParameter("mno"));
	   

	    
	    //페이징
	    int listCount; // 현재 총 게시글 갯수
        int currentPage; // 현재 요청한 페이지 (즉, 사용자가 요청한 페이지수)
        int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
        int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 (몇개 단위씩 리스트가 보여질껀지)
        
        int maxPage; // 가장 마지막 페이지가 몇번페이지인지 (총 페이지 수)
        int startPage; // 페이지 하단에 보여질 페이징바의 시작수
        int endPage; // 페이지 하단에 보여질 페이징바의 끝수
        
        // * listCount : 총 게시글 갯수
        listCount = new ReviewService().selectListCount(memNo);
        //현재페이지
       
       currentPage = Integer.parseInt(request.getParameter("currentPage"));
        
        //페이징바의 페이지 최대 갯수
        pageLimit = 10;
        
        //한페이지에 보여질 게시판
        boardLimit = 5;
        
        
        maxPage = (int)Math.ceil((double)listCount / boardLimit);
        
       
        startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        endPage = startPage + pageLimit - 1;
       
        if(endPage > maxPage) {
            endPage = maxPage;
        }
        
       
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit
                                 , maxPage, startPage, endPage);
        
        
        request.setAttribute("pi", pi);
        
        //TODO mno 세션에서 가져온것 확인하고 주석 풀기
        ArrayList<Review>list = new ReviewService().selectMypageReviewList(memNo,pi);      
        //응답페이지에서필요로하는 데이터영역담기
        request.setAttribute("list", list);
        
//        for(Review r : list) {
//            System.out.println(r);
//        }
        
	    //포워딩
	    request.getRequestDispatcher("views/member/mypageReviewList.jsp").forward(request, response);
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

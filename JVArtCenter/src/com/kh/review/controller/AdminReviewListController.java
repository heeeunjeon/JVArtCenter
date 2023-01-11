package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/admin_list.re")
public class AdminReviewListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewListController() {

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int listCount = new ReviewService().adminselectListCount(); // 현재 총 리뷰 숫자 (삭제된 리뷰 포함x)
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        ; // 현재 요청한 페이지 (즉, 사용자가 요청한 페이지 수)
        int pageLimit = 10; // 페이지 하단에 보여질 페이징 바의 페이지 최대 갯수 (직접 설정)
        int boardLimit = 15;// 한 페이지에 보여질 게시글의 최대 갯수 (몇 개 단위씩 리스트가 보여질건지 직접 설정)

        int maxPage = (int) Math.ceil((double) listCount / boardLimit);// 가장 마지막 페이지가 몇 번 페이지인지 (총 페이지 수)
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1; // 페이지 하단에 보여질 페이징 바의 시작 수
        int endPage = startPage + pageLimit - 1; // 페이지 하단에 보여질 페이징 바의 끝 수

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        // 회원 정보 받아올 arraylist -> 서비스로 연결
        ArrayList<Review> list = new ReviewService().adminselectReviewList(pi);

        request.setAttribute("pi", pi);
        request.setAttribute("list", list);

        request.getRequestDispatcher("views/admin/adminReviewListView.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

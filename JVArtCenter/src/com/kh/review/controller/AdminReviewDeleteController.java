package com.kh.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteController
 */
@WebServlet("/admin_delete.re")
public class AdminReviewDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewDeleteController() {
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int reviewNo = Integer.parseInt(request.getParameter("rno"));

        int result = new ReviewService().deleteReview(reviewNo);

        if (result > 0) {
            request.getSession().setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/list.re?currentPage=1");
        } else {
            request.getSession().setAttribute("alertMsg", "처리중에 문제가 발생했습니다.");
            response.sendRedirect(request.getContextPath() + "/list.re?currentPage=1");
        }
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

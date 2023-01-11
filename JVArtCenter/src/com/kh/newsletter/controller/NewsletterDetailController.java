package com.kh.newsletter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.newsletter.model.service.NewsletterService;
import com.kh.newsletter.model.vo.Newsletter;

/**
 * Servlet implementation class NewsletterDetailController
 */
@WebServlet("/detail.news")
public class NewsletterDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsletterDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    int newsNo = Integer.parseInt(request.getParameter("neno"));
	       
        NewsletterService neService = new NewsletterService();
        
        int result = neService.increaseCount(newsNo);
        if(result > 0) {
            Newsletter ne = neService.selectNewsletter(newsNo);
            ArrayList<Attachment> list  = neService.selectAttachmentList(newsNo); 
            
            request.setAttribute("ne", ne);
            request.setAttribute("list", list);
            request.getRequestDispatcher("views/newsletter/newsletterDetailView.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "뉴스레터 상세조회 실패");
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

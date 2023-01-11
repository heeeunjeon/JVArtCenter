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
 * Servlet implementation class AdminNewsletterDetailController
 */
@WebServlet("/admin_detail.news")
public class AdminNewsletterDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewsletterDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
        int newsNo = Integer.parseInt(request.getParameter("neno"));
      
        Newsletter ne = new NewsletterService().selectNewsletter(newsNo);
        ArrayList<Attachment> list  = new NewsletterService().selectAttachmentList(newsNo); 
        
        if(list != null) {
            request.setAttribute("ne", ne);
            request.setAttribute("list", list);
            request.getRequestDispatcher("views/admin/adminNewsletterDetailView.jsp").forward(request, response);
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

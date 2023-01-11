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
 * Servlet implementation class AdminNesletterUpdateFormCotroller
 */
@WebServlet("/admin_updateForm.news")
public class AdminNewsletterUpdateFormCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewsletterUpdateFormCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    NewsletterService neService = new NewsletterService();
	        
        int newsNo = Integer.parseInt(request.getParameter("neno"));
        Newsletter ne = neService.selectNewsletter(newsNo);
        ArrayList<Attachment> list = neService.selectAttachmentList(newsNo);

        request.setAttribute("ne", ne);
        request.setAttribute("list", list);
        
        request.getRequestDispatcher("views/admin/adminNewsletterUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.newsletter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.newsletter.model.service.NewsletterService;
import com.kh.newsletter.model.vo.Newsletter;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminNewsletterInsertController
 */
@WebServlet("/admin_insert.news")
public class AdminNewsletterInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewsletterInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
	    request.setCharacterEncoding("UTF-8");
        
        if(ServletFileUpload.isMultipartContent(request)) {
            int maxSize = 10 * 1024 * 1024;
            String savePath = request.getSession().getServletContext().getRealPath("/resources/newsletter_upfiles/");
            MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
            
            String newsCategory = multiRequest.getParameter("category");
            String newsTitle = multiRequest.getParameter("title");
            String newsContent = multiRequest.getParameter("content");

            Newsletter ne = new Newsletter();
            ne.setNewsCategory(newsCategory);
            ne.setNewsTitle(newsTitle);
            ne.setNewsContent(newsContent);
            
            ArrayList<Attachment> list = new ArrayList<>();
            for(int i = 0; i <= 3; i++) {
                
                String key = "file" + i;
                
                if(multiRequest.getOriginalFileName(key) != null) { // ??????????????? ???????????????
                    
                    Attachment at = new Attachment();
                    at.setOriginName(multiRequest.getOriginalFileName(key));
                    at.setChangeName(multiRequest.getFilesystemName(key));
                    at.setFilePath("resources/newsletter_upfiles/");
                    if(i == 0) { // ???????????????
                        at.setFileLevel(1);
                    } else { // ???????????????
                        at.setFileLevel(2);
                    }
                    
                    list.add(at);
                }
            }

            int result = new NewsletterService().insertNewsletter(ne, list);
            
            if(result > 0) {
                request.getSession().setAttribute("alertMsg", "???????????? ????????? ??????????????????.");
                response.sendRedirect(request.getContextPath() + "/admin_list.news?currentPage=1");
            } else {

                request.setAttribute("errorMsg", "???????????? ????????? ??????????????????.");
            }
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

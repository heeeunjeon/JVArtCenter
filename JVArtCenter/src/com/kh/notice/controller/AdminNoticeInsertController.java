package com.kh.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminNoticeInsertController
 */
@WebServlet("/admin_insert.no")
public class AdminNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertController() {
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
		    String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
		    MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		    
		    String noticeCategory = multiRequest.getParameter("category");
		    String noticeTitle = multiRequest.getParameter("title");
		    String noticeContent = multiRequest.getParameter("content");

		    Notice n =  new Notice();
		    n.setNoticeCategory(noticeCategory);
		    n.setNoticeTitle(noticeTitle);
		    n.setNoticeContent(noticeContent);
		   
		    Attachment at = null;
		    if(multiRequest.getOriginalFileName("upfile") != null) {
		        
		        at = new Attachment();
		        at.setOriginName(multiRequest.getOriginalFileName("upfile"));
		        at.setChangeName(multiRequest.getFilesystemName("upfile"));
		        at.setFilePath("resources/notice_upfiles/");
		    }
		    
		    int result = new NoticeService().insertNotice(n, at);
		    
		    if(result > 0) {
		        request.getSession().setAttribute("alertMsg", "공지사항 작성에 성공했습니다.");
		        response.sendRedirect(request.getContextPath() + "/admin_list.no?currentPage=1");
		    } else {
		        if(at != null) {
		            new File(savePath + at.getChangeName()).delete();
		        }
		        request.setAttribute("errorMsg", "공지사항 작성에 실패했습니다.");
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

package com.kh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeDetailController
 */
@WebServlet("/admin_detail.no")
public class AdminNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    int noticeNo = Integer.parseInt(request.getParameter("nno"));

        Notice n = new NoticeService().selectNotice(noticeNo);
        Attachment at = new NoticeService().selectAttachment(noticeNo); 
        
        if(n != null) {
            request.setAttribute("n", n);
            request.setAttribute("at", at);
            request.getRequestDispatcher("views/admin/adminNoticeDetailView.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "공지사항 상세조회 실패");
           
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

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
 * Servlet implementation class AdminNoticeUpdateController
 */
@WebServlet("/admin_update.no")
public class AdminNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateController() {
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
            
            int noticeNo = Integer.parseInt(multiRequest.getParameter("nno"));
            String noticeCategory = multiRequest.getParameter("category");
            String noticeTitle = multiRequest.getParameter("title");
            String noticeContent = multiRequest.getParameter("content");

            Notice n =  new Notice();
            n.setNoticeNo(noticeNo);
            n.setNoticeCategory(noticeCategory);
            n.setNoticeTitle(noticeTitle);
            n.setNoticeContent(noticeContent);
           
            Attachment at = null;
            if(multiRequest.getOriginalFileName("reUpfile") != null) {
                
                at = new Attachment();
                at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
                at.setChangeName(multiRequest.getFilesystemName("reUpfile"));
                at.setFilePath("resources/notice_upfiles/");
                
                if(multiRequest.getParameter("originFileNo") != null) { // ?????? ???????????? ????????? ?????? => UPDATE????????? ????????? ?????? ???????????? ??????
                    at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
                } else { // ?????? ??????????????? ???????????? ?????? ?????? => INSERT????????? ????????? ????????? ????????????
                    at.setNoticeNo(noticeNo);
                }
            }
           
            int result = new NoticeService().updateNotice(n, at);
            
            if(result > 0) { // ?????? ?????? => ?????? ???????????? ?????? ???, ????????????????????????..
                
                // ?????? ???????????? ?????? ????????? ???????????? ?????? ?????? => ?????? ???????????? ??????
                if(multiRequest.getParameter("originFIleName") != null 
                        && multiRequest.getOriginalFileName("reUpfile") != null) {
                    new File(savePath + multiRequest.getParameter("originFileName")).delete();
                }
                        
                request.getSession().setAttribute("alertMsg", "??????????????? ?????????????????????.");
                response.sendRedirect(request.getContextPath() + "/admin_detail.no?nno=" + noticeNo);
            } else { // ?????? ??????

                request.setAttribute("errorMsg", "????????? ??????????????????.");
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

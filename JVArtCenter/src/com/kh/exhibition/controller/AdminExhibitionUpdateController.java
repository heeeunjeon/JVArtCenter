package com.kh.exhibition.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.exhibition.model.service.ExhibitionService;
import com.kh.exhibition.model.vo.Exhibition;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminExhibitionInsertController
 */
@WebServlet("/admin_update.ex")
public class AdminExhibitionUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminExhibitionUpdateController() {
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
            String savePath = request.getSession().getServletContext().getRealPath("/resources/image/");
            MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
            
            int exNo = Integer.parseInt(multiRequest.getParameter("eno"));
            String lcCode = multiRequest.getParameter("lcCode");
            String exTitle = multiRequest.getParameter("exTitle");
            String exContent = multiRequest.getParameter("exContent");
            String startDate = multiRequest.getParameter("startDate");
            String endDate = multiRequest.getParameter("endDate");
            int price = Integer.parseInt(multiRequest.getParameter("price"));
            String artists = multiRequest.getParameter("artists");

            Exhibition ex = new Exhibition(lcCode, exTitle, exContent, startDate, endDate, price, artists);
            ex.setExNo(exNo);
            if(multiRequest.getOriginalFileName("file0") != null) {
                
                ex.setExThumbnail("resources/image/" + multiRequest.getFilesystemName("file0"));
            } 
            if(multiRequest.getOriginalFileName("file1") != null) { 
                
                ex.setExImage("resources/image/" + multiRequest.getFilesystemName("file1"));
            }
            
            int result = new ExhibitionService().updateExhibition(ex);
            System.out.println(result);
            if(result > 0) {
                request.getSession().setAttribute("alertMsg", "전시 수정에 성공했습니다.");
                response.sendRedirect(request.getContextPath() + "/admin_list.ex?currentPage=1");
            } else {
    
                request.setAttribute("errorMsg", "전시 수정에 실패했습니다.");
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

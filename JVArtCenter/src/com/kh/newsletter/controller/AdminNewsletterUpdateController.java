package com.kh.newsletter.controller;

import java.io.File;
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
 * Servlet implementation class AdminNewsletterUpdateController
 */
@WebServlet("/admin_update.news")
public class AdminNewsletterUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewsletterUpdateController() {
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
            
            int newsNo = Integer.parseInt(multiRequest.getParameter("neno"));
            String newsCategory = multiRequest.getParameter("category");
            String newsTitle = multiRequest.getParameter("title");
            String newsContent = multiRequest.getParameter("content");

            Newsletter ne = new Newsletter();
            ne.setNewsNo(newsNo);
            ne.setNewsCategory(newsCategory);
            ne.setNewsTitle(newsTitle);
            ne.setNewsContent(newsContent);
           
            ArrayList<Attachment> list = new ArrayList<>();
            for(int i = 0; i < 4; i++) {
                
                String key = "re-file" + i;
                String key2 = "originFileNo" + i;
                if(multiRequest.getOriginalFileName(key) != null) { // 새 첨부파일이 존재한다면
                    
                    Attachment at = new Attachment();
                    at.setOriginName(multiRequest.getOriginalFileName(key));
                    at.setChangeName(multiRequest.getFilesystemName(key));
                    at.setFilePath("resources/newsletter_upfiles/");
                    
                    if(multiRequest.getParameter(key2) != null) { // 기존 첨부파일 존재한 경우 => update구문에서 추가적으로 필요한 파일고유번호 담기
                        at.setFileNo(Integer.parseInt(multiRequest.getParameter(key2)));
                    } else { // 기존 첨부파일이 존재하지 않는 경우 => insert구문에 참조할 newsNo 담기
                        at.setNewsNo(newsNo);
                    }
                    
                    list.add(at);
                }
            }
           
            int result = new NewsletterService().updateNewsletter(ne, list);
            
            if(result > 0) { // 수정 성공 => 기존 첨부파일 삭제 후, 상세조회페이지로..
                
                for(int i = 1; i <= 4; i++) {
                    String key = "re-file" + i;
                    String key2 = "originFileNo" + i;
                    String key3 = "originFileName" + i;
                    if(multiRequest.getParameter(key2) != null 
                            && multiRequest.getOriginalFileName(key) != null) {
                        new File(savePath + multiRequest.getParameter(key3)).delete();
                    }
                }
                
                request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
                response.sendRedirect(request.getContextPath() + "/admin_detail.news?neno=" + newsNo);
            } else { // 수정 실패

                request.setAttribute("errorMsg", "수정에 실패했습니다.");
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

package com.kh.newsletter.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.newsletter.model.dao.NewsletterDao;
import com.kh.newsletter.model.vo.Newsletter;

public class NewsletterService {

    public int selectListCount() {
        
        Connection conn = getConnection();
        
        int listCount = new NewsletterDao().selectListCount(conn);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectCateListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new NewsletterDao().selectCateListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectTitleListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new NewsletterDao().selectTitleListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }

    // 회원용 뉴스레터 전체 조회
    public ArrayList<Newsletter> selectNewsletterList(PageInfo pi) {
        
        Connection conn = getConnection();
        
        ArrayList<Newsletter> list = new NewsletterDao().selectNewsletterList(conn, pi);
        
        close(conn);
        
        return list;
    }

    // 회원용 뉴스레터 검색
    public ArrayList<Newsletter> selectNewsletterList(PageInfo pi, String keyword, String searchword) {
        
        Connection conn = getConnection();
        
        ArrayList<Newsletter> list = new NewsletterDao().selectNewsletterList(conn, pi, keyword, searchword);
        
        close(conn);
        
        return list;
    }
    
    public int increaseCount(int newsNo) {
        
        Connection conn = getConnection();
        
        int result = new NewsletterDao().increaseCount(conn, newsNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        return result;
    }
    
    public Newsletter selectNewsletter(int newsNo) {
        
        Connection conn = getConnection();
        
        Newsletter ne = new NewsletterDao().selectNewsletter(conn, newsNo);
        
        close(conn);
        
        return ne;
    }
    
    public ArrayList<Attachment> selectAttachmentList(int newsNo) {
        
        Connection conn = getConnection();
        
        ArrayList<Attachment> list = new NewsletterDao().selectAttachmentList(conn, newsNo);
        
        close(conn);
        
        return list;
    }
    
    // 관리자용 뉴스레터 전체조회
    public ArrayList<Newsletter> selectList(PageInfo pi) {
        
        Connection conn = getConnection();
        
        ArrayList<Newsletter> list = new NewsletterDao().selectList(conn, pi);
        
        close(conn);
        
        return list;
    }
    
    // 관리자용 뉴스레터 검색
    public ArrayList<Newsletter> selectList(PageInfo pi, String keyword, String searchword) {
        
        Connection conn = getConnection();
        
        ArrayList<Newsletter> list = new NewsletterDao().selectList(conn, pi, keyword, searchword);
        
        close(conn);
        
        return list;
    }
    
    public int insertNewsletter(Newsletter ne, ArrayList<Attachment> list) {
        
        Connection conn = getConnection();
        
        int result1 = new NewsletterDao().insertNewsletter(conn, ne);
        
        int result2 =  new NewsletterDao().insertAttachmentList(conn, list);
        

        if(result1 > 0 && result2 > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result1 * result2;
    }
    
    public int updateNewsletter(Newsletter ne, ArrayList<Attachment> list) {
        
        Connection conn = getConnection();
        
        int result1 = new NewsletterDao().updateNewsletter(conn, ne);
        
        int result2 = 1;
        
        if(!list.isEmpty()) { // 첨부파일 변경이 있는 경우
           
            for(int i = 0; i < list.size(); i++) {
                if(list.get(i).getFileNo() != 0) { 
                    // CASE2. 기존첨부파일O, 새로운첨부파일O
                    result2 *= new NewsletterDao().updateAttachment(conn, list.get(i));
                 }  else { 
                    // CASE3. 기존첨부파일X, 새로운첨부파일O 
                    result2 *= new NewsletterDao().insertNewAttachment(conn, list.get(i));
                }
            }
        } 
    
        if(result1 > 0 && result2 > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result1 * result2;
    }
    
    public int deleteNewsletter(int newsNo) {
        
        Connection conn = getConnection();
        
        int result = new NewsletterDao().deleteNewsletter(conn, newsNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    

}

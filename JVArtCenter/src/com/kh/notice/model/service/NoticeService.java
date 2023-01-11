package com.kh.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {

    public int selectListCount() {
       
        Connection conn = getConnection();
        
        int listCount = new NoticeDao().selectListCount(conn);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectCateListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new NoticeDao().selectCateListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectTitleListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new NoticeDao().selectTitleListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectContentListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new NoticeDao().selectContentListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    public ArrayList<Notice> selectList(PageInfo pi) {
        
        Connection conn = getConnection();
        
        ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
        
        close(conn);
        
        return list;
    }
    
    public ArrayList<Notice> selectList(PageInfo pi, String keyword, String searchword) {
        
        Connection conn = getConnection();
        
        ArrayList<Notice> list = new NoticeDao().selectList(conn, pi, keyword, searchword);
        
        close(conn);
        
        return list;
    }
    
    public int increaseCount(int noticeNo) {
        
        Connection conn = getConnection();
        
        int result = new NoticeDao().increaseCount(conn, noticeNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        return result;
    }
    
    public Notice selectNotice(int noticeNo) {
        
        Connection conn = getConnection();
        
        Notice n = new NoticeDao().selectNotice(conn, noticeNo);
        
        close(conn);
        
        return n;
    }
    
    public Attachment selectAttachment(int noticeNo) {
        
        Connection conn = getConnection();
        
        Attachment at = new NoticeDao().selectAttachment(conn, noticeNo);
        
        close(conn);
        
        return at;
    }
    
   public int insertNotice(Notice n, Attachment at) {
       
       Connection conn = getConnection();
       
       int result1 = new NoticeDao().insertNotice(conn, n);
       
       int result2 = 1;
       if(at != null) { // 첨부파일 존재시
           result2 = new NoticeDao().insertAttachment(conn, at);
       }
       
       if(result1 > 0 && result2 > 0) {
           commit(conn);
       } else {
           rollback(conn);
       }
       
       close(conn);
       
       return result1 * result2;
   }
   
   public int updateNotice(Notice n, Attachment at) {
       
       Connection conn = getConnection();
       
       int result1 = new NoticeDao().updateNotice(conn, n);
       
       int result2 = 1;
       if(at != null) { // 새로운 첨부파일 존재시
          if(at.getFileNo() != 0) { // 기존 첨부파일이 있는 경우
              result2 = new NoticeDao().updateAttachment(conn, at);
          } else { // 기존 첨부파일이 없는 경우
              result2 = new NoticeDao().insertNewAttachment(conn, at);
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
   
   public int deleteNotice(int noticeNo) {
       
       Connection conn = getConnection();
       
       int result = new NoticeDao().deleteNotice(conn, noticeNo);
       
       if(result > 0) {
           commit(conn);
       } else {
           rollback(conn);
       }
       
       close(conn);
       
       return result;
   }
    
}

package com.kh.exhibition.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.exhibition.model.dao.ExhibitionDao;
import com.kh.exhibition.model.vo.Exhibition;
import com.kh.review.model.vo.Review;

public class ExhibitionService {
        
    public int selectListCount(String exlist) {
        
        Connection conn = getConnection();
        
        int listCount = new ExhibitionDao().selectListCount(conn, exlist);
        
        close(conn);
        
        return listCount;
    }
    
    public ArrayList<Exhibition> selectExhibitionList(String exlist, PageInfo pi) {
        Connection conn = getConnection();
        
        ArrayList<Exhibition> list  =  new ExhibitionDao().selectExhibitionList(conn, exlist, pi);
        
        close(conn);
        
        return list;
    }
   
    public Exhibition selectExhibitionDetail(int exNo) {
        Connection conn = getConnection();
        Exhibition ex  =  new ExhibitionDao().selectExhibitionDetail(conn, exNo);
        
        close(conn);
        
        return ex;
    }

    public ArrayList<Exhibition> selectExhibitionSearch(String searchWord, String exlist) {
        Connection conn = getConnection();
         ArrayList<Exhibition> list  =  new ExhibitionDao().selectExhibitionSearch(conn, searchWord, exlist);
        
        close(conn);
        
        return list;
    }
    
    //checked bookmark
   public boolean checkExhibitionBookMarked(int memNo, int exNo) { //북마크를 받았으면 리턴
       Connection conn = getConnection();
       
       boolean  isBM = new ExhibitionDao().checkExhibitionBookMarked(conn, memNo, exNo);

       return isBM;

     }
    
    public ArrayList<Review> selectExhibitionReview(int exNo) {
        Connection conn = getConnection();
        
         ArrayList<Review> list  =  new ExhibitionDao().selectExhibitionReview(conn, exNo);
        
        close(conn);
        
        return list;
    }
    
    public int deleteBookmark(int memNo, int exNo) {
        
        Connection conn = getConnection();
        
        int result = new ExhibitionDao().deleteBookmark(conn, memNo, exNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    
    public int insertBookmark(int memNo, int exNo) {
        
        Connection conn = getConnection();
        
        int result = new ExhibitionDao().insertBookmark(conn, memNo, exNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }

    public ArrayList<Exhibition> selectThisYear() {
        
        Connection conn = getConnection();
        
        ArrayList<Exhibition> list = new ExhibitionDao().selectThisYear(conn);
        
        close(conn);
        
        return list;
    }
   
    // 관리자
    public int selectAllCount() {
        
        Connection conn = getConnection();
        
        int count = new ExhibitionDao().selectAllCount(conn);
        
        close(conn);
        
        return count;
    }
    
    public ArrayList<Exhibition> selectExhibitionListAll(PageInfo pi) {
        
        Connection conn = getConnection();
        
        ArrayList<Exhibition> list  =  new ExhibitionDao().selectExhibitionListAll(conn, pi);
        
        close(conn);
        
        return list;
    }
    
    public int insertExhibition(Exhibition ex) {
        
        Connection conn = getConnection();
        
        int result = new ExhibitionDao().insertExhibition(conn, ex);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        return result;
    }
    
    
    public int updateExhibition(Exhibition ex) {
        
        Connection conn = getConnection();
        
        int result = new ExhibitionDao().insertExhibition(conn, ex);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        return result;
    }

    public int deleteExhibition(int ex) {
        
        Connection conn = getConnection();
        
        int result = new ExhibitionDao().deleteExhibition(conn, ex);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
     
        return result;
    }
  }  




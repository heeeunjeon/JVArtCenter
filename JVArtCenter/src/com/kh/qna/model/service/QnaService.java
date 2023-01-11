package com.kh.qna.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.dao.QnaDao;
import com.kh.qna.model.vo.Qna;

public class QnaService {
    
    public int selectListCount() {
        
        Connection conn = getConnection();
        
        int listCount = new QnaDao().selectListCount(conn);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectCateListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new QnaDao().selectCateListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectMemIdListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new QnaDao().selectMemIdListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectTitleListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new QnaDao().selectTitleListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    // 관리자용 전체 조회 (모든 회원의 글들이 나오도록)
    public ArrayList<Qna> selectList(PageInfo pi) {
        
        Connection conn = getConnection();
        
        ArrayList<Qna> list = new QnaDao().selectList(conn, pi);
        
        close(conn);
        
        return list;
    }
    
    public ArrayList<Qna> selectList(PageInfo pi, String keyword, String searchword) {
        
        Connection conn = getConnection();
        
        ArrayList<Qna> list = new QnaDao().selectList(conn, pi, keyword, searchword);
        
        close(conn);
        
        return list;
    }
    
    public int insertQna(Qna q) {
        
        Connection conn = getConnection();
        
        int result = new QnaDao().insertQna(conn, q);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result; 
    }
    
    public Qna selectQna(int qnaNo) {
        
        Connection conn = getConnection();
        
        Qna q = new QnaDao().selectQna(conn, qnaNo);
        
        close(conn);
        
        return q;
    }
    
    public int updateQna(Qna q) {
        
        Connection conn = getConnection();
        
        int result = new QnaDao().updateQna(conn, q);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result; 
    }
    
    public int deleteQna(int qnaNo) {
        
        Connection conn = getConnection();
        
        int result = new QnaDao().deleteQna(conn, qnaNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    
    public int insertQnaAnswer(Qna q) {
        
        Connection conn = getConnection();
        
        int result = new QnaDao().insertQnaAnswer(conn, q);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    
    public int updateQnaAnswer(Qna q) {
        
        Connection conn = getConnection();
        
        int result = new QnaDao().updateQnaAnswer(conn, q);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    
    public int deleteQnaAnswer(int qnaNo) {
        
        Connection conn = getConnection();
        
        int result = new QnaDao().deleteQnaAnswer(conn, qnaNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    
    // 회원용 전체 조회 (로그인한 회원의 글들만 나오도록)
    public ArrayList<Qna> selectOwnList(PageInfo pi, int memNo) {
        
        Connection conn = getConnection();
        
        ArrayList<Qna> list = new QnaDao().selectOwnList(conn, pi, memNo);
        
        close(conn);
        
        return list;
    }
    
    // 마이페이지에서 내 문의내역 상세조회
    public ArrayList<Qna> selectmyQnalist(int qnaNo) {
        
        Connection conn = getConnection();
        
        ArrayList<Qna> list = new QnaDao().selectmyQnalist(conn, qnaNo);
    
        
        close(conn);
        
        
        return list;
    }

    // 마이페이지에서 내 문의내역 수정하기 
    public int mypageUpdateQna(Qna q) {
        
        Connection conn = getConnection();
        
        // Qna updateQ = null;
        
        int result = new QnaDao().mypageUpdateQna(conn, q);
        
        if(result > 0 ) {
            commit(conn);
            
            // 업데이트된 정보 다시 전체조회 해서 가져오자 
            // updateQ  = new QnaDao().selectmypageUpdateQna(conn, q); 
            
        } else {
            rollback(conn);
        }
        
        
        return result;
    }    
    
    public ArrayList<Qna> selectMainList() {
        Connection conn = getConnection();
        
        ArrayList<Qna> list = new QnaDao().selectMainList(conn);
        
        close(conn);
        
        return list;
    }
    
    public ArrayList<Qna> selectmyQna(int memNo) {
        Connection conn = getConnection();
        
        ArrayList<Qna> list = new QnaDao().selectmyQna(conn, memNo);
        
        close(conn);
        
        return list;
    }
    
 // 내문의내역 삭제 
    public int mypageQnadelete(int qnaNo) {
        
        Connection conn = getConnection();
        
        int result = new QnaDao().mypageQnadelete(conn, qnaNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        return result;
        

    }
}

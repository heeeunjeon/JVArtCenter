package com.kh.review.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.vo.Review;

public class ReviewDao {

    Properties prop = new Properties();

    public ReviewDao() {
        String fileName = ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
    
    // REVIEW LIST

    public ArrayList<Review> selectMypageReviewList(Connection conn, int memNo, PageInfo pi) {
        
        ArrayList<Review> list = new ArrayList<>();
        ResultSet rset = null;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectReviewList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            
            pstmt.setInt(1, memNo);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            
            rset = pstmt.executeQuery();
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
            
            while (rset.next()) {
               list.add(
                        new Review(
                                rset.getInt("REVIEW_NO"),
                                rset.getString("MEM_ID"),
                                rset.getString("EX_TITLE"),
                                rset.getString("REVIEW_CONTENT"),
                                rset.getInt("RATING"),
                                format.format(rset.getDate("REVIEW_DATE"))
                         )
                        );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            close(rset);
            close(pstmt);
        }
        
        System.out.println(list);
        return list;
    }

    //   Review Detail
    public Review selectReview(Connection conn, int reviewNo) {
                                         
           // 1) 필요한 변수 먼저 셋팅
           Review n = null;
           PreparedStatement pstmt = null;
           ResultSet rset = null;
           
           String sql = prop.getProperty("selectReviewDetail");
           
           try {
               // 2) pstmt 생성
               pstmt = conn.prepareStatement(sql);
               
               // 3_1) 쿼리문 완성시키기
               pstmt.setInt(1, reviewNo);
               
               // 3_2) 실행 후 결과받기
               rset = pstmt.executeQuery();
               
               // 4) rset 으로부터 조회된 데이터 뽑기
               if(rset.next()) {
                                      
                     n = new Review(rset.getInt("REVIEW_NO")
                             , rset.getString("EX_NO")
                             , rset.getString("REVIEW_CONTENT")
                             ,rset.getInt("RATING")
                             );
                            
               }
               
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               
               // 5) 자원 반납
               close(rset);
               close(pstmt);
           }
           
           // 6) 결과 리턴
           return n;
       }
        
    
    
        //업데이트
        public int updateReview(Connection conn , Review n) {
            
            int result = 0;
            PreparedStatement pstmt = null;
            
            String sql = prop.getProperty("updateReview");
            
            try {
                pstmt = conn.prepareStatement(sql);
                
                pstmt.setString(1, n.getReviewContent());
                pstmt.setInt(2, n.getRating());
                pstmt.setInt(3, n.getReviewNo());
               
                result = pstmt.executeUpdate();
                
            } catch(SQLException e) {
                e.printStackTrace();
            }finally {
                close(pstmt);
            }
            
            return result;
            
    }

        //페이징
    public int selectListCount(Connection conn, int memNo) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
       
        String sql = prop.getProperty("selectListCount");
       
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, memNo);
            
            rset = pstmt.executeQuery();

            if (rset.next()) {
                listCount = rset.getInt("COUNT");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return listCount;
    }


    public int deleteReview(Connection conn, int reviewNo) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("deleteReview");
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewNo);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int adminselectListCount(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("adminselectListCount");
        int listCount = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();
            if (rset.next()) {
                listCount = rset.getInt("COUNT");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return listCount;
    }
    
    public ArrayList<Review> adminselectReviewList(Connection conn, PageInfo pi) {
        ResultSet rset = null;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("adminselectReviewList");
        ArrayList<Review> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            rset = pstmt.executeQuery();
            while (rset.next()) {
                list.add(new Review(rset.getInt("REVIEW_NO"),
                        rset.getString("MEM_ID"),
                        rset.getString("EX_TITLE"),
                        rset.getString("REVIEW_CONTENT"),
                        rset.getInt("RATING"),
                        rset.getString("REVIEW_DATE")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
}

package com.kh.exhibition.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.exhibition.model.vo.Exhibition;
import com.kh.review.model.vo.Review;

public class ExhibitionDao {    
    
    private Properties prop = new Properties();

    public ExhibitionDao() {
    
        String fileName = ExhibitionDao.class.getResource("/sql/exhibition/exhibition-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public int selectListCount(Connection conn, String exlist) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = null;
        
        if (exlist.equals("P"))  sql = prop.getProperty("selectListCount_P");     
        else if (exlist.equals("C")) sql = prop.getProperty("selectListCount_C");
        else if (exlist.equals("F")) sql = prop.getProperty("selectListCount_F");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rset = pstmt.executeQuery();
            if(rset.next()) {
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

    public ArrayList<Exhibition> selectExhibitionList(Connection conn, String exlist, PageInfo pi) {
        
        // SELECT 문 => ResultSet 객체 (여러행 조회)
        
        ArrayList<Exhibition> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = null;
        
        if (exlist.equals("P"))  sql = prop.getProperty("selectExhibitionList_P");     
        else if (exlist.equals("C")) sql = prop.getProperty("selectExhibitionList_C");
        else if (exlist.equals("F")) sql = prop.getProperty("selectExhibitionList_F");
       
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Exhibition(rset.getInt("EX_NO")
                                      , rset.getString("LC_NAME")
                                      , rset.getString("EX_TITLE")
                                      , rset.getString("START_DATE")
                                      , rset.getString("END_DATE")
                                      , rset.getString("EX_THUMBNAIL")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
    public Exhibition selectExhibitionDetail(Connection conn, int exNo) {
        
        Exhibition ex = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = null;
        
        sql = prop.getProperty("selectExhibitionDetail");
             
        try {
            pstmt = conn.prepareStatement(sql);     
            pstmt.setInt(1, exNo);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                
                ex = new Exhibition(rset.getInt("ex_No"), rset.getString("lc_Name"), rset.getString("ex_Title"), rset.getString("ex_Content"), rset.getString("start_Date"), 
                        rset.getString("end_Date"),  rset.getInt("Price"),rset.getString("Artists"),
                        rset.getString("ex_Thumbnail"),rset.getString("ex_Image"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            close(rset);
            close(pstmt);
        }
        return ex;
    }
    
    public ArrayList<Exhibition> selectExhibitionSearch(Connection conn, String searchWord, String exlist) {
        
        ArrayList<Exhibition> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = null;
        
        if (exlist.equals("P"))  sql = prop.getProperty("selectExhibitionSearch_P");     
        else if (exlist.equals("C")) sql = prop.getProperty("selectExhibitionSearch_C");
        else if (exlist.equals("F")) sql = prop.getProperty("selectExhibitionSearch_F");
       
        try {
            pstmt = conn.prepareStatement(sql);     
            pstmt.setString(1, "%" + searchWord + "%");
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Exhibition(rset.getInt("EX_NO")
                                      , rset.getString("LC_NAME")
                                      , rset.getString("EX_TITLE")
                                      , rset.getString("START_DATE")
                                      , rset.getString("END_DATE")
                                      , rset.getString("EX_THUMBNAIL")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public boolean  checkExhibitionBookMarked(Connection conn, int memNo, int exNo) {

        PreparedStatement pstmt = null;
        ResultSet rset = null;
     
        String sql = prop.getProperty("checkExhibitionBookmarked");

          try {
              pstmt = conn.prepareStatement(sql);     
              pstmt.setInt(1,memNo);
              pstmt.setInt(2,exNo);
              rset = pstmt.executeQuery();
              
              while(rset.next()) {
                  
                 return true;  //while문 안에 들어왔다는 것은 북마크 번호가 있다
               
              }
                                       
           } catch (SQLException e) {
                  e.printStackTrace();
           } finally {
                    
              close(pstmt);
           }
          return false; //북마크된 데이터가 하나도 없다
      }

    
    public ArrayList<Review> selectExhibitionReview(Connection conn, int exNo) {
        
        ArrayList<Review> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = null;
        
        sql = prop.getProperty("selectExhibitionReview");
             
        try {
            pstmt = conn.prepareStatement(sql);     
            pstmt.setInt(1, exNo);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {   
                
                list.add(new Review(rset.getInt("review_No"), rset.getString("review_Content"), rset.getInt("rating"),  rset.getString("review_Date")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public int deleteBookmark(Connection conn, int memNo, int exNo) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("deleteBookmark");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,memNo);
            pstmt.setInt(2,exNo);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int insertBookmark(Connection conn, int memNo, int exNo) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertBookmark");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,memNo);
            pstmt.setInt(2,exNo);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public ArrayList<Exhibition> selectThisYear(Connection conn) {
        
        ArrayList<Exhibition> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectThisYear");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Exhibition(rset.getString("EX_TITLE")
                                      , rset.getString("START_DATE")
                                      , rset.getString("END_DATE")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
    // 관리자
    public int selectAllCount(Connection conn) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("selectAllCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rset = pstmt.executeQuery();
            if(rset.next()) {
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
    
    public ArrayList<Exhibition> selectExhibitionListAll(Connection conn, PageInfo pi) {
        
        ArrayList<Exhibition> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("selectExhibitionListAll");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Exhibition(rset.getInt("EX_NO")
                                      , rset.getString("LC_NAME")
                                      , rset.getString("EX_TITLE")
                                      , rset.getString("START_DATE")
                                      , rset.getString("END_DATE")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
    public int insertExhibition(Connection conn, Exhibition ex) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertExhibition");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, ex.getLcCode());
            pstmt.setString(2, ex.getExTitle());
            pstmt.setString(3, ex.getExContent());
            pstmt.setString(4, ex.getStartDate());
            pstmt.setString(5, ex.getEndDate());
            pstmt.setInt(6, ex.getPrice());
            pstmt.setString(7, ex.getArtists());
            pstmt.setString(8, ex.getExThumbnail());
            pstmt.setString(9, ex.getExImage());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    
    
    public int updateExhibition(Connection conn, Exhibition ex) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("updateExhibition");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, ex.getLcCode());
            pstmt.setString(2, ex.getExTitle());
            pstmt.setString(3, ex.getExContent());
            pstmt.setString(4, ex.getStartDate());
            pstmt.setString(5, ex.getEndDate());
            pstmt.setInt(6, ex.getPrice());
            pstmt.setString(7, ex.getArtists());
            pstmt.setString(8, ex.getExThumbnail());
            pstmt.setString(9, ex.getExImage());
            pstmt.setInt(10, ex.getExNo());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int deleteExhibition(Connection conn, int exNo) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("deleteExhibition");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,exNo);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
   
}
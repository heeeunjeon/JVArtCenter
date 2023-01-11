package com.kh.qna.model.dao;

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
import com.kh.qna.model.vo.Qna;

public class QnaDao {
    
    Properties prop = new Properties();
    
    public QnaDao() {
        String fileName = QnaDao.class.getResource("/sql/qna/qna-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public int selectListCount(Connection conn) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectListCount");
        
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
    
    
    public int selectCateListCount(Connection conn, String searchword) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectCateListCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, searchword);
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
    
    public int selectMemIdListCount(Connection conn, String searchword) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectMemIdListCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, searchword);
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
  
    public int selectTitleListCount(Connection conn, String searchword) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectTitleListCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, searchword);
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
    
    public ArrayList<Qna> selectOwnList(Connection conn, PageInfo pi, int memNo) {
        
        ArrayList<Qna> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectOwnList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, memNo);
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            
            rset = pstmt.executeQuery();
            while(rset.next()) {
                list.add(new Qna(rset.getInt("QNA_NO")
                                      , rset.getString("MEM_ID")
                                      , rset.getString("QNA_CATEGORY")
                                      , rset.getString("QNA_TITLE")
                                      , rset.getDate("QNA_DATE")
                                      , rset.getString("ANSWER")
                                      , rset.getDate("ANSWER_DATE")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    
    public ArrayList<Qna> selectList(Connection conn, PageInfo pi) {
        
        ArrayList<Qna> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            
            rset = pstmt.executeQuery();
            while(rset.next()) {
                list.add(new Qna(rset.getInt("QNA_NO")
                                      , rset.getString("MEM_ID")
                                      , rset.getString("QNA_CATEGORY")
                                      , rset.getString("QNA_TITLE")
                                      , rset.getDate("QNA_DATE")
                                      , rset.getString("ANSWER")
                                      , rset.getDate("ANSWER_DATE")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public ArrayList<Qna> selectList(Connection conn, PageInfo pi, String keyword, String searchword) {
        
        ArrayList<Qna> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectList");
        if(keyword != null && keyword.equals("category")) {
           sql = prop.getProperty("selectCategoryList");
        } else if(keyword != null && keyword.equals("memId")) {
            sql = prop.getProperty("selectMemIdList");
        } else if(keyword != null && keyword.equals("title")) {
            sql = prop.getProperty("selectTitleList");
        }
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, searchword);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            
            rset = pstmt.executeQuery();
            while(rset.next()) {
                list.add(new Qna(rset.getInt("QNA_NO")
                                      , rset.getString("MEM_ID")
                                      , rset.getString("QNA_CATEGORY")
                                      , rset.getString("QNA_TITLE")
                                      , rset.getDate("QNA_DATE")
                                      , rset.getString("ANSWER")
                                      , rset.getDate("ANSWER_DATE")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public int insertQna(Connection conn, Qna q) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertQna");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, q.getMemNo());
            pstmt.setString(2, q.getQnaCategory());
            pstmt.setString(3, q.getQnaTitle());
            pstmt.setString(4, q.getQnaContent());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public Qna selectQna(Connection conn, int qnaNo) {
        
        Qna q = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectmyQnalist");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qnaNo);
            
            rset = pstmt.executeQuery();
            if(rset.next()) {
                q = new Qna(rset.getInt("QNA_NO")
                                 , rset.getString("MEM_ID")
                                 , rset.getString("QNA_CATEGORY")
                                 , rset.getString("QNA_TITLE")
                                 , rset.getString("QNA_CONTENT")
                                 , rset.getDate("QNA_DATE")
                                 , rset.getString("ANSWER"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        } 
        return q;
    }
    
   public int updateQna(Connection conn, Qna q) {
      
       int result = 0;
       PreparedStatement pstmt = null;
       
       String sql = prop.getProperty("updateQna");
       
       try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, q.getQnaCategory());
            pstmt.setString(2, q.getQnaTitle());
            pstmt.setString(3, q.getQnaContent());
            pstmt.setInt(4, q.getQnaNo());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
         return result;
   }
   
   public int deleteQna(Connection conn, int qnaNo) {
       
       int result = 0;
       PreparedStatement pstmt = null;
       
       String sql = prop.getProperty("deleteQna");
       
       try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qnaNo);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
         return result;
   }
   
   public int insertQnaAnswer(Connection conn, Qna q) {
       
       int result = 0;
       PreparedStatement pstmt = null;
       
       String sql = prop.getProperty("insertQnaAnswer");
       
       try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, q.getAnswer());
            pstmt.setInt(2, q.getQnaNo());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
         return result;
   }
   
   public int updateQnaAnswer(Connection conn, Qna q) {
       
       int result = 0;
       PreparedStatement pstmt = null;
       
       String sql = prop.getProperty("updateQnaAnwer");
       
       try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, q.getAnswer());
            pstmt.setInt(2, q.getQnaNo());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
         return result;
   }
   
   public int deleteQnaAnswer(Connection conn, int qnaNo) {
       
       int result = 0;
       PreparedStatement pstmt = null;
       
       String sql = prop.getProperty("deleteQnaAnswer");
       
       try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qnaNo);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
         return result;
   }
   

   // 마이페이지에서 내 문의내역 상세 조회 
    public ArrayList<Qna> selectmyQnalist(Connection conn, int qnaNo) {
        
        ArrayList<Qna> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectmyQnalist");
        
        try {
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qnaNo);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                list.add(new Qna(rset.getInt("QNA_NO")
                                      , rset.getString("QNA_CATEGORY")
                                      , rset.getString("QNA_TITLE")
                                      , rset.getString("QNA_CONTENT")
                                      , rset.getDate("QNA_DATE")
                                      , rset.getString("ANSWER")
                                      , rset.getDate("ANSWER_DATE")));
            }


            
        } catch (SQLException e) {
            
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }

    // 마이페이지에서 내 문의내역 수정하기 
    public int mypageUpdateQna(Connection conn, Qna q) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("mypageUpdateQna");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, q.getQnaCategory());
            pstmt.setString(2, q.getQnaTitle());
            pstmt.setString(3, q.getQnaContent());
            pstmt.setInt(4, q.getQnaNo());
            
            result = pstmt.executeUpdate();
            
            
            
        } catch (SQLException e) {
            
            e.printStackTrace();
        } finally {
            close(pstmt);
            
        }
        
        return result;
    }
    
    public ArrayList<Qna> selectMainList(Connection conn) {
        
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Qna> list = new ArrayList<>();
        String sql = prop.getProperty("selectMainList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Qna qna = new Qna();
                qna.setQnaNo(rset.getInt("QNA_NO"));
                qna.setQnaCategory(rset.getString("QNA_CATEGORY"));
                qna.setQnaTitle(rset.getString("QNA_TITLE"));
                qna.setMemNo(rset.getString("MEM_ID"));
                qna.setQnaDate(rset.getDate("QNA_DATE"));
                list.add(qna);
            }
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        }finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public ArrayList<Qna> selectmyQna(Connection conn, int memNo) {
        ArrayList<Qna> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        
        String sql = prop.getProperty("selectmyQna");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, memNo);
            
            rset = pstmt.executeQuery();
       
      while(rset.next()) {
        list.add(new Qna(rset.getInt("QNA_NO")
                   , rset.getString("QNA_CATEGORY")
                   , rset.getString("QNA_TITLE")
                   , rset.getDate("QNA_DATE")
                   , rset.getString("ANSWER")));
      }
            
        } catch (SQLException e) {
            
            
            e.printStackTrace();
        } finally {
            
            close(rset);
            close(pstmt);
            
            
        }

        return list;
    }
    
 // 내 문의 내역 삭제 DAO 
    public int mypageQnadelete(Connection conn, int qnaNo) {
        
    
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("mypageQnadelete");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, qnaNo);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            
            e.printStackTrace();
            
        } finally {
            close(pstmt);
        }
            
        return result;
    }
}

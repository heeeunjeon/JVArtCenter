package com.kh.newsletter.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.newsletter.model.vo.Newsletter;

public class NewsletterDao {

 Properties prop = new Properties();
    
    public  NewsletterDao() {
        
        String fileName = NewsletterDao.class.getResource("/sql/newsletter/newsletter-mapper.xml").getPath();
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

    public ArrayList<Newsletter> selectNewsletterList(Connection conn, PageInfo pi) {
        
        ArrayList<Newsletter> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectNewsletterList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            
            rset = pstmt.executeQuery();
            while(rset.next()) {

                Newsletter ne = new Newsletter();
                ne.setNewsNo(rset.getInt("NEWS_NO"));
                ne.setNewsCategory(rset.getString("NEWS_CATEGORY"));
                ne.setNewsTitle(rset.getString("NEWS_TITLE"));
                ne.setNewsDate(rset.getDate("NEWS_DATE"));
                ne.setNewsCount(rset.getInt("NEWS_COUNT"));
                ne.setTitleImg(rset.getString("TITLEIMG"));
                
                list.add(ne);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public ArrayList<Newsletter> selectNewsletterList(Connection conn, PageInfo pi, String keyword, String searchword) {
        
        ArrayList<Newsletter> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectNewsletterList");
        if(keyword != null && keyword.equals("category")) {
           sql = prop.getProperty("selectCateNewsList");
        } else if(keyword != null && keyword.equals("title")) {
            sql = prop.getProperty("selectTitleNewsList");
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

                Newsletter ne = new Newsletter();
                ne.setNewsNo(rset.getInt("NEWS_NO"));
                ne.setNewsCategory(rset.getString("NEWS_CATEGORY"));
                ne.setNewsTitle(rset.getString("NEWS_TITLE"));
                ne.setNewsDate(rset.getDate("NEWS_DATE"));
                ne.setNewsCount(rset.getInt("NEWS_COUNT"));
                ne.setTitleImg(rset.getString("TITLEIMG"));
                
                list.add(ne);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public int increaseCount(Connection conn, int newsNo) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("increaseCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, newsNo);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
        
    }
    
    public Newsletter selectNewsletter(Connection conn, int newsNo) {
        
        Newsletter ne = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectNewsletter");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, newsNo);
            
            rset = pstmt.executeQuery();
            if(rset.next()) {
                ne = new Newsletter(rset.getInt("NEWS_NO")
                                            , rset.getString("NEWS_CATEGORY")
                                            , rset.getString("NEWS_TITLE")
                                            , rset.getString("NEWS_CONTENT")
                                            , rset.getDate("NEWS_DATE")
                                            , rset.getInt("NEXT_NO")
                                            , rset.getInt("LAST_NO")
                                            , rset.getString("NEXT_TITLE")
                                            , rset.getString("LAST_TITLE"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return ne;
    }
    
    public ArrayList<Attachment> selectAttachmentList(Connection conn, int newsNo) {
        
        ArrayList<Attachment> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectAttachment");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, newsNo);
            
            rset = pstmt.executeQuery();
            while(rset.next()) {
                list.add(new Attachment(rset.getInt("FILE_NO")
                                                   , rset.getString("ORIGIN_NAME")
                                                   , rset.getString("CHANGE_NAME")
                                                   , rset.getString("FILE_PATH")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public ArrayList<Newsletter> selectList(Connection conn, PageInfo pi) {
        
        ArrayList<Newsletter> list = new ArrayList<>();
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
                list.add(new Newsletter(rset.getInt("NEWS_NO")
                                      , rset.getString("NEWS_CATEGORY")
                                      , rset.getString("NEWS_TITLE")
                                      , rset.getDate("NEWS_DATE")
                                      , rset.getInt("NEWS_COUNT")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public ArrayList<Newsletter> selectList(Connection conn, PageInfo pi, String keyword, String searchword) {
        
        ArrayList<Newsletter> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectList");
        if(keyword != null && keyword.equals("category")) {
           sql = prop.getProperty("selectCategoryList");
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
                list.add(new Newsletter(rset.getInt("NEWS_NO")
                                      , rset.getString("NEWS_CATEGORY")
                                      , rset.getString("NEWS_TITLE")
                                      , rset.getDate("NEWS_DATE")
                                      , rset.getInt("NEWS_COUNT")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
      
    public int insertNewsletter(Connection conn, Newsletter ne) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertNewsletter");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ne.getNewsCategory());
            pstmt.setString(2, ne.getNewsTitle());
            pstmt.setString(3, ne.getNewsContent());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
      
        int result = 1; // 누적곱 이용할 예정이므로 1로 셋팅
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertAttachmentList");
        
        try {
            for(Attachment at : list) {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, at.getOriginName());
                pstmt.setString(2, at.getChangeName());
                pstmt.setString(3, at.getFilePath());
                pstmt.setInt(4, at.getFileLevel());
                
                result *= pstmt.executeUpdate();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
        
    }
    
    public int updateNewsletter(Connection conn, Newsletter ne) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("updateNewsletter");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ne.getNewsCategory());
            pstmt.setString(2, ne.getNewsTitle());
            pstmt.setString(3, ne.getNewsContent());
            pstmt.setInt(4, ne.getNewsNo());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int updateAttachment(Connection conn, Attachment at) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("updateAttachment");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, at.getOriginName());
            pstmt.setString(2, at.getChangeName());
            pstmt.setString(3, at.getFilePath());
            pstmt.setInt(4, at.getFileNo());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int insertNewAttachment(Connection conn, Attachment at) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertNewAttachment");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, at.getNewsNo());
            pstmt.setString(2, at.getOriginName());
            pstmt.setString(3, at.getChangeName());
            pstmt.setString(4, at.getFilePath());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int deleteNewsletter(Connection conn, int newsNo) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("deleteNewsletter");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, newsNo);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
       
}

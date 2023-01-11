package com.kh.notice.model.dao;

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
import com.kh.notice.model.vo.Notice;

public class NoticeDao {
    
    Properties prop = new Properties();
    
    public  NoticeDao() {
        
        String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
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
  
    public int selectContentListCount(Connection conn, String searchword) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectContentListCount");
        
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
    
    public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
        
        ArrayList<Notice> list = new ArrayList<>();
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
                list.add(new Notice(rset.getInt("NOTICE_NO")
                                      , rset.getString("NOTICE_CATEGORY")
                                      , rset.getString("NOTICE_TITLE")
                                      , rset.getDate("NOTICE_DATE")
                                      , rset.getInt("NOTICE_COUNT")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }

public ArrayList<Notice> selectList(Connection conn, PageInfo pi, String keyword, String searchword) {
        
        ArrayList<Notice> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectList");
        if(keyword != null && keyword.equals("category")) {
           sql = prop.getProperty("selectCategoryList");
        } else if(keyword != null && keyword.equals("title")) {
            sql = prop.getProperty("selectTitleList");
        } else if(keyword != null && keyword.equals("content")) {
            sql = prop.getProperty("selectContentList");
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
                list.add(new Notice(rset.getInt("NOTICE_NO")
                                      , rset.getString("NOTICE_CATEGORY")
                                      , rset.getString("NOTICE_TITLE")
                                      , rset.getDate("NOTICE_DATE")
                                      , rset.getInt("NOTICE_COUNT")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }

    public int increaseCount(Connection conn, int noticeNo) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("increaseCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, noticeNo);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
        
    }
    
    public Notice selectNotice(Connection conn, int noticeNo) {
        
        Notice n = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectNotice");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, noticeNo);
            
            rset = pstmt.executeQuery();
            if(rset.next()) {
                n = new Notice(rset.getInt("NOTICE_NO")
                                  , rset.getString("NOTICE_CATEGORY")
                                  , rset.getString("NOTICE_TITLE")
                                  , rset.getString("NOTICE_CONTENT")
                                  , rset.getDate("NOTICE_DATE")
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
        return n;
    }
    
    public Attachment selectAttachment(Connection conn, int noticeNo) {
        
        Attachment at = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectAttachment");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, noticeNo);
            
            rset = pstmt.executeQuery();
            if(rset.next()) {
                at = new Attachment(rset.getInt("FILE_NO")
                                             , rset.getString("ORIGIN_NAME")
                                             , rset.getString("CHANGE_NAME")
                                             , rset.getString("FILE_PATH"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return at;
    }
    
    public int insertNotice(Connection conn, Notice n) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertNotice");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, n.getNoticeCategory());
            pstmt.setString(2, n.getNoticeTitle());
            pstmt.setString(3, n.getNoticeContent());
           
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int insertAttachment(Connection conn, Attachment at) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertAttachment");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, at.getOriginName());
            pstmt.setString(2, at.getChangeName());
            pstmt.setString(3, at.getFilePath());
           
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int updateNotice(Connection conn, Notice n) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("updateNotice");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, n.getNoticeCategory());
            pstmt.setString(2, n.getNoticeTitle());
            pstmt.setString(3, n.getNoticeContent());
            pstmt.setInt(4, n.getNoticeNo());
            
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
            pstmt.setInt(1, at.getNoticeNo());
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
    
    public int deleteNotice(Connection conn, int noticeNo) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("deleteNotice");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, noticeNo);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
}

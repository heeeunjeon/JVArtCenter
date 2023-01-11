package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.exhibition.model.vo.Exhibition;
import com.kh.member.model.vo.Grade;
import com.kh.member.model.vo.Member;
import static com.kh.common.JDBCTemplate.*;

public class MemberDao {
    
    private Properties prop = new Properties();
    
    public MemberDao() {
        String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
        
        try {
      prop.loadFromXML(new FileInputStream(fileName));
        } catch(IOException e) {
            e.printStackTrace();
        }
    }
    
    //로그인서비스
    public Member loginMember(Connection conn , Member m) {
        
        //필요한 변수 셋팅
        Member loginUser = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("loginMember");
        
        try {
            //쿼리문 실행에 필요한 객체 생성
            pstmt = conn.prepareStatement(sql);
            
            //미완성 쿼리문 완성시키기
            pstmt.setString(1, m.getMemId());
            pstmt.setString(2, m.getMemPwd());
            
            //쿼리문 실행 후 결과받기
            rset = pstmt.executeQuery();
            
            //rset으로 커서를 움직여가며 값 뽑기
            if(rset.next()) {
                
                loginUser = new Member(rset.getInt("MEM_NO"),
                                                     rset.getString("GR_CODE"),
                                                     rset.getString("MEM_ID"),
                                                     rset.getString("MEM_PWD"),
                                                     rset.getString("MEM_NAME"),
                                                     rset.getString("GENDER"),
                                                     rset.getString("EMAIL"),
                                                     rset.getString("BIRTH_DATE"),
                                                     rset.getString("PHONE"),
                                                     rset.getDate("ENROLL_DATE"),
                                                     rset.getString("MEM_STATUS"));
                
            }
            // 이 시점 기준으로
            // 만약 일치하는 회원을 찾았다면 loginUser 에는 해당 회원의 정보가 다 담겨있을 것
            // 만약 일치하는 회원을 못찾았다면 loginUser 에는 null 값이 들어있을 것
            
        } catch (SQLException e) {
           
            e.printStackTrace();
        } finally { 
            //자원반납
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        //결과리턴
        return loginUser;
        
    }
    
    public Grade selectGrade(Connection conn, String grCode) {
        
        Grade g = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectGrade");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, grCode);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                
                g = new Grade(rset.getString("GR_CODE")
                            , rset.getString("GR_NAME")
                            , rset.getDouble("DISCOUNT"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return g;
    }
    

    // 회원가입 서비스
    public int insertMember(Connection conn, Member m) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("insertMember");
        
        try {
            pstmt=conn.prepareStatement(sql);
            
            pstmt.setString(1, m.getMemId());
            pstmt.setString(2, m.getMemPwd());
            pstmt.setString(3, m.getMemName());
            pstmt.setString(4, m.getPhone());
            pstmt.setString(5, m.getEmail());
            pstmt.setString(6, m.getGender());
            pstmt.setString(7, m.getBirthDate());
            
            result = pstmt.executeUpdate();
       
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        } return result;
   
    }
    
    //아이디 찾기 
    public String findId(Connection conn, Member m) {
        
        String memId = "";
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("findUserId");
        
        try {
            pstmt= conn.prepareStatement(sql);
            
            pstmt.setString(1, m.getMemName());
            pstmt.setString(2, m.getPhone());
                                
            rset = pstmt.executeQuery();
            
            
           if(rset.next()) {
               
               memId = rset.getString("MEM_ID");
               
           }
           
                   
        } catch (SQLException e) {
           
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        return memId;
    }
    
    // 비밀번호 찾기
    public String findPwd(Connection conn, Member m) {
        String memPwd = "";
        PreparedStatement pstmt= null;
        ResultSet rset = null;
        String sql = prop.getProperty("findPwd");
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, m.getMemId());
            pstmt.setString(2, m.getMemName());
            pstmt.setString(3, m.getPhone());
            rset = pstmt.executeQuery();
            if(rset.next()) {
             memPwd = rset.getString("MEM_PWD");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        return memPwd;
    }
    
    public int idCheck(Connection conn, String checkId) {
        
        // SELECT 문 => ResultSet 객체 (숫자 하나)
        
        int count = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("idCheck");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, checkId);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                count = rset.getInt("COUNT(*)");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return count; // 중복된 아이디가 있다면 1, 없다면 0
    }
    
    public int emailCheck(Connection conn, String email) {
        
        int count = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("emailCheck");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, email);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                count = rset.getInt("COUNT(*)");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return count; // 중복된 아이디가 있다면 1, 없다면 0
    }
   
    // 회원 정보 수정 DAO 
    public int updateMember(Connection conn, Member updateM) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("updateMember");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, updateM.getMemPwd());
            pstmt.setString(2, updateM.getEmail());
            pstmt.setString(3, updateM.getBirthDate());
            pstmt.setString(4, updateM.getPhone());
            pstmt.setString(5, updateM.getMemId());
            
            result = pstmt.executeUpdate();

            
        } catch (SQLException e) {

            e.printStackTrace();
            
        } finally {
            
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    // 수정된 회원정보 조회하는 DAO 
    public Member selectUpdateMember(Connection conn, Member updateM) {
        Member updateMem = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectUpdateMem");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, updateM.getMemId());
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                updateMem = new Member(rset.getInt("MEM_NO"),
                               rset.getString("GR_CODE"),
                               rset.getString("MEM_ID"),
                               rset.getString("MEM_PWD"),
                               rset.getString("MEM_NAME"), 
                               rset.getString("GENDER"),
                               rset.getString("EMAIL"),
                               rset.getString("BIRTH_DATE"),
                               rset.getString("PHONE"),
                               rset.getDate("ENROLL_DATE"),
                               rset.getString("MEM_STATUS"));
            } 
            
        } catch (SQLException e) {
            
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }

        return updateMem;
    }
    
    // 내 북마크리스트 조회
    public ArrayList<Integer> selectMyBookmarkList(Connection conn, int memNo) {
        
        ArrayList<Integer> exNoList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectMyBookmarkList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, memNo);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                exNoList.add(rset.getInt("EX_NO"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return exNoList;
    }
    public Exhibition selectMyBookmarkEx(Connection conn, int exNo) {
        
        Exhibition ex = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectMyBookmarkEx");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, exNo);
            rset = pstmt.executeQuery();
            if(rset.next()) {
                
                ex = new Exhibition();
                ex.setExNo(rset.getInt("EX_NO"));
                ex.setExTitle(rset.getString("EX_TITLE"));
                ex.setExThumbnail(rset.getString("EX_THUMBNAIL"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return ex;
    }
    
    // ----- 관리자
    // 관리자 회원조회
    public Member selectMemberList(Connection conn, int mno) {

        Member m = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectMemberList");

        try {

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, mno);
            rset = pstmt.executeQuery();

            if (rset.next()) {

                m = new Member(rset.getString("GR_CODE"),
                        rset.getString("MEM_ID"),
                        rset.getString("MEM_PWD"),
                        rset.getString("MEM_NAME"),
                        rset.getString("PHONE"),
                        rset.getString("EMAIL"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }

        return m;
    }

    public int deleteMember(Connection conn, int memNo) {

        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("deleteMember");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, memNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }

    public int adminUpdateMember(Connection conn, Member m) {

        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("updateMember");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, m.getGrCode());
            pstmt.setString(2, m.getMemPwd());
            pstmt.setString(3, m.getMemName());
            pstmt.setString(4, m.getPhone());
            pstmt.setString(5, m.getEmail());
            pstmt.setInt(6, m.getMemNo());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;

    }

    public int selectListCount(Connection conn) {

        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectListCount");

        try {
            pstmt = conn.prepareStatement(sql);

            rset = pstmt.executeQuery();

            if (rset.next()) {

                listCount = rset.getInt("COUNT(*)");
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {

            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);

        }
        return listCount;
    }

    public int selectMemNameListCount(Connection conn, String searchword) {

        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectMemNameListCount");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, searchword);
            rset = pstmt.executeQuery();

            if (rset.next()) {

                listCount = rset.getInt("COUNT(*)");
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {

            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);

        }
        return listCount;
    }

    public int selectPhoneListCount(Connection conn, String searchword) {

        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectPhoneListCount");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, searchword);
            rset = pstmt.executeQuery();

            if (rset.next()) {

                listCount = rset.getInt("COUNT(*)");
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {

            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);

        }
        return listCount;
    }

    public ArrayList<Member> selectList(Connection conn, PageInfo pi) {

        ArrayList<Member> list = new ArrayList<>();
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
            while (rset.next()) {

                list.add(new Member(rset.getInt("MEM_NO"),
                        rset.getString("GR_NAME"),
                        rset.getString("MEM_ID"),
                        rset.getString("MEM_PWD"),
                        rset.getString("MEM_NAME"),
                        rset.getString("GENDER"),
                        rset.getString("EMAIL"),
                        rset.getString("BIRTH_DATE"),
                        rset.getString("PHONE"),
                        rset.getDate("ENROLL_DATE"),
                        rset.getString("MEM_STATUS")));
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        return list;

    }

    public ArrayList<Member> selectList(Connection conn, PageInfo pi, String keyword, String searchword) {

        ArrayList<Member> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectList");
        if (keyword != null && keyword.equals("memName")) {
            sql = prop.getProperty("selectMemNameList");
        } else if (keyword != null && keyword.equals("phone")) {
            sql = prop.getProperty("selectPhoneList");
        }

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, searchword);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);

            rset = pstmt.executeQuery();
            while (rset.next()) {

                list.add(new Member(rset.getInt("MEM_NO"),
                        rset.getString("GR_NAME"),
                        rset.getString("MEM_ID"),
                        rset.getString("MEM_PWD"),
                        rset.getString("MEM_NAME"),
                        rset.getString("GENDER"),
                        rset.getString("EMAIL"),
                        rset.getString("BIRTH_DATE"),
                        rset.getString("PHONE"),
                        rset.getDate("ENROLL_DATE"),
                        rset.getString("MEM_STATUS")));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public int deleteMember(Connection conn, Member m) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("deleteMember");
        
        try {

            pstmt = conn.prepareStatement(sql);
            
        
            pstmt.setString(1, m.getMemId());
            pstmt.setString(2, m.getMemPwd());
            

            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            

            JDBCTemplate.close(pstmt);
        }
        

        return result;

}
}
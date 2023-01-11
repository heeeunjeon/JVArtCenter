package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.exhibition.model.vo.Exhibition;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Grade;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class MemberService {

    //로그인 서비스
    public Member loginMember(Member m){
        
        Connection conn = JDBCTemplate.getConnection();
        
        Member loginUser = new MemberDao().loginMember(conn, m);
        
        JDBCTemplate.close(conn);
        
        return loginUser;
    }
    
    // 회원 등급명 가져오기
    public Grade selectGrade(String grCode) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        Grade g = new MemberDao().selectGrade(conn, grCode);
        
        JDBCTemplate.close(conn);
        
        return g;
    }
    
    //회원가입용 서비스
    public int insertMember(Member m) {
        Connection conn = JDBCTemplate.getConnection();
        int result = new MemberDao().insertMember(conn, m);
        
        if(result>0) { //성공시
            JDBCTemplate.commit(conn);
        } else { //실패시
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
            
        
    }
    
    //회원 아이디 찾기
    public String findId(Member m) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        String memId = new MemberDao().findId(conn, m);
        
        JDBCTemplate.close(conn);
        
        return memId ;
                    
    }
    
    // 회원 비밀번호 찾기  서비스
    public String findPwd(Member m) {
     Connection conn = JDBCTemplate.getConnection();
      String memPwd = new MemberDao().findPwd(conn, m);
       JDBCTemplate.close(conn);
       return memPwd;
     }
    
   //아이디 중복체크
   public int idCheck(String checkId) {
       
       Connection conn = JDBCTemplate.getConnection();
       
       int count = new MemberDao().idCheck(conn, checkId);
       
       JDBCTemplate.close(conn);
       
       return count;
   }
   
   // 이메일 중복체크
    public int emailCheck(String email) {
           
           Connection conn = JDBCTemplate.getConnection();
           
           int count = new MemberDao().emailCheck(conn, email);
           
           JDBCTemplate.close(conn);
           
           return count;
       }
    
    // 회원정보수정 업데이트 서비스 
    public Member updateMember(Member updateM) {
        Connection conn = JDBCTemplate.getConnection();
        
        Member updateMem = null;
        
        int result = new MemberDao().updateMember(conn, updateM);
    
        
        if (result > 0) { // 수정 성공했다면 
            JDBCTemplate.commit(conn);
            
            // 업데이트된 정보 다시 전체조회 해서 가져오자 
            updateMem = new MemberDao().selectUpdateMember(conn, updateM); 
            
        } else { // 수정 실패했다면 
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);

        
        return updateMem;
    }
    
    // 내 북마크리스트 조회
    public ArrayList<Integer> selectMyBookmarkList(int memNo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        ArrayList<Integer> exNoList = new MemberDao().selectMyBookmarkList(conn, memNo);
        
        JDBCTemplate.close(conn);
        
        return exNoList;
    }
    public Exhibition selectMyBookmarkEx(int exNo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        Exhibition ex = new MemberDao().selectMyBookmarkEx(conn, exNo);
        
        JDBCTemplate.close(conn);
        
        return ex;
    }
    
    
    // ----- 관리자
    
    //관리자 회원수정 
    public Member selectMemberList(int mno){
        
        Connection conn = JDBCTemplate.getConnection();
        
        Member m = new MemberDao().selectMemberList(conn, mno);

  
        JDBCTemplate.close(conn);

        
        return m;
        
    }
    
    public int deleteMember(int memNo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = new MemberDao().deleteMember(conn, memNo);
        
        if(result > 0) {
            JDBCTemplate.commit(conn);
        } 
        else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
        
        return result;
    }
     
    public Member adminUpdateMember(Member m) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = new MemberDao().updateMember(conn, m);
        Member updateMem = null;
        
        if(result > 0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        
        return updateMem;
        
    }
     
    public int selectListCount() {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int listCount = new MemberDao().selectListCount(conn);
        
        JDBCTemplate.close(conn);
        
        return listCount;
        
    }
    
    public int selectMemNameListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new MemberDao().selectMemNameListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    public int selectPhoneListCount(String searchword) {
        
        Connection conn = getConnection();
        
        int listCount = new MemberDao().selectPhoneListCount(conn, searchword);
        
        close(conn);
        
        return listCount;
    }
    
    public ArrayList<Member> selectList(PageInfo pi){
        
        Connection conn = JDBCTemplate.getConnection();
        
        ArrayList<Member> list = new MemberDao().selectList(conn, pi);
        
        JDBCTemplate.close(conn);
        
        return list;
        
    }
     
    public ArrayList<Member> selectList(PageInfo pi, String keyword, String searchword) {
        
        Connection conn = getConnection();
        
        ArrayList<Member> list = new MemberDao().selectList(conn, pi, keyword, searchword);
        
        close(conn);
        
        return list;
    }
    
public int deleteMember(Member m) {
        

        Connection conn = JDBCTemplate.getConnection();
        
    
        int result = new MemberDao().deleteMember(conn, m);
        
    
        if(result > 0) { 
            JDBCTemplate.commit(conn);
        }
        else { 
            JDBCTemplate.rollback(conn);
        }
        
    
        JDBCTemplate.close(conn);
        
    
        return result;
        
        
        
    }
    
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
	/* 마이페이지 틀에 대한 스타일 */
    #content_2>div { float: left;}
    #mypage_menubar {
      width: 20%;
      height: 100%;
      padding: 50px;
      font-size: 20px;
    }
   #mypage_content { width: 80%;}
   /* MYPAGE 문구에 대한 스타일 */
   #mypage_text {
      font-size: 35px;
      font-weight: bold;
    }
</style>
</head>
<body>

     <!-- 마이페이지 메뉴영역 -->
     <div id="mypage_menubar"> 
       <div id="mypage_text">
         <a href="<%= path %>/mypageMain.me">MY PAGE</a>
       </div>

       <hr>

       <a href="<%= path %>/mypagePwdConfirm.me">회원정보수정</a> <br>
       <a href="<%= path %>/mypageTicketing.me">예매내역</a> <br>
       <a href="<%= path %>/mypageQnA.me">문의내역</a> <br>
       <a href="<%= path %>/mypageReview.me?currentPage=1">리뷰</a> <br>
       <a href="<%= path %>/mypageBookMarkList">북마크</a> <br>
     </div>
       
  </body>
</html>
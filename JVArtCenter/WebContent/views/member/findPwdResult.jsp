<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- import 할 것들 --%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%@ include file="../common/menubar.jsp" %>
<% String memPwd = (String)request.getAttribute("memPwd"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
	
	#content { height: 600px; } 
	
	#findid{
      margin-top: 100px; 
      width: 800px;
      height: 300px;
      background-color: lightgray;
      margin: auto;

      }
      #findid p{
        padding-top: 100px;
        font-size: 30px;
        text-align: center;
      }
      #login{
        margin-left: 265px;
        margin-top: 20px;
      
      }
     
</style>
</head>
<body>

    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->
      
   
      <div id="content">
        <!--바디-->
        <div id="content_1"></div>
        <div id="content_2">

  <div id="findid">
    <p>회원님의 비밀번호는<%=memPwd %> 입니다.</p>
   
  </div> 		
  <button id="login" class="btn btn-dark" onclick="login();">로그인하러가기 </button>
  
      
              
            
        </div>
        <div id="content_3"></div>
    </div>
   </div>
    
   <%@ include file="../common/footerbar.jsp" %>

   <script>
    function login(){
    	location.href="<%= contextPath %>/login";
    }
   </script>
  </body>
</html>
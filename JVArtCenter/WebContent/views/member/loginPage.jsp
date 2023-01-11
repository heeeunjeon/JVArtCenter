<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member" %>
<%@ include file="../common/menubar.jsp" %>
	
<% 	Cookie[] cookies = request.getCookies();
		String saveId = "";
		if(cookies != null) {
			
	for(int i = 0; i < cookies.length; i++) {
		
		
		if(cookies[i].getName().equals("saveId")) {
			saveId = cookies[i].getValue();
			break;
		}
	}
}
	%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 700px; }

        #content_2{
            margin: auto;
        }

        #hr{
            width: 50em;
            margin: auto;
        }
        #login{
            font-size : 70px;
            text-align: center;
            font-weight: 500;
        }
        #loginpg{
            margin : auto;
        }
         #loginbtn{
            width: 200px;
            margin-left : 90px;
           
        }
        #registerbtn{
            width:200px;
            margin-left : 110px
        }
        #memId, #memPwd{
            border-radius: 3px;
            width: 22em;
            height: 3em; 
            margin-left: 20px;
            padding : 10px;
            
        }
        #findId, #findPwd{
            color: rgb(12, 0, 0);
            text-decoration: none;
            font-weight : 900;

        }
        #saveId:hover{
            cursor: pointer;
        }
       
        #memberregi{
            font-weight: 500;
            color: rgba(0, 0, 0, 0.59);
            font-size: 25px;
        }

        #saveId{
            font-weight: 800;
           
        }
     
</style>
</head>
<body>

    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->
      

      <div id="navi">
        <!--세부메뉴 영역-->
        
      </div>
       <!-- 로그인 실패시 다시 로그인 페이지로 -->

      <div id="content">
        <!--바디-->
        <div id="content_1"></div>
        
     
		    <div id="content_2">

		  	    <form id="login-form" action="<%= contextPath %>/login.me" method="post">
		        
		            <h3 id="login">로그인</h3>
                    <div class="progress">
                     <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
                     </div>
                    <br>
    <table id="loginpg" >
       <tr>
            <td><input type="text" placeholder="아이디" id="memId" name="memId" required autofocus></td>
            <td width="60"></td>
            <td rowspan="2" colspan="2"><p id="memberregi" style="text-align:center;">
                <br>아직 회원이 아니신가요?<br>
                회원가입을 하시면<br>
                전시 할인 혜택을 받으실 수 있습니다.</p></td>
       </tr>
       <tr>
            <td><input type="password" placeholder="비밀번호" id="memPwd" name="memPwd" required>
            
       </tr>
       <tr>
            <td><input type="checkbox" class="form-check-input"  value="y" name="saveId" id="saveId" style="margin-left: 25px;">&nbsp;<label for ="saveId" id="saveId">아이디저장</label> &nbsp;&nbsp;
            <a href="<%= contextPath %>/findIdForm.me" id="findId">아이디찾기</a> | <a href="<%= contextPath %>/findPwdForm.me" id="findPwd">비밀번호 찾기</a>
            <td colspan="2"></td>   
       </tr>
       <tr>
        <td height="20px"></td>
        <td height="20px"></td>
       </tr>
       <tr>
            <td>
                <button type="submit" id="loginbtn" class="btn btn-primary">로그인</button>
            </td>
            <td></td>
            <td><button type="button" id="registerbtn" class="btn btn-dark" onclick="agreePage();">가입하기</button></td>
       </tr>
    </table>
		       
		      </form> 
			</div>
		 
		  	  	
        <div id="content_3"></div>
      </div>	
    
    <script>
    
		$(function() {
		
		var saveId = "<%= saveId %>"; 
		
		if(saveId != "") { // 쿠키가 있는 경우
			
			$("#login-form input[name=memId]").val(saveId);
			$("#saveId").attr("checked", true);
		}
		
				});
    
    	 function agreePage(){
    		
    	 	location.href = "<%= contextPath %>/enrollAgree.me";
    	 }
    	 
    </script>
      
      
   </div> 
    
    <%@ include file="../common/footerbar.jsp" %>

  </body>
</html>
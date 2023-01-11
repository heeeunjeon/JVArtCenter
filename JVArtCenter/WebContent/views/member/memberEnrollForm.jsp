<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>

<style>

     #register{
      font-size: 40px;
      text-align: center;
      font-weight: 500;
      } 
      #known{
        font-size: 15px;
        font-weight: 600;
        text-align: center;
      }   
     .must::before{
       content: "*";
       color: red;
     }
     #resetbtn, #submitbtn {
       width: 15% !important;
       vertical-align: center;
     }
     
     #enroll-form {
     	width : 100%;
     	margin : auto;
     }
     
     #userId, #userPassword, #pwdChecked, #name, #telephone
     , #email, #gender, #birthday {
		height : 40px;
		margin : 15px;
	 }
	 #enroll>div>label, #enroll>div>input {
     	height : 100%;
     	padding : 5px;
     }
	 
	 #enroll label {
	 	width : 150px;
	 }
	 
	 #enroll input[type=text], #enroll input[type=password] {
	 	width : 250px;
	 }
	 #telephone>input {
	 	width : 100px !important;
	 }
	 #emailid, #domain-text, #domain-list { width : 150px !important; }
	 
	 .box {
	 	width : 100px;
	 	height : 100%;
	 }
	 
	 #idCheck, #emailCheck {
	 	height : 100%;
	 	margin : 0px 5px !important;
	 	padding : 10px 20px;
	 	vertical-align : center;
	 }
	 #enroll button:hover{ cursor: pointer; }
	 
	 #gender input[type=radio] {
	 	width : 17px !important;
	 	margin-right : 10px;
	 	height : 17px !important;
	 }
	 #gender span {
	 	margin-right : 10px;
	 	height : 15px;
	 }
	 
	 #enroll { margin-left : 80px; }
	 #enroll input::placeholder {
	 	font-size: 12px;
	 }
	 
	
   </style>
   </head>
   <body>
   
    <div id="content">
           <!--바디-->
      <div id="content_1"></div>
       <div id="content_2">
   
          <form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">
              <pre id="register">회원가입</pre>
              <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
              </div><br>

               <pre style="color:rgba(0, 0, 0, 0.631)" id="known">회원님의 개인정보를 안전하게 보호하고 있으며 회원님의 동의 없이는 공개 또는 제3자에게 제공되지 않습니다.
              입력하신 이메일 주소로 예매내역이 발송됩니다.
               </pre>
               <br><br>
          <div id="enroll">  <!--회원가입 폼-->
          	<p style="color: rgba(247, 7, 7, 0.835); font-weight:bold; margin: 0px;" class="must"> 표시는 필수입력 항목입니다.</p><br><br>
               <div id="userId">
               	  <label class="must"> 아이디</label>
                  <input type="text" name="memId" pattern=[a-z0-9]{5,12} placeholder="영문 소문자, 숫자 5자 이상 12자 이하" id="txtid" required>  
                  <button type="button" id="idCheck" class="btn btn-dark" onclick="idcheck();">아이디 중복확인</button>
               </div>
               <div id="userPassword">
                 <label class="must"> 비밀번호</label> 
                 <input type="password" name="memPwd" id="password_1" class="pw"  pattern=[a-zA-Z0-9]{5,15} placeholder="영문 대소문자, 숫자 5자 이상 15자 이하" required>
               </div>  
               <div id="pwdChecked">
                 <label class="must"> 비밀번호 확인</label>
                 <input type="password"  id="password_2" class="pw" placeholder="비밀번호를 재입력해주세요."required>&nbsp;<font id = "checkPw" size = "2"></font> 
               </div>     
   
             <div id="name">
               <label class="must"> 이름</label>
                <input type="text" name="memName" placeholder="이름을 입력해주세요." required>
             </div>
   
             <div id="telephone">
               <label class="must"> 휴대폰번호</label>        
               <select class="box" name="phone1" id="phone">
                 <option value="010" selected>010</option>
                 <option value="011">011</option>
                 <option value="016">016</option>
                 <option value="017">017</option>
                 <option value="018">018</option>
                 <option value="019">019</option>
               </select>
                 - <input type="text" name="phone2"> - <input type="text" name="phone3">
             </div>
             
             <div id="email">
               <label class="must"> 이메일</label>
               <input class="box" id="emailid" type="text" name="email"/>
               <button type="button" id="emailCheck" class="btn btn-dark" onclick="emailcheck();">이메일 중복확인</button>
             </div>
             
             <div id="gender">
               <label class="must"> 성별</label>
               <input type="radio" name="gender" value="M"><span>남</span>
               <input type="radio" name="gender" value="F"><span>여</span>
             </div>
             
             <div id="birthday">
               <label class="must">생년월일</label>
                 <select class="box" id="birth-year" name="year">
                 	<option disabled selected>연도</option>
                 	<% for(int i = 1940; i <= 2022; i ++) { %>
                 		<option><%= i %></option>
                 	<% } %>
                 </select>
                 <select class="box" id="birth-month" name="month">
                   <option disabled selected>월</option>
                   <% for(int i = 1; i <= 12; i ++) { %>
                 		<option><%= i %></option>
                 	<% } %>
                 </select>
                 <select class="box" id="birth-day"  name="day">
                   <option disabled selected>일</option>
                   <% for(int i = 1; i <= 31; i ++) { %>
                 		<option><%= i %></option>
                 	<% } %>
                 </select>
             </div>
             <br><br><br>
   
             <div align="center">
               <button type="reset" id="resetbtn" class="btn btn-primary">초기화 </button>  
               <button type="submit" id="submitbtn" class="btn btn-dark" disabled>회원가입</button>
             </div>
          </div>
         </form>
        </div>
   
            <div id="content_3"></div>
        </div>
      
        <%@ include file="../common/footerbar.jsp" %>   
   
     
        <script>
        	function idcheck() {
            	
        		var $memId = $("#enroll-form input[name=memId");
				if($memId.val() != "") {
					var regExp = /^[a-z\d]{5,12}$/;
					if(!regExp.test($memId.val())) {
						alert("영문 소문자, 숫자 5자 이상 12자 이하로 입력해주세요.");
					} else {
						
						$.ajax({
		        			url : "idCheck.me",
		        			type : 'POST',
		        			data : {checkId : $memId.val()},
		        			success : function(result) {
		        				
		        				// result 의 값은 "NNNNN" 또는 "NNNNY" 가 담겨있음
		        				if(result == "NNNNN") { // 사용 불가
		        					
		        					window.alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
		        					$memId.focus(); // 재입력 유도
		        					
		        				} else { // 사용 가능
		        					
		        					if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) { // 사용하겠다.
		        						
		        						// 아이디값 확정 => 다시 수정 못하게 readonly 속성 추가
		        						$memId.attr("readonly", true);
		        						
		        						// 회원가입버튼 활성화
		        						// $("#enroll-form button[type=submit]").removeAttr("disabled");
		        						
		        					} else { // 사용하지 않겠다.
		        						
		        						// 재입력 유도
		        						$memId.focus();
		        					}
		        				}
		        			}, 
		        			error : function() {
		        				console.log("아이디 중복체크용 ajax 통신 실패!");
		        			}
		        		});
					}
					
				} else {
					alert("아이디를 입력해주세요.");
				}      		
        	}
        	
			function emailcheck() {
            	
				if($("#emailid").val() != "" && $("#domain-txt").val() != "") {
					
					var email = $("#emailid").val() + "@" + $("#domain-txt").val();
					
	        		$.ajax({
	        			url : "emailCheck.me",
	        			type : 'POST',
	        			data : {
	        				email1 : $("#emailid").val(),
	        				email2 : $("#domain-txt").val()
	        			},
	        			success : function(result) {
	        				
	        				// result 의 값은 "NNNNN" 또는 "NNNNY" 가 담겨있음
	        				if(result == "NNNNN") { // 사용 불가
	        					
	        					window.alert("이미 존재하거나 탈퇴한 회원의 이메일입니다.");
	        					$("#emailid").focus(); // 재입력 유도
	        					
	        				} else { // 사용 가능
	        					
	        					if(confirm("사용 가능한 이메일입니다. 사용하시겠습니까?")) { // 사용하겠다.
	        						
	        						// 아이디값 확정 => 다시 수정 못하게 readonly 속성 추가
	        						$("#emailid").attr("readonly", true);
	        						
	        						// 회원가입버튼 활성화
	        						$("#enroll-form button[type=submit]").removeAttr("disabled");
	        						
	        					} else { // 사용하지 않겠다.
	        						
	        						// 재입력 유도
	        						$("#emailid").focus();
	        					}
	        				}
	        			}, 
	        			error : function() {
	        				console.log("아이디 중복체크용 ajax 통신 실패!");
	        			}
	        		});
				} else {
					alert("이메일을 입력해주세요.");
				}   
				
        	}
        </script>
		
        
        <script>
        
        $('.pw').keyup(function(){
            let pass1 = $("#password_1").val();
            let pass2 = $("#password_2").val();
            
            if (pass1 != "" || pass2 != ""){
                if (pass1 == pass2){
                    $("#checkPw").html("");
                } else {
                    $("#checkPw").html('비밀번호가 일치하지 않습니다.');
                    $("#checkPw").attr('color','red');
                }
            }
        
        })
        
   		 </script>
        	
      
   </body>
   </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member" 
    import= "javax.servlet.http.HttpSession"	 %>
    
<%Member memId = (Member)session.getAttribute("memId"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정찾기</title>
<style>
	#content{
		height: 300px;
	}
	
        #findidform{
            font-size: 40px;
            text-align: center;
            font-weight: 500   }

         #findpwd, #findid{
			text-decoration: none;
			text-align: center;
			font-size: 20px;
			color: rgba(0, 0, 0, 0.59);
			font-weight: 600;
		 }

         #find{
            font-weight: 600;
            color: rgba(0, 0, 0, 0.59);
            font-size: 20px;}
            
            #findname, #findemail{
                font-size: 15px;
                font-weight: 600;
                color: rgba(0, 0, 0, 0.59);
                margin-left: 25px;;

            }
            #reginame, #regiemail{
            border-radius: 3px;
            width: 25em;
            height: 3em; 
            margin-left: 20px;
            }

            .findbtn{
            width: 200px;
            margin-left : 20px;
			margin-top: 20px;
            }
          
            #findid-form table{
                margin: auto;
            }
    
	
</style>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>
	
    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->

  

      <div id="content">
        <!--바디-->
        <div id="content_1"></div>
        <div id="content_2">
			<form id="findid-form" action="<%= contextPath %>/findId.me" method="post">
				<p id="findidform">계정찾기</p>
				<div class="progress">
					<div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
				  </div>
				<table>
					<tr>
						<td width="300px">
							<button type="button" class="btn btn-light" class="findbtn">아이디찾기</button>
						</td>
						<td>
							<button type="button" class="btn btn-light" class="findbtn" onclick="goPwd();">비밀번호찾기</button>
						</td><br>
					</tr>
					<tr>
						<td colspan="2" ><pre id="find" style="text-align:center;">

회원정보에 등록된 정보로 아이디를 조회하실 수 있습니다.   
						</pre></td>
					</tr>
					<tr>
						<td id="ff" ><p id="findname">
							이름
						</p></td>
					</tr>
					<tr>
						<td >
							<input type="text" placeholder="이름을 입력해주세요." id="reginame" name="memName" >
						</td>
					</tr>
					<tr>
						<td>
						<br><p id="findemail">휴대폰번호</p>
						</td>
					</tr>
					<tr>
						<td>
						<input type="text"  placeholder="휴대폰번호를입력해주세요. (-포함)" id="regiemail" name="phone">
						</td>  
					</tr>
					<tr>
						<br><td colspan="2"><button type="submit" id="findbtn" class="btn btn-primary" >아이디찾기</button></td>
					</tr>
				</table>
				</form>

				

		</div>
        <div id="content_3"></div>


		<script>
			function goPwd(){
				location.href = "<%= contextPath %>/findPwdForm.me";
			}
	
		  </script>

      </div>	

	
    
    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
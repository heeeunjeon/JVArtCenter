<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정찾기</title>
<style>
	#content{
		height: 4000px;
	}
	
        #findidform{
            font-size: 40px;
            text-align: center;
            font-weight: 500   }

        

         #find{
            font-weight: 600;
            color: rgba(0, 0, 0, 0.59);
            font-size: 20px;}
            
            #findname, #findemail, #findid{
                font-size: 15px;
                font-weight: 600;
                color: rgba(0, 0, 0, 0.59);
                margin-left: 25px;;

            }
            #reginame, #regiemail, #regiid{
            border-radius: 3px;
            width: 25em;
            height: 3em; 
            margin-left: 20px;
            }

            #findbtn{
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
        
			<form id="findid-form" action="<%= contextPath %>/findPwd.me" method="post">
				<p id="findidform">계정찾기</p>
				<div class="progress">
					<div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
				  </div>
				<table>
					<tr>
						<td width="300px">
							<button type="button" class="btn btn-ligh" id="findbtn" onclick="findid()">아이디찾기</button>
						</td>
						<td>
							<button type="button" class="btn btn-ligh" id="findbtn">비밀번호찾기</button>
						</td><br>
					</tr>
					<tr>
						<td colspan="2" ><pre id="find" style="text-align:center;">

회원정보에 등록된 정보로 비밀번호를 찾을 수 있습니다.   
						</pre></td>
					</tr>
					<tr>
						<td><p id="findid">아이디
						</p></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="아이디를 입력해주세요." id="regiid" name="memId"></td>
					</tr>
					<tr>
						<td><br><p id="findname">
							이름
						</p></td>
					</tr>
					<tr>
						<td >
							<input type="text" placeholder="이름을 입력해주세요." id="reginame" name="memName" required>
						</td>
					</tr>
					<tr>
						<td>
						<br><p id="findemail">휴대폰번호</p>
						</td>
					</tr>
					<tr>
						<td>
						<input type="text"  placeholder="휴대폰번호를입력해주세요." id="regiemail" name="phone"required>
						</td>  
					</tr>
					<tr>
						<br><td colspan="2"><button type="submit" id="findbtn" class="btn btn-primary" onclick="result()">비밀번호찾기</td>
					</tr>
				</table>
				</form>


		</div>
        <div id="content_3"></div>
      </div>	

	  <script>
		function findid(){
			location.href = "<%= contextPath %>/views/member/findId.jsp";
		};
		
	  </script>
    	
    	<script type="text/javascript">
    	function result(){
    		location.href= "<%= contextPath %>/views/member/fidpwdresult.jsp"; 
    		};
    	</script>
    
    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
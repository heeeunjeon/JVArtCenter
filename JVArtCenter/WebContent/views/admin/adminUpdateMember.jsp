<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- import 할 것들 --%>
<%@ page import=" java.util.ArrayList, com.kh.member.model.vo.Member" %>
<% 
	Member m = (Member)request.getAttribute("m");
%>
<%@ include file="adminPath.jsp" %>
<%
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>JV 관리자 페이지</title>

<!-- JQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- chart.js CDN (차트 api) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<!-- swiper.js CDN (이미지 스와이프 api) -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!-- <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->

<!-- 아이콘/글씨체 링크-->
<link href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin-2@4.1.4/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin-2@4.1.4/css/sb-admin-2.min.css" rel="stylesheet">

<style>
	/* ---------- 전체 스타일 ---------- */
	/* 영역 사이즈 고정 */
	.wrapper {
		width: 1900px;
		/* 각자 필요한 길이만큼 height 속성값 수정해서 길이 조정 */
		height: 1050px;
	}
	
	/* 1:1문의 커서 갖다대면 바뀌는거 */
	.qnaTitle:hover {
		cursor: pointer;
		font-weight: bold;
	}
	
	#content-wrapper #accordionSidebar {
		width: 224px;
	}
	
	#content-wrapper {
		width: 1676px;
	}
	
	#accordionSidebar, #content-wrapper {
		float: left;
		height: 100%;
	}
	
	/* ----- 추가한 스타일은 여기에 ----- */
	#form{
		border: 1px solid #4e73df; ;
		width: 600px;
		height: 500px;
		margin-top: 50px;
		margin-left: 350px;
		
	}

	#form td{
		height: 50px;
		padding-top: 30px;
	}

	#submitbtn, #cancelbtn {
		height: 40px;
		width: 100px;
		
	}
	#sublitbtn{
		padding-left: 50px;
	}

	#subminbtn{
		background-color: #4e73df;
	}
	#cancelbtn{
		margin-left: 10px;
	}
	#btn{
		margin-left: 25px;;
	}
</style>
</head>

<body>
	<div class="wrapper">

		<%@ include file="adminSidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- content 영역 시작 -->
			<div id="content">

				<%@ include file="adminTopbar.jsp"%>

					<div id="admin_contents" >
							
						<form id="updateMember-form" action="<%= contextPath %>/updatemember.admin" method="post">
							<div id="form" align="center">						<!-- 아이디, 비밀번호, (비밀번호확인), 전화번호, 이메일, 주소, 취미 -->
								<input type="hidden" name="mno" value=<%= m.getMemNo() %>>
								<table>
									<!-- (tr>td*3)*8 + Enter -->
									<tr>
										<td>&nbsp;회원등급:</td>
										<td>&nbsp;<input type="text" name="grCode" maxlength="6" required value="<%= m.getGrCode() %>"></td>
									</tr>
									<tr>
										<td>&nbsp;아이디:</td>
										<td>&nbsp;<input type="text" name="userId" maxlength="12" required value="<%= m.getMemId() %>" readonly></td>
										<!-- 아이디의 수정을 막기 위해 readonly 속성을 부여 -->
									</tr>
									<tr>
										<td>&nbsp;비밀번호:</td>
										<td>&nbsp;<input type="text" name="memPwd" maxlength="6" required value="<%= m.getMemPwd() %>"></td>
										
									</tr>
									<tr>
										<td>&nbsp;이름:</td>
										<td>&nbsp;<input type="text" name="memName" maxlength="6" required value="<%= m.getMemName() %>"></td>
										
									</tr>
									<tr>
										<td>&nbsp;전화번호:</td>
										<td>&nbsp;<input type="text" name="phone" placeholder="- 포함해서 입력" value="<%= m.getPhone() %>"></td>
									</tr>
									<tr>
										<td>&nbsp;이메일:</td>
										<td>&nbsp;<input type="email" name="email" value="<%= m.getEmail() %>"></td>
		
									</tr>
								</table><br><br>

								<div align="center" id="btn">
									<button type="submit" class="btn btn-secondary btn-sm" id="submitbtn">정보변경</button>
								
									<button type="reset" class="btn btn-danger btn-sm" id="cancelbtn">초기화</button>
								</div>
							</div>
						</form>
					</div>
		
			</div>
			<!-- content 영역 끝 -->
		</div>
		<!-- End of Content Wrapper -->

	</div>

	<%@ include file="adminScript.html"%>

</body>

</html>
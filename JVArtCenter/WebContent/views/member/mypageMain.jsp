<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp"%>
<%
	int memNo = loginUser.getMemNo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
#content { height: 850px; }

#mypage_main {
	height: 20%;
	margin: auto;
	text-align: center;
	padding: 30px;
}

#mypage_main p {
	font-size: 25px;
	font-weight: bold;
	
}

#mypage_main {
	font-size: 18px;
}

#mypage_main_btn1, #mypage_main_btn2 {
	margin: auto;
	text-align: center;
	width: 70%;
	font-size: 18px;
	
}


#mypage_text {
	font-size: 40px;
	font-weight: bold;
}

#mypage_main_btn1 td, #mypage_main_btn2 td {
	border: 1px solid black;
	text-align: center;
}

#mypage_main_btn1 a:hover, #mypage_main_btn2 a:hover {
	background-color: black;
	text-align: center;
	cursor: pointer;
	color : white;
}
#mypage_main_btn1 a, #mypage_main_btn2 a {
	display: block;
	width: 100%;
	height: 100%;
	text-align: center;
	line-height: 195.8px;
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

				<%@ include file="../common/mypageMenubar.jsp"%>

				<!-- 마이페이지 내용영역 -->
				<div id="mypage_content">
					<div id="mypage_main">
						<p style="padding-top: 30px;">
							<%= loginUser.getMemName() %>님 <br> 반갑습니다 <br>
						</p>
						<%= grade.getGrName() %> ⎜ <a>나의 회원 등급</a>
					</div>

					<table id="mypage_main_btn1" height="200" align="center">
						<tr>
							<td width="500">
								<a href="<%= contextPath %>/mypagePwdConfirm.me"><b>회원정보수정</b></a>
							</td>
							<td width="500">
								<a href="<%= contextPath %>/mypageTicketing.me"><b>예매내역</b></a>
							</td>
						</tr>
					</table>
					<table id="mypage_main_btn2" height="200" align="center">
						<tr>
							<td width="500">
								<a href="<%= contextPath %>/mypageQnA.me"><b>문의내역</b></a>
							</td>
							<td width="500">
								<a href="<%= contextPath %>/mypageReview.me?currentPage=1"><b>내 리뷰 확인</b></a>
							</td>
							<td width="500">
								<a href="<%= contextPath %>/mypageBookMarkList"><b>북마크</b></a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div id="content_3"></div>
		</div>
	</div>
	
	<%@ include file="../common/footerbar.jsp"%>

</body>
</html>
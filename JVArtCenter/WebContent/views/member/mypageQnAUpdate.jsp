<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.qna.model.vo.Qna"%>
<%@ include file="../common/menubar.jsp"%>
<%
	Qna q = (Qna)request.getAttribute("q");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
/* #content { height: 2000px; } */
#mypage_text {
	font-size: 40px;
	font-weight: bold;
}

#mypage_menuName {
	font-size: 30px;
	font-weight: bold;
	padding-left: 30px;
	padding-top: 56px;
}

hr {
	margin-left: 30px;
}

#mypage_inquiry_Update {
	margin-left: 30px;
}

#mypage_inquiry_Update td {
	padding: 10px;
}


#mypage_inquiry_Update_btn {
	padding-top: 20px;
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
					<div id="mypage_inquiry_update">
						<!-- 현재페이지 제목 -->
						<div id="mypage_menuName">문의내역 수정</div>
						
						<hr>

						<!-- 문의내역 수정 테이블 -->
						<form action="<%= contextPath %>/MypageQnAUpdate.me" method="post">
							<input type="hidden" name="qno" value="<%= q.getQnaNo() %>">
							<table align="left" id="mypage_inquiry_Update">
								<tr>
									<td style="font-weight: bold;">글 번호</td>
									<td><%= q.getQnaNo() %></td>
								</tr>
								<tr>
									<td style="font-weight: bold;">카테고리</td>
									<td>
										<select name="category">
											<option seleted>예매 문의</option>
											<option>환불 문의</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">제목</td>
									<td>
										<input type="text" class="form-control" size="61" value="<%= q.getQnaTitle() %>" name="title">
									</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">내용</td>
									<td>
										<textarea cols="50" rows="10" style="resize: none;" class="form-control" name="content"><%= q.getQnaContent() %></textarea>
									</td>
								</tr>
							
								<tr>
									<td>
										<!-- 수정,취소 버튼 -->
										<div id="mypage_inquiry_Update_btn" align="left">
											<button type="submit" class="btn btn-primary">수정</button>
											<button type="button" id="mypageInquiryUpdateCancel" class="btn btn-primary" style="background-color: white; color: black;">취소</button>
										</div>
									</td>
								</tr>
							</table>
						</form>
						
						
					</div>
				</div>
			</div>

			<div id="content_3"></div>
		</div>
	</div>

	<script>
		$(function () {
			$("#mypageInquiryUpdateCancel").click(function() { // 취소하기 버튼, 맨처음 문의내역 조회로 돌아감 
				location.href = "<%= contextPath %>/mypageQnA.me"
			});
		})
		
	</script>

	<%@ include file="../common/footerbar.jsp"%>

</body>
</html>
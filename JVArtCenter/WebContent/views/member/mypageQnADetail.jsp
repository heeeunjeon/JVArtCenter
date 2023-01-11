<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.qna.model.vo.Qna" %>
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
						<div id="mypage_menuName">문의내역 상세조회</div>
						
						<hr>

						<!-- 문의내역 수정 테이블 -->
						<table align="left" id="mypage_inquiry_Update">
							<tr>
								<td style="font-weight: bold;">글 번호</td>
								<td><%= q.getQnaNo() %></td>
							</tr>
							<tr>
								<td style="font-weight: bold;">카테고리</td>
								<td><input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="" size="61" value="<%= q.getQnaCategory() %>"></td>
							</tr>
							<tr>
								<td style="font-weight: bold;">제목</td>
								<td>
									<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="" size="61" value="<%= q.getQnaTitle() %>">
								</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">내용</td>
								<td>
									<textarea cols="50" rows="10" style="resize: none;" class="form-control" class="form-control" id="disabledInput" disabled=""><%= q.getQnaContent() %></textarea>
								</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">답변</td>
								<td>
									<textarea cols="50" rows="10" style="resize: none;" class="form-control" class="form-control" id="disabledInput" disabled=""><%= q.getAnswer() %></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<!-- 수정,취소 버튼 -->
									<div id="mypage_inquiry_Update_btn" align="left">
										<button type="submit" class="btn btn-primary" id="mypageQnaUpdateBtn">수정</button>
										<button type="button" id="mypageInquirydelete" class="btn btn-primary" style="background-color: white; color: black;">삭제하기</button>
										<button type="button" id="mypageInquiryUpdateCancel" class="btn btn-primary" style="background-color: white; color: black;">취소</button>

									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div id="content_3"></div>
		</div>
	</div>

	<script>
		$(function () {
			$("#mypageInquiryUpdateCancel").click(function() { // 취소하기 버튼 
				location.href = "<%= contextPath %>/mypageQnA.me"
			});

			$("#mypageInquirydelete").click(function() { // 삭제하기 버튼
				
				var result = confirm('문의 내역을 삭제하시겠습니까?');

		        if(result) {
		           //yes
		        	location.href = "<%= contextPath %>/mypageQnadelete.me?qno=<%= q.getQnaNo() %>"
		        } else {
		            //no
		        }
		            
				
			});
			
			
			$("#mypageQnaUpdateBtn").click(function() { // 수정하기 버튼 
				location.href = "<%= contextPath %>/mypageQnAUpdatePage.me?qno=<%= q.getQnaNo() %>"
			});
			
			
		})
		
		
	</script>

	<%@ include file="../common/footerbar.jsp"%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.qna.model.vo.Qna"%>
<%@ include file="adminPath.jsp" %>
<%-- 스트립틀릿은 여기에 --%>
<%
	Qna q = (Qna)request.getAttribute("q");
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

<title>관리자 - 1대1문의 답변 등록 / 수정 / 삭제 </title>

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
<link href="<%= contextPath %>/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- CSS -->
<link href="<%= contextPath %>/resources/css/sb-admin-2.min.css" rel="stylesheet">

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
	button {
		border-color: #4e73df;
		margin: 7px;
	}
	table, th {
		font-size: 18px;
	}
	table {
		border-collapse: separate;
		border-spacing: 30px 15px;
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

				<div id="admin_contents">
					
						<!-- content 내용 여기에 붙여넣기! -->
	
			            <div id="qna-header">
			                <h2 style="font-size: 40px; margin-left: 40px;">1:1 문의 관리</h2>
			            </div>
			
						<br><br>

			            <div id="qna-detail-admin" align="center">
			                <table>
			                    <tr>
			                        <th width="300px">처리상태</th>
			                        <td width="600px">
			                        	<% if(q.getAnswer() == null && q.getAnswerDate() == null) { %>
				                    			답변대기
				                    	<% } else { %>
				                    			답변완료
				                    	<% } %>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th>구분</th>
			                        <td><%= q.getQnaCategory() %></td>
			                    </tr>
			                    <tr>
			                        <th>회원아이디</th>
			                        <td><%= q.getMemNo() %></td>
			                    </tr>
			                    <tr>
			                        <th>제목</th>
			                        <td><%= q.getQnaTitle() %></td>
			                    </tr>
			                    <tr>
			                        <th>내용</th>
			                        <td><%= q.getQnaContent() %></td>
			                    </tr>
			                </table>
			            </div>
			            
			            
			           
			            <% if(q.getAnswer() == null) { %>
			             <!--  답변이 없는 경우 작성  -->  
			             	<form id="qna-ans-enroll-form" action="<%= contextPath %>/admin_insert.qna" method="post">
				            	<div id="qna-answer-admin" align="center">
				            		<input type="hidden" name="qnaNo" value="<%= q.getQnaNo() %>">
					                 <table>
						                <tr>
						                    <th width="300px">답변</th>
						                    <td width="600px"><textarea name="answer" id="qna-ans" cols="60" rows="15" placeholder="답변 내용 입력" style="resize:none;" required></textarea></td>
						                </tr>
					                 </table>
				            	</div>
				            	<br><br>
				            	<div align="center">
					              <button type="submit" class="btn btn-outline-primary">답변등록</button>
					              <button type="button" class="btn btn-outline-primary" onclick="location.href='<%= contextPath %>/admin_list.qna?currentPage=1'">목록으로</button>
					            </div>
				            </form>
				            
				            
				        
			            <% } else { %>
			            <!--  답변이 있는 경우 수정  -->
			            	<form id="qna-ans-update-form" action="<%= contextPath %>/admin_update.qna" method="post">
								<div id="qna-answer-admin" align="center">
					              <input type="hidden" name="qnaNo" value="<%= q.getQnaNo() %>">
					                 <table>
						                <tr>
						                    <th width="300px">답변</th>
						                    <td width="600px"><textarea name="answer" id="qna-ans" cols="60" rows="15" style="resize:none;" required><%= q.getAnswer() %></textarea></td>
						                </tr>
					                 </table>
					            </div>
								<br><br>
				            	<div align="center">
					              <button type="submit" class="btn btn-outline-primary">답변수정</button>
					              <button type="button" class="btn btn-outline-primary" onclick="location.href='<%= contextPath %>/admin_delete.qna?qno=<%= q.getQnaNo() %>'">답변삭제</button>
					              <button type="button" class="btn btn-outline-primary" onclick="location.href='<%= contextPath %>/admin_list.qna?currentPage=1'">목록으로</button>
					            </div>
					         </form>
						<% } %>
			            <br>

				</div>

			</div>
			<!-- content 영역 끝 -->
		</div>
		<!-- End of Content Wrapper -->

	</div>

	<%@ include file="adminScript.html"%>

</body>

</html>
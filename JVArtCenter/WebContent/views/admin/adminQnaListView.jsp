<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, com.kh.common.model.vo.PageInfo, com.kh.qna.model.vo.Qna"%>
<%@ include file="adminPath.jsp"%>
<%-- 스트립틀릿은 여기에 --%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
ArrayList<Qna> list = (ArrayList<Qna>) request.getAttribute("list");
String keyword = request.getParameter("keyword");
String searchword = request.getParameter("searchword");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
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

<title>관리자 - 1대1문의 전체조회</title>

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
<link
	href="<%=contextPath%>/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- CSS -->
<link href="<%=contextPath%>/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">

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
#qna-list-admin tr {
	height: 30px;
}

#qnaTitle:hover {
	border: 1px solid lightslategray;
	cursor: pointer;
}

#qna-btn>button, #qna-search-btn {
	background-color: #4e73df;
	border-radius: 7px;
	border-color: #4e73df;
	color: white;
}

#qna-search-form {
	margin-left: 250px;
	margin-right: 650px;
}

#qna-search-form, #qna-btn {
	display: inline-block;
}

#qna-paging-admin button {
	background: #4e73df;
	color: white;
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

					<div id="admin-qna-header">
						<h2 style="font-size: 40px; margin-left: 40px;">1:1 문의 관리</h2>
					</div>

					<br> <br>

					<div id="qna-search-form">
						<form action="<%=contextPath%>/admin_list.qna?currentPage=1"
							method="get">
							<select name="keyword">
								<option value="" hidden disabled selected>선택</option>
								<option value="category">문의유형</option>
								<option value="memId">회원아이디</option>
								<option value="title">제목</option>
							</select> <input type="text" name="searchword" placeholder="검색어를 입력하세요." required>
							<button type="submit" id="qna-search-btn">검색</button>
							<input type="hidden" name="currentPage" value="1">
						</form>
					</div>

					<div id="qna-btn">
						<button type="button" onclick="enrollPage();">작성/수정</button>
						<button type="button" onclick="deletePage();">답변삭제</button>
					</div>

					<br> <br>

					<div id="qna-list-admin">
						<table align="center">
							<thead>
								<tr
									style="background-color: #4e73df; color: white; height: 50px;">
									<th></th>
									<th width="50px" style="font-size: 18px;">NO.</th>
									<th width="150px" style="font-size: 18px;">작성일</th>
									<th width="100px" style="font-size: 18px;">회원ID</th>
									<th width="150px" style="font-size: 18px;">문의유형</th>
									<th width="550px" style="font-size: 18px;">제목</th>
									<th width="150px" style="font-size: 18px;">답변일</th>
									<th width="100px" style="font-size: 18px;">처리상태</th>
								</tr>
							</thead>
							<tbody>

								<%
									if (list.isEmpty()) {
								%>
								<tr>
									<td colspan="8">조회된 리스트가 없습니다.</td>
								</tr>
								<%
									} else {
								%>
								<%
									for (Qna q : list) {
								%>
								<tr style="height: 40px;">
									<td><input type="radio" name="chk" value=<%=q.getQnaNo()%>></td>
									<td><%=q.getQnaNo()%></td>
									<td><%=q.getQnaDate()%></td>
									<td><%=q.getMemNo()%></td>
									<td><%=q.getQnaCategory()%></td>
									<td id="qnaTitle"><%=q.getQnaTitle()%></td>
									<td>
										<%
											if (q.getAnswer() == null && q.getAnswerDate() == null) {
										%> - <%
											} else {
										%> <%=q.getAnswerDate()%> <%
 	}
 %>
									</td>
									<td>
										<%
											if (q.getAnswer() == null && q.getAnswerDate() == null) {
										%> 답변대기 <%
											} else {
										%> 답변완료 <%
											}
										%>
									</td>

								</tr>
								<%
									}
								%>
								<%
									}
								%>

							</tbody>
						</table>
					</div>

					<!--  상세조회  / 답변작성및수정 / 답변삭제 -->
					<script>
		            	function enrollPage() {
		            		let checked = [];
			            	const checkBox = document.querySelectorAll('input[name=chk]');
			            	
			            	checkBox.forEach((item) => {
			            		if(item.checked){
			            			checked.push(item);
			            		}
			            	})
			            	
			            	if(checked.length === 0){
			            		alert('항목을 선택해주세요.')
			            	}else{
		            		// name 속성이 chk 인 input 태그들 중에서 지금 현재 체크되어잇는 (checked 속성이 있는상태) 요소"만 "
		            		location.href = "<%=contextPath%>/admin_enrollForm.qna?qno=" + $("input[name=chk]:checked").val();
			            	}
		            	}
		
		            	function deletePage() {
		            		let checked = [];
			            	const checkBox = document.querySelectorAll('input[name=chk]');
			            	
			            	checkBox.forEach((item) => {
			            		if(item.checked){
			            			checked.push(item);
			            		}
			            	})
			            	
			            	if(checked.length === 0){
			            		alert('항목을 선택해주세요.')
			            	}else{
			            	location.href = "<%=contextPath%>/admin_delete.qna?qno=" + $("input[name=chk]:checked").val(); 
			            	}
			        	}
			            
		            	$(function() {
		            		
		            		$("tr").on("click", "#qnaTitle", function() {
		            			
		            			location.href = "<%=contextPath%>/admin_enrollForm.qna?qno=" + $(this).siblings().eq(1).text();
		            		});
		            	});
		            </script>

					<br> <br> <br> <br> <br>

					<div id="qna-paging-admin" align="center">
						<%
							if (keyword != null) {
						%>

						<%
							if (currentPage != 1) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/admin_list.qna?currentPage=<%=currentPage - 1%>&searchword=<%=searchword%>&keyword=<%=keyword%>';"
							class="btn btn-secondary">&lt;</button>
						<%
							}
						%>

						<%
							for (int p = startPage; p <= endPage; p++) {
						%>

						<%
							if (p != currentPage) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/admin_list.qna?currentPage=<%=p%>&searchword=<%=searchword%>&keyword=<%=keyword%>';"
							class="btn btn-secondary"><%=p%></button>
						<%
							} else {
						%>
						<button disabled class="btn btn-secondary"><%=p%></button>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (currentPage != maxPage) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/admin_list.qna?currentPage=<%=currentPage + 1%>&searchword=<%=searchword%>&keyword=<%=keyword%>';"
							class="btn btn-secondary">&gt;</button>
						<%
							}
						%>

						<%
							} else {
						%>

						<%
							if (currentPage != 1) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/admin_list.qna?currentPage=<%=currentPage - 1%>';"
							class="btn btn-secondary">&lt;</button>
						<%
							}
						%>

						<%
							for (int p = startPage; p <= endPage; p++) {
						%>

						<%
							if (p != currentPage) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/admin_list.qna?currentPage=<%=p%>';"
							class="btn btn-secondary"><%=p%></button>
						<%
							} else {
						%>
						<button disabled class="btn btn-secondary"><%=p%></button>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (currentPage != maxPage) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/admin_list.qna?currentPage=<%=currentPage + 1%>';"
							class="btn btn-secondary">&gt;</button>
						<%
							}
						%>

						<%
							}
						%>
					</div>

				</div>
				<!-- content 영역 끝 -->
			</div>
			<!-- End of Content Wrapper -->

		</div>

		<%@ include file="adminScript.html"%>
</body>

</html>
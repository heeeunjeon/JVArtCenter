<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, com.kh.common.model.vo.PageInfo, com.kh.newsletter.model.vo.Newsletter"%>
<%@ include file="adminPath.jsp"%>
<%-- 스트립틀릿은 여기에 --%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
ArrayList<Newsletter> list = (ArrayList<Newsletter>) request.getAttribute("list");
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
<link
	href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin-2@4.1.4/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin-2@4.1.4/css/sb-admin-2.min.css"
	rel="stylesheet">

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
#news-list-admin tr {
	height: 30px;
}

#newsTitle:hover {
	border: 1px solid lightslategray;
	cursor: pointer;
}

#news-btn>button, #news-search-btn {
	background-color: #4e73df;
	border-radius: 7px;
	border-color: #4e73df;
	color: white;
}

#news-search-form {
	margin-left: 250px;
	margin-right: 580px;
}

#news-search-form, #news-btn {
	display: inline-block;
}

#news-paging-admin button {
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
					<div id="news-header">
						<h2 style="font-size: 40px; margin-left: 40px;">뉴스레터 관리</h2>
					</div>

					<br>
					<br>

					<div id="news-search-form">
						<form action="<%=contextPath%>/admin_list.news?currentPage=1"
							method="get">
							<select name="keyword">
								<option value="" hidden disabled selected>선택</option>
								<option value="category">카테고리</option>
								<option value="title">제목</option>
							</select> <input type="text" name="searchword" placeholder="검색어를 입력하세요."
								required>
							<button type="submit" id="news-search-btn">검색</button>
							<input type="hidden" name="currentPage" value="1">
						</form>
					</div>

					<div id="news-btn">
						<button type="button" onclick="enrollPage();">새글작성</button>
						<button type="button" onclick="updatePage();">선택수정</button>
						<button type="button" onclick="deletePage();">선택삭제</button>
					</div>

					<br>
					<br>

					<div id="news-list-admin">
						<table align="center">
							<thead>
								<tr
									style="background-color: #4e73df; color: white; height: 50px;">
									<th></th>
									<th width="100px" style="font-size: 18px;">NO.</th>
									<th width="200px" style="font-size: 18px;">카테고리</th>
									<th width="700px" style="font-size: 18px;">제목</th>
									<th width="150px" style="font-size: 18px;">작성일</th>
									<th width="100px" style="font-size: 18px;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.isEmpty()) {
								%>
								<tr>
									<td colspan="6">조회된 리스트가 없습니다.</td>
								</tr>
								<%
									} else {
								%>
								<%
									for (Newsletter ne : list) {
								%>
								<tr style="height: 40px;">
									<td><input type="radio" name="chk"
										value=<%=ne.getNewsNo()%>></td>
									<td><%=ne.getNewsNo()%></td>
									<td><%=ne.getNewsCategory()%></td>
									<td id="newsTitle"><%=ne.getNewsTitle()%></td>
									<td><%=ne.getNewsDate()%></td>
									<td><%=ne.getNewsCount()%></td>
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

					<script>
						function enrollPage() {
						
							location.href = "<%=contextPath%>/admin_enrollForm.news"; 
						}
						
						function updatePage() {
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
						   	location.href = "<%=contextPath%>/admin_updateForm.news?neno=" + $("input[name=chk]:checked").val(); 
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
				          	location.href = "<%=contextPath%>/admin_delete.news?neno=" + $("input[name=chk]:checked").val(); 
			            	}
				      	}
				      	
			            $(function() {
			              
			            	$("tr").on("click", "#newsTitle", function() {
			                
			                location.href = "<%=contextPath%>/admin_detail.news?neno=" + $(this).siblings().eq(1).text();
			              });
			            });
			          </script>

					<br>
					<br>
					<br>
					<br>
					<br>

					<div id="news-paging-admin" align="center">
						<%
							if (keyword != null) {
						%>
						<%
							if (currentPage != 1) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/admin_list.news?currentPage=<%=currentPage - 1%>&searchword=<%=searchword%>&keyword=<%=keyword%>';"
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
							onclick="location.href='<%=contextPath%>/admin_list.news?currentPage=<%=p%>&searchword=<%=searchword%>&keyword=<%=keyword%>';"
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
							onclick="location.href='<%=contextPath%>/admin_list.news?currentPage=<%=currentPage + 1%>&searchword=<%=searchword%>&keyword=<%=keyword%>';">&gt;</button>
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
							onclick="location.href='<%=contextPath%>/admin_list.news?currentPage=<%=currentPage - 1%>';">&lt;</button>
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
							onclick="location.href='<%=contextPath%>/admin_list.news?currentPage=<%=p%>';"
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
							onclick="location.href='<%=contextPath%>/admin_list.news?currentPage=<%=currentPage + 1%>';"
							class="btn btn-secondary">&gt;</button>
						<%
							}
						%>
						<%
							}
						%>
					</div>

				</div>

			</div>
			<!-- content 영역 끝 -->
		</div>
		<!-- End of Content Wrapper -->

	</div>

	<%@ include file="adminScript.html"%>

</body>

</html>
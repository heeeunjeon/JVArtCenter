<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.kh.newsletter.model.vo.Newsletter, com.kh.common.model.vo.Attachment" %>
<%@ include file="adminPath.jsp" %>
<%-- 스트립틀릿은 여기에 --%>
<%
	Newsletter ne = (Newsletter)request.getAttribute("ne");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
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
		width: 2900px;
		/* 각자 필요한 길이만큼 height 속성값 수정해서 길이 조정 */
		height: 1500px;
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
	#news-paging>ul>li { 
	  list-style-type : none; 
	} 

	#hr2 {
			height : 1px;
			margin-left: 25px;
			background-color : black;     
	}
	#hr3 {
        width: 90%;
        height : 0.1px;
        margin-left: 25px;
        background-color : black;     
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
			`
					  <br><br>

			          <div id="news-title-wrap">
			            <div id="news-title" style="font-size: 22px; font-weight: 900; margin-left: 50px;"><%= ne.getNewsTitle() %></div>
			            <span id="news-category" style="font-size: 18px; font-weight: 500; margin-left: 50px;"><%= ne.getNewsCategory() %></span>
						<span id="news-date" style="font-size: 18px; font-weight: 300; margin-left: 50px;"><%= ne.getNewsDate() %></span>
						<span id="news-count" style="font-size: 18px; font-weight: 300; margin-left: 50px;"><%= ne.getNewsCount() %></span>
			          </div>

					  <hr id="hr2"><br>
			
			          <div id="news-content-wrap" align="center">
						    <pre><%= ne.getNewsContent() %></pre>
						    <p>
						         <% for(int i = 0; i < list.size(); i++) { %>
						              <img src="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeName() %>" width="700px;" height="400px;">
						         <% } %>
						     </p>
						</div>
			
					  <hr id="hr3">

			             <div id="news-paging">
			               <ul>
			                   <li id="news-prev">
									<span style="color: dimgray;"><b>이전 글</b></span> &ensp;
			                        <a href="<%= contextPath %>/admin_detail.news?neno=<%= ne.getLastNo() %>"><%= ne.getLastTitle() %></a>
			                   </li>
			                   <li id="news-next">
									<span style="color: dimgray;"><b>다음 글</b></span> &ensp;
			                        <a href="<%= contextPath %>/admin_detail.news?neno=<%= ne.getNextNo() %>"><%= ne.getNextTitle() %></a>
			                   </li>
			               </ul>
			             </div>
			   
			         
			          <div id="notice-bottom-btn" align="center">
			            <a href="<%= contextPath %>/admin_updateForm.news?neno=<%= ne.getNewsNo() %>" class="btn btn-outline-primary">수정</a>
			            <a href="<%= contextPath %>/admin_delete.news?neno=<%= ne.getNewsNo() %>" class="btn btn-outline-primary">삭제</a>
			            <a href="<%= contextPath %>/admin_list.news?currentPage=1" class="btn btn-outline-primary">목록</a>
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
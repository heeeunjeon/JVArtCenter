<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice, com.kh.common.model.vo.Attachment" %>
<%@ include file="adminPath.jsp" %>
<%-- 스트립틀릿은 여기에 --%>
<%
	Notice n = (Notice)request.getAttribute("n");
	Attachment at = (Attachment)request.getAttribute("at");
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

<title>관리자 - 공지사항 상세조회</title>

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
	#notice-paging>ul>li {
        list-style-type : none;
    }
	label {
        margin-left: 15px;
        margin-right: 15px;
    }
	#hr2 {
        width: 90%;
        height : 2px;
        margin-left: 35px;
        background-color : black;     
    }
    #hr3 {
        width: 90%;
        height : 1px;
        margin-left: 35px;
        background-color : black;     
    }
    #notice-title-wrap, #notice-content-wrap {
        margin-left: 60px;
    }
    #notice-content-wrap {
        display: inline-block;
        height : 500px;
        width: 88%;
        padding: 15px;
    }
	#notice-bottom-btn {
		border-color: #4e73df;
		margin: 7px;
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
          
			          <div id="notice-header">
			              <h2 style="font-size: 40px; margin-left: 40px;">공지사항 관리</h2>
			          </div>
			
					  <br><br>

			          <div id="notice-title-wrap">
			              <p id="category" style="font-size: 18px; font-weight: 500;"><%= n.getNoticeCategory() %></p>
			              <p id="title" style="font-size: 22px; font-weight: 900;"><%= n.getNoticeTitle() %></p>
			              <p id="date" style="font-size: 18px; font-weight: 300;"><%= n.getNoticeDate() %></p>
			          </div>
					  
					  <hr id="hr2">

			          <div id="notice-content-wrap">
						    <pre><%= n.getNoticeContent() %></pre>
						</div>
					  <div>
					  	<% if(at == null) { %>

					  	<% } else { %>
							<label style="margin-left:50px;">첨부파일</label><a download="<%= at.getOriginName() %>" style="color: 4e73df" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>"><%= at.getOriginName() %></a>
					  	<% } %>
					  </div>

					  <hr id="hr3">

			          <div id="notice-paging">
			            <ul>
			                <li id="notice-prev">
			                    <span style="color: dimgray;"><b>이전 글</b></span> &ensp; 
			                    <a href="<%= contextPath %>/admin_detail.no?nno=<%= n.getLastNo() %>"><%= n.getLastTitle() %></a>
			                </li>
			                <li id="notice-next">
			                    <span style="color: dimgray;"><b>다음 글</b></span> &ensp;
			                    <a href="<%= contextPath %>/admin_detail.no?nno=<%= n.getNextNo() %>"><%= n.getNextTitle() %></a>
			                </li>
			            </ul>
			          </div>
			          
			          <div id="notice-bottom-btn" align="center">
			            <a href="<%= contextPath %>/admin_updateForm.no?nno=<%= n.getNoticeNo() %>" class="btn btn-outline-primary">수정</a>
			            <a href="<%= contextPath %>/admin_delete.no?nno=<%= n.getNoticeNo() %>" class="btn btn-outline-primary">삭제</a>
			            <a href="<%= contextPath %>/admin_list.no?currentPage=1" class="btn btn-outline-primary">목록</a>
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
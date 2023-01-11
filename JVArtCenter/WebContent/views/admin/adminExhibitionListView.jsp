<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- import 할 것들 --%>
<%@ page import="java.util.ArrayList, com.kh.exhibition.model.vo.Exhibition, com.kh.common.model.vo.PageInfo" %>
<%@ include file="../admin/adminPath.jsp" %>
<%-- 스트립틀릿은 여기에 --%>
<%
	ArrayList<Exhibition> list = (ArrayList<Exhibition>)request.getAttribute("list"); // 조회된 내용물 출력하기
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
	#ex-list-admin tr { height: 30px;}
	#exTitle:hover {
	    border : 1px solid lightslategray;
	    cursor : pointer;
	}
	#ex-btn>button, #ex-search-btn {
    	background-color : #4e73df;
    	border-radius : 7px;
    	border-color : #4e73df;
		color : white;
    }
	#ex-search-form {
		margin-left: 250px;
		margin-right: 580px;
	}
	#ex-search-form, #ex-btn {
		display: inline-block;
	}
	#ex-paging-admin button {
		background: #4e73df;
		color: white;
	}
	#ex-btn {
		margin-left: 800px;
	}

</style>
</head>

<body>
	<div class="wrapper">

		<%@ include file="../admin/adminSidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- content 영역 시작 -->
			<div id="content">

				<%@ include file="../admin/adminTopbar.jsp"%>

				<div id="admin_contents">
					
					<!-- content 내용 여기에 붙여넣기! -->
					
					<div id="ex-header">
						<h2 style="font-size: 40px; margin-left: 40px;">전시 관리</h2>
					</div>
					
					<br><br>

			
			          <div id="ex-btn">
							<button type="button" onclick="enrollPage();">새글작성</button>
							<button type="button" onclick="updatePage();">선택수정</button>
			            	<button type="button" onclick="deletePage();">선택삭제</button>
			          </div>
					  
					  <br><br>

			          <div id="ex-list-admin">
			              <table align="center">
			                <thead>
			                  <tr style="background-color:#4e73df; color:white; height:50px; text-align:center;">
			                 	  <th></th>
			                      <th width="100px" style="font-size: 18px;">NO.</th>
			                      <th width="100px" style="font-size: 18px;">전시관</th>
			                      <th width="700px" style="font-size: 18px;">전시명</th>
			                      <th width="150px" style="font-size: 18px;">시작일자</th>
			                      <th width="150px" style="font-size: 18px;">종료일자</th>
			                  </tr>
			                </thead>
			                <tbody>
			                    <% if(list.isEmpty()) { %>
			                      <tr>
			                        <th colspan="5">조회된 리스트가 없습니다.</th>
			                      </tr>
			                    <% } else { %>
			                      <% for(Exhibition e : list) { %>
			                        <tr style="height: 40px; text-align:center">
			                          <td><input type="radio" name=chk value="<%= e.getExNo() %>"></td>
			                          <td><%= e.getExNo() %></td>
			                          <td><%= e.getLcCode() %></td>
			                          <td id="exTitle"><%= e.getExTitle() %></td>
			                          <td><%= e.getStartDate() %></td>
			                          <td><%= e.getEndDate() %></td>
			                        </tr>
			                      <% } %>
			                    <% } %>
			                </tbody>
			              </table>
			          </div>
			          <script>
						function enrollPage() {
						
							location.href = "<%= contextPath %>/admin_enrollForm.ex"; 
						}
						
						function updatePage() {
						   	location.href = "<%= contextPath %>/admin_UpdateForm.ex?eno=" + $("input[name=chk]:checked").val(); 
						}
				          
				      	function deletePage() {
				          	location.href = "<%= contextPath %>/admin_delete.ex?eno=" + $("input[name=chk]:checked").val(); 
				      	}
				      	
			            $(function() {
			              
			            	$("tr").on("click", "#exTitle", function() {
			                
			                location.href = "<%= contextPath %>/admin_detail.ex?eno=" + $(this).siblings().eq(1).text();
			              });
			            });
			          </script>
			          <br><br><br><br><br>
			
			          <div id="ex-paging-admin" align="center">
		            	<% if(currentPage != 1) { %>
		                    <button onclick="location.href='<%= contextPath %>/admin_list.ex?currentPage=<%= currentPage - 1 %>';" class="btn btn-secondary">&lt;</button>
		            	<% } %>
		            	
		            	<% for(int p = startPage; p <= endPage; p++) { %>
		            	
		            		<% if(p != currentPage) { %>
		                        <button onclick="location.href='<%= contextPath %>/admin_list.ex?currentPage=<%= p %>';" class="btn btn-secondary"><%= p %></button>
		            		<% } else { %>
		                        <button disabled class="btn btn-secondary"><%= p %></button>
		            		<% } %>
		            	<% } %>
		
		                <% if(currentPage != maxPage) { %>
		                    <button onclick="location.href='<%= contextPath %>/admin_list.ex?currentPage=<%= currentPage + 1 %>';">&gt;</button>
		            	<% } %>
			          </div>
				</div>

			</div>
			<!-- content 영역 끝 -->
		</div>
		<!-- End of Content Wrapper -->

	</div>

	<%@ include file="../admin/adminScript.html"%>

</body>

</html>
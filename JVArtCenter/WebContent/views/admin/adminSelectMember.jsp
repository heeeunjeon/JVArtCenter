<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.member.model.vo.Member, com.kh.common.model.vo.PageInfo" %>    
<%@ include file="adminPath.jsp" %>    
<% // request 에 담았던 list 키값의 값을 뽑아오기 
	// ArrayList<Member> list = 
	//(ArrayList<Member>)request.getAttribute("list");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
			height: 1000px;
		};
		#accordionSidebar { width: 224px; }
		#content-wrapper { width: 1676px; }
		
		#accordionSidebar, #content-wrapper {
			float: left;
			height: 100%;
		}
		
		#search{
			width: 100px;
			height: 40px;
		}
		#findType{
			height: 40px;
		}
		#searchbtn{
			background-color: rgba(31, 31, 209, 0.849);
			font-weight: 700;
			width: 90px;
		}
		#mem{
			width: 20px;
		}


		#member-search-admin{
			margin-left: 50px;
		}

		#info{
			margin-left: 50px;
		}

		#searchw{
			height: 40px;
		}

    </style>
</head>
<body>
	
	<div class="wrapper">
	
		<%@ include file="adminSidebar.jsp" %>
		
	    <!-- Content Wrapper -->
	    <div id="content-wrapper" class="d-flex flex-column">
	
	        <!-- content 영역 시작 -->
	        <div id="content">
				
				<%@ include file="adminTopbar.jsp" %>
	
				
						<div id="member-search-admin" >
					        <form action="<%= contextPath %>/selectmember.admin?currentPage=1" method="get">
								<select name="keyword" id="findType">
									<option value="" hidden disabled selected>::검색 유형::</option>
									<option value="memName">회원이름</option>
									<option value="phone">연락처</option>
								</select>
								<input type="text" name="searchword" placeholder="검색어를 입력하세요" id="searchw" required>
								<button class="btn btn-success" id="searchbtn">검 색</button>
								<input type="hidden" name="currentPage" value="1">
							</form>
		              </div><br>
		              				
					
						<table id="info">
							<thead>
								<tr style="background-color:#4e73df; color:white; height:50px;">
									<th width="20px" style="text-align: center">NO</th>
									<th width="200px"style="text-align: center">회원등급</th>
									<th width="100px" style="text-align: center">아이디</th>
									<th width="100px" style="text-align: center">비밀번호</th>
									<th width="100px" style="text-align: center">성함</th>
									<th width="200px" style="text-align: center">휴대폰번호</th>
									<th width="50px" style="text-align: center">성별</th>
									<th width="300px" style="text-align: center">이메일</th>
									<th width="100px" style="text-align: center">생년월일</th>
									<th width="100px" style="text-align: center">가입일</th>
									<th width="100px" style="text-align: center">탈퇴현황</th>
								  </tr>
							</thead>
							<tbody>
								<% for(Member m : list) { %>
									<tr>
										<td width="20px" style="text-align: center"><%= m.getMemNo() %></td>
										<td width="200px"style="text-align: center"><%= m.getGrCode() %></td>
										<td width="100px" style="text-align: center"><%= m.getMemId() %></td>
										<td width="100px" style="text-align: center"><%= m.getMemPwd() %></td>
										<td width="100px" style="text-align: center"><%= m.getMemName() %></td>
										<td width="200px" style="text-align: center"><%= m.getPhone() %></td>
										<td width="40px" style="text-align: center"><%= m.getGender() %></td>
										<td width="300px" style="text-align: center"><%= m.getEmail() %></td>
										<td width="100px" style="text-align: center"><%= m.getBirthDate() %></td>
										<td width="100px" style="text-align: center"><%= m.getEnrollDate() %></td>
										<td width="100px" style="text-align: center"><%= m.getMemStatus() %></td>
									</tr>
								<%} %>
							</tbody>	
						</table><br>
			
				
       			 <div align="center" class="paging-area">
		            <% if(keyword != null) { %>
		            	<% if(currentPage != 1) { %>
		                    <button onclick="location.href='<%= contextPath %>/selectmember.admin?currentPage=<%= currentPage - 1 %>&searchword=<%=searchword %>&keyword=<%=keyword %>';">&lt;</button>
		            	<% } %>
		            	
		            	<% for(int p = startPage; p <= endPage; p++) { %>
		            	
		            		<% if(p != currentPage) { %>
		                        <button onclick="location.href='<%= contextPath %>/selectmember.admin?currentPage=<%= p %>&searchword=<%=searchword %>&keyword=<%=keyword %>';"><%= p %></button>
		            		<% } else { %>
		                        <button disabled><%= p %></button>
		            		<% } %>
		            	<% } %>
		
		                <% if(currentPage != maxPage) { %>
		                    <button onclick="location.href='<%= contextPath %>/selectmember.admin?currentPage=<%= currentPage + 1 %>&searchword=<%=searchword %>&keyword=<%=keyword %>';">&gt;</button>
		            	<% } %>
		            	
		            <% } else { %>
		            	<% if(currentPage != 1) { %>
		                    <button onclick="location.href='<%= contextPath %>/selectmember.admin?currentPage=<%= currentPage - 1 %>';">&lt;</button>
		            	<% } %>
		            	
		            	<% for(int p = startPage; p <= endPage; p++) { %>
		            	
		            		<% if(p != currentPage) { %>
		                        <button onclick="location.href='<%= contextPath %>/selectmember.admin?currentPage=<%= p %>';"><%= p %></button>
		            		<% } else { %>
		                        <button disabled><%= p %></button>
		            		<% } %>
		            	<% } %>
		
		                <% if(currentPage != maxPage) { %>
		                    <button onclick="location.href='<%= contextPath %>/selectmember.admin?currentPage=<%= currentPage + 1 %>';">&gt;</button>
		            	<% } %>
		            <% } %>
					
				</div>
	        </div>
	        <!-- content 영역 끝 -->

	    </div>
	    <!-- End of Content Wrapper -->
	    
	</div>
	    
    <%@ include file="adminScript.html" %>
	
</body>
</html>
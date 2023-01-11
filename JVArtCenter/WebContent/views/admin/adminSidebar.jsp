<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");	
%>

	<script>
	
		if("<%= alertMsg %>" != "null") {
			alert("<%= alertMsg %>");
			// 알림창을 띄워준 후 session 에 담긴 해당 메세지를 지워줘야함
			// 안그러면 menubar.jsp 가 로딩될 때마다 매번 alert 가 계속 뜰 것!!
			
			<% session.removeAttribute("alertMsg"); %>
		}
		
		if("<%= errorMsg %>" != "null") {
			alert("<%= errorMsg %>");
			<% session.removeAttribute("errorMsg"); %>
		}
		
	</script>

<!-- 사이드메뉴바 -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="<%= path %>/admin">

		<div class="sidebar-brand-text mx-3">JV artcenter admin</div>
	</a>
	<div class="sidebar-brand-icon rotate-n-15"></div>
	<!-- Divider -->
	<hr class="sidebar-divider my-0">



	<!-- 전시관리 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href=""
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>전시관리</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="<%= path %>/admin_list.ex?currentPage=1">전시 목록</a> <a class="collapse-item"
					href="<%= path %>/admin_enrollForm.ex">전시 추가</a>
			</div>
		</div></li>



	<!-- 회원관리 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href=""
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fas fa-fw fa-wrench"></i> <span>회원관리</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">

				<a class="collapse-item" href="<%= path %>/selectmember.admin?currentPage=1">회원 정보 조회</a>

			</div>
		</div></li>



	<!-- 서비스관리 메뉴 -->
	<li class="nav-item"><a class="nav-link collapsed" href=""
		data-toggle="collapse" data-target="#collapsePages"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span>서비스관리</span>
	</a>
		<div id="collapsePages" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Login Screens:</h6>
				<a class="collapse-item" href="<%= path %>/admin_list.no?currentPage=1">공지사항
					목록</a> <a class="collapse-item"
					href="<%= path %>/admin_list.news?currentPage=1">뉴스레터 목록</a> <a
					class="collapse-item" href="<%= path %>/admin_list.qna?currentPage=1">1대1문의
					목록</a> <a class="collapse-item" href="<%= path %>/admin_list.re?currentPage=1">리뷰목록</a>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- 사이드메뉴바 끝 -->


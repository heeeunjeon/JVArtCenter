<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.ArrayList, com.kh.exhibition.model.vo.Exhibition"%>
<%@ include file="../common/menubar.jsp"%>
<%
	ArrayList<Exhibition> list = (ArrayList<Exhibition>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
#content { height: 1500px; }

#mypage_content {
	margin-top: 70px;
}
.bmThumbnail {
	width: 290px;
	height: 360px;
	display: inline-block;
	margin: 15px;
	font-size: 13px;
	font-weight: 400;
	vertical-align: middle;
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
				<div id="mypage_content" class="bookmark">
					<div id="bookmark-1">
						<h1>북마크🔖</h1>
					</div>
					<br>
             
					<div id="bookmark-3" style="width: 1050px;" align="center">
								
								<% if(!list.isEmpty()) { %>
         							
									<% for(Exhibition e : list) { %>
									
										<div class="bmThumbnail" align="center">
											<a href="<%= contextPath %>/detail.ex?eno=<%= e.getExNo() %>" style="width: 230px; height: 300px;"><img src="<%= contextPath %>/<%= e.getExThumbnail() %>" width="230px" height="300px"></a><br><br>
											<b style="display: block"><%= e.getExTitle() %></b>
										</div>
									<% } %>										
										
								<% } else { %>
									<h3 align="center">등록된 북마크가 없습니다.</h3>
								<% } %>
					</div>
				</div>
			</div>


			<div id="content_3"></div>
		</div>
	</div>
	<%@ include file="../common/footerbar.jsp"%>

</body>
<script>
    var click = document.getElementById("bookmark-3");

   	click.addEventListener("click",function(){
        //alert('클릭');
        //클릭 시 상세 이동
        
   	});   	 

</script>
</html>
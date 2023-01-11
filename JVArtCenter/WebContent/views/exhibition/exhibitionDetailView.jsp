<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.exhibition.model.vo.Exhibition" %>
<%@ page import="com.kh.review.model.vo.Review" %>
<%@ include file="../common/menubar.jsp" %>
<% 
	Exhibition ex = (Exhibition)request.getAttribute("ex"); // 조회된 내용물 출력하기
	boolean isBM = (boolean)request.getAttribute("isBM"); // 컨트롤러에서 넘겨준 변수사용가능
	ArrayList<Review> review = (ArrayList<Review>)request.getAttribute("review"); // 조회된 리뷰 출력하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 2500px; }
	
	/* ----- 추가한 스타일은 여기에 ----- */
	#ex_detail {
		margin: auto;
	    width: 80%;
	    table-layout: fixed; /* 테이블 사이즈가 어떤 경우에도 바뀌지 않도록 */
	    margin-top: 20px;
	}
	#info_review {
		margin: auto;
		width: 80%;
		margin-top: 10px;
	}
	#ex_info, #ex_review {
		box-sizing: border-box;
		border: 1px solid black;
		border-bottom: none;
	}

</style>

</head>
<body>
    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->
      
      <div id="navi">
        <!--세부메뉴 영역-->
        <a href="<%= contextPath %>/list.ex?term=C&currentPage=1">현재전시</a>
        <a href="<%= contextPath %>/list.ex?term=P&currentPage=1">지난전시</a>
        <a href="<%= contextPath %>/list.ex?term=F&currentPage=1">오픈예정</a>
      </div>
	
	  <% if(ex.getExImage() != null) { %>
	  	<div id="content" style="height: 2000px;">
	  <% } else { %>	
      	<div id="content" style="height: 1600px;">
      <% } %>
        <!--바디-->
        <div id="content_1"></div>
        <div id="content_2">
            <!-- content 내용 여기에 붙여넣기! -->
            
            <table id="ex_detail">
            	
				<tr height="100px">
					<td rowspan="5" align="center" width="50%;">
						<img src="<%= contextPath %>/<%= ex.getExThumbnail() %>" width="430px" height="500px">
					</td>
					<td rowspan="5" width="10%;"></td>
					<th width="40%;"><h2><%= ex.getExTitle() %></h2></th>
				</tr>
				<tr height="100px">
					<td><%= ex.getStartDate() %> ~ <%= ex.getEndDate() %></td>
				</tr>
				<tr height="100px">
					<td><%= ex.getLcCode() %></td>
				</tr>
				<tr height="100px">
					<td><%= ex.getPrice() %>원</td>
				</tr>
				<tr height="100px">
					<td>
						<a href="" class="btn btn-primary" onclick="bookmark();">
						<% if(!isBM) { %>
							<b style="font-size: 18px; color: white;">♥</b>
						<% } else { %>
							<b style="font-size: 18px; color: red;">♥</b>
						<% } %>
						
						</a>
						<a href="<%= contextPath %>/detail.resv?exno=<%= ex.getExNo() %>" class="btn btn-primary">예매하기</a>
					</td>
				</tr>
				
            </table>
            
            <div style="margin: auto; margin-top: 25px; width: 80%; border-bottom: 1px solid black">
            	<input type="button" class="btn btn-secondary" id="ex_info" value="상세안내">
            	<input type="button" class="btn btn-secondary" id="ex_review" value="리뷰">
            </div>
            
            <table id="info_review">
            	
            	<% if(ex.getArtists() != null) { %>
            		<tr><td>참여 작가 : <%= ex.getArtists() %></td></tr>
            	<% } else { %>
            		<tr><td>참여 작가 : 없음</td></tr>
            	<% } %>
            	<tr height="20px;"></tr>
				<tr><td><%= ex.getExContent() %></td></tr>
				<tr height="40px;"></tr>
				<% if(ex.getExImage() != null) { %>
					<tr><td align="center"><img src="<%= contextPath %>/<%= ex.getExImage() %>" width="730px" height="800px"></td></tr>
				<% } %>
            	
            </table>
            
            <script>
				$(function() {
					
					$("#ex_info").on("click", function() {
						var str = "<tr><td>참여 작가 : <%= ex.getArtists() %></td></tr>"
								+ "<tr height='20px;'></tr>"
								+ "<tr><td><%= ex.getExContent() %></td></tr>"
								+ "<tr height='20px;'></tr>";
								<% if(ex.getExImage() != null) { %>
							str	+= "<tr><td align='center'><img src='<%= contextPath %>/<%= ex.getExImage() %>' width='630px' height='700px'></td></tr>";
								<% } %>
						
						$("#info_review").html(str);
					});
					
					
					$("#ex_review").on("click", function() {
						
						var str = "";
						
						if(<%= review.isEmpty() %>) {
							str = "작성된 리뷰가 없습니다.";
						} else {
								<% for(Review r : review) { %>
								
									str += "<tr><td>" + "<%= r.getReviewContent() %>" + "</td></tr>";
								<% } %>
							
						}
						
						console.log(str);
						
						$("#info_review").html(str);
					});
				});
				
				function bookmark() {
					
					$.ajax({
						url : "bookmark.ex",
						data : {
							isBM : <%= isBM %>,
							exNo : <%= ex.getExNo() %>
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					});
				}
			</script>
            
        </div>
        <div id="content_3"></div>
    </div>
   </div>
   
   <%@ include file="../common/footerbar.jsp" %>

  </body>
</html>
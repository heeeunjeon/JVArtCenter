<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.exhibition.model.vo.Exhibition, com.kh.common.model.vo.PageInfo" %>
<%@ include file ="../common/menubar.jsp"%>
<%
	ArrayList<Exhibition> list = (ArrayList<Exhibition>)request.getAttribute("list"); // 조회된 내용물 출력하기
	String exlist = (String)request.getAttribute("exlist");	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 2000px; }
	
	/* ----- 추가한 스타일은 여기에 ----- */
	/* 검색창 */
	  #ex_search { height: 50px; }
	  #ex_search input {
	    height: 100%;
	    border: 1px solid black;
	    margin: 0px;
	    box-sizing: border-box;
	  }
	  #ex_search input[type=submit] {
	    vertical-align: top; /* 텍스트 입력칸과 높이가 맞지 않아서 상단으로 올렸음 */
	    line-height: 8px;
	  }	
	  
	  /* 전시 목록 테이블 전체 */
	  #ex_list {
	    margin: auto;
	    width: 80%;
	    table-layout: fixed; /* 테이블 사이즈가 어떤 경우에도 바뀌지 않도록 */
	    margin-top: 50px;
	  }
	  #ex_list tr {
	  	height: 100px;
	  }
	  #ex_list td {
		font-size: 20px;	  	
	  }
	  
	  #exPaging {
	  	margin-top: 50px;
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

      <div id="content">
        <!--바디-->
        <div id="content_1"></div>
        <div id="content_2">
        <!-- content 내용 여기에 붙여넣기! -->
        
        <% if(exlist.equals("C")) { %>
        	<h2 align="center">현재전시</h2>
        <% } else if(exlist.equals("P")) { %>
        	<h2 align="center">지난전시</h2>
        <% } else { %>
        	<h2 align="center">오픈예정</h2>
        <% } %>
        
        
          	<div id="ex_search" align="right">
	          <input type="text" id="searchWord" placeholder="작품명 검색" style="padding-left : 10px;">
	          <input type="submit" class="btn btn-primary" value="검색" onclick="searchEx();">
       		</div>
		  <table id="ex_list">
       		<% if(list.isEmpty()) { %>
       			<h2 align="center" style="margin-top: 200px;">현재 진행중인 전시가 없습니다.</h2>
		  	<% } else { %>
		       <% for(Exhibition ex : list) { %>
		       		<tr>
						<td width="40%" height="300 !important" rowspan="3">
							<button type="button" style="padding: 5px;">
								<img src="<%= contextPath %>/<%= ex.getExThumbnail() %>" width="230px" height="300px">
								<input type="hidden" value="<%= ex.getExNo() %>">
							</button>
						</td>
						<td align="right" style="vertical-align: bottom;"><h2><%= ex.getExTitle() %></h2></td>
					</tr>
					<tr>
						<td align="right"><h3><%= ex.getLcCode() %></h3></td>
					</tr>
					<tr>
						<td align="right" style="vertical-align: top;"><%= ex.getStartDate() %> ~ <%= ex.getEndDate() %></td>
					</tr>
					<tr style="height: 20px !important;"></tr>
		       	<% } %>
	       <% } %>
		  </table>
		  
		  <div id="exPaging" align="center">
            
           	<% if(currentPage != 1) { %>
           		<button onclick="location.href='<%= contextPath %>/list.ex?term=<%= exlist %>&currentPage=<%= currentPage - 1 %>';" class="btn btn-secondary">&lt;</button>
           	<% } %>
           	
           	<% for(int p = startPage; p <= endPage; p++) { %>
           	
           		<% if(p != currentPage) { %>
           			<button onclick="location.href='<%= contextPath %>/list.ex?term=<%= exlist %>&currentPage=<%= p %>';" class="btn btn-secondary"><%= p %></button>
           		<% } else { %>
           			<button disabled class="btn btn-secondary"><%= p %></button>
           		<% } %>
           	<% } %>

            <% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%= contextPath %>/list.ex?term=<%= exlist %>&currentPage=<%= currentPage + 1 %>';" class="btn btn-secondary">&gt;</button>
           	<% } %>
            </div>
		  
            <script>
              $(function() {
            	  $(document).on("click", "#ex_list button>img", function() {
                  	
                  	location.href = "<%= contextPath %>/detail.ex?eno=" + $(this).next().val();
                });
              });
              
              function searchEx() {

					$.ajax({
						url : "search.ex",
						data : {
							searchWord : $("#searchWord").val(),
							exlist : "<%= exlist %>"
						},
						success : function(result) {

							var str = "";
							
							if(result.length != 0) {
								
								for(var i = 0; i < result.length; i++) {
								
									str += "<tr>"
										+ 		"<td width='40%' height='300 !important' rowspan='3'>"
										+ 		"<button type='button' style='padding: 5px;'>"
										+			"<img src=<%= contextPath %>/" + result[i].exThumbnail + " width='230px' height='300px'>"
										+ 			"<input type='hidden' value='" + result[i].exNo + "'>"
										+ 		"</button>"
										+ 		"</td>"
										+ 		"<td align='right' style='vertical-align: bottom;'><h2>" + result[i].exTitle + "</h2></td>"
										+ "</tr>"
										+ "<tr><td align='right'><h3>" + result[i].lcCode + "</h3></td></tr>"
										+ "<tr><td align='right' style='vertical-align: top;'>" + result[i].startDate + " ~ " + result[i].endDate + "</td></tr>"
										+ "<tr style='height: 20px !important;'></tr>";
								}
							} else {

								str = "<h2 align='center' style='margin-top: 200px;'>해당 키워드가 포함된 전시가 없습니다.</h2>";
								
							}

							$("#ex_list").html(str);

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
        
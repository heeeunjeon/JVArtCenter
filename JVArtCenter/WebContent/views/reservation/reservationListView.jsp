<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.exhibition.model.vo.Exhibition"%>
<%@ include file="../common/menubar.jsp" %>
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
	#content { height: 3200px; }
	
	/* ----- Reservation 공통 스타일 ----- */
	  /* 전체적으로 조금씩 띄우기 */
	  #content_2 * { margin: 1px; }
	  /* 상단 스텝바 세로길이 */
	  #resv_step {
	      height : 75px;
	  }
	  /* 각 스텝 div */
	  #resv_step>div {
	      display: inline-block;
	      width: 32%; /* margin 이 들어가 있어서 1/3 씩 */
	      height: 100%;
	      margin: 1px;
	      line-height: 70px;
	      font-weight: bold;
	  }
	  /* 진행됐거나 진행 중인 단계에만 스타일 적용 */
	  #resv_step_1 {
	    background-color: black;
	      color: white;
	  }
		
	/* ----- ReservationStep1 스타일 ----- */
	  /* 스텝바를 제외한 전체 영역 */
	  #resv_content {
	      height: 100%;
	      margin-top: 35px;
	  }
	
	  /* 검색창 */
	  #resv_search { height: 60px; }
	  #resv_search input {
	    height: 100%;
	    border: 1px solid black;
	    margin: 0px;
	    box-sizing: border-box;
	  }
	  #resv_search input[type=button] {
	    vertical-align: top; /* 텍스트 입력칸과 높이가 맞지 않아서 상단으로 올렸음 */
	    line-height: 8px;
	  }
	  #searchExKeyword {
	  	padding-left : 10px;
	  }
	
	  /* 테이블 확인용 테두리 */
	  /* #resv_list td { border: 1px solid red;} */
	  /* 전시 목록 테이블 전체 */
	  #resv_list {
	    margin: auto;
	    width: 60%;
	    table-layout: fixed; /* 테이블 사이즈가 어떤 경우에도 바뀌지 않도록 */
	    margin-top: 50px;
	  }
	  #resv_list tr {
	  	height: 100px;
	  }
	  
</style>
</head>
<body>

    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->
      
      <div id="navi">
        <!--세부메뉴 영역-->
      </div>

      <div id="content">
        <!--바디-->
        <div id="content_1"></div>
        <div id="content_2">

          <div id="resv_step" align="center">
            <div id="resv_step_1">01.티켓선택</div>
            <div id="resv_step_2">02.관람일/인원선택</div>
            <div id="resv_step_3">03.결제</div>
          </div>
          <br>

          <div id="resv_content">
            <div id="resv_search" align="center">
              <input type="text" id="searchExKeyword" style="width: 300px;">
              <input type="button" class="btn btn-primary" value="검색" onclick="searchExList();">
          	</div>
            
	          <br>
			
			<table id="resv_list">
	          	
				<% if(!list.isEmpty()) { %>

					<% for(Exhibition ex : list) { %>
						<tr>
							<td width="40%" height="300 !important" rowspan="3">
								<button type="button" style="padding: 5px;">
									<img src="<%= contextPath %>/<%= ex.getExThumbnail() %>" width="230px" height="300px">
									<input type="hidden" value="<%= ex.getExNo() %>">
								</button>
							</td>
							<td rowspan="3" width="10%"></td>
							<td style="vertical-align: bottom;"><h3><%= ex.getExTitle() %></h3></td>
						</tr>
						<tr>
							<td><h4><%= ex.getLcCode() %></h4></td>
						</tr>
						<tr>
							<td style="vertical-align: top;"><%= ex.getStartDate() %> ~ <%= ex.getEndDate() %></td>
						</tr>
						<tr style="height: 20px !important;"></tr>
					<% } %>
				<% } else { %>
					<h2 align="center" style="margin-top: 200px;">현재 예매 가능한 전시가 없습니다.</h2>
				<% } %>
	          </table>
	          
	          <script>
	          	$(function() {
	          		
	          		$(document).on("click", "#resv_list button>img", function() {
	          			
	          			location.href = "<%= contextPath %>/detail.resv?exno=" + $(this).next().val();
	          		});

	          	});

				function searchExList() {

					$.ajax({
						url : "search.resv",
						data : { keyword : $("#searchExKeyword").val() },
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
										+ 		"<td rowspan='3' width='10%'></td>"
										+ 		"<td style='vertical-align: bottom;'><h3>" + result[i].exTitle + "</h3></td>"
										+ "</tr>"
										+ "<tr><td><h4>" + result[i].lcCode + "</h4></td></tr>"
										+ "<tr><td style='vertical-align: top;'>" + result[i].startDate + " ~ " + result[i].endDate + "</td></tr>"
										+ "<tr style='height: 20px !important;'></tr>";
								}
							} else {

								str = "<h2 align='center' style='margin-top: 200px;'>해당 키워드가 포함된 전시가 없습니다.</h2>";
								
							}

							$("#resv_list").html(str);

						},
						error : function() {
							console.log("ajax 통신 실패");
						}

					});
				}
	          </script>
			
	          
          </div>

        </div>
        <div id="content_3"></div>
      </div>
    </div>
    
    <%@ include file="../common/footerbar.jsp" %>

  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.exhibition.model.vo.Exhibition"%>
<%@ include file="../common/menubar.jsp" %>
<%
	Exhibition ex = (Exhibition)request.getAttribute("ex");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 1800px; }
	
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
	  #resv_step_1, #resv_step_2 {
	    background-color: black;
	      color: white;
	  }
	
	/* ----- ReservationStep2 스타일 ----- */
	/* 스텝바를 제외한 전체 영역 */
	#resv_content {
	      height: 100%;
	      margin-top: 80px;
	}
	
	/* 전체 가로길이 고정 */
	#resv_table, #resv_form { width: 800px; }

	/* 전시정보에 대한 스타일 */
	#resv_info>img {
		max-height: auto;
		margin-bottom: 20px;
	}
	#resv_info>table tr { vertical-align: top; }
	
	/* 예매 정보를 입력하는 테이블 스타일 */
	#resv_form th, #resv_form td {
		/* 테이블 확인용 테두리 */
		/* border: 1px solid red; */
		padding: 10px;
	}
	#resv_form table th {
		vertical-align: top;
		text-align: center;
	}

	/* 입력칸에 대한 스타일 */
	#resv_form input, #resv_form select {
		box-sizing: border-box;
		width: 100%;
		text-align: center;
		height: 47px;
	}

	#resv_form_btn {
		font-size: large;
		height: 55px;
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
        <div id="content_2" align="center">

			<div id="resv_step" align="center">
				<div id="resv_step_1">01.티켓선택</div>
				<div id="resv_step_2">02.관람일/인원선택</div>
				<div id="resv_step_3">03.결제</div>
			</div>
			<br>

			<div id="resv_content">

				<div id="resv_info">
					
					<div style="width: 600px; margin-bottom: 60px;"><img src="<%= contextPath %>/<%= ex.getExThumbnail() %>" style="max-width: 100%; height: auto;"></div>
					<br>

					<table id="resv_table">
						<tr>
							<td colspan="4">
							<h2 style="margin-bottom: 20px;"><%= ex.getExTitle() %></h2>
							<hr style="margin-bottom: 30px;">
							</td>
						</tr>
						<tr height="100px">
							<th>전시기간</th>
							<td><%= ex.getStartDate() %> ~ <%= ex.getEndDate() %></td>
							<th>장소</th>
							<td><%= ex.getLcCode() %></td>
						</tr>
						<tr height="100">
							<th>운영시간</th>
							<td>
							월요일 휴관 <br>
							화요일 ~ 일요일 11:00 ~ 18:00 <br>
							입장마감 17:00
							</td>
							<th>이용요금</th>
							<td><%= ex.getPrice() %> 원</td>
						</tr>
					</table>
					
						<br><br>
					
						<form id="resv_form" action="<%= contextPath %>/insert.resv" method="post">
							<input type="hidden" name="memNo" value="<%= loginUser.getMemNo() %>">
							<input type="hidden" name="exNo" value="<%= ex.getExNo() %>">
							<input type="hidden" name="exTitle" value="<%= ex.getExTitle() %>">
							<input type="hidden" name="location" value="<%= ex.getLcCode() %>">
							<input type="hidden" name="price" value="<%= ex.getPrice() %>">
							
							<div>
								<table>
									<tr>
										<th width="250">
											날짜 <br>
											<small>* 당일은 현장예매만 가능합니다.</small>
										</th>
										<th width="250">회차</th>
										<th width="250">
											인원 <br>
											<small>* 1인 4매까지 예매 가능합니다.</small>
										</th>
									</tr>
									<tr>
										<td><input type="date" name="date"></td>
										<td>
											<select name="time">
												<option value="all" selected>전회차 가능 11:00 ~ 18:00</option>
											</select>
										</td>
										<td><input type="number" name="count" value="1" min="1" max="4"></td>
									</tr>							
								</table>
							</div>
							
							<br><br>
							<div align="center">
								<button type="submit" id="resv_form_btn" class="btn btn-primary" style="width: 400px;" onclick="return validate();">예매하기</button>
							</div>
						</form>
						
						<script>
						
							function validate() {
								
								var startDate = new Date("<%= ex.getStartDate() %>");
								startDate.setHours(0, 0, 0, 0);
								var endDate = new Date("<%= ex.getEndDate() %>");
								endDate.setHours(0, 0, 0, 0);
								
								// input 입력값 확인
								var date = new Date($("#resv_form input[type=date]").val());
								date.setHours(0, 0, 0, 0);
								var count = $("#resv_form input[type=number]").val();
								var now = new Date();
								now.setHours(0, 0, 0, 0);

								if($("#resv_form input[type=date]").val() == "") {
									alert("날짜를 입력해주세요.");
									return false;
								} else {
									
									if((date < startDate) || (date > endDate)) {
										alert("예매 가능한 기간이 아닙니다.");
										return false;
									} else if(date < now) {
										alert("지난 날짜는 예매할 수 없습니다.");
										return false;
									} else if(date.getTime() == now.getTime()) {
										alert("당일은 현장예매만 가능합니다.");
										return false;
									}
								}
							}
						
						</script>
				</div>
			</div>
        </div>
        <div id="content_3"></div>
      </div>
     </div>
    
    <%@ include file="../common/footerbar.jsp" %>

  </body>
</html>
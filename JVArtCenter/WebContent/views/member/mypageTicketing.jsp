<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.reservation.model.vo.Reservation"%>
<%@ include file="../common/menubar.jsp"%>
<%
	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>

<style>
/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
/* #content { height: 2000px; } */
#mypage_text {
	font-size: 40px;
	font-weight: bold;
}

#mypage_menuName {
	font-size: 30px;
	font-weight: bold;
	padding: 30px;
	padding-top: 50px;
}

#mypage_Ticketing_LookUp {
	width: 1013px;
	margin: 30px;
	font-size: 15px;
	text-align: center;
	padding: none !important;
}

#mypage_Ticketing_LookUp td {
	padding: 15px;
}

#mypage_Ticketing_btn {
	float: right;
	padding: 20px;
}

.form-control {
	display: inline;
	width: 200px;
}

.pagination {
	padding-left: 50%;
}

#mypage_Ticketing_LookUp>thead th { font-size: 17px; }


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
				<div id="mypage_content">

					<div id="mypage_menuName">최근 예매 내역</div>
					<!-- 검색 필터 및 버튼 -->
					<div id="mypage_Ticketing_btn">
						<button value="3" class="btn btn-outline-primary" onclick="search3Months();">3개월</button>
						<button value="6" class="btn btn-outline-primary" onclick="search6Months();">6개월</button>
						&emsp; <input type="date" id="startResvDate" class="form-control">
						&nbsp;~&nbsp;<input type="date" id="endResvDate" class="form-control">
						<button type="button" class="btn btn-primary" onclick="searchResvDate();">검색</button>
					</div>


					<!-- 예매내역 리스트  -->
					<table id="mypage_Ticketing_LookUp" class="table table-hover">
						<thead>
							<tr style="background-color: black; color: white;">
								<th width="200">전시명</th>
								<th width="90">관람일자</th>
								<th width="70">수량</th>
								<th width="70">결제금액</th>
								<th width="70">결제여부</th>
								<th width="70">상세내역</th>
							</tr>
						</thead>
						<tbody>
							<% if(list.isEmpty()) { %>
								<tr>
									<td colspan="6">최근 예매내역이 없습니다.</td>
								</tr>
							<% } else { %>
								<% for(Reservation rv : list) { %>
									<tr>
										<td><%= rv.getExNo() %></td>
										<td><%= rv.getResvDate() %></td>
										<td><%= rv.getCount() %></td>
										<td><%= rv.getPayment() %></td>
										<% if(rv.getPayStatus().equals("Y")) { %>
											<td>결제완료</td>
											<td>
												<a href="<%= contextPath %>/mypageTicketingDetail.bo?rno=<%= rv.getResvNo() %>" class="btn-link">상세보기</a>
											</td>
										<% } else if(rv.getPayStatus().equals("C")) { %>
											<td>취소환불</td>
											<td>
												<a href="<%= contextPath %>/mypageTicketingDetail.bo?rno=<%= rv.getResvNo() %>" class="btn-link">상세보기</a>
											</td>
										<% } %>
									</tr>
								<% } %>
							<% } %>
						</tbody>
					</table>
					
					<script>
						function search3Months() {
		
							$.ajax({
								url : "ticketingSearch3.me",
								data : { memNo : <%= loginUser.getMemNo() %> },
								success : function(result) {
		
									var str = "";
									var status = "";
									
									if(result.length != 0) {
										
										for(var i = 0; i < result.length; i++) {
											
											if(result[i].payStatus === "Y") {
												status = "결제완료";
											} else if(result[i].payStatus === "C") {
												status = "취소완료";		
											} else {
												status = "미결제";
											}
										
											str += "<tr>"
												+ 		"<td>" + result[i].exNo + "</td>"
												+ 		"<td>" + result[i].resvDate + "</td>"
												+ 		"<td>" + result[i].count + "</td>"
												+ 		"<td>" + result[i].payment + "</td>"
												+		"<td>" + status + "</td>"
												+		"<td><a href='<%= contextPath %>/mypageTicketingDetail.bo?rno=" + result[i].resvNo + "' class='btn-link'>상세보기</a></td>"
												+ "</tr>";
										}
										
									} else {
		
										str = "<tr><td colspan='6'>3개월 이내 예매내역이 없습니다.</td></tr>";
										
									}
		
									$("#mypage_Ticketing_LookUp>tbody").html(str);
		
								},
								error : function() {
									console.log("ajax 통신 실패");
								}
							});
						}
						
						function search6Months() {
							
							$.ajax({
								url : "ticketingSearch6.me",
								data : { memNo : <%= loginUser.getMemNo() %> },
								success : function(result) {
		
									var str = "";
									var status = "";
									
									if(result.length != 0) {
										
										for(var i = 0; i < result.length; i++) {
											
											if(result[i].payStatus === "Y") {
												status = "결제완료";
											} else if(result[i].payStatus === "C") {
												status = "취소완료";		
											} else {
												status = "미결제";
											}
										
											str += "<tr>"
												+ 		"<td>" + result[i].exNo + "</td>"
												+ 		"<td>" + result[i].resvDate + "</td>"
												+ 		"<td>" + result[i].count + "</td>"
												+ 		"<td>" + result[i].payment + "</td>"
												+		"<td>" + status + "</td>"
												+		"<td><a href='<%= contextPath %>/mypageTicketingDetail.bo?rno=" + result[i].resvNo + "' class='btn-link'>상세보기</a></td>"
												+ "</tr>";
										}
										
									} else {
		
										str = "<tr><td colspan='6'>6개월 이내 예매내역이 없습니다.</td></tr>";
										
									}
		
									$("#mypage_Ticketing_LookUp>tbody").html(str);
		
								},
								error : function() {
									console.log("ajax 통신 실패");
								}
							});
						}
						
						function searchResvDate() {
							
							var start = new Date($("#startResvDate").val());
							start.setHours(0, 0, 0, 0);
							var end = new Date($("#endResvDate").val());
							end.setHours(0, 0, 0, 0);
							
							if(end < start) {
								alert("조회하신 기간이 올바르지 않습니다.\n시작일은 반드시 종료일보다 과거여야 합니다.");
							} else {
								
								$.ajax({
									url : "ticketingSearchDate.me",
									data : {
										memNo : <%= loginUser.getMemNo() %>,
										startDate : $("#startResvDate").val(),
										endDate : $("#endResvDate").val()
									},
									success : function(result) {
										
										var str = "";
										var status = "";
										
										if(result.length != 0) {
											
											for(var i = 0; i < result.length; i++) {
												
												if(result[i].payStatus === "Y") {
													status = "결제완료";
												} else if(result[i].payStatus === "C") {
													status = "취소완료";		
												} else {
													status = "미결제";
												}
											
												str += "<tr>"
													+ 		"<td>" + result[i].exNo + "</td>"
													+ 		"<td>" + result[i].resvDate + "</td>"
													+ 		"<td>" + result[i].count + "</td>"
													+ 		"<td>" + result[i].payment + "</td>"
													+		"<td>" + status + "</td>"
													+		"<td><a href='<%= contextPath %>/mypageTicketingDetail.bo?rno=" + result[i].resvNo + "' class='btn-link'>상세보기</a></td>"
													+ "</tr>";
											}
											
										} else {
			
											str = "<tr><td colspan='6'>검색하신 기간의 예매내역이 없습니다.</td></tr>";
											
										}
			
										$("#mypage_Ticketing_LookUp>tbody").html(str);
			
									},
									error : function() {
										console.log("ajax 통신 실패");
									}
								});
							}
						}
			          </script>
							
				</div>

			</div>
			<div id="content_3"></div>
		</div>

	</div>
	

	<%@ include file="../common/footerbar.jsp"%>

</body>
</html>
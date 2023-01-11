<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.reservation.model.vo.Reservation, com.kh.exhibition.model.vo.Exhibition"%>
<%@ include file="../common/menubar.jsp"%>
<%
	Reservation rv = (Reservation)request.getAttribute("rv");
	Exhibition ex = (Exhibition)request.getAttribute("ex");
	double discount = (double)request.getAttribute("discount");
	
	// 티켓금액
	int ticketPrice = ex.getPrice() * rv.getCount();
	// 할인금액
	int discountPrice = (int)(ticketPrice * discount);
	// 결제금액
	int payPrice = ticketPrice - discountPrice;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
#content { height: 1300px; }
#mypage_text {
	font-size: 40px;
	font-weight: bold;
}

#mypage_menuName {
	font-size: 30px;
	font-weight: bold;
	padding-left: 30px;
	padding-top: 50px;
}

#mypage_Ticketing_LookUp_Detail {
	padding-left: 30px;
}

#mypage_Ticketing_LookUp_Detail table {
	width: 100%;
	height: 50px;
	text-align: left;
}

#mypage_Ticketing_LookUp_Detail2 {
	width: 100%;
	padding-left: 30px !important;
}

#mypage_Ticketing_Detail_btn {
	padding-left: 30px;
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
				<div id="mypage_content">

					<div id="mypage_menuName">예매상세내역</div>

					<!-- 예매 상세내역 -->
					<div id="mypage_Ticketing_LookUp_Detail">
						<hr>
						<h5>예매번호 <%= rv.getResvNo() %></h5>
						<hr>
						<table class="table">
							<tr>
								<td rowspan="8" align="center">
									<img
									id="mypage_Ticketing_LookUp_Detail_img"
									src="<%= contextPath %>/<%= ex.getExThumbnail() %>" width="300px;">
								</td>
							</tr>
							<tr>
								<td style="font-weight: bold; padding: none;" colspan="4"><h3><%= ex.getExTitle() %></h3></td>
							</tr>
							<tr>
								<td style="font-weight: bold; text-align: left;">관람일</td>
								<td><%= rv.getResvDate() %></td>
								<td style="font-weight: bold; text-align: left;">상태</td>
								<% if(rv.getPayStatus().equals("Y")) { %>
									<td>예매완료</td>
								<% } else if(rv.getPayStatus().equals("C")) { %>
									<td>취소완료</td>
								<% } %>
							</tr>
							<tr>
								<td style="font-weight: bold; text-align: left;">예매자</td>
								<td><%= loginUser.getMemName() %></td>
								<td style="font-weight: bold; text-align: left;">예매수량</td>
								<td><%= rv.getCount() %>매</td>
							</tr>
						</table>
					</div>
					<br><br><br>

					<div id="mypage_Ticketing_LookUp_Detail2">
						<hr>
						<h5>결제정보</h5>
						<hr>
						<table class="table">
							<tr>
								<td style="text-align: left; font-weight: bold;" width="150px">티켓금액</td>
								<td style="text-align: right;" width="130px"><%= ticketPrice %>원</td>
								<td style="text-align: left; font-weight: bold;" width="150px">할인금액</td>
								<td style="text-align: right;" width="100px"><%= discountPrice %>원</td>
								<td style="text-align: left; font-weight: bold;" width="150px">최종결제금액</td>
								<td style="text-align: right;" width="130px"><%= payPrice %>원</td>
							</tr>
							<tr>
								<td style="text-align: left; font-weight: bold;">결제일</td>
								<td style="text-align: right;"><%= rv.getPayDate() %></td>
								<td></td><td></td>
								<td style="text-align: left; font-weight: bold;">결제내역</td>
								<td style="text-align: right;"><a href="<%= rv.getReceipt() %>" target="_blank">영수증 보기</a></td>
							</tr>
						</table>
					</div>

					<br><br><br>
					<div id="mypage_Ticketing_Detail_btn" align="center">
						<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#ticketingCancelInfo">취소하기</button>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-outline-primary" onclick="history.back();">돌아가기</button>
					</div>
				</div>
				
				<!-- 모달창 -->
				<div class="modal" tabindex="-1" id="ticketingCancelInfo">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
							<h5 class="modal-title">예매취소</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" align="center">
								<table style="margin: 40px;">
									<tr>
										<td rowspan="7" width="400">
											<img src="<%= contextPath %>/<%= ex.getExThumbnail() %>" width="100%">
										</td>
										<td rowspan="7" width="35"></td>
										<th width="90">전시명</th>
										<td width="200"><%= ex.getExTitle() %></td>
									</tr>

									<tr>
										<th>관람일자</th>
										<td><%= rv.getResvDate() %></td>
									</tr>
									<tr>
										<th>예매자</th>
										<td><%= loginUser.getMemName() %></td>
									</tr>
									<tr>
										<th>휴대폰</th>
										<td>
											<% if(loginUser.getPhone() == null) { %>
												없음
											<% } else { %>
												<%= loginUser.getPhone() %>
											<% } %>
										</td>
									</tr>
									<tr>
										<th>예매수량</th>
										<td><%= rv.getCount() %>매</td>
									</tr>
									<tr>
										<th>결제금액</th>
										<td><%= rv.getPayment() %>원</td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" onclick="cancelPay();">예매취소</button>
							</div>
						</div>
					</div>
				</div>
				
				<script>
						function cancelPay() {
							$.ajax({
								url : "<%= contextPath %>/getToken.resv",
								data : {
									imp_key : "1727133848405455",
									imp_secret : "OCjfwc1lxL1LMNxWqq38WJceT8I24xn8k1e6UGT23s9nxtmFtMouX70Sk09YOR2S3OXI578aeko6jxIB"
								},
								type : "post"
							}).done(function(result) {
								
								// console.log(result.code);
								// console.log(result.response.access_token);
								
								if(result.code == 0) {
									
									
									$.ajax({
										url : "<%= contextPath %>/refund.resv", //
										type : "post",
										data : {
											imp_uid : "<%= rv.getImpUid() %>", // DB에서 조회해온 값 대입할 것
											reason : "고객 요청",
											token : result.response.access_token
										}
									}).done(function(result) {
										
										if(result.delResv > 0) {
											alert("예매가 성공적으로 취소되었습니다.");
											location.href = "<%= contextPath %>/mypageMain.me";
										} else {
											alert(result.message);
										}
										
									}).fail(function(error) {
			
										alert("예매 취소 실패 : " + error.message);
									})
								}
			
							}).fail(function(error) {
			
								alert("토큰 발급 실패");
							})
						}
					</script>
				
				
			</div>
			<div id="content_3"></div>
		</div>
	</div>
	
	<%@ include file="../common/footerbar.jsp"%>

</body>
</html>
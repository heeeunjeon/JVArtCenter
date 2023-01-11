<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.reservation.model.vo.Reservation"%>
<%@ include file="../common/menubar.jsp" %>
<%
	String exTitle = (String)request.getParameter("exTitle");
	String location = (String)request.getAttribute("location");
	int price = (int)request.getAttribute("price");
	String time = (String)request.getAttribute("time");
	int discount = (int)request.getAttribute("discountPrice");
	
	// resvNo, memNo, exNo, date, count
	Reservation rv = (Reservation)request.getAttribute("rv");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 1200px; }
	
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
	  #resv_step_1, #resv_step_2, #resv_step_3 {
	    background-color: black;
	    color: white;
	  }
	  
	/* ----- ReservationStep3 스타일 ----- */
	/* 스텝바를 제외한 전체 영역 */
	#resv_content {
	      height: 100%;
	      margin-top: 80px;
	}

	/* 전체 가로길이 고정 */
	#resv_content>div {
		width: 1200px;
		margin: auto;
	}

	/* 각 테이블들 */
	#resv_pay_info>table td, #resv_payment>table th+td { padding: 5px;}
	/* #resv_pay_info th, #resv_pay_info td { vertical-align: top; } */
	#resv_payment td { text-align: right; }

	/* 결제하기 버튼 */
	#payment_btn {
		font-size: large;
		height: 55px;
	}
	
	/* #resv_content td { border: 1px solid red;} */
	
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

				<div id="resv_pay_info">
              
					<h3>티켓 정보</h3>
					<br>
					<hr>
					<br>
					<table>
					  <tr>
						<td width="100">전시명</td>
						<td width="30"></td>
						<td width="300"><%= exTitle %></td>
					  </tr>
					  <tr>
						<td>관람일시</td>
						<td></td>
						<td>
							<%= rv.getResvDate() %>
							<br>
							<% if(time != null && time.equals("all")) { %>
								전회차 입장 가능 11:00 ~ 18:00
							<% } else { %>
								<%= time %>
							<% } %>
						</td>
					  </tr>
					  <tr>
						<td>장소</td>
						<td></td>
						<td><%= location %></td>
					  </tr>
					</table>
				</div>

				<div id="resv_payment" style="margin-top: 50px;">
					
					<h3>결제 정보</h3>
					<br>
					<hr>
					<br>
					<table>
					<tr>
						<th width="100">총 인원</th>
						<td width="160"><%= rv.getCount() %></td>
					</tr>
					<tr>
						<th>총 금액</th>
						<td><%= price * rv.getCount() %></td>
					</tr>
					<tr>
						<th>등급할인액(VIP)</th>
						<td>-<%= discount %> 원</td>
					</tr>
					</table>
	
					<hr style="margin: 50px 0px;">
					<br>
	
					<h3>최종 결제 금액</h3>
	
					<h2 align="right"><%= rv.getPayment() %>원</h2>
					
					<br><br>
					
				</div>
					
					<br><br>
	
				<div align="center">
					<input type="checkbox" id="resv_check"> 예약 티켓 정보 동의 <br>
					티켓의 가격, 할인 내역, 취소 정책을 최종확인하였으며, <br>
					구매에 동의합니다. (전자거래법 제8조 제2항) <br><br>
					<button type="submit" id="payment_btn" class="btn btn-primary" style="width: 400px;" onclick="requestPay()">결제하기</button>
				</div>
				
				<script>
					function requestPay() {
						if($("#resv_check").is(":checked")) {
							
							IMP.init("imp00813715"); // 가맹점 식별코드
							// IMP.request_pay(param, callback) 결제창 호출
							IMP.request_pay({ // param
								pg: "html5_inicis", // PG사 코드값 (이니시스 웹표준)
								pay_method: "card", // 결제방법
								merchant_uid: "resv_" + new Date().getTime(), // 가맹점 주문번호 (중복되지 않게 임의로, 결제가 승인된 주문번호로는 재결제 불가)
								name: "<%= exTitle %>", // 결제창에 노출될 상품명 (PG사마다 차이 있지만, 16자 이내 권장)
								amount: <%= rv.getPayment() %>, // 가격
								buyer_name: "<%= loginUser.getMemName() %>", // 구매자 이름 <%-- loginUser.memName --%>
								buyer_email: "<%= loginUser.getEmail() %>"
							}, function(rsp) { // callback
								// callback 속성으로 success (boolean) 반환함
								var msg = "";
								if(rsp.success) {
									// 결제 성공시 로직
									// imp_uid : 아임포트 고유 결제번호 (null 일 수 있음), merchant_uid : 가맹점 고유 주문번호
									$.ajax({
										url : "update.resv", // 요청시 이동하여 DB에 입력할 주소
										data : {
											resvNo : <%= rv.getResvNo() %>,
											payment : rsp.paid_amount,
											impUid : rsp.imp_uid,
											status : rsp.status,
											receipt : rsp.receipt_url
										},
										type : "post",
										success : function(result) {
											
											if(result > 0) {
												
												msg = "결제가 완료되었습니다. 나의 예매내역으로 이동합니다.\n";
												msg += "결제번호 : " + rsp.imp_uid + "\n";
												msg += "결제금액 : " + rsp.paid_amount;
												alert(msg);
												location.href = "<%= contextPath %>/mypageTicketing.me"; // mypage 나의 예매내역에서 주문번호로 조회해서 상세화면으로
											} else {
												msg = "결제 정보를 저장하지 못했습니다."
												console.log(rsp.error_msg);
												alert(msg);
											}
										},
										error : function() {
											alert("ajax 통신 실패");
										}
									});
							
								} else {
									// 결제 실패시 로직
									// 결제 실패시 코드 : error_code, 메세지 : error_msg
									
									$.ajax({
										url : "drop.resv",
										data : {
											resvNo : <%= rv.getResvNo() %>
										},
										type : "post",
										success : function(result) {
											if(result > 0) {
												
												// 결제 정보 테이블에서 완전 삭제
												alert("결제를 취소했습니다.\n처음 화면으로 돌아갑니다.");
												location.replace("<%= contextPath %>/list.resv");
												
											} else {
												alert("결제 정보 삭제 실패");
											}
										},
										error : function() {
											
											alert("ajax 통신 실패");
											
										}
									});
								}
							})
						} else {
							alert("동의 여부에 체크해주세요.");
						}
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
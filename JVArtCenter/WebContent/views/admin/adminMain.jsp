<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- import 할 것들 --%>
<%@ include file="adminPath.jsp"%>
<%-- 스트립틀릿은 여기에 --%>

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
		height: 1050px;
	}
	
	/* 1:1문의 커서 갖다대면 바뀌는거 */
	.qnaTitle:hover {
		cursor: pointer;
		font-weight: bold;
	}
	
	#content-wrapper #accordionSidebar {
		width: 224px;
	}
	
	#content-wrapper {
		width: 1676px;
	}
	
	#accordionSidebar, #content-wrapper {
		float: left;
		height: 100%;
	}
	
	/* ----- 추가한 스타일은 여기에 ----- */

	.sales {
		width: 45%;
		height: 90%;
		float:left;
		margin: 20px;
	}

	.rows{
		margin-top: 50px;
	}
</style>
</head>

<body>
	<div class="wrapper">

		<%@ include file="adminSidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- content 영역 시작 -->
			<div id="content">

				<%@ include file="adminTopbar.jsp"%>
				<!-- 오늘 매출, 주간 매출 -->
				<div id="admin_contents">
					<div class="rows">
						<div class="sales">
							<div>TODAY</div>
							<div class="today"></div>
						</div>
						<div class="sales">
							<div>WEEKS</div>
							<div class="week">₩</div>
						</div>
					</div>

					<!-- 두번째 줄 // 월간 매출, 성별별 통계 -->
					<div class="rows">
						<div class="barChart">
							<canvas id="perMonth"></canvas>
						</div>
						<div class="circleChart">
							<canvas id="gender"></canvas>
						</div>
					</div>
					
					<!-- chart.js영역 -->
					<script>
						$(() => {
							selectSales();
							selectSalesPerMonth();
							reservationsPerGender();
						})

						//  ------------------------------------------------- 일 매출, 주간 매출 ------------------------------------

						
						function selectSales(){
							$.ajax({
								url : '<%=contextPath%>/sales.st',
								data : {},
								type : 'get',
								success : ((res) => {
									$('.sales')
									.eq(0)
									.children('.today')
									.html('₩ '+res.todaySales);

									$('.sales')
									.eq(1)
									.children('.week')
									.html('₩ '+ res.weekSales);
								}),
								error : () => console.log('매출 통계 데이터 AJAX 통신 중 에러 발생')
							})
						}

						
						//  ------------------------------------------------- 월간 매출 그래프 ------------------------------------						


						function selectSalesPerMonth() {
							$.ajax({
								url : '<%=contextPath%>/salesPerMon.st',
								data : {},
								type : 'get',
								success : (res) => {
									
						const perMonth = new Chart(lineCtx,lineConfig);
									res.sort((a,b) => a.dateRange - b.dateRange);

									let labels = lineConfig.data.labels;
									let data = lineConfig.data.datasets[0].data;

									res.forEach(el => {
										labels.push(el.dateRange)
										data.push(el.total);
									})
								},
						
								error : () => console.log('에러발생 삐용삐용')
							})
						}
					
						//  ------------------------------------------------- 월간 매출 그래프 ------------------------------------											
					function reservationsPerGender(){
						$.ajax({
							url : '<%=contextPath%>/ratePerGen.st',
							data : {},
							type : 'get',
							success : (res) => {

								const labels = circleConfig.data.labels;
								const data = circleConfig.data.datasets[0].data;

								res.forEach(el => {
									labels.push(el.label);
									data.push(el.rate);
								})

								const perGender = new Chart(circleCtx, circleConfig);
							},
							error : () => console.log('성별 통계 AJAX 통신 중 에러발생')
						})
					}


					// 바형 그래프
						var lineCtx = document.getElementById('perMonth').getContext('2d');

						var lineConfig = {
							type: 'line', // 차트의 형태
							data: { // 차트에 들어갈 데이터
										// x축
								labels: [],

								datasets: [{ //데이터
												label: '월간 매출 추이', //차트 제목
												fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
												data: [],//x축 label에 대응되는 데이터 값
												backgroundColor: [
													//색상
													'rgba(255, 99, 132, 0.2)'],
												borderColor: [
													//경계선 색상
													'rgba(255, 99, 132, 1)'],
												//경계선 굵기
												borderWidth: 2
											}]
										},
										options: {
											maintainAspectRatio: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											}
										}
									};
						
						var circleCtx = document.getElementById('gender').getContext('2d');

						var circleConfig = {
							type: 'doughnut', // 차트의 형태
							data: { // 차트에 들어갈 데이터
								labels: [], // x축
								datasets: [{ //데이터
									label: '성별별 예매율', //차트 제목
									data: [],
									backgroundColor: ['rgba(255, 99, 132, 1)',
													  'rgba(54, 162, 235, 1)',
													  'rgba(255, 206, 86, 1)',
													  'rgba(75, 192, 192, 1)',
													  'rgba(153, 102, 255, 1)',
													  'rgba(255, 159, 64, 1)'],
								borderColor: [	//경계선 색상
												'rgba(255, 99, 132, 1)',
												'rgba(54, 162, 235, 1)',
												'rgba(255, 206, 86, 1)',
												'rgba(75, 192, 192, 1)',
												'rgba(153, 102, 255, 1)',
												'rgba(255, 159, 64, 1)'],
								borderWidth: 1 //경계선 굵기								
											}]
							}, // data 끝

							options: {
								maintainAspectRatio: false,
								scales: {
									yAxes: [{
										ticks: {beginAtZero: true}
									}]
								}
								} // option 끝
							};

					</script>
					<!-- 세번째 줄 // 답변 대기중인 1:1 문의
						-> 글 제목 클릭 시 상세페이지
					-->
					<div class="rows">
						<table style="text-align:center; margin-left:40px;" class="qnaList">
							<thead>
								<tr>
									<th>글 번호</th>
									<th>카테고리</th>
									<th>글 제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>답변하기</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>

					<script>
						$(() => {
							qna;
						})
						const tbody = document.querySelector('.qnaList>tbody');
						let button = ""
						let tr = ""
						let td = ""
							const qna = $.ajax({
							url : '<%=contextPath%>/admin_main_list.qna',
							data : [],
							type : 'get',
							success : (res) => {
								res.forEach((el) => {
									tr = `<tr>`
										+'<td>'+el.qnaNo+'</td>'
										+'<td>'+el.qnaCategory+'</td>'
										+'<td>'+el.qnaTitle+'</td>'
										+'<td>'+el.memNo+'</td>'
										+'<td>'+el.qnaDate+'</td>'
										+'<td><button onclick=location.href="<%=contextPath%>/admin_enrollForm.qna?qno='+el.qnaNo+'">답변하기</button></td>'
										+'</tr>'
									tbody.innerHTML+=tr;
								})
						},
							error : () => console.log('1:1문의 AJAX 통신중 문제 발생')
						})

					</script>
				</div>

			</div>
			<!-- content 영역 끝 -->
		</div>
		<!-- End of Content Wrapper -->

	</div>

	<%@ include file="adminScript.html"%>

</body>

</html>
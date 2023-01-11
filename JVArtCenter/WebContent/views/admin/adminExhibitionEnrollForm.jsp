<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/adminPath.jsp" %>
<%-- 스트립틀릿은 여기에 --%>

<<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	button {
		border-color: #4e73df;
		margin: 7px;
	}
	table, th {
		font-size: 18px;
	}
	table {
		border-collapse: separate;
		border-spacing: 30px 15px;
  	}

</style>
</head>

<body>
	<div class="wrapper">

		<%@ include file="../admin/adminSidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- content 영역 시작 -->
			<div id="content">

				<%@ include file="../admin/adminTopbar.jsp"%>

				<div id="admin_contents">
					
					<!-- content 내용 여기에 붙여넣기! -->

			          <div id="exhibit-header">
			            <h2 style="font-size: 40px; margin-left: 20px;">전시 관리</h2>
			          </div>
			
					  <br><br>

			          <form id="exhibit-enroll-form" action="<%=contextPath %>/admin_insert.ex" method="post" enctype="multipart/form-data"> 
			            
			            <div>
			              <table align="center">
			                <tr>
			                  <th width="300px">전시장소</th>
			                  <td width="600px" >
			                    <select name="location" id="exhibit-location">
			                      <option selected disabled hidden>전시관 선택</option>
			                      <option value="J1">J관</option>
			                      <option value="J2">V관</option>
			                      <option value="J3">A관</option>
			                      <option value="J4">C관</option>
			                    </select>
			                  </td>
			                </tr>
			                <tr>
			                  <th>제목</th>
			                  <td><input type="text" name="exTitle" size="59" required></td> 
			                </tr>
			                <tr>
			                  <th>내용</th>
			                  <td><textarea name="exContent" style="resize:none;" cols="60" rows="5" ></textarea></td>
			                </tr>
			                <tr>
			                	<th>시작일</th>
			                	<td><input type="date" name="startDate" required></td>
			                </tr>
			                <tr>
			                	<th>종료일</th>
			                	<td><input type="date" name="endDate" required></td>			                
			                </tr>
			                <tr>
			                	<th>가격</th>
			                	<td><input type="text" name="price" size="14" required></td>
			                </tr>
			                <tr>
			                	<th>작가</th>
			                	<td><input type="text" name="artists" size="59"></td>
			                </tr>			                			                			                
			                <tr>
			                	<th>대표 이미지</th>
			                	<td><img id="exThumbnail" width="170" height="150"></td>
			                </tr>
			                <tr>
			                  <th>상세 이미지</th>
			                  <td><img id="exImage" width="170" height="150"></td>
			                </tr>
			              </table>
			            </div>
						
			            <div id="file-area">
			                <input type="file" id="file0" name="file0" onchange="loadImg(this, 0);" required> 
			                <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);"> 
			            </div>
			
			            <br><br>
			
			            <script>
			            
				        	$(function() {
				        		
				        		$("#file-area").hide();
				        		
				        		$("#exThumbnail").click(function() {
				        			$("#file0").click();
				        		});
				        		$("#exImage").click(function() {
				        			$("#file1").click();
				        		})
				        	})
				        
				            function loadImg(inputFile, num) {
				                
				                if(inputFile.files.length == 1) { 
				                	
				                	var reader = new FileReader();
				                
				                	reader.readAsDataURL(inputFile.files[0]);
				                	
				                	reader.onload = function(e) {
				                		
				                		switch(num) {
				                    		case 0 : $("#exThumbnail").attr("src", e.target.result); break;
				                    		case 1 : $("#exImage").attr("src", e.target.result); break;
				                		}
				                	};
				                } else { 
				                	
				                	switch(num) {
				                    	case 0 : $("#exThumbnail").attr("src", null); break;
				                    	case 1 : $("#exImage").attr("src", null); break;
				                	}
				                } 
				            }
			            </script>
			            
			            <div align="center">
			              <button type="submit" class="btn btn-outline-primary">등록</button>
			              <button type="button" class="btn btn-outline-primary" onclick="history.back();">목록</button>
			            </div>
			          </form>
				</div>

			</div>
			<!-- content 영역 끝 -->
		</div>
		<!-- End of Content Wrapper -->

	</div>

	<%@ include file="../admin/adminScript.html"%>

</body>


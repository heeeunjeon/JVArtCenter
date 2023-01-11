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

			          <div id="news-header">
			            <h2 style="font-size: 40px; margin-left: 20px;">뉴스레터 관리</h2>
			          </div>
			
					  <br><br>

			          <form id="news-enroll-form" action="<%= contextPath %>/admin_insert.news" method="post" enctype="multipart/form-data"> 
			            
			            <div>
			              <table align="center">
			                <tr>
			                  <th width="300px">카테고리</th>
			                  <td width="600px" colspan="3">
			                    <select name="category" id="news-category">
			                      <option selected disabled hidden>유형선택</option>
			                      <option>전시 포커스</option>
			                      <option>작가 인터뷰</option>
			                      <option>소장품 더보기</option>
			                    </select>
			                  </td>
			                </tr>
			                <tr>
			                  <th>제목</th>
			                  <td colspan="3"><input type="text" name="title" size="59" required></td> 
			                </tr>
			                <tr>
			                  <th>내용</th>
			                  <td colspan="3"><textarea name="content" style="resize:none;" cols="60" rows="5" required></textarea></td>
			                </tr>
			                <tr>
			                	<th>대표 이미지</th>
			                	<td colspan="3"><img id="titleImg" width="170" height="150"></td>
			                </tr>
			                <tr>
			                  <th>상세 이미지</th>
			                  <td><img id="contentImg1" width="170" height="150"></td>
			                  <td><img id="contentImg2" width="170" height="150"></td>
			                  <td><img id="contentImg3" width="170" height="150"></td>
			                </tr>
			              </table>
			            </div>
						
			            <div id="file-area">
			                <input type="file" id="file0" name="file0" onchange="loadImg(this, 0);" required> 
			                <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);"> 
			                <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
			                <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
			            </div>
			
			            <br><br>
			
			            <script>
			            
				        	$(function() {
				        		
				        		$("#file-area").hide();
				        		
				        		$("#titleImg").click(function() {
				        			$("#file0").click();
				        		});
				        		$("#contentImg1").click(function() {
				        			$("#file1").click();
				        		})
				        		$("#contentImg2").click(function() {
				        			$("#file2").click();
				        		})
				        		$("#contentImg3").click(function() {
				        			$("#file3").click();
				        		})
				        	})
				        
				            function loadImg(inputFile, num) {
				                
				                if(inputFile.files.length == 1) { 
				                	
				                	var reader = new FileReader();
				                
				                	reader.readAsDataURL(inputFile.files[0]);
				                	
				                	reader.onload = function(e) {
				                		
				                		switch(num) {
				                    		case 0 : $("#titleImg").attr("src", e.target.result); break;
				                    		case 1 : $("#contentImg1").attr("src", e.target.result); break;
				                    		case 2 : $("#contentImg2").attr("src", e.target.result); break;
				                    		case 3 : $("#contentImg3").attr("src", e.target.result); break;
				                		}
				                	};
				                } else { 
				                	
				                	switch(num) {
				                    	case 0 : $("#titleImg").attr("src", null); break;
				                    	case 1 : $("#contentImg1").attr("src", null); break;
				                    	case 2 : $("#contentImg2").attr("src", null); break;
				                		case 3 : $("#contentImg3").attr("src", null); break;
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


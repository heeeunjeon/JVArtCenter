<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.kh.newsletter.model.vo.Newsletter, com.kh.common.model.vo.Attachment"  %>
<%@ include file="../admin/adminPath.jsp" %>
<%-- 스트립틀릿은 여기에 --%>
<%
	Newsletter ne = (Newsletter)request.getAttribute("ne");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자 - 공지사항 전체조회</title>

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
<link href="<%= contextPath %>/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- CSS -->
<link href="<%= contextPath %>/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">

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

			          <form id="news-update-form" action="<%= contextPath %>/admin_update.news" method="post" enctype="multipart/form-data"> 
			            <input type="hidden" name="neno" value="<%= ne.getNewsNo() %>">
			            <div>
			              <table align="center">
			                <tr>
			                  <th width="300px">카테고리</th>
			                  <td width="600px"  colspan="3">
			                    <select name="category" id="news-category">
			                      <option selected disabled hidden>유형선택</option>
			                      <option>전시 포커스</option>
			                      <option>작가 인터뷰</option>
			                      <option>소장품 더보기</option>
			                    </select>
			
			                    <script>
			                      $(function() {
			                        $("#news-update-form option").each(function() {
			                          if($(this).text() == "<%= ne.getNewsCategory() %>") {
			                            $(this).attr("selected", true);
			                          }
			                        })
			                      });
			
			                    </script>
			                  </td>
			                </tr>
			                <tr>
			                  <th>제목</th>
			                  <td colspan="3"><input type="text" name="title" size="59" required value="<%= ne.getNewsTitle() %>"></td> 
			                </tr>
			                <tr>
			                  <th>내용</th>
			                  <td colspan="3"><textarea name="content" style="resize:none;" cols="60" rows="5" required><%= ne.getNewsContent() %></textarea></td>
			                </tr>
			                <tr>
			                	<th>대표 이미지</th>
			                	<td colspan="3">
			                		<img src="<%= contextPath %>/<%= list.get(0).getFilePath() + list.get(0).getChangeName() %>" id="titleImg" width="170" height="150">
			                		<input type="hidden" name="originFileNo0" value="<%= list.get(0).getFileNo() %>">
			                       	<input type="hidden" name="originFileName0" value="<%= list.get(0).getChangeName() %>">
			                	</td>
			                <tr>
			                  <th>상세 이미지</th>
							  <% for(int i = 1; i < list.size(); i++) { %>
			                  	<% if(list.get(i) != null) { %>
			                  		<td>
			                  			<img src="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeName() %>"  id="contentImg<%= i %>" width="170" height="150">
			                  			<input type="hidden" name="originFileNo<%= i %>" value="<%= list.get(i).getFileNo() %>">
			                       		<input type="hidden" name="originFileName<%= i %>" value="<%= list.get(i).getChangeName() %>">
			                  		</td>
			                  	<% } %>
			                  <% } %>
							  <% for(int i = list.size(); i < 4; i++) { %>
							  		<td><img id="contentImg<%= i %>" width="170" height="150"></td>
							  <% } %>	
			                </tr>
			              </table>
						</div>
			
						<div id="file-area">
			                <input type="file" id="file0" name="re-file0" onchange="loadImg(this, 0);" > <!-- 대표이미지 업로드용 (대표이미지 - 썸네일은 필수) -->
			                <input type="file" id="file1" name="re-file1" onchange="loadImg(this, 1);"> <!-- 상세이미지 업로드용 -->
			                <input type="file" id="file2" name="re-file2" onchange="loadImg(this, 2);">
			                <input type="file" id="file3" name="re-file3" onchange="loadImg(this, 3);">
			            </div>
			            
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
			              <button type="submit" class="btn btn-outline-primary">수정</button>
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

</html>
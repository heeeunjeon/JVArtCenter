<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice, com.kh.common.model.vo.Attachment" %>
<%@ include file="adminPath.jsp" %>
<%-- 스트립틀릿은 여기에 --%>
<%
	Notice n = (Notice)request.getAttribute("n");
	Attachment at = (Attachment)request.getAttribute("at");
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

<title>관리자 - 공지사항 수정</title>

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

		<%@ include file="adminSidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- content 영역 시작 -->
			<div id="content">

				<%@ include file="adminTopbar.jsp"%>

				<div id="admin_contents">
					
					<!-- content 내용 여기에 붙여넣기! -->

			          <div id="notice-header">
			            <h2 style="font-size: 40px; margin-left: 20px;">공지사항 관리</h2>
			          </div>
			
					  <br><br>

			          <form id="notice-update-form" action="<%= contextPath %>/admin_update.no" method="post" enctype="multipart/form-data"> 
			            <input type="hidden" name="nno" value="<%= n.getNoticeNo() %>">
			            <div>
			              <table align="center">
			                <tr>
			                  <th width="300px">카테고리</th>
			                  <td width="600px">
			                    <select name="category" id="notice-category">
			                      <option>회원</option>
			                      <option>예매</option>
			                      <option>시설</option>
			                      <option>기타</option>
			                    </select>
			
			                    <script>
			                      $(function() {
			                        $("#notice-update-form option").each(function() {
			                          if($(this).text() == "<%= n.getNoticeCategory() %>") {
			                            $(this).attr("selected", true);
			                          }
			                        })
			                      });
			
			                    </script>
			                  </td>
			                </tr>
			                <tr>
			                  <th>제목</th>
			                  <td><input type="text" name="title" size="59" required value="<%= n.getNoticeTitle() %>"></td> 
			                </tr>
			                <tr>
			                  <th>첨부파일</th>
			                  <td>
			                  	<% if(at != null) { %>
			                  		<%= at.getOriginName() %>
			                  		<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
			                  		<input type="hidden" name="originFileName" value="<%= at.getChangeName() %>">
			                  	<% } %>
			                  	<input type="file" name="reUpfile">
			                  </td>
			                </tr>
			                <tr>
			                  <th>내용</th>
			                  <td colspan="2"><textarea name="content" style="resize:none;" cols="60" rows="15" required><%= n.getNoticeContent() %></textarea></td>
			                </tr>
			              </table>
			            </div>
			
						<br><br>
						
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

	<%@ include file="adminScript.html"%>

</body>

</html>
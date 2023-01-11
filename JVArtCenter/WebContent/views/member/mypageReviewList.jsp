<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp" %>
<%@page import="java.util.ArrayList, com.kh.review.model.vo.Review" %>
<%@ page import="com.kh.common.model.vo.PageInfo, java.util.ArrayList, com.kh.review.model.vo.Review" %>
 <%
	// 필요한 데이터 뽑기
	PageInfo pi = (PageInfo)request.getAttribute("pi"); // 페이징바 만들기
	ArrayList<Review>list = (ArrayList<Review>)request.getAttribute("list");
	
	// 조회된 내용물 출력하기
	
	// 자주 쓸 필드값만 미리 빼둠
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	/* #content { height: 2000px; } */
	
	/*신희섭 스타일*/
	 

  
  #review-0{color:red;}
	#mypage_content1{text-align: center;}
  #mypage_content2{cursor : pointer; }
  #mypage_content{margin-top : 70px;

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
        
        <%@ include file="../common/mypageMenubar.jsp" %>
        	
        <!-- 마이페이지 내용영역 -->
         <div id="mypage_content">
			<div id="review-0">
			<h1>작성한 리뷰</h1>
           <b>매매,욕설 등 운영 규정에 위반되는 글은 사전 통보없이 삭제될 수 있습니다.<br>
           개인정보가 포함된 내용은 삼가해주기시 바라며,게시물로 발생하는 문제는 작성자 본인에게 책임이 있습니다.          
           </b>
           </div>
           <br><br>
      <div id="mypage_content1" class="list" >
            <table id= ""  class=" list-area table table-hover" style="width: 400;">
              <thead>
                <tr style="background:black; color: white;" >
                  
                  <th scope="col">전시명</th>
                  <th scope="col"style="width:650px;">내용</th>
                  <th scope="col">평점</th>
                  <th scope="col">작성일</th>
                  
                </tr>
              </thead>
            
				<tbody id="mypage_content2" class="table" >
              
               <%if(list.isEmpty()) {%>
               <!-- 리스트가 비어있을 경우 -->
               <tr>
               		<td colspan="5" id="mypage_content2" >작성하신 리뷰가 없습니다.</td>
               </tr>
               <%}else{ %>
                 
               	<%for(Review r : list)  { %> 
               		 
               		<%-- <% for (int i = 0; i <r.getReviewNo(); i++) { %>   --%>
               			
               			
               			
               		
               		<tr> 
               		    <input type="hidden" id="reNo" value="<%= r.getReviewNo() %>"> 
               			<td><%=r.getExNo() %></td>
               			<td><%=r.getReviewContent() %></td>
               			<td><%=r.getRating() %></td>
               			<td><%=r.getReviewDate() %></td>
               		</tr>
               			<%} %>
               		 <%} %>
              <%--  <%} %>  --%>
              
              
              </tbody>
                 
              
            </table>
           <br><br>
                <div align="center" class="paging-area">
       				<% if(currentPage != 1) { %>
		                    <button onclick="location.href='<%=contextPath%>/mypageReview.me?currentPage=<%= currentPage - 1 %>';" class="btn btn-secondary">&lt;</button>
		            	<% } %>
		            	
		            	<% for(int p = startPage; p <= endPage; p++) { %>
		            	
		            		<% if(p != currentPage) { %>
		                        <button onclick="location.href='<%=contextPath%>/mypageReview.me?currentPage=<%= p %>';" class="btn btn-secondary"><%= p %></button>
		            		<% } else { %>
		                        <button disabled class="btn btn-secondary"><%= p %></button>
		            		<% } %>
		            	<% } %>
		
		                <% if(currentPage != maxPage) { %>
		                    <button onclick="location.href='<%=contextPath%>/mypageReview.me?currentPage=<%= currentPage + 1 %>';">&gt;</button>
		            	<% } %>
                </div>
        
          </div>
            

          </div>
         </div>
        
        </div>
        <div id="content_3"></div>
      </div>
        
    </div>
    <script>
          $(function(){
        	  
        	  $(".list-area>tbody>tr").click(function(){
        		  
        		  <%if(!list.isEmpty()) {%>
        		  
        		  //클릭했을 때 상세보기 페이지 요청
        		  var rro = $(this).children().eq(0).val();
	        	
        		  //게시글 번호 넘기면서 url 요청
        		  location.href="<%= path %>/detali.re?re="+rro;
        		  
        		  <%}%>
        	  });
        	  
          });
          </script>
         
         
          
    <%@ include file="../common/footerbar.jsp" %>

  </body>
</html>
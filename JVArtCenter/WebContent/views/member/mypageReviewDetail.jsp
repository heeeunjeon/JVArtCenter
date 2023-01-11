 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp" %>
<%@page import="java.util.ArrayList, com.kh.review.model.vo.Review" %>
<%
	Review n = (Review)request.getAttribute("n");
	int rating = n.getRating();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	/* #content { height: 2000px; } */
  
  #mypage_content { margin-top: 150px; }
  /*#review-2 th, #review-2 td { border: 1px solid red;} */

</style>
</head>
<script type="text/javascript">
$(function(){
	$('#exampleSelect1').val(<%=rating%>);
	
})
</script>
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
          <form action="" method="">
  
            <table id="review-2" align="center" >
    
                <tr style="height: 30px;">
                    <th width="80px;">전시</th>
                    <td width="300px;">
                      <div class="form-group">
                        <fieldset>
                          <%-- <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." value="<%= n.getExNo()%>"readonly="readonly"> --%>
                          <input class="form-control" id="readOnlyInput" type="text"  value="<%= n.getExNo()%>"readonly="readonly">
                        </fieldset>
                      </div>
                      
                    </td>
                    <td width="10px;"></td>
    
                    <th width="50px;">평점</th>
                    <td>
                      <div class="form-group" >
                        <select class="form-select" id="exampleSelect1"  disabled="disabled">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                        </select>
                      </div>
                    </td>
                </tr>
                <tr style="height: 30px;"></tr>
                <tr>
                  <th width="100px;" colspan="5">리뷰 내용</th>
                </tr>
                <tr>
                  <td colspan="5">
                    <div class="form-group">
                      <textarea class="form-control" id="exampleTextarea" rows="5" readonly="readonly"><%=n.getReviewContent() %></textarea>
                    </div>
                  </td>
                </tr>
            </table>  
            
  
  
            <br><br>
  
            <div align="center">
    			
    		  <!-- <button type="button" class="btn btn-primary" data-toggle="" >목록으로</button>
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateReivewForm"> 수정하기</button>
              
    
              <button type="button" class="btn btn-primary" data-toggle="" >삭제하기</button>
              
               -->
              <a href="<%= path %>/mypageReview.me?currentPage=1"" class="btn btn-primary">목록가기</a>
            
            <%-- <% if(loginUser != null && loginUser.getUserId().equals(n.getWriter())) { %> <% } %>--%>  
	            <!-- 현재 로그인한 사용자가 해당 글을 작성한 경우에만 보여지게끔 -->
	            <a href="<%= path %>/updateForm.re?rno=<%= n.getReviewNo() %>" class="btn btn-primary"  type="submit">수정하기</a>
	            <a href="<%= path %>/delete.re?rno=<%= n.getReviewNo() %>" class="btn btn-primary"  type="submit">삭제하기</a>
	                    
             
    
            </div>
          </form>
          </div> 
        <br><br>
        </div>
      </div>
    <%@ include file="../common/footerbar.jsp" %>
    </div>
  </body>
</html>
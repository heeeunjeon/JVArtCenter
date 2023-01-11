 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp" %>
<%@page import="java.util.ArrayList, com.kh.review.model.vo.Review" %>
<%-- <%
	Review n = (Review)request.getAttribute("n");
	int rating = n.getRating();
%> --%>
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
          
          <form action="<%=path%>/update.re" method="post">
  			
  			<input type="hidden" name="rno" value="<%=n.getReviewNo() %>">
  			
            <table id="review-2" align="center" >
    
                <tr style="height: 30px;">
                    <th width="80px;">전시</th>
                    <td width="300px;">
                      <div class="form-group">
                        <fieldset>
                          <!-- <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." >  -->
                          <input class="form-control" id="readOnlyInput" type="text"  value="<%=n.getExNo()%>" readonly="readonly">
                          
                         <%-- <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." value="<%= n.getExNo()%>"> 
                          <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." value="<%= n.getExNo()%>"> --%> 
                       </fieldset>
                      </div>
                      
                    </td>
                    <td width="10px;"></td>
    
                    <th width="50px;">평점</th>
                    <td>
                      <div class="form-group"  >
                       <!--  <select class="form-select" id="exampleSelect1"  disabled="disabled"> -->
                        <select class="form-select" id="exampleSelect1" name="rating">
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
                    <div class="form-group" >
                      <textarea name="content" class="form-control" id="exampleTextarea" rows="5"  name="content"><%=n.getReviewContent() %></textarea> 
                      <!-- <textarea class="form-control" id="exampleTextarea" rows="5" ></textarea> -->
                    </div>
                  </td>
                </tr>
            </table>  
            
  
  
            <br><br>
  
            <div align="center">
    
              <button type="submit" class="btn btn-primary" data-toggle="" data-target=> 수정하기</button>
                  
              <button type="button" class="btn btn-primary" data-toggle="" onclick="history.back();">취소하기</button>
              
                 
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
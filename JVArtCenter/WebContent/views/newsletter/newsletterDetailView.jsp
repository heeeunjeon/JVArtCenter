<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.kh.newsletter.model.vo.Newsletter, com.kh.common.model.vo.Attachment" %>
<%@ include file="/views/common/menubar.jsp" %>
<%
	Newsletter ne = (Newsletter)request.getAttribute("ne");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스레터 상세조회</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
  #content { height: 5000px; }
  #navi a, label {
    margin-left: 15px;
    margin-right: 15px;
  }
  
  #news-paging>ul>li { 
    list-style-type : none; 
  } 
  #hr1 {
        height : 4px;
        margin-left: 25px;
        background-color : black;
  }
  #hr2 {
        height : 2px;
        margin-left: 25px;
        background-color : black;     
  }
  #hr3 {
        width: 90%;
        height : 1px;
        margin-left: 25px;
        background-color : black;     
  }
</style>
</head>
<body>
	
    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->

        <div id="navi">
            <!--세부메뉴 영역-->
            <a href="<%= contextPath %>/list.no?currentPage=1">공지사항</a>
	        <a href="<%= contextPath %>/faq">FAQ</a>
	        <a href="" id="qna">1대1 문의</a>
	        <a href="<%= contextPath %>/list.news?currentPage=1">뉴스레터</a>
        </div>

        <script>
	         $("#qna").click(function() {
	   			
	   			if("<%= loginUser %>" == "null") {
	   				alert("로그인 후 이용 가능합니다.");
	   				$("#qna").attr("href", "<%= contextPath %>/login");
	   			} else {
	   				$("#qna").attr("href", "<%= contextPath %>/enrollForm.qna");
	   			}
	   		})
 		</script>

      <div id="content">
        <!--바디-->
        <div id="content_1"></div>
        <div id="content_2">

          <div id="news-header">
            <h2 style="font-size: 35px; margin-left: 20px;">뉴스레터</h2>
          </div>

          <br><hr id="hr1"><br>

          <div id="news-title-wrap">
            <div id="news-title" style="font-size: 22px; font-weight: 900; margin-left: 50px;"><%= ne.getNewsTitle() %></div>            
          	<br>
            <span id="news-category" style="font-size: 18px; font-weight: 500; margin-left: 50px;"><%= ne.getNewsCategory() %></span>
            <span id="news-date" style="font-size: 18px; font-weight: 300; margin-left: 50px;"><%= ne.getNewsDate() %></span>
          </div>

          <hr id="hr2"><br>

          <div id="news-content-wrap" align="center">
        	<pre><%= ne.getNewsContent() %></pre>
            <p>
            	<% for(int i = 0; i < list.size(); i++) { %>
          			<img src="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeName() %>" width="1100px">
          		<% } %>
            </p>
          </div>

          <hr id="hr3">   

          <div id="news-paging">
            <ul>
                <li id="news-prev">
                    <span style="color: dimgray;"><b>이전 글</b></span> &ensp;
                    <a href="<%= contextPath %>/detail.news?neno=<%= ne.getLastNo() %>"><%= ne.getLastTitle() %></a>
                </li>
                <li id="news-next">
                    <span style="color: dimgray;"><b>다음 글</b></span> &ensp;
                    <a href="<%= contextPath %>/detail.news?neno=<%= ne.getNextNo() %>"><%= ne.getNextTitle() %></a>
                </li>
            </ul>
          </div>
          <br><br>
          <div id="news-bottom-btn" align="center">
              <a href="<%= contextPath %>/list.news?currentPage=1" class="btn btn-outline-primary">목록</a>
          </div>

        </div>
        <div id="content_3"></div>
      </div>	
    </div>
    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
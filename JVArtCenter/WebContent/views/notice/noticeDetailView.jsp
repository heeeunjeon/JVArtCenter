<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice, com.kh.common.model.vo.Attachment" %>
<%@ include file="../common/menubar.jsp" %>
<%
	Notice n = (Notice)request.getAttribute("n");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세조회</title>
<style>
    /* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
    #content { height: 1400px; }
    #navi a, label {
        margin-left: 15px;
        margin-right: 15px;
    }

    #notice-paging>ul>li {
        list-style-type : none;
    }
    #hr1 {
        width: 90%;
        height : 4px;
        margin-left: 25px;
        background-color : black;
    }
    #hr2 {
        width: 90%;
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
    #notice-title-wrap {
        margin-left: 40px;
    }
    #notice-content-wrap {
        display: inline-block;
        background-color: #e2e2e2;
        height : 850px;
        width: 88%;
        margin-left: 35px;
        padding: 30px;
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
          
          <div id="notice-header">
              <h2 style="font-size: 35px; margin-left: 20px;">공지사항</h2>
          </div>

          <br><hr id="hr1"><br>

          <div id="notice-title-wrap">
              <p id="category" style="font-size: 18px; font-weight: 500;"><%= n.getNoticeCategory() %></p> 
              <p id="title" style="font-size: 22px; font-weight: 900;"><%= n.getNoticeTitle() %><p> 
              <p id="date" style="font-size: 18px; font-weight: 300;"><%= n.getNoticeDate() %></p>
          </div>
          
          <hr id="hr2">
          
          <div id="notice-content-wrap">
              <pre><%= n.getNoticeContent() %></pre>
          </div>

          <br><br>

		  <div>
		  	<% if(at == null) { %>

		  	<% } else { %>
		  		<label style="margin-left:50px;">첨부파일</label><a download="<%= at.getOriginName() %>" style="color:lightseagreen;" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>"><%= at.getOriginName() %></a>
		  	<% } %>
		  </div>

          <hr id="hr3">

          <div id="notice-paging">
            <ul>
                <li id="notice-prev">
                    <span style="color: dimgray;"><b>이전 글</b></span> &ensp; 
                    <a href="<%= contextPath %>/detail.no?nno=<%= n.getLastNo() %>"><%= n.getLastTitle() %></a>
                </li>
                <li id="notice-next">
                    <span style="color: dimgray;"><b>다음 글</b></span> &ensp;
                    <a href="<%= contextPath %>/detail.no?nno=<%= n.getNextNo() %>"><%= n.getNextTitle() %></a>
                </li>
            </ul>
          </div>
          <br><br>
          <div id="notice-bottom-btn" align="center">
              <a href="<%= contextPath %>/list.no?currentPage=1" class="btn btn-outline-primary">목록</a>
          </div>
        </div>
        <div id="content_3"></div>
      </div>
     </div>	
    
    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
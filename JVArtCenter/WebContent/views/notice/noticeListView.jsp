<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.model.vo.PageInfo, com.kh.notice.model.vo.Notice" %>
<%@ include file="../common/menubar.jsp" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    String keyword = request.getParameter("keyword");
    String searchword = request.getParameter("searchword");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 전체조회</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 1050px; }
  #navi a, label {
    margin-left: 15px;
    margin-right: 15px;
  }

	#notice-list tr { height: 30px;}
  #notice-list>table>tbody>tr:hover {
      border : 1px solid lightslategray;
      cursor : pointer;
  }
  #list-main>th {
    color: white;
    font-size: 18px;
  }
  #selectBox, #notice-search-form input, #notice-search-form button {
    display: inline-block;
  }
    /* SELECT-OPTION 효과 */
  select {
    -o-appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
  }
  #selectBox {
    position: relative;
    width: 120px;
    height: 45px;
    border: 1px solid black;
  }
  #selectBox select {
    width: inherit;
    height: inherit;
    background: transparent;
    border: 0 none;
    outline: 0 none;
    padding: 0 5px;
    position: relative;
    z-index: 3; 
  }
  #selectBox option {
    font-weight: 300;
    color: black;
    padding: 3px 0;
    font-size: 16px;
  }
  #selectBox #icoArrow {
    position: absolute; 
    top: 0; 
    right: 0; 
    z-index: 1; 
    width: 35px; 
    height: inherit;
    border-left: 1px solid black;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  #selectBox #icoArrow img {
    width: 50%;
    transition: .3s; 
  }
  #selectBox select:focus + #icoArrow img {
    transform: rotate(180deg);
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
         
            <div id="notice-search-form" align="right">
                <form action="<%= contextPath %>/list.no?currentPage=1" method="get">
                  <div id="selectBox">
                    <select name="keyword">
                    	<option value="" disabled selected>선택</option>
                    	<option value="category">카테고리</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <span id="icoArrow"><img src="https://cdn-icons-png.flaticon.com/512/2791/2791552.png" width="20"></span>
                  </div>
                    <input type="text" name="searchword" class="form-control" placeholder="Search" style="width:200px;">
                    <button type="submit" id="notice-search-btn" class="btn btn-primary" style="background-color:black; color:white;">검색</button>
                    <input type="hidden" name="currentPage" value="1">
                </form>  
              </div>
              <br>
              
              <div id="notice-list">
                <table align="center" class="table table-hover">
                  <thead>
                    <tr id="list-main" style="background-color: black;">
                      <th width="50px">NO</th>
                      <th width="120px">카테고리</th>
                      <th width="700px">제목</th>
                      <th width="180px">등록일</th>
                      <th width="100px">조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="5">조회된 리스트가 없습니다.</td>
                    	</tr>
                    <% } else { %>
                    	<% for(Notice n : list) { %>
	                    	<tr>
                                <td><%= n.getNoticeNo() %></td>
	                    		<td><%= n.getNoticeCategory() %></td>
	                    		<td><%= n.getNoticeTitle() %></td>
	                    		<td><%= n.getNoticeDate() %></td>
	                    		<td><%= n.getNoticeCount() %></td>
	                    	</tr>
                    	<% } %>
                    <% } %>
                    </tbody>
                </table>
            </div>
            
            <!--  상세조회  -->
            <script>
            	$(function() {
            		
            		$("tbody").on("click", "tr", function() {
            			
            			location.href = "<%= contextPath %>/detail.no?nno=" + $(this).children().eq(0).text();
            		});
            	});
            </script>

            <br><br>

           <div id="notice-paging" align="center">
            
            <% if(keyword != null) { %>
            	<% if(currentPage != 1) { %>
                    <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= currentPage - 1 %>&searchword=<%=searchword %>&keyword=<%=keyword %>';" class="btn btn-secondary">&lt;</button>
            	<% } %>
            	
            	<% for(int p = startPage; p <= endPage; p++) { %>
            	
            		<% if(p != currentPage) { %>
                        <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= p %>&searchword=<%=searchword %>&keyword=<%=keyword %>';" class="btn btn-secondary"><%= p %></button>
            		<% } else { %>
                        <button disabled class="btn btn-secondary"><%= p %></button>
            		<% } %>
            	<% } %>

                <% if(currentPage != maxPage) { %>
                    <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= currentPage + 1 %>&searchword=<%=searchword %>&keyword=<%=keyword %>';" class="btn btn-secondary">&gt;</button>
            	<% } %>
            <% } else { %>
            	<% if(currentPage != 1) { %>
                    <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= currentPage - 1 %>';" class="btn btn-secondary">&lt;</button>
            	<% } %>
            	
            	<% for(int p = startPage; p <= endPage; p++) { %>
            	
            		<% if(p != currentPage) { %>
                        <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= p %>';" class="btn btn-secondary"><%= p %></button>
            		<% } else { %>
                        <button disabled class="btn btn-secondary"><%= p %></button>
            		<% } %>
            	<% } %>

                <% if(currentPage != maxPage) { %>
                    <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= currentPage + 1 %>';" class="btn btn-secondary">&gt;</button>
            	<% } %>
            <% } %>
            </div>

        </div>
        <div id="content_3"></div>
      </div>	
    </div>
    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
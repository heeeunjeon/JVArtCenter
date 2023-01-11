<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.qna.model.vo.Qna"%>
<%@ include file="../common/menubar.jsp"%>
<%
    ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
/* #content { height: 2000px; } */
#mypage_text {
    font-size: 40px;
    font-weight: bold;
}
#mypage_menuName {
    font-size: 30px;
    font-weight: bold;
    padding: 30px;
    padding-top: 50px;
}
#mypage_inquiry_btn {
    float: right;
    padding-bottom: 20px;
}
#mypage_inquiry_Lookup {
    width: 1034px;
    height: 50px;
    margin-left: 30px;
    box-sizing: border-box;
    margin-top: 30px;
    
}
#mypage_inquiry_Lookup td {
    padding: 10px;
    vertical-align: middle;
}
#mypage_inquiry_Detail>* {
    width: 1034px;
    text-align: left;
    margin-left: 30px;
}
#mypage_inquiry_Detail>td {
    padding: none !important;
}

.form-select {
    display: inline;
    width: 150px;
    height: 50px;
}
.btn btn-primary {
    padding: none;
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
                <%@ include file="../common/mypageMenubar.jsp"%>
                <!-- 마이페이지 내용영역 -->
                <div id="mypage_content">
                    <div id="mypage_menuName">내 문의내역</div>
                        
                        <!-- 문의내역 게시판 리스트 -->
                        <table id="mypage_inquiry_Lookup" class="table table-hover">
                            <thead>
                                <tr style="background-color: black; color: white; font-size: 50px; text-align: center;">
                                    <th width="30">No</th>
                                    <th width="80">카테고리</th>
                                    <th width="250">제목</th>
                                    <th width="130">작성일</th>
                                    <th width="80">답변여부</th>
                                    <th width="80">확인</th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- 문의 내역이 없다면 -->
                            <% if(list.isEmpty()) { %> 
                                <tr> 
                                    <td colspan="6">조회된 리스트가 없습니다.</td>
                                </tr>
                            <% } else { %>
                                <% for (int i = 0; i < list.size(); i++) { %>
                                <tr>
                                    <td align="center" id="mypageQnADetailNo"><%= i+1 %>
                                    </td><!-- 글번호 -->
                                    <td align="center"><%= list.get(i).getQnaCategory() %></td><!-- 카테고리 -->
                                    <td> <%= list.get(i).getQnaTitle() %></td><!-- 게시글 제목 -->
                                    <td align="center"> <%= list.get(i).getQnaDate() %></td><!-- 게시날짜 -->
                                    <!-- 답변여부 -->
                                    <% if (list.get(i).getAnswer() == null) { %>
                                        <td>답변 예정</td>
                                    <% } else { %>
                                        <td>답변 완료</td>
                                    <% } %>
                                    <td align="center">
                                    	<a href="<%= contextPath %>/mypageQnADetail.me?qno=<%= list.get(i).getQnaNo() %>" class="btn btn-outline-primary">상세보기</a>
                                    </td>
                                </tr>
 
                                <% } %>
                            <% } %>
                            </tbody>
                            
                        </table>
                </div>
            </div>
            <div id="content_3"></div>
        </div>
    </div>
    

    <%@ include file="../common/footerbar.jsp"%>
</body>
</html>
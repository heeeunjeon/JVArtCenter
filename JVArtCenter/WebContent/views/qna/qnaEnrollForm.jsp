<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/menubar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1문의 작성</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 1050px; }
  #navi a, label {
    margin-left: 15px;
    margin-right: 15px;
  }

  #qna-header, #qna-info { margin-left: 50px;}
  table {
    border-collapse: separate;
    border-spacing: 30px 15px;
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
    width: 140px;
    height: 30px;
    border-radius: 2px;
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
    font-weight: 600;
    color: slategray;
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
  
  button {
    margin: 7px;
  } 
  table, th {
    font-size: 18px;
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
          
          <div id="qna-header">
            <h2 style="font-size: 35px;">1대1 문의</h2>
          </div>
          <br>
          <div id="qna-info">
            <p style="font-size: 18px;">
              상담시간 : 평일(월~금) 10:00 ~ 17:00 <br>
              (Off-time 12:00 ~ 13:00, 토/일/공휴일 휴무) <br>
              취소 및 환불 문의는 1대1 문의로 접수가 어려우니 고객센터(1544-9970)로 문의해주세요.
            </p>
          </div>
          <br>
          <form id="qna-enroll-form" action="<%= contextPath %>/insert.qna" method="post"> 
			  <input type="hidden" name="memNo" value=<%= loginUser.getMemNo() %>> <!-- 로그인 완성되면 수정-->
              <div>
                <table align="center">
                  <tr>
                    <th>성명</th>
                    <td><input type="text" value="<%= loginUser.getMemName() %>" size="11" style="color:slategray; font-weight: 600; text-align:center;"></td>
                  </tr>
                  <tr>
                    <th>아이디</th> 
                    <td><input type="text" value="<%= loginUser.getMemId() %>" size="11" style="color:slategray; font-weight: 900; text-align:center;"></td>
                  </tr>
                  <tr>
                    <th>문의유형</th>
                    <td>
                      <div id="selectBox">
                        <select name="category" id="qna-category">
                          <option>전시문의</option>
                          <option>예매및관람문의</option>
                          <option>취소문의</option>
                          <option>시설문의</option>
                          <option>회원문의</option>
                          <option>기타</option>
                        </select>
                        <span id="icoArrow"><img src="https://cdn-icons-png.flaticon.com/512/2791/2791552.png" width="20"></span>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" size="60" required></td> 
                  </tr>
                  <tr>
                    <th>문의 내용</th>
                    <td><textarea name="content" cols="60" rows="15" style="resize:none;" required></textarea></td>
                  </tr>
                </table>
              </div>
              <br>
              <div align="center">
                <button type="submit" class="btn btn-primary" style="font-size:18px;">등록</button>
                <button type="button" class="btn btn-outline-primary" onclick="location.href='<%= contextPath %>'" style="font-size:18px;">취소</button>
              </div>
          </form>
        </div>
        <div id="content_3"></div>
      </div>	
    </div>
    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
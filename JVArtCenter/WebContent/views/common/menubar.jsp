<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*, java.util.Date"%>
<%
	String contextPath = request.getContextPath();

	String alertMsg = (String)session.getAttribute("alertMsg");
	
	String errorMsg = (String)session.getAttribute("errorMsg");
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	Grade grade = (Grade)session.getAttribute("grade");	
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- 메뉴바 아이콘 -->
    <script src="https://kit.fontawesome.com/c7bfbb0e5b.js" crossorigin="anonymous"></script> 
    <!-- 부트스트랩 css 사용 -->
    <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- ajax jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
    <title>JV ARTCENTER</title>
    <!-- index.jsp 타이틀보다 우선하기 때문에 주석처리 -->
    <!-- 모두 동일한 타이틀을 위해 변경함 -->
  </head>
  <style>

    /* ---------- 전체 스타일 ---------- */
    html, body { width : 1900px; }
    div {  /*표 확인용 */
        /* border: 0.5px solid lightgrey;  */
        box-sizing: border-box;
    }
    .wrap {
      width: 1900px;
    }
    a {
      text-decoration: none;   
    }

    /* header, content, footer의 공통속성 : 가로길이 100% */
    .wrap > div {
      width: 100%;
    }

    /* ---------- header ---------- */
    #header {
      height: 150px;
    }

    /* 메인메뉴 전체를 감싸는 ul */
    #navbar_menu>a {
      display: block;
      line-height: 35px;
    }
    #navbar_menu {
      display: flex;
      list-style: none;
      padding-left: 0;
      font-size: large;
      position: relative;
      margin-left: 550px;
    }
    #navbar_menu>li {
      font-size: 20px;
      position: static;
    }

    /* 각 메인 메뉴 */
    .nav-item {
      font-size: 20px;
    }

    /* 메인메뉴 우측 아이콘 */
    #navbar_icons {
      font-size: 20px;
      display: flex;
      padding: 5px 10px;
    }
    #search,
    #user,
    #calender,
    #exit {
      padding: 10px 12px;
    }
    
    /* 서브메뉴를 담당하는 ul 태그에 대한 스타일 */
    #navbar_menu>li>div {
      list-style-type: none;
      padding: 0px;
      display: none; /* 평소에는 안보여주다가 마우스가 올라가는 순간 보여지게끔 */
      position: absolute;
    }
    /* 메인메뉴에 마우스가 올라가는 순간 서브메뉴가 펼쳐져서 보이게끔 */
    #navbar_menu>li>a:hover + div {
      display: block; /* 메인메뉴에만 마우스가 올라갔을때만 유지됨 */
    }
    /* 서브메뉴에도 마우스가 올라갈 때 펼쳐진게 유지될 수 있게끔 */
    #navbar_menu > li > div:hover {
      display: block;
    }
    /* 서브메뉴 글씨만 좀 더 작게 보이게끔 */
    #navbar_menu > li > div a {
      font-size: 15px;
    }
    #navbar_menu > li > div a:hover {
      font-size: 18px;
    }

    /* 고정된 세부메뉴 전체를 감싸는 div */
    #navi {
      height: 75px;
      text-align: center;
    }
    #navi>a {
    	margin: 15px;
    }

    /* ---------- content ---------- */
    #content {
      height: 1050px;
      display: flex;
    }

    #content > div {
      height: 100%;
    }
    #content_1 {
      width: 15%;
      float: left;
    }
    #content_2 {
      width: 70%;
      height: 100%;
    }
    #content_3 {
      width: 15%;
      float: right;
    }
    
    /* 모달 */
    .modal-body>div {
    	column-count: 2;
    	column-gap: 80px;
    	padding: 20px;
    }
    .modal-body>div h3 {
    	font-size: 22px;
    }

  </style>
  <body>
  	<script>
	
		if("<%= alertMsg %>" != "null") {
			alert("<%= alertMsg %>");
			// 알림창을 띄워준 후 session 에 담긴 해당 메세지를 지워줘야함
			// 안그러면 menubar.jsp 가 로딩될 때마다 매번 alert 가 계속 뜰 것!!
			
			<% session.removeAttribute("alertMsg"); %>
		}
		
		if("<%= errorMsg %>" != "null") {
			alert("<%= errorMsg %>");
			<% session.removeAttribute("errorMsg"); %>
		}
		
	</script>
  
    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->

      <div id="header">
        <!--헤더영역-->
        
        <div>
          <nav class="navbar navbar-expand-lg navbar-light bg-light" style="border: 1px 0px;">
            <div class="container-fluid">
              <a class="navbar-brand" href="<%= contextPath %>"><span style="margin-left: 10px;">JV</span> ART CENTER</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarColor03">
                <ul class="navbar-nav me-auto" id="navbar_menu">
                  <li class="nav-item">
                    <a class="nav-link dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="<%= contextPath %>/list.ex?term=C&currentPage=1">전시</a>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="<%= contextPath %>/list.ex?term=C&currentPage=1">현재전시</a>
                      <a class="dropdown-item" href="<%= contextPath %>/list.ex?term=P&currentPage=1">지난전시</a>
                      <a class="dropdown-item" href="<%= contextPath %>/list.ex?term=F&currentPage=1">오픈예정</a>
                   
                    </div>
                  </li>
                  <li class="nav-item">
                  	<a class="nav-link" href="" id="resvlink">예매</a>
                  	<script>
                  		$("#resvlink").click(function() {
                  			
                  			if("<%= loginUser %>" == "null") {
                  				alert("로그인 후 이용 가능합니다.");
                  				$("#resvlink").attr("href", "<%= contextPath %>/login");
                  			} else {
                  				$("#resvlink").attr("href", "<%= contextPath %>/list.resv");
                  			}
                  		})
                  	</script>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="<%= contextPath %>/info">안내</a>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="<%= contextPath %>/info">JV소개</a>
                      <a class="dropdown-item" href="<%= contextPath %>/location">전시관 안내</a>
                      <a class="dropdown-item" href="<%= contextPath %>/facility">편의시설 안내</a>
                      <a class="dropdown-item" href="<%= contextPath %>/directions">오시는길</a>
                      
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="<%= contextPath %>/list.no?currentPage=1">서비스</a>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="<%= contextPath %>/list.no?currentPage=1">공지사항</a>
                      <a class="dropdown-item" href="<%= contextPath %>/faq">FAQ</a>
                      <a class="dropdown-item" href="" id="qnaMenu">1대1 문의</a>
                      <a class="dropdown-item" href="<%= contextPath %>/list.news?currentPage=1">뉴스레터</a>
                    </div>
                  </li>
                </ul>
                
                <script>
	                $("#qnaMenu").click(function() {
	          			
	          			if("<%= loginUser %>" == "null") {
	          				alert("로그인 후 이용 가능합니다.");
	          				$("#qnaMenu").attr("href", "<%= contextPath %>/login");
	          			} else {
	          				$("#qnaMenu").attr("href", "<%= contextPath %>/enrollForm.qna");
	          			}
	          		})
		        </script>   
                
              </div>
              <div id="navbar_icons">
                <a href="" onclick="thisYear();" data-bs-toggle="modal" data-bs-target="#thisYear"
                  ><i id="calender" class="fa-regular fa-calendar-days" ></i
                ></a>
                <% if(loginUser == null) { %>
                	<a href="<%= contextPath %>/login"><i id="user" class="fa-regular fa-user"></i></a>
                <% } else { %>
                	<a href="<%= contextPath %>/mypageMain.me"><i id="user" class="fa-regular fa-user"></i></a>
                	<a href="<%= contextPath %>/logout.me"><i id="exit" class="fa-solid fa-arrow-right-from-bracket"></i></a>
                <% } %>
                
              </div>
            </div>
          </nav>
        </div>
      </div>
      
      </div>
      
      <!-- 달력 -->
		<div class="modal" tabindex="-1" id="thisYear">
			<div class="modal-dialog modal-xl modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
					<h3 class="modal-title">&nbsp;&nbsp;&lt;<b style="color: red;">2022</b> 올해의 전시&gt;</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div style="margin: 40px;">
						</div>
					</div>
				</div>
			</div>
		</div>
      
      <script>
      function thisYear() {
    	  
    	  $.ajax({
			url : "year.ex",
			success : function(result) {
				
				var str = "";
				
				if(result.length != 0) {
					
   					for(var i = 0; i < result.length; i++) {
   						
   						str += "<h4>▷ " + result[i].exTitle + "</h4>"
						 	 + "<h5>" + result[i].startDate + " ~ " + result[i].endDate + "</h5><br>";
   					}
				} else {
					
					str = "<h2 align='center;'>올해 기획된 전시가 없습니다.</h2>";
				}
				
				$(".modal-body>div").html(str);
			},
			error : function() {
				
				console.log("ajax 통신 실패");
			}
		});
      }
      
      </script>

  </body>
</html>

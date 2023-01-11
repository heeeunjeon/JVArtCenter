<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>footerbar</title>
  </head>
  <style>

    /* ---------- footer ---------- */
    #footer {
      background-color: black;
      color: white;
      padding : 30px;
      width: 100%;
    }

    /* ---------하단에 딱 달라붙게 하는 css---------- */
    * {
      margin: 0;
    }
    /* 리셋을 하지 않은 경우 추가 */

    html, body {
      height: 100%;
    }

    .wrapper {
      min-height: 100%;
      margin: 0 auto -155px;
    }
    /* 하단 마진은 푸터의 높이 값과 같다 */

    footer, .push {
      height: 155px;
    }

    /* ------------------------------------------ */

    #footer>p {
        padding: 10px;
        box-sizing: border-box;
    }

    #footer_etc {
      padding: 10px;
    }
    #footer_etc a {
      text-decoration: none;
      color: white;
    }

    

  </style>
  <body>
     <!--전체를 감싸는 wrap영역-->
      <div class="wrap">
     

      <div id="footer">
        <!--푸터-->
        <div id="footer_etc">
            <a href="<%= contextPath %>/privacypolicy">개인정보처리방침</a> |
            <a href="<%= contextPath %>/tos">이용약관</a>
        </div>
        <br><br>
        <p>
          JV ART CENTER<br />
          서울특별시 영등포구 선유동2로 57 <br /><br />

          Tel 1544-9970<br />

          © 2022 JV Arts Center All right reserved.
        </p>
      </div>
    </div>
  </body>
</html>
    
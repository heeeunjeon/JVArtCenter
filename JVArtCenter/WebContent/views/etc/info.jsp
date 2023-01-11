<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
	/*각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	 #content { height: 700px; }
	
  .ml11 {
  font-weight: 700;
  font-size: 3.5em;
}

.ml11 .text-wrapper {
  position: relative;
  display: inline-block;
  padding-top: 0.1em;
  padding-right: 0.05em;
  padding-bottom: 0.15em;
}

.ml11 .line {
  opacity: 0;
  position: absolute;
  left: 0;
  height: 100%;
  width: 3px;
  background-color: #fff;
  transform-origin: 0 50%;
}

.ml11 .line1 { 
  top: 0; 
  left: 0;
}

.ml11 .letter {
  display: inline-block;
  line-height: 1em;
}
.letter{
  padding-left: 17px;
}

#text{
  text-align: center;
  font-size : 18px;
  width: 800px;
  margin-left : 10px;
  font-weight : 500;
}
  </style>
    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->
      
      <div id="navi">
        <a href="<%= contextPath %>/info">JV소개</a>
        <a href="<%= contextPath %>/location">전시관 안내</a>
        <a href="<%= contextPath %>/facility">편의시설 안내</a>
        <a href="<%= contextPath %>/directions">오시는길</a>
      </div>
   
      <div id="content">
        <!--바디-->
        <div id="content_1"></div>
        <div id="content_2">

          <h1 class="ml11">
            <span class="text-wrapper">
              <span class="line line1"></span>
              <span class="letters">Joy of Art, Value of Art</span>
            </span>
          </h1>
        <table>
          
          <tr>
            <td>
              <img id="img" src="resources/image/introduce.png">
            </td>
              <td><div id="text">
영감을 디자인하는 복합문화예술센터,<br>
새로운 라이프스타일을 발견하는 JV아트센터입니다.<br>
당산동에 개관한 JV아트센터는, 다양한 문화예술 콘텐츠들을 더 확장된 공간에서,<br>보다 많은 사람들에게 수준 높은 감성으로 제시하며 주목을 받고있습니다.<br><br>
영등포구 당산동에 개관한 JV아트센터는 <br>보다 많은 대중들이 일상에서 예술을 즐길 수 있도록 <br>새로운 라이프스타일을 제안하는 전시는 물론, <br>어린이부터 시니어까지 
즐길 수 있는 다채로운 전시를 연중 실행하여 <br>누구나 즐겁게 예술을 경험하고 향유하는 영감의 장소, <br>문화와 예술로 삶을 풍요롭게 하는 서울의 문화·예술 랜드마크로 자리매김할 예정입니다.<br><br>
예술은 창조, 자율, 조화 그리고 소통입니다.<br>
JV아트센터는 언제나 예술인들과 관객 여러분들을 위해 열려 있을 것 입니다.
</div></td>
          </tr>
        </table>      
              

        </div>
        <div id="content_3"></div>
    </div>
   </div>
    


   <%@ include file="../common/footerbar.jsp" %>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>

   <script>

    // Wrap every letter in a span
var textWrapper = document.querySelector('.ml11 .letters');
textWrapper.innerHTML = textWrapper.textContent.replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>");

anime.timeline({loop: true})
  .add({
    targets: '.ml11 .line',
    scaleY: [0,1],
    opacity: [0.5,1],
    easing: "easeOutExpo",
    duration: 700
  })
  .add({
    targets: '.ml11 .line',
    translateX: [0, document.querySelector('.ml11 .letters').getBoundingClientRect().width + 10],
    easing: "easeOutExpo",
    duration: 700,
    delay: 100
  }).add({
    targets: '.ml11 .letter',
    opacity: [0,1],
    easing: "easeOutExpo",
    duration: 600,
    offset: '-=775',
    delay: (el, i) => 34 * (i+1)
  }).add({
    targets: '.ml11',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1000
  });

   </script>



  </body>
</html>
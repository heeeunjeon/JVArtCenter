<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	/* #content { height: 1500px; } */
	
  #centertime, #centerhow, #centerattention{
    font-size: 25px;
    text-align: center;
    width: 500px;


  }
  #time, #how, #attention{
    margin: auto;
    text-align: center;
    font-size: 15px;
    width: 1100px;

  }

  #img{
    width: 1000px;
    height: 500px;
    margin-left: 200px;
  }
  table{
    margin: auto;
  }
</style>
</head>
<body>

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


                <img id="img" src="resources/image/info.jpg"><br><br>
    <table>
          <tr>
            <th id="centertime" width="700px"><p>관람시간안내</p></th>
              <td width="700px"><div id="time"><p>
                화, 수, 목, 금, 일요일 11:00AM ~ 8:00PM

                토요일 (연장개관) 11:00AM ~ 9:00PM

                ※ 휴관: 매주 월요일 (단, 6/6 현충일, 8/15 광복절, 9/12 추석 대체 휴일, 10/3 개천절 제외), 추석연휴(9/9, 9/10)

                ※ 11/19(토) ~ 11/27(일), 휴관없이 매일 오후 9시까지 특별 연장 개관합니다. <hr>
              </p></div></td>
          </tr>      
          
          <tr>
                <th id="centerhow"><p>관람 방법</p></th>
                  <td><div id="how"><p>
                    JV아트센터는 관람객분들이 쾌적한 환경에서 전시에 집중할 수 있도록 사전 예약제로 운영하고 있습니다.
                    
                    관람을 원하시는 경우, 디뮤지엄 홈페이지 또는 APP으로 전시 티켓을 예매하실 수 있습니다.
                    
                    방문하시고자 하는 날짜에 잔여석이 남아 있는 경우, 무인발권기에서 현장 발권을 하실 수 있습니다. 티켓이 매진된 경우, 원하시는 날짜에 관람이 불가하오니 온라인 사전 예매를 진행해 주세요.
                    
                    예매한 티켓이 활성화되면, JV아트센터 입구를 통해 바로 입장하시면 됩니다. 입장 마감 시간은 전시관 마감 1시간 전까지 가능합니다.
                    
                    <hr>
                    
                  </p></div></td>
        </tr>
        
            <tr>
                <th id="centerattention"><p>관람 유의 사항</p></th>
              <td><div id="attention"><p>
              정부의 코로나19 방역 지침에 따라, 단체 입장이 제한 될 수 있습니다. 예매 전, JV아트센터에 홈페이지에서 단체 입장 가능 여부를 확인해 주세요.

            37.5도 이상의 발열이 확인 되는 경우 입장 할 수 없습니다.

            전시관에서 마스크를 벗으시거나, 착용을 거부할 경우, 그리고 올바르게 마스크를 착용하지 않을 경우 모두의 안전을 위하여 퇴장 조치 될 수 있습니다.

            전시장 안으로는 물, 껌, 사탕을 포함한 모든 음식을 가져갈 수 없고, 드실 수 없으니 꼭 기억해 주세요.

            전시관관 내에는 안내견을 제외한 반려동물은 입장할 수 없습니다.

            플래시, 삼각대 및 셀카봉을 이용한 촬영, 상업적 용도의 촬영, 동영상 촬영은 불가합니다. 아티스트의 소중한 작품을 지켜주세요.

            14세 미만 어린이의 경우, 보호자와 함께 입장하셔야 합니다. 전시장에서는 어린이들이 보호자의 손을 잡고 전시를 관람할 수 있게 해주세요.

            관람객이 전시 작품 및 시설물을 파괴하거나 훼손하였을 때에는 이에 상응하는 손해 배상을 하실 수 있으니, 관람에 유의해 주세요.

            JV아트센터에서는 전문 교육팀을 제외한 타 기관의 교육, 전시 해설은 불가합니다. 디뮤지엄의 승인 없이 교육을 진행할 경우 직원이 즉각 교육 중단을 요청할 수 있습니다.
            </p></div></td>
          </tr>
    </table>
              

        </div>
        <div id="content_3"></div>
    </div>
   </div>
    
   <%@ include file="../common/footerbar.jsp" %>

  </body>
</html>
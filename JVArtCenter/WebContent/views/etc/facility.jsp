<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편의시설 안내</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 2600px; } 

</style>
</head>
<body>

    <div class="wrap">
      <!--전체를 감싸는 wrap영역-->

        <div id="navi">
            <!--세부메뉴 영역-->
	        <a href="<%= contextPath %>/info">JV소개</a>
	        <a href="<%= contextPath %>/location">전시관 안내</a>
	        <a href="<%= contextPath %>/facility">편의시설 안내</a>
	        <a href="<%= contextPath %>/directions">오시는길</a>
        </div>

        <div id="content">
            <!--바디-->
            <div id="content_1"></div>
            <div id="content_2">

                <div id="facility-header">
                    <h2 style="font-size: 40px;">편의시설</h2>
                </div>
                <br>

                <div id="facility-content">
                    <table>
                        <tr id="facility-store">
                            <td id="facility-left" width="45%">
                                <h4><b>1F JV ART STORE</b></h4>
                                 <p>
                                    독립적이면서도 조화롭고 실용적이면서도 예술적인 작품들이 <br>
                                    어우러진 JV ART STORE 입니다. <br>
                                    국내외에서 활약하는 작가들의 손끝에서 탄생한 감각적인 작품들이 <br>
                                    가득한 공간에서 작품 하나하나가 주는 특별한 감동을 느껴보세요
                                </p>
                            </td>
                            <td id="facility-right" width="55%">
                                <img src="<%= contextPath %>/resources/image/guidance/facility_store.PNG" width="750px" height="400px">
                            </td>
                        </tr>
                        <tr id="facility-cafe">
                            <td id="facility-left">
                                <h4><b>B1 카페 CAFE</b></h4>
                                <p>
                                    각자의 길을 걷던 삼형제가 향기로운 커피에 반해<br>
                                    오늘까지 함께 조금씩 쌓아온 챔프 커피입니다. <br><br>
                                    
                                    형제들과 함께하며 무엇보다 인생에서 중요한 가치, 마음의 나눔을 <br>
                                    알게 되었습니다. 새로운 JV 아트센터에서 수많은 거장의 작품들과 <br>
                                    함께할 작은 여운을 나누고자 합니다. <br>
                                </p>
                            </td>
                            <td id="facility-right">
                                <img src="<%= contextPath %>/resources/image/guidance/facility_cafe.PNG" width="750px" height="400px">
                            </td>
                        </tr>
                        <tr id="facility-parking">
                            <td id="facility-left">
                                <h4><b>B2,B3 주차장</b></h4>
                                <p>
                                    JV 아트센터 방문 시 이용 가능한 <br> 
                                    주차 가능한 공간이 지하 2, 3 층에 마련되어있습니다. <br>
                                    지하 3층에는 전기차 급속 충전기가 세 대 설치되어있습니다.
                                </p>
                            </td>
                            <td id="facility-right">
                                <img src="<%= contextPath %>/resources/image/guidance/facility_parking.PNG" width="750px" height="400px">
                            </td>
                        </tr>
                        <tr id="facility-locker">
                            <td id="facility-left">
                                <h4><b>B1, 1F 물품보관함</b></h4>
                                <p>
                                    자율적으로 개인물품을 보관할 수 있으며, <br>
                                    귀중품이나 파손 위험이 있는 물품을 안전하게 보관하실 수 있습니다.
                                </p>
                            </td>
                            <td id="facility-right">
                                <img src="<%= contextPath %>/resources/image/guidance/facility_locker.PNG" width="750px" height="400px">
                            </td>
                        </tr>
                        <tr id="facility-ticketmachine">
                            <td id="facility-left">
                                <h4><b>B1, 1F 무인발권기</b></h4>
                                <p>
                                    현장에서 티켓을 발권할 수 있는 무인발권기가 <br>
                                    지하 1층과 1층 로비에 세 대씩 마련되어 있습니다. <br>
                                    비대면 발권을 통해 좀 더 빠르고 편리한 관람을 하실 수 있습니다.
                                </p>
                            </td>
                            <td id="facility-right">
                                <img src="<%= contextPath %>/resources/image/guidance/facility_ticketmachine.PNG" width="750px" height="400px">
                            </td>
                        </tr>
                        <tr id="facility-others">
                            <td id="facility-left">
                                <h4><b>1-4F 기타 시설</b></h4>
                                <p>
                                    영아와 함께 휴식이 필요하신 분들을 위해 <br>
                                    소파, 아기침대, 수유쿠션 등이 비치된 수유실이 <br>
                                    마련되어 있으며 안내데스크에서 안내 받으실 수 있습니다. <br>
                                    또한 유모차 및 휠체어 무료 대여를 희망하시는 분들 역시 <br>
                                    안내데스크에서 안내 받으실 수 있습니다.
                                </p>
                            </td>
                            <td id="facility-right">
                                <img src="<%= contextPath %>/resources/image/guidance/facility_others.PNG" width="750px" height="400px">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="content_3"></div>
        </div>    
    </div>	


    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
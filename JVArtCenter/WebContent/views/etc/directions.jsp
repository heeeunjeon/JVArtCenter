<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f779f8645f3712ddd84f4910d346e344&libraries=services,clusterer"></script>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 800px; } 

    #location-map {
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
    #location-text {
        width: 50%;
        float: right;
        box-sizing: border-box;
        padding-left: 20px;
    }
    #location-header>h2 {
        display: inline-block;
    }
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

                <div id="location-header">
                    <img src="<%= contextPath %>/resources/image/guidance/map_mark.png" height="35px" style="margin-bottom:25px;"> &nbsp;&nbsp;
                    <h2 style="font-size: 40px;">오시는 길</h2>
                </div>
        
                <div>
                    <div id="location-map" style="height:500px;"></div> 
    
                    <script>
                      var mapContainer = document.getElementById('location-map'); // 지도를 표시할 div   
                      var mapOption = {         
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표        
                        level: 3 // 지도의 확대 레벨    
                      }; // 지도를 표시할 div와  지도 옵션으로  지도를 생성
                      var map = new kakao.maps.Map(mapContainer, mapOption); 
                      // 주소-좌표 변환 객체를 생성
                      var geocoder = new kakao.maps.services.Geocoder();
    
                      // 주소로 좌표를 검색합니다
                      geocoder.addressSearch('서울특별시 영등포구 선유동2로 57', function(result, status) {
    
                        // 정상적으로 검색이 완료됐으면 
                        if (status === kakao.maps.services.Status.OK) {
    
                          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
                          // 결과값으로 받은 위치를 마커로 표시합니다
                          var marker = new kakao.maps.Marker({
                              map: map,
                              position: coords
                          });
    
                          // 인포윈도우로 장소에 대한 설명을 표시합니다
                          var infowindow = new kakao.maps.InfoWindow({
                              content: '<div style="width:150px;text-align:center;padding:6px 0;color:black;font-weight:bold;">JV 아트센터</div>'
                          });
                          infowindow.open(map, marker);
    
                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                          map.setCenter(coords);
                        } 
                      });  
                    </script>

                    <div id="location-text">
                        <h3>JV 아트센터</h3>
                        <div id="location-address">
                            <div>
                                서울특별시 영등포구 선유동2로 57 <br>
                                JV아트센터 <br>
                                1544-9970 
                            </div>
                        </div> 
                        <br>
                        <div id="location-traffic">
                            <div>
                                <h4>지하철로 오실 경우</h4>
                                <div>2호선, 9호선 당산역 12번 출구에서 400m</div>
                            </div>
                            <br>
                            <div>
                                <h4>버스로 오실 경우</h4>
                                <div>선유고등학교/(구)강서세무서 하차 (지선)7612  (광역)1000 / 1200 / 1300 / 1301 / 1302 / 1400 / 1500 / 1601 / M6628 / M6724</div>
                                <div>당산역 하차 (간선)603 / 605 / 660 / 661 / 760 / 761 (지선) 5620 / 5714 / 6514 / 6620/ 6623 / 6631 / 6632</div>
                            </div>
                            <br>
                            <div>
                                <h4>자동차로 오실 경우</h4>
                                <div>JV 아트센터(서울특별시 영등포구 선유동2로 57)로 이동</div>
                                <dl>
                                    <dt style="margin-top:5px">주차요금</dt>
                                    <dd>- JV 아트센터 당일 티켓 소지: 2시간 무료 <br> - 초과 요금: 10분당 1,000원
                                    </dd>
                                </dl>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
            <div id="content_3"></div>
        </div>    
    </div>	

    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
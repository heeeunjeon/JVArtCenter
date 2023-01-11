<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 조회</title>
<style>
	/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
	#content { height: 1400px; } 
    #faq-list li {
      list-style-type : none;
    }

    #faq-list div {
        width : 100%;
        height : 30px;
        line-height : 30px; 
        font-weight : 800;
        cursor : pointer;
        margin-top : 40px;
    }
    #faq-list p {
        width : 90%;
        height : 130px;
        margin-top : 50px;
        margin-left : 175px;
        box-sizing : border-box;
        display : none;
    }
    #faq-cate {
        display: inline-block;
        width: 150px;
        font-size: 20px;
        margin-left: 20px;
    }
    #faq-arrow {
        display: inline-block;
    }
    #faq-list img {
        margin-top: 5px;
        margin-right: 20px;
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

                <div id="faq-header">
                    <h2 style="font-size: 40px; margin-left: 20px;">FAQ</h2>
                </div>
        
                <div id="faq-list">
                    <ul>
                        <li>
                            <div>
                                <span id="faq-cate">회원</span>
                                <span>회원 정보는 어디에서 변경할 수 있나요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                회원 정보 변경은 JV 아트센터 홈페이지 로그인 후, [마이페이지] > [내 회원정보] > [회원 정보 수정]에서 가능합니다. 
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">회원</span>
                                <span>아이디 | 비밀번호 를 잊어버렸어요.</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                로그인 화면의 아이디찾기 | 비밀번호찾기 에서 로그인 계정의 정보 확인이 가능합니다.  <br>
                                아이디 찾기 : E-MAIL 인증을 통한 본인 확인 후 등록된 아이디를 찾을 수 있습니다.  <br>
                                비밀번호찾기 : 회원가입 정보를 통해 본인 인증 후 비밀번호 재설정이 가능합니다.  <br>
                                <br>
                                * 아이디찾기 | 비밀번호찾기에서 확인할 수 없으신가요? <br>
                                JV 아트센터 1544-9970 로 문의해 주세요. 소중한 정보를 확인하실 수 있도록 도와드리겠습니다. <br>
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">회원</span>
                                <span>멤버십 등급은 어디서 확인 할 수 있나요</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터 홈페이지에서 로그인해 주세요. <br>
                                [마이페이지]에서 회원 등급을 확인하실 수 있습니다. 
                            </p>
                        </li>
                        <li> 
                            <div>
                                <span id="faq-cate">회원</span>
                                <span>멤버십 등급의 산정 기준과 등급별 혜택이 궁금해요</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터 홈페이지에서 회원가입 시 일반등급, 최근 6개월 간 3회 이상 예매 시 VIP등급, 5회 이상 예매 시 VVIP 등급으로 산정됩니다. <br>
                                일반등급은 1%의 할인, VIP등급은 3%의 할인, VVIP등급은 5%의 할인이 적용됩니다.
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">예매/관람</span>
                                <span>전시장에서 사진촬영이 가능한가요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터는 전시장에서 사진 촬영이 가능합니다.  <br>
                                다만, 플래시, 삼각대 및 셀카스틱을 이용한 촬영, 허가되지 않은 상업적 용도의 촬영 및 녹음, 동영상 촬영은 불가합니다. <br>
                                언론보도용 사진이 필요하신 경우, '1대1문의'에 남겨주시거나 JV 아트센터 홍보마케팅팀으로 문의 주시기 바랍니다. <br>
                                사진 촬영을 하실 때에는 과도한 촬영음이 발생하거나, 대기 줄이 생기지 않도록 관람 에티켓을 지켜주시기 바랍니다. 
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">예매/관람</span>
                                <span>JV 아트센터의 관람시간 및 휴관일이 궁금해요</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터의 전시 운영 시간은 다음과 같습니다. <br>
                                화∙수∙목∙금∙토∙일요일 AM 11시 ~ PM 8시 <br>
                                * 매주 월요일 휴관 <br>
                                * 설, 추석 당일 휴관 
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">예매/관람</span>
                                <span>예매티켓의 변경 및 취소가 가능한가요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                예매하신 티켓의 변경, 취소는 관람 전 일 오후 5시까지만 가능합니다. <br>
                                취소 가능 시간 이후의 티켓 취소, 변경, 환불은 불가능하니 이점 유의 바랍니다.
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">예매/관람</span>
                                <span>관람 전 소지품을 보관할 수 있나요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터에는 물품보관함이 마련되어 있습니다. <br>
                                소형 1000원, 중ㆍ대형 2000원에 2시간 동안 이용가능하며 추가 시간당 소형 1,000원, 중ㆍ대형 2,000원의 요금이 부과됩니다. <br>
                                소지품 보관이 필요 하시면 물품보관함을 이용 후 편안하게 전시를 감상해 주세요. <br>
                                백팩, 꽃, 음식물, 풍선, 우산, 손선풍기 등은 전시장 내부에서 소지할 수 없습니다. <br>
                                해당 물품을 소지 후 방문하실 경우 필히 보관함에 물품을 보관 후 전시 관람을 해 주세요. 
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">예매/관람</span>
                                <span>전시장에서 소지품을 분실했는데 어떻게 하면 될까요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                유실물 확인을 위해 '1대1문의하기'로 방문일시, 장소, 분실물 정보를 원하시는 연락 방법과 함께 등록해 주세요. <br>
                                분실물 정보(종류, 색상, 브랜드 등)을 구체적으로 작성해 주시면 정확하게 확인하는데 도움이 됩니다. <br>
                                소중한 유실물을 빠르게 찾아드릴 수 있도록 노력하겠습니다.
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">예매/관람</span>
                                <span>전시를 관람하려면 반드시 예약을 해야 하나요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터의 전시들은 안전하고 쾌적한 관람을 위해 사전예약제로 운영됩니다. <br>
                                잔여 티켓에 한해 현장 발권을 진행 하나, 방문하시고자 하는 시간에 예매가 완료 된 경우 <br>
                                현장 구매와 입장이 어려 울 수 있으니 JV아트센터 홈페이지에서 사전 예약 후 방문해 주시기를 추천 드립니다. 
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">예매/관람</span>
                                <span>관람료는 얼마인가요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터는 진행하는 전시에 따라 관람료가 상이합니다. <br>
                                자세한 관람 요금에 대한 정보는 홈페이지 [전시] > [현재전시]에서 확인하실 수 있습니다.
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">예매/관람</span>
                                <span>디지털 가이드를 이용할 수 있나요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터는 디지털 가이드 서비스를 제공하고 있습니다. <br>
                                디지털 가이드는 전시 작품 앞에 다가가면 자동으로 작품 해설을 제공해주는 단말기로 무료로 대여하실 수 있습니다. <br>
                                대여 시 여권, 주민등록증 등 신분등을 맡기셔야 합니다.
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">위치/시설</span>
                                <span>JV 아트센터의 위치는 어디인가요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터는 당산역  12번 출구에서 도보 7분거리에 위치하고 있습니다. <br>
                                뿐만 아니라 버스정류장도 가까이에 있어 대중교통으로 편리하게 방문이 가능합니다. <br>
                                아래의 '오시는 길'을 클릭하시면 이용 가능한 교통편과 주차정보를 확인하실 수 있습니다. <br>
                                주소 : 서울특별시 영등포구 선유동2로 57 JV아트센터 <br><br>

                                <a href="">오시는 길 자세히 보기</a>                        
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">위치/시설</span>
                                <span>JV 아트센터는 주차가 가능한가요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터 방문 시 주차장 B2, B3(지하 주차장)를 이용하실 수 있습니다. <br>
                                사전 정산기에서 JV 아트센터 당일 관람 티켓을 등록하시면 2시간의 무료 혜택이 적용되며, 초과시 10분당 1,000원의 추가요금이 부과됩니다. <br>
                                * 주차장 이용 및 인근 교통 체증으로 인한 예약 변경∙취소는 불가 하오니 가급적 대중교통을 이용하시기 바랍니다.
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">위치/시설</span>
                                <span>JV 아트센터에 휠체어로 입장 가능한가요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터는 휠체어로 이동이 편리한 출입구와 티켓 박스를 마련 하고 있습니다. <br>
                                이를 통해 입장 하신 다음 엘리베이터를 통해 전시장을 이동하며 전시 감상이 가능합니다. <br> 
                                방문 당일 직원의 안내가 필요 하시면 가까운 직원에게 문의해 주시기 바랍니다. 
                            </p>
                        </li>
                        <li>
                            <div>
                                <span id="faq-cate">위치/시설</span>
                                <span>유모차와 휠체어를 대여할 수 있나요?</span>
                                <img src="<%= contextPath %>/resources/image/down_arrow.png" height="20px;" align="right">
                                <hr>
                            </div>
                            <p>
                                JV 아트센터는 영아를 동반한 관람객이나 장애인 관람객의 편안한 관람을 돕기 위하여 안내데스크에서 유모차와 휠체어를 대여해 드리고 있습니다. <br>
                                방문 당일 안내데스크에 문의해 주시기 바랍니다.
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        
            <div id="content_3"></div>
        </div>    
    </div>	
    
    <script>
        $(function() {

            $("#faq-list div").click(function() {

                var $p = $(this).next();
        
                if($p.css("display") == "none") { 
                    
                    $(this).parents().find("p").slideUp(1000);

                    $p.slideDown(1000);

                } else {

                    $p.slideUp(1000);
                }

            });
        });
    </script>

    <%@ include file="/views/common/footerbar.jsp" %>

  </body>
</html>
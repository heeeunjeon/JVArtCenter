<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="views/common/menubar.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <!-- 아이콘 부트스트랩 -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
    />

    <!-- JavaScript Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>

    <!-- 스크롤 애니매이션 -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
      AOS.init();
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.1/jquery.min.js"></script>
    <!-- Hiding HTML5 Video Controls using CSS Pseudo selectors -->

    <title>JV Art Center</title>
    <style>
      #content {
        height: 3500px;
      }
      #index {
        width: 1900px;
      }
      #index > div {
        width: 100%;
      }
      #main_img {
        height: 20%;
        box-sizing: border-box !important;
      }

      #main_content {
        height: 78%;
      }
      #main_content > div {
        width: 80%;
        margin: auto;
      }

      .pagination {
        justify-content: center;
      }

      #main_3 hr {
        height: 70vh;
        width: 0.1vw;
        border-width: 0;
        color: black;
        background-color: black;
      }

      .carouselExampleControls {
        position: relative;
      }

      .carousel-item h6 {
        position: absolute;
        top: 40%;
        left: 15%;
        color: white;
        font-size: 20px;
        font-weight: 300;
        letter-spacing: 0px;
      }

      .carousel-item h1 {
        position: absolute;
        top: 45%;
        left: 15%;
        color: white;
        font-size: 50px;
        font-weight: 600;
        letter-spacing: -2px;
      }
      .carousel-item a {
        position: absolute;
        top: 55%;
        left: 15%;
        color: white;
        text-decoration: none;
        font-size: 20px;
        font-weight: 400;
      }

      .carousel-item video {
        object-fit: cover;
        width: 100%;
        height: 800px;
        box-sizing: border-box;
      }

      /* 비디오 컨트롤러 숨기기 */
      /* 전체화면 버튼 */
      video::-webkit-media-controls-fullscreen-button {
        display: none !important;
      }

      /* 일시정지, 재생 버튼 */
      video::-webkit-media-controls-play-button {
        display: none !important;
      }

      /* 재생 슬라이드..? */
      video::-webkit-media-controls-timeline {
        display: none !important;
      }

      /* 현재 진행 시간 */
      video::-webkit-media-controls-current-time-display {
        display: none !important;
      }

      /* 전체 시간 */
      video::-webkit-media-controls-time-remaining-display {
        display: none !important;
      }

      /* 음소거 버튼 */
      video::-webkit-media-controls-mute-button {
        display: none !important;
      }

      /* 볼륨 조절 슬라이드 */
      video::-webkit-media-controls-volume-slider {
        display: none !important;
      }

      video::-webkit-media-controls-fullscreen-button {
        display: none !important;
      }

      video::-webkit-media-controls {
        display: none;
      }

      /* #content * { border: 1px solid lightgray; }
    #content div { border: 1px solid red; } */
    </style>
  </head>
  <body>
    <div class="wrap"></div>
    <!--전체를 감싸는 wrap영역-->

    <div id="content">
      <!--바디-->
      <div id="index">
        <div id="main_img" style="height: 25%">
          <!-- 스와이프 -->
          <div
            id="carouselExampleControls"
            class="carousel slide"
            data-bs-ride="carousel"
          >
            <div class="carousel-inner">
              <div class="carousel-item active">
                <h6>2022.10.01 - 2023.01.08</h6>
                <h1>장 줄리앙 : 그러면 거기</h1>
                <a href="<%= contextPath %>/detail.ex?eno=1236">예매하기</a>
                <video
                  class="video"
                  autoplay
                  muted
                  frameborder="0"
                  loop
                  controls="false"
                >
                  <source
                    type="video/mp4"
                    src="resources/image/main_video_5.mp4"
                  />
                </video>
              </div>
              <div class="carousel-item">
                <h6>2022.11.01 - 2022.11.30</h6>
                <h1>ROMANTIC DAYS 어쨌든, 사랑</h1>
                <a href="<%= contextPath %>/detail.ex?eno=1237">예매하기</a>
                <video
                  class="video"
                  autoplay
                  muted
                  frameborder="0"
                  loop
                  controls="false"
                >
                  <source
                    type="video/mp4"
                    src="resources/image/main_video_3.mp4"
                  />
                </video>
              </div>
            </div>
            <button
              class="carousel-control-prev"
              type="button"
              data-bs-target="#carouselExampleControls"
              data-bs-slide="prev"
            >
              <span
                class="carousel-control-prev-icon"
                aria-hidden="true"
              ></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button
              class="carousel-control-next"
              type="button"
              data-bs-target="#carouselExampleControls"
              data-bs-slide="next"
            >
              <span
                class="carousel-control-next-icon"
                aria-hidden="true"
              ></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>
        <div id="main_content" data-aos="fade-up"
        data-aos-duration="2000">
            
            <div id="main_1" style="height: 25%;">
                <div>
                    <table style="width: 100%;">
                        <tr>
                            <td><h2>현재 전시</h2></td>
                            <td><h5 style="float: right;">JV의 수준높은 전시를 소개합니다</h5></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="float: right;">
                                <a href="<%= contextPath %>/list.ex?term=C&currentPage=1">
                                    더보기
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                                        <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                    </table>
                    
            
            <!-- 현재 전시 -->
            </div>
                <table align="center" style="margin-top: 30px; box-sizing: border-box; display: block; width: 100%;">
                    <tr>
                        <td width="50%">
                            <img src="resources/image/exhibition.png" style="width: 100%; height: 400px;" id="imgSlide">
                            <a href="" style="padding-top: 20px; display: block; font-weight: 600;">올림픽 이펙트: 한국 건축과 디자인 8090</a>
                        </td>
                        <td></td>
                        <td width="50%"> 
                            <img src="resources/image/exhibition2.png" style="width: 100%; height: 400px;">
                            <a href="" style="padding-top: 20px; display: block; font-weight: 600;">구름 산책자</a>
                        </td>
                    </tr>
                </table>


            </div>
            

            <div id="main_2" style="height: 25%;" data-aos="fade-up"
            data-aos-duration="2000">
                <table style="width: 100%; box-sizing: border-box;">
                    <tr>
                        <td style="vertical-align: top; width: 30%;">
                            <h2>지난 전시</h2>
                            <a href="<%= contextPath  %>/list.ex?term=P&currentPage=1">
                                    더보기
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                                </svg>
                            </a>
                        </td>
                        <td>
                            <img src="resources/image/exhibition3.png" alt="" style="width : 100%; height: 280px">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 40px;"></td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top; width: 30%;">
                            <h2>예정 전시</h2>
                            <a href="<%= contextPath %>/list.ex?term=F&currentPage=1">
                                더보기
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                                </svg>
                            </a>
                        </td>
                        <td>
                            <img src="resources/image/exhibition4.png" alt="" style="width : 100%; height: 280px">
                        </td>
                    </tr>
                </table>
            </div>

            <div id="main_3" style="height: 30%;" data-aos="fade-up"
            data-aos-duration="2000">
                <h2>뉴스레터</h2>

                <table style="width: 100%;">
                    <tr>
                        <td rowspan="6" style="width: 50%; vertical-align: top; padding-right: 30px; padding-top: 30px;" align="center" >
                            <img src="resources/image/newslettermain1.png" style="width:100%; height: 350px;">
                            <p style="text-align: left; width: 100%;">
                                <a href="<%= contextPath%>/detail.news?neno=3"><b style="padding-top: 30px; display: block; font-size: large;">스스로 소우주가 된 화가 이성자 이야기</b> <br><br>
                               1965년,여성화가 이성자(1918~2009)가 혜성처럼 화단에 등장했다. 한국에서 미술과 관련된 

                               이력이 전무했던 여성이 국제적인<br>화가가 되어 귀국 전시를 연것이다. 이성자는 세 아들을 키우는

                               평범한 가정부부였는데, 가족과의 불화로 아이들과 헤어지고 단신으로 프랑스로 떠났다.
                                </a>
                            </p>
                        </td>
                        <tr>
                            <td rowspan="6" align="center">
                                <hr>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; height: 200px; vertical-align: top; padding: 30px;">
                                <img src="resources/image/newslettermain2.png" style="width:100%; height: 200px;">
                            </td>
                            <td rowspan="6" align="center">
                                <hr>
                            </td>
                            <td style="width: 25%; vertical-align: top; padding-left: 40px; padding-top: 30px;">
                                <img src="resources/image/newslettermain3.png" style="width:100%; height: 200px;">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="padding-left: 30px; vertical-align: top;">
                                <a href="<%= contextPath %>/detail.news?neno=6"><b style="padding-top: 30px; display: block">김영주, 현대 도시를 표류하는 인간을 포착하다.</b></a>
                            </td>
                            <td style="padding-left: 30px; vertical-align: top;">
                                <a href="<%= contextPath %>/detail.news?neno=8"><b style="padding-top: 30px; display: block">판소리의 해학과 풍류를 담은 성재휴의 작품세계</b></a>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%; height: 200px; vertical-align: top; padding: 30px;">
                                <img src="resources/image/newslettermain4.png" style="width:100%; height: 200px;">
                            </td>
                            <td style="width: 25%; vertical-align: top; padding-left: 40px; padding-top: 30px;">
                                <img src="resources/image/newslettermain5.png" style="width:100%; height: 200px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 30px; vertical-align: top;">
                                <a href="<%= contextPath %>/detail.news?neno=2"><b style="padding-top: 30px; display: block;">폐허 위에서 아름다운 시를 빚어낸 화가</b></a>
                            </td>
                            <td style="padding-left: 30px; vertical-align: top;">
                                <a href="<%= contextPath %>/detail.news?neno=4"><b style="padding-top: 30px; display: block">동경 파리, 뉴욕을 누빈 추상화가 김환기의 아틀리에 이야기</b></a>
                            </td>
                            
                        </tr>
                    
                    
                </table>
            </div>

            <div id="main_4" data-aos="fade-up" data-aos-duration="2000">
                <div>
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 30%; vertical-align: top;">
                                <h2>공간</h2>
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <h5>관람객과 예술 작품이 교감하는<br>
                                    JV 아트센터의 건축과 공간을 <br> 소개합니다</h5>
                                
                            </td>
                            <td style="vertical-align: top;">
                                <h2>공지사항</h2>
                            </td>
                            <td style="vertical-align: top; text-align: right;">
                                <a href="<%= contextPath %>/list.no?currentPage=1"><b>더보기</b></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-right: 20px;">
                                <br><br><br>
                                
                                JV 아트센터는 한국의 예술 문화를 이끌어가는 작가들과 시대적 가치를 반영, 생동하는 현대미술과 한국 전통의 미를 담고있는 전통 미술이 함께 공존하는 아트센터 입니다. <br><br>
                                <a href="<%= contextPath %>/info"><b>더보기</b></a>
                            </td>
                            <td colspan="2">
                                <table class="table" style="width: 100%;">
                                      <tr>
                                        <td width="10%">1</td>
                                        <td><a href="<%= contextPath %>/detail.no?nno=1">JV아트센터 홈페이지가 새롭게 단장하였습니다.</a></td>
                                      </tr>
                                      <tr>
                                        <td>2</td>
                                        <td><a href="<%= contextPath %>//detail.no?nno=2">JV 아트센터 회원 등급 안내</a></td>
                                      </tr>
                                      <tr>
                                        <td>3</td>
                                        <td><a href="<%= contextPath %>/detail.no?nno=3">대중교통 이용 안내</a></td>
                                      </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>

    </div>
    
</div>
</div>


<script>
let imgSlide = document.querySelector("#imgSlide");
let imgList = ["resources/image/exhibition1.png" ,"resources/image/exhibition2.png"];
let i = 0;

function prev(){ // 이전
    i--;
    imgSlide.src = imgList[i];
    if(i<0){
        i = imgList.length-1;
        imgSlide.src = imgList[i];
    }
}

function next(){ // 다음
    i++;
    imgSlide.src = imgList[i];
    if(i >= imgList.length){
        i = 0;
        imgSlide.src = imgList[i];
    }
}
</script>

    <%@ include file="views/common/footerbar.jsp" %>
  </body>
</html>

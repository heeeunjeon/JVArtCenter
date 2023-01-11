<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/menubar.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의페이지</title>

<style>
  td>textarea{
      width: 800px;
      height: 150px;
      resize: none;
      border-radius: 5px;
      margin-left: 260px;
        }

  #agree {
      margin-left: 260px;
        }

  #hr{
      width: 50em;
      margin: auto; }

  #agree_{
      font-size: 40px;
      text-align: center;
      font-weight: 300; }    

  #agreebtn{
            width: 200px;
            margin-left : 430px; }

  #noagreebtn{
            width:200px;
            margin-left : 50px;
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
          <pre id="agree_">약관동의</pre>
          <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
          </div>
          <br><br>
          <table>
              <tr>
                  <td>
                      <label style="font-weight : 700"><input type="checkbox" name="agree_all" id="agree">
                      서비스 이용약관, 개인정보취급방침, 개인정보수집 및 제3자 제공, 개인정보 취급위탁에 모두 동의합니다.</label>
                  </td>
              </tr>
              <tr>
                  <td height="15"></td>
              </tr>
              <tr>
                  <td><label style="font-weight:600"><input type="checkbox" name="agree" value="1" id="agree">
                      서비스 이용약관(필수)</label></td>
              </tr>
              <tr>
                  <td>
                      <textarea>제1조(목적)
① JV아트센터 이용자 약관(이하 "본 약관"이라 합니다)은 이용자가 재단법인 JV아트센터(이하 "JV아트센터")에서 제공하는 서비스(이하 "서비스"라 합니다)를 이용함에 있어 이용조건 및 절차 등에 관한 기본적인 사항을 규정함을 목적으로 합니다.
② 이용자가 되고자 하는 자는 JV아트센터가 정한 소정의 절차를 거쳐 회원 자격을 취득합니다. 본 약관에 정하는 이외의 이용자와 JV아트센터의 권리, 의무 및 책임사항에 관해서는 전기통신사업법 기타 대한민국의 관련 법령과 상관습에 의합니다.
제2조(이용자의 정의)
"이용자"란 JV아트센터에 접속하여 본 약관에 따라 JV아트센터 회원으로 가입하여 JV아트센터가 제공하는 서비스를 받는 자를 말합니다. 이용자는 본인 실명 회원만을 원칙으로 합니다.
                      </textarea>
                  </td>
              </tr>
              <tr>
                  <td>
                      <label style="font-weight:600"><input type="checkbox"  name="agree" value="2" id="agree" >
                      개인정보수집목적 및 이용목적(필수)</label>
                  </td>
              </tr>
              <tr>
                  <td><textarea>
개인정보 수집목적 및 이용목적
① 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스, 재단에서 진행하는 프로그램 참가자의 본인 확인, 사고 발생 시 응급 처치
② 회원 관리
회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달
2. 수집하는 개인정보 항목
- 회원가입 시
∙ 필수항목: 성명, 생년월일, 회원 ID, 비밀번호, 휴대전화번호, 이메일
∙ 선택항목: 성별, 자녀 유무, 자녀 생년월일
- 소셜 회원을 통한 회원 가입 시(카카오, 네이버, 애플, 구글)
∙ 필수항목: 로그인 정보 식별값, 성명, 생년월일, 회원 ID, 비밀번호, 휴대전화번호, 이메일
∙ 선택항목: 성별, 생년월일, 자녀 유무, 자녀 생년월일
- 전시/이벤트 티켓 예매 시
∙ 필수항목: 예매자 정보(성명, 이메일, 휴대전화번호)
∙ 선택항목: 없음
- 교육프로그램 티켓 예매 시
∙ 필수항목: 예매자 정보(성명, 이메일, 휴대전화번호), 프로그램 참여 아동∙청소년의 나이
∙ 선택항목: 없음
- 단체예매 신청/대관·제휴 문의 시
∙ 필수항목: 신청자 정보(성명, 이메일, 휴대전화번호), 단체명
∙ 선택항목: 없음
- 본인인증 시
∙ 필수항목: 성명, 성별, 생년월일, 휴대전화번호
∙ 선택항목: 없음
- 서비스 이용과정에서 자동 수집 정보
∙ IP정보, 디바이스 또는 브라우저 정보, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
        </textarea></td>
              </tr>
              <tr>
                  <td>
                      <label style="font-weight:600"><input  type="checkbox"  name="agree" value="3" id="agree">
                      개인정보 수집 및 이용, 제3자 제공에 대한 안내/동의(필수)</label>
                  </td>
              </tr>
              <tr>
                  <td>
                      
                        <textarea>1 개인정보의 처리 목적
① JV아트센터은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급·배송, 마케팅 및 광고에의 활용
2 개인정보의 처리 및 보유 기간 작성
① JV아트센터은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유·이용기간 또는 법령에 따른 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.
고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권·채무관계 잔존시에는 해당 채권·채무관계 정산시까지
전자상거래에서의 계약·청약철회, 대금결제, 재화 등 공급기록 : 5년
3 정보주체와 법정대리인의 권리·의무 및 그 행사방법
정보주체는 JV아트센터에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
1. 개인정보 열람요구
2. 오류 등이 있을 경우 정정 요구
3. 삭제요구
4. 처리정지 요구
4 처리하는 개인정보 항목
개인정보 처리업무: 홈페이지 회원가입 및 관리, 민원사무 처리, 재화 또는 서비스 제공, 마케팅 및 광고에의 활용
필수항목: 로그인ID, 비밀번호, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록
선택항목: 이메일, 성별, 이름</textarea>
                  </td>
              </tr>
              

          </table><br>
      <button type="button" id="agreebtn" onclick="enrollPage();" class="btn btn-primary" name="checkButton" value=" 확 인 " disabled>동의</button>
      <button type="reset" id="noagreebtn" class="btn btn-dark">비동의</button>

        </div>
        <div id="content_3"></div>
      </div>	
    
    <%@ include file="/views/common/footerbar.jsp" %>

    <script>

      const agreeChkAll = document.querySelector('input[name=agree_all]');
  
      agreeChkAll.addEventListener('change', (e) => {
      let agreeChk = document.querySelectorAll('input[name=agree]');
      for(let i = 0; i < agreeChk.length; i++){
        agreeChk[i].checked = e.target.checked;
      }
  })

   function enrollPage(){
    		
    location.href = "<%= contextPath %>/enrollForm.me"; }


    $('#agree').on('click', function(){

        var agreebtn = document.getElementById('agreebtn');
        var agree = document.getElementById('agree');

        if(agree.checked){
            $(agreebtn).removeAttr('disabled')
        } else {
            $(agreebtn).attr('disabled', true)
        }


    })


  </script>



  </body>
</html>
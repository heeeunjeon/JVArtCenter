package com.kh.reservation.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class TestRefundController
 */
@WebServlet("/getToken.resv")
public class ReservationGetTokenController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationGetTokenController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String impKey = request.getParameter("imp_key");
	    String impSecret = request.getParameter("imp_secret");
	    // String impUid = request.getParameter("imp_uid");
	    
	    // String accessToken = null; // 발급받을 액세스 토큰
	    URL toUrl = new URL("https://api.iamport.kr/users/getToken"); // 액세스 토큰을 받아올 주소
	    HttpURLConnection toConn = (HttpURLConnection)toUrl.openConnection();
	    
	    // 요청방식
	    toConn.setRequestMethod("POST");
	    
	    // Header 설정 (application/json 형식으로 데이터 전송)
	    toConn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
	    // 서버로부터 받을 Data를 JSON 형식 타입으로 요청
	    toConn.setRequestProperty("Accept", "application/json");
	    
	    // Data 설정
	    toConn.setDoOutput(true); // OutputStream 으로 POST 데이터를 넘겨주겠다는 옵션
	    
	    // 서버로 보낼 데이터 JSON 형태로 변환
	    JSONObject apiObj = new JSONObject();
	    apiObj.put("imp_key", impKey);
	    apiObj.put("imp_secret", impSecret);
	    
	    // conn.connect();
	    
	    // request
	    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(toConn.getOutputStream()));
	    bw.write(apiObj.toString());
	    bw.flush();
	    bw.close();
	    
        // int responseCode = toConn.getResponseCode();
	    // response.getWriter().print(responseCode);
        
        BufferedReader br = new BufferedReader(new InputStreamReader(toConn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line = "";
        while((line = br.readLine()) != null) {
            sb.append(line);
        }
        br.close();
        
        JSONObject jsonObj = new JSONObject();
        
        try {
            JSONParser jsonParser = new JSONParser();
            jsonObj = (JSONObject)jsonParser.parse(sb.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().print(jsonObj);
        
        // System.out.println(jsonObj.toString());
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

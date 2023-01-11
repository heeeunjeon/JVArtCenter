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

import com.kh.reservation.model.service.ReservationService;

/**
 * Servlet implementation class TestRefundController
 */
@WebServlet("/refund.resv")
public class ReservationRefundController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationRefundController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String impUid = request.getParameter("imp_uid");
	    String reason = request.getParameter("reason");
	    String token = request.getParameter("token");
	    
	    // 결제 취소
        URL reUrl = new URL("https://api.iamport.kr/payments/cancel");
        // https://api.iamport.kr/payments/cancel?_token=fb6d9470b5448007729ee0de17a28a1ab9e54f04
        
        HttpURLConnection reConn = (HttpURLConnection)reUrl.openConnection();
        
        // 요청방식
        reConn.setRequestMethod("POST");
        
        // Header 설정 (application/json 형식으로 데이터 전송)
        reConn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        reConn.setRequestProperty("Authorization", token);
        // reConn.setRequestProperty("Authorization", "Bearer " + token);
        // 서버로부터 받을 Data를 JSON 형식 타입으로 요청
        reConn.setRequestProperty("Accept", "application/json");
        
        // Data 설정
        reConn.setDoOutput(true); // OutputStream 으로 데이터를 넘겨주겠다는 옵션
        
        JSONObject impObj = new JSONObject();
        impObj.put("imp_uid", impUid);
        impObj.put("reason", reason);
        
        // request
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(reConn.getOutputStream()));
        bw.write(impObj.toString());
        bw.flush();
        bw.close();
        
        int responseCode = reConn.getResponseCode();
        
        BufferedReader br = new BufferedReader(new InputStreamReader(reConn.getInputStream()));
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
        
        int result = 0;
        
        if(jsonObj.get("code").toString().equals("0")) {
            
            result = new ReservationService().deleteReservation(impUid);
        }
        
        jsonObj.put("delResv", result);
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().print(jsonObj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

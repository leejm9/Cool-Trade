package com.cooltrade.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/APICallerServlet")
public class APICallerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String endpoint = "http://openapi.epost.go.kr:80/postal/RegisterDeliveryService"; // 엔드포인트를 여기에 입력하세요
        String apiKey = "34wsc6y766r8ksUWol03G06POGG5hfycBII2oLzjGnQ1I5+EugxDjmCgVqWv3l0QPP1XvzaaNNBdfWdwSuv8EA==";

        try {
            // API 호출을 위한 URL 생성
            StringBuilder urlBuilder = new StringBuilder(endpoint);
            urlBuilder.append("?api_key=" + apiKey);

            // URL 연결 및 연결 설정
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 응답 읽기
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder responseContent = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                responseContent.append(line);
            }
            rd.close();
            
            // API 응답을 웹 페이지에 출력
            response.setContentType("text/html");
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h1>API 응답:</h1>");
            response.getWriter().println("<pre>" + responseContent.toString() + "</pre>");
            response.getWriter().println("</body></html>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
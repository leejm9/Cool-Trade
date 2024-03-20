package com.cooltrade.member.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/downloadprofileimage.do")
public class DownloadProfileImageController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * Default constructor.
   */
  public DownloadProfileImageController() {
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  /*
    // 서버에 저장된 이미지 파일 경로
    String filePath = "/resources/images_upfiles/"+request.getParameter("uno");
    File downloadFile = new File(filePath);

    // MIME 타입 설정
    response.setContentType("image/jpeg");

    // 파일 다운로드를 위한 헤더 설정
    response.setHeader("Content-Disposition", "attachment; filename=\"" + downloadFile.getName() + "\"");

    // 파일 길이 설정
    response.setContentLength((int) downloadFile.length());

    // 파일 전송
    try (BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(downloadFile));
        BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream())) {

      byte[] buffer = new byte[1024];
      int bytesRead = -1;
      while ((bytesRead = inStream.read(buffer)) != -1) {
        outStream.write(buffer, 0, bytesRead);
      }
    }*/
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }

}

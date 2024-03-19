package com.cooltrade.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.cooltrade.common.MyFileRenamePolicy;
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;
import com.cooltrade.product.model.vo.Images;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/uploadprofileimage.do")
public class AjaxUploadProfileImageController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * Default constructor.
   */
  public AjaxUploadProfileImageController() {
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    Member m = (Member) session.getAttribute("loginUser");
    int uno = m.getUserNo();
	request.setCharacterEncoding("UTF-8");
	
	if(ServletFileUpload.isMultipartContent(request)) {
		// 파일 용량 제한
		int maxSize = 10*1024*1024;
		
		// 저장시킬 폴더 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images_upfiles/");
		
		// 전달 파일 업로드
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		// 유저의 프로필이미지 이미지번호 조회
		int select = new MemberService().selectProfileImg(uno);
		int result = 0;
		
		if(select == 0) {
			// 프로필이미지 이미지번호가 0일 경우 => 프로필이미지가 없다
			if(multiRequest.getOriginalFileName("image") != null) {
				System.out.println("프로필이미지 없다!");
				Images img = new Images();
				img.setOriginName(multiRequest.getOriginalFileName("image"));
				img.setChangeName(multiRequest.getFilesystemName("image"));
				img.setImgPath("resources/images_upfiles/");
				img.setImgLevel(1);
				
				result = new MemberService().insertMemberProfileImg(uno, img);
			}
		} else {
			if(multiRequest.getOriginalFileName("image") != null) {
				System.out.println("프로필이미지 있었다!");
				Images img = new Images();
				img.setOriginName(multiRequest.getOriginalFileName("image"));
				img.setChangeName(multiRequest.getFilesystemName("image"));
				img.setImgPath("resources/images_upfiles/");
				img.setImgNo(select);
				img.setImgLevel(1);
				
				result = new MemberService().updateMemberProfileImg(uno, img);
			}
		}
		
		String titleImg = new MemberService().getProfileImg(select);
		
		if(result > 0) {
			response.getWriter().print(titleImg);
		}
		
	/*
	  // 업로드된 파일에 대한 처리
      @SuppressWarnings("rawtypes")
      Enumeration files = multiRequest.getFileNames();
      while (files.hasMoreElements()) {
        String inputFileName = (String) files.nextElement();
        String uploadedFileName = multiRequest.getFilesystemName(inputFileName);
        if (uploadedFileName != null) {
          File uploadedFile = new File(savePath, uploadedFileName);
          String newFileName = "" + userNo; // 새 파일명 지정
          File newFile = new File(savePath, newFileName);
          
          // 파일명 변경
          if (uploadedFile.renameTo(newFile)) {
            System.out.println("파일명이 성공적으로 변경되었습니다.");
          } else {
            System.out.println("파일명 변경 실패.");
          }
        }
      }
    }
    response.getWriter().print("success");
    */
	  
	}
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

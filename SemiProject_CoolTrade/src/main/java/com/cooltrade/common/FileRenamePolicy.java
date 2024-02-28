package com.cooltrade.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileRenamePolicy {

	// 원본 파일 전달 받아서 파일명 수정 작업 후 수정된 파일 변환시켜주는 메소드
	public File rename(File originFile) {
		
		// 업로드된 파일의 이름을 받아오는 메소드
		String originName = originFile.getName();
		
		// 파일 업로드 시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 3. 원본파일확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 원본 파일과, 바꿀 파일 이름을 주면서 전달
		return new File(originFile.getParent(), changeName);
		
	}
	
}

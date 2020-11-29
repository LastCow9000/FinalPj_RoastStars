package com.beans.roaststars.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.vo.UploadTestVO;

@Controller
public class FileUploadController {	
	private String uploadPath;
	@RequestMapping("multi_fileupload.do")
	public ModelAndView fileUpload(UploadTestVO vo,MultipartHttpServletRequest  request){			
		uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false)
			uploadDir.mkdirs();
		List<MultipartFile> list=vo.getFile();
		//view 화면에 업로드 된 파일 목록을 전달하기 위한 리스트 
		ArrayList<String> nameList=new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			//만약 업로드 파일이 없으면 파일명은 공란처리된다 
			String fileName=list.get(i).getOriginalFilename();
			//업로드 파일이 있으면 파일을 특정경로로 업로드한다
			if(!fileName.equals("")){			
				try {
					list.get(i).transferTo(new File(uploadPath+fileName));
					System.out.println(fileName+" 업로드 완료");
					nameList.add(fileName);
				} catch (Exception e) {					
					e.printStackTrace();
				} 
			}
		}
		return new ModelAndView("product/multifileupload_result.tiles","nameList",nameList);
	}	
}
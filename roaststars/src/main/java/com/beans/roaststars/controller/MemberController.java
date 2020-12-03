package com.beans.roaststars.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.UserService;
import com.beans.roaststars.model.vo.UserVO;

@Controller
public class MemberController {

	@Resource
	private UserService userService;
	private String uploadPath; //업로드 경로
	
	// 로그인 폼 페이지
	@RequestMapping("login-form.do")
	public String loginForm() {
		return "user/loginForm.tiles";
	}

	// 로그아웃 완료 후 이동할 페이지
	@RequestMapping("login-fail.do")
	public String loginFail() {
		return "user/loginFail";
	}

	// 회원가입 폼으로 이동
	@RequestMapping("register-form.do")
	public String registerForm() {
		return "user/registerForm.tiles";
	}

	// 회원가입
	@PostMapping("register-user.do")
	public String register(UserVO vo, MultipartHttpServletRequest request) {
		//System.out.println("회원가입 시 패스워드 확인:"+vo.getPassword()+"----"+vo.getPassword().length());
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false)
			uploadDir.mkdirs();
		MultipartFile file=vo.getUploadFile();
		if(file!=null && file.isEmpty()==false) {
			File uploadFile=new File(uploadPath + file.getOriginalFilename());
			try {
				file.transferTo(uploadFile);
				System.out.println(uploadPath+file.getOriginalFilename());
				vo.setBusinessPic(uploadPath+file.getOriginalFilename());
				String localPath="C:\\kosta203\\Final-project\\FinalPj_RoastStars\\roaststars\\src\\main\\webapp\\resources\\upload";
				File localPathDir=new File(localPath);
				if(localPathDir.exists()==false)
					localPathDir.mkdirs();
				FileCopyUtils.copy(file.getBytes(), new File(localPath + File.separator + file.getOriginalFilename()));
			}catch(IllegalStateException | IOException e){
				e.printStackTrace();
			}
		}
		userService.registerUser(vo);
		return "redirect:register-resultView.do?id=" + vo.getId();
	}

	// 회원가입 결과 페이지로 이동
	@RequestMapping("register-resultView.do")
	public ModelAndView registerResultView(String id) {
		UserVO vo = userService.findUserById(id);
		return new ModelAndView("user/registerResultView.tiles", "userVO", vo);
	}

	// 아이디 중복확인
	@RequestMapping("id-checkAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		return userService.idCheck(id);
	}

	//닉네임 중복확인
	@RequestMapping("nick-checkAjax.do")
	@ResponseBody
	public String nickcheckAjax(String nickname) {
		return userService.nickCheck(nickname);
	}

}

package com.beans.roaststars.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.MyPickService;
import com.beans.roaststars.model.service.UserService;
import com.beans.roaststars.model.vo.UserVO;

@Controller
public class MemberController {

	@Resource
	private UserService userService;
	@Resource
	private MyPickService myPickService;
	
	private String uploadPath; // 업로드 경로

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
		return "user/registerUserForm.tiles";
	}

	// 회원가입
	@PostMapping("register-user.do")
	public String register(UserVO vo, MultipartHttpServletRequest request) {
		//이미지 파일 업로드용
		if (vo.getUploadFile() != null) {
			uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
			File uploadDir = new File(uploadPath);
			if (uploadDir.exists() == false)
				uploadDir.mkdirs();
			MultipartFile file = vo.getUploadFile();
			if (file != null && file.isEmpty() == false) {
				File uploadFile = new File(uploadPath + file.getOriginalFilename());
				try {
					file.transferTo(uploadFile);
					vo.setBusinessPic(file.getOriginalFilename());
					String localPath = "C:\\kosta203\\Final-project\\FinalPj_RoastStars\\roaststars\\src\\main\\webapp\\resources\\upload";
					File localPathDir = new File(localPath);
					if (localPathDir.exists() == false)
						localPathDir.mkdirs();
					FileCopyUtils.copy(uploadFile,
							new File(localPath + File.separator + file.getOriginalFilename()));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		userService.registerUser(vo);
		
		return "redirect:register-resultView.do?id=" + vo.getId();
	}

	// 회원가입 결과 페이지로 이동
	@RequestMapping("register-resultView.do")
	public ModelAndView registerResultView(String id) {
		UserVO vo = userService.findUserById(id);
		return new ModelAndView("user/registerUserResult.tiles", "userVO", vo);
	}

	// 아이디 중복확인
	@RequestMapping("id-checkAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		return userService.idCheck(id);
	}

	// 닉네임 중복확인
	@RequestMapping("nick-checkAjax.do")
	@ResponseBody
	public String nickcheckAjax(String nickname) {
		return userService.nickCheck(nickname);
	}

	// 회원탈퇴시 비밀번호 확인
	@Secured({"ROLE_MEMBER","ROLE_MANAGER"})
	@PostMapping("pass-checkAjax.do")
	@ResponseBody
	public String passcheckAjax(String password) {
		return userService.passCheck(password);
	}
	
	//회원수정폼
	@Secured({"ROLE_MEMBER","ROLE_MANAGER"})
	@RequestMapping("update-userform.do")
	public ModelAndView updateForm(String id) {
		UserVO userVO = userService.findUserById(id);
		return new ModelAndView("user/updateUserForm.tiles", "userVO",userVO);
	}
	
	//비밀번호 변경 폼으로 이동.
		@Secured({"ROLE_MANAGER", "ROLE_MEMBER"})
		@RequestMapping("update-PasswordForm.do")
		public ModelAndView updatePasswordForm(String id) {
			UserVO userVO = userService.findUserById(id);
			return new ModelAndView("user/updatePasswordForm.tiles","userVO",userVO);
		} 
	
	//회원수정
	@Secured({"ROLE_MEMBER","ROLE_MANAGER"})
	@PostMapping("update-useraction.do")
	public String updateUserAction(UserVO userVO) {
		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userService.updateUser(userVO);//service에서 변경될 비밀번호를 암호화한다 
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		uvo.setPassword(userVO.getPassword());
		uvo.setName(userVO.getName());
		uvo.setAddress(userVO.getAddress());
		uvo.setTel(userVO.getTel());
		return "user/updateUserResult.tiles";
	}
	
	//비밀번호 변경
	@Secured({"ROLE_MEMBER","ROLE_MANAGER"})
	@PostMapping("update-userPasswordaction.do")
	public String updateUserPasswordAction(String password, Model model) {
		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=uvo.getId();
		userService.updateUserPassword(id, password);//service에서 변경될 비밀번호를 암호화한다 
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		model.addAttribute("userVO",uvo);
		return "user/updateUserResult.tiles";
	}
	
	//회원탈퇴폼으로 이동.
	@Secured({"ROLE_MANAGER", "ROLE_MEMBER"})		
	@RequestMapping("delete-userform.do")
	public String deleteForm() {
		return "user/deleteUserForm.tiles";
	} 
	
	//회원탈퇴하기
	@Secured({"ROLE_MANAGER", "ROLE_MEMBER"})		
	@PostMapping("delete-useraction.do")
	public String deleteUserAction(UserVO userVO) {
		userService.deleteUser(userVO);
		return "user/deleteUserResult.tiles";
	} 
	
	//비밀번호 찾기 폼 이동
	@RequestMapping("find-password-form.do")
	public String findPasswordForm() {
		return "user/findPasswordForm";
	}
	
	//비밀번호 찾기 ajax
	@PostMapping("find-password.do")
	@ResponseBody
	public String findPassword(String id, String name) {
		String pw=null;
		if(userService.checkIdAndName(id, name)==1) { //id와 name이 일치하면
			pw=userService.updateTempPass(id); //임시 비밀번호 발급 실행
		}
		return pw;
	}
}

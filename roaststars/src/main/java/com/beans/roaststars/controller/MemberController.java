package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beans.roaststars.model.service.UserService;

@Controller
public class MemberController {
	
	@Resource
	private UserService userService;
	
	//로그인 폼 페이지
	@RequestMapping("login-form.do")
	public String loginForm() {
		return "user/loginForm.tiles";
	}
	
	//로그아웃 완료 후 이동할 페이지
	@RequestMapping("login-fail.do")
	public String loginFail() {
		return "user/loginFail";
	}
}

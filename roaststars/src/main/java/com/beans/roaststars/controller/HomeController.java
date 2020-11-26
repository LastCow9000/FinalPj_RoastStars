package com.beans.roaststars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("home.do")
	public String home() {
		return "home.tiles";
	}
	/*	spring-security.xml에 아래와 같이 설정되어 있음 
	로그인 하였으나 권한이 없는 요청을 하였을 경우 보여지는 페이지를 지정  
	spring-security.xml 에 설정되어있음 
	<security:access-denied-handler error-page="/accessDeniedView.do"/>
	*/
	@RequestMapping("accessDeniedView.do")
	public String accessDeniedView() {
		return "auth/accessDeniedView";
	}
}

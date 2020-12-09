package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beans.roaststars.model.service.AdminService;
import com.beans.roaststars.model.vo.AdminListVO;

@Controller
public class AdminController {

	@Resource
	private AdminService adminService;

	@RequestMapping("admin-detail.do")
	public String adminDetailForm(String pageNo, Model model) {
		//권한 종류
		model.addAttribute("authorList", adminService.getUserAuthorityList());
		//등급대기 총인원
		model.addAttribute("watingTotalCount", adminService.getTotalCountByWaitingMember());
		//회원 정보 넘기기
		AdminListVO lvo=adminService.getAllWatingForAuthor(pageNo);
		model.addAttribute("lvo",lvo);
		return "admin/adminDetailForm.tiles";
	}

	// 성호 : 페이지이동(beanspickDetailForm.jsp)
	@RequestMapping("beanspick-detail-form.do")
	public String beanspickDetailForm() {
		return "admin/beanspickDetailForm.tiles";
	}
	
	//영섭 : 권한부여
	@RequestMapping("grant-authority.do")
	@ResponseBody
	public String grantAuthority(String id, String authority) {
		String result=null;
		try {
			int resultCount=adminService.grantAuthority(id, authority);
			if(resultCount >= 1)
				result="true";
		}catch(Exception e) {
			e.printStackTrace();
			result="false";
		}
		return result;
	}

}

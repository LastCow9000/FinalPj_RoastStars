package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beans.roaststars.model.service.MyPickService;

@Controller
public class MyPickController {

	@Resource
	private MyPickService myPickService;
	
	//마이픽 리스트(페이징)
	@Secured({"ROLE_MANAGER", "ROLE_MEMBER"})	
	@RequestMapping("my-pick-list.do")
	public String myPickList(String id, String pageNo, Model model) {
		model.addAttribute("lvo", myPickService.getMyPickList(id, pageNo)); //페이징 적용 리스트
		model.addAttribute("totalCount", myPickService.getTotalCountMyPick(id)); //총 갯수
		return "user/myPick.tiles";
	}
	
	//마이픽 추가
	@Secured({"ROLE_MANAGER", "ROLE_MEMBER"})	
	@PostMapping("my-pick-add.do")
	@ResponseBody
	public String MyPickAdd(String id, String cafeNo) {
		int count=-1;
		try {
			count=myPickService.addMyPick(id, cafeNo); //마이픽 추가
		}catch (Exception e) { //중복으로 인한 sql 오류시 처리
			e.printStackTrace();
			count=0;
		}
		return (count>=1) ? "ok":"fail";
	}
	
	//마이픽 삭제(primary key로)
	@Secured({"ROLE_MANAGER", "ROLE_MEMBER"})	
	@PostMapping("my-pick-delete.do")
	@ResponseBody
	public String MyPickDelete(String pickNo) {
		int count=myPickService.deleteMyPick(pickNo);
		return (count>=1) ? "ok":"fail";
	}
	
	//마이픽 삭제(id와 cafeNo로)
	@Secured({"ROLE_MANAGER", "ROLE_MEMBER"})	
	@PostMapping("my-pick-delete-by-id-cafeNo.do")
	@ResponseBody
	public String MyPickDeleteByIdAndCafeNo(String id, String cafeNo) {
		int count=myPickService.deleteMyPickByIdAndCafeNo(id, cafeNo);
		return (count>=1) ? "ok":"fail";
	}
}

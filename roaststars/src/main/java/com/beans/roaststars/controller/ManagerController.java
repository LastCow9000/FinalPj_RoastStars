package com.beans.roaststars.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.UserVO;
@Controller
public class ManagerController {
	@Resource
	private CafeService cafeService;

	// 카페등록폼으로 이동
	@Secured("ROLE_MANAGER")
	@RequestMapping("register-cafeform.do")
	public String registerCafeForm() {
		return "cafe/registerCafeForm.tiles";
	}

	// 카페등록하기
	@Transactional
	@Secured("ROLE_MANAGER")
	@PostMapping("register-cafe.do")
	public ModelAndView registerCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO) {
		// 로그인한 유저정보 불러오기
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		cafeVO.setUserVO(uvo);
		cafeOperVO.setCafeVO(cafeVO);
		// 카페정보 등록
		cafeService.registerCafe(cafeVO, cafeOperVO);
		// cafeNo 보내주기
		cafeVO = cafeService.findcafeByNoNotJoin(cafeVO.getCafeNo());
		cafeOperVO.setCafeVO(cafeVO);
		cafeOperVO = cafeService.findCafeByCafeNo(cafeVO.getCafeNo());
		return new ModelAndView("cafe/registerCafeResult.tiles", "cafeOperVO", cafeOperVO);
	}

	// 카페정보수정폼으로 이동하기 전에 자신의 카페 리스트 불러오기
	@Secured("ROLE_MANAGER")
	@RequestMapping("update-cafelist.do")
	public String updateCafeList(Model model) {
		UserVO userVO = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<CafeVO> list = cafeService.getCafeList(userVO.getId());
		model.addAttribute("list", list);
		return "cafe/updateCafeList.tiles";
	}
	//카페정보 수정전 자신의 카페목록 불러오기.
	@Secured("ROLE_MANAGER")
	@RequestMapping("update-cafeform.do")
	public ModelAndView updateCafeForm(String cafeNo, Model model) {
		model.addAttribute(cafeNo);
		CafeVO cafeVO = new CafeVO();
		cafeVO = cafeService.findcafeByNoNotJoin(cafeNo);
		return new ModelAndView("cafe/updateCafeForm.tiles", "cafeVO", cafeVO);
	}

	// 카페정보수정하기
	@Transactional
	@Secured("ROLE_MANAGER")
	@PostMapping("update-cafe.do")
	public ModelAndView updateCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO) { // 로그인한 유저정보 불러오기
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		cafeVO.setUserVO(uvo);
		cafeOperVO.setCafeVO(cafeVO);
		cafeService.updateCafe(cafeVO, cafeOperVO);
		cafeOperVO = cafeService.findCafeByCafeNo(cafeVO.getCafeNo());
		return new ModelAndView("cafe/updateCafeResult.tiles", "cafeOperVO", cafeOperVO);
	}
	
	@Secured({"ROLE_MANAGER","ROLE_ADMIN"})
	@PostMapping("deleteCafe-Ajax.do")
	@ResponseBody
	public String deleteCafe(String cafeNo) {
		return cafeService.deleteCafe(cafeNo);
	}
}

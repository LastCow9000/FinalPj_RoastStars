package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.service.CafeService;

@Controller
public class CafeController {
	
	@Resource
	private CafeMapper cafeMapper;
	@Resource
	CafeService cafeService;
	
	//메인화면 검색 결과후 지역검색 리스트뽑기
	@RequestMapping("findListByLoc.do")
	public String findListByLoc(String loc, Model model) {
		model.addAttribute("cafeList",cafeService.findListByLoc(loc));
		return "cafe/CafeListByLoc.tiles";
	}
	
	//카페 상세보기 페이지로 이동
	@RequestMapping("cafe-detail.do")
	public ModelAndView viewCafeDetail(String cafeNo) {
		return new ModelAndView("cafe/cafeDetail.tiles",
				"cafeVO", cafeMapper.findCafeByCafeNo(cafeNo));
	}//viewCafeDetail
	
	
}

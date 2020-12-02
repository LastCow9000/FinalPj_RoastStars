package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.vo.CafeVO;

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
		return "cafe/cafeListByLoc.tiles";
	}
	
	//카페 상세보기 페이지로 이동
	@RequestMapping("cafe-detail.do")
	public ModelAndView viewCafeDetail(String cafeNo) {
		return new ModelAndView("cafe/cafeDetail.tiles",
				"cafeVO", cafeMapper.findCafeByCafeNo(cafeNo));
	}//viewCafeDetail
	
	//카페 간략정보 ajax
	@RequestMapping("cafe-simple.do")
	@ResponseBody
	public CafeVO getCafeSimple(String cafeNo) {
		CafeVO cafeVO=cafeMapper.findCafeByCafeNo(cafeNo);
		return cafeVO;
	}
	
	
}

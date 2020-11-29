package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.mapper.CafeMapper;

@Controller
public class CafeController {
	
	@Resource
	private CafeMapper cafeMapper;

	//카페 상세보기 페이지로 이동
	@RequestMapping("cafe-detail.do")
	public ModelAndView viewCafeDetail(String cafeNo) {
		return new ModelAndView("cafe/cafeDetail.tiles",
				"cafeVO", cafeMapper.findCafeByCafeNo(cafeNo));
	}
}

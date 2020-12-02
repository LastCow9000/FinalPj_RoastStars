package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.vo.ReviewListVO;

@Controller
public class ReviewController {

	@Resource
	private ReviewService reviewService;
/*
	@RequestMapping("review-list.do")
	@ResponseBody
	public ModelAndView findCafeByCafeNo(String cafeNo,String pageNo) {
		ReviewListVO lvo = reviewService.findReviewListByCafeNo(cafeNo,pageNo);
		return new ModelAndView("cafe/cafeDetail.tiles", 
				"lvo", lvo);
	}*/
}

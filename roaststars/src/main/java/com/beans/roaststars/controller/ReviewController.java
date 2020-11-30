package com.beans.roaststars.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Resource
	private ReviewService reviewService;
	
	@RequestMapping("review-list.do")
	public ModelAndView findCafeByCafeNo(String cafeNo) {
		List<ReviewVO> reviewList = reviewService.findReviewListByCafeNo(cafeNo);
		return new ModelAndView("cafe/review/reviewList",
				"reviewList", reviewList);
	}
}

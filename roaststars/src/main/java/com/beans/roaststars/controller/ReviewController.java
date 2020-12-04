package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewVO;

@Controller
public class ReviewController {

	@Resource
	private ReviewService reviewService;

	@Secured("ROLE_MEMBER")
	@RequestMapping("register-review-form.do")
	public ModelAndView registerReviewForm(String cafeNo) {
		return new ModelAndView("review/registerReviewForm",
				"cafeNo", cafeNo);
	}
	
	@Secured("ROLE_MEMBER")
	@PostMapping("register-review.do")
	public String registerReviewAndupdateProperty(ReviewVO reviewVO, PropertyVO propertyVO,
			String cafeNo, String id, RedirectAttributes ra) {
		reviewService.registerReviewAndUpdateProperty(reviewVO, propertyVO, cafeNo, id);
		ra.addAttribute("cafeNo", cafeNo);
		return "redirect:review/registerReviewResult";
	}
}

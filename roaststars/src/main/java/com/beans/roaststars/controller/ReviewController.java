package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewVO;

@Controller
public class ReviewController {

	@Resource
	private ReviewService reviewService;

	// 리뷰 등록 폼으로 이동하기(모달 열기)
	@Secured("ROLE_MEMBER")
	@RequestMapping("register-review-form.do")
	public String registerReviewForm() {
		return "review/registerReviewForm";
	}
	
	// 리뷰 등록 전, 리뷰 중복 체크
	@Secured("ROLE_MEMBER")
	@RequestMapping("check-review-ajax.do")
	@ResponseBody
	public int checkReviewAjax(String id, String cafeNo) {
		return reviewService.checkDuplicatedReview(cafeNo, id);
	}
	
	// 리뷰 등록 시 1)리뷰 등록, 2)해당 카페에 평점 추가
	@Secured("ROLE_MEMBER")
	@PostMapping("register-review.do")
	public String registerReviewAndupdateProperty(ReviewVO reviewVO, PropertyVO propertyVO,
			String cafeNo, String id) {
		reviewService.registerReviewAndUpdateProperty(reviewVO, propertyVO, cafeNo, id);
		return "redirect:cafe-detail.do?id="+id+"&cafeNo="+cafeNo;
	}
	
	/*
	// 리뷰 작성 결과 alert으로 이동
	@Secured("ROLE_MEMBER")
	@RequestMapping("register-review-result.do")
	public ModelAndView registerReviewResult(String cafeNo) {
		return new ModelAndView("review/registerReviewResult.tiles",
				"cafeNo", cafeNo);
	}*/
	
	// 리뷰 삭제
	@Secured("ROLE_MEMBER")
	@PostMapping("delete-review.do")
	public String deleteReview(String reviewNo, String cafeNo, String id) {
		reviewService.deleteReviewAndRollbackProperty(reviewNo);
		return "redirect:cafe-detail.do?id="+id+"&cafeNo="+cafeNo;
	}
}

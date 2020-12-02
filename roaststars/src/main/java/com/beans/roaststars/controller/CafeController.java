package com.beans.roaststars.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.ReviewListVO;
import com.beans.roaststars.model.vo.UserVO;

@Controller
public class CafeController {

	@Resource
	CafeService cafeService;

	@Resource
	ReviewService reviewService;
	
	@Resource
	CafeMapper cafeMapper;

	// 메인화면 검색 결과후 지역검색 리스트뽑기
	@RequestMapping("findListByLoc.do")
	public String findListByLoc(String loc, Model model) {
		model.addAttribute("cafeList",cafeService.findListByLoc(loc));
		return "cafe/cafeListByLoc.tiles";
	}

	// 카페 상세보기 페이지로 이동
	@RequestMapping("cafe-detail.do")
	public String viewCafeDetail(String cafeNo, String pageNo, Model model, HttpSession session) {
		// CafeVO 넘기기
		model.addAttribute("cafeVO", cafeService.findCafeByCafeNo(cafeNo));
		// 총 리뷰 개수 넘기기
		model.addAttribute("reviewTotalCount", reviewService.findReviewTotalCountByCafeNo(cafeNo));
		// 리뷰 리스트 넘기기
		ReviewListVO lvo = reviewService.findReviewListByCafeNo(cafeNo, pageNo);
		model.addAttribute("lvo", lvo);
		
		/* 로그인 UserVO 넘기기 --- 실패 !! 
		 * 원인 : 로그인하지 않은 사용자는 54번 라인을 실행하지 못해 오류가 발생한다.
		// : 로그인 사용자의 정보 확인을 위해 Spring Security 세션 회원정보를 반환받는다
		if(session != null) {
			UserVO loginUserVO = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("loginUserId", loginUserVO.getId());
		} else {
			model.addAttribute("loginUserId", "null");
		}
		*/
		
		return "cafe/cafeDetail.tiles";
	}// viewCafeDetail

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

package com.beans.roaststars.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.ReviewListVO;
import com.beans.roaststars.model.vo.PropertyVO;
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
		model.addAttribute("cafeList", cafeService.findListByLoc(loc));
		return "cafe/cafeListByLoc.tiles";
	}

	// 카페 상세보기 페이지로 이동
	@RequestMapping("cafe-detail.do")
	public String viewCafeDetail(String cafeNo, String pageNo, Model model, HttpSession session) {
		// CafeVO 넘기기
		model.addAttribute("cafeTotal", cafeService.findCafeByCafeNo(cafeNo));
		// 총 리뷰 개수 넘기기
		model.addAttribute("reviewTotalCount", reviewService.findReviewTotalCountByCafeNo(cafeNo));
		// 리뷰 리스트 넘기기
		ReviewListVO lvo = reviewService.findReviewListByCafeNo(cafeNo, pageNo);
		model.addAttribute("lvo", lvo);
		
		return "cafe/cafeDetail.tiles";
	}// viewCafeDetail


	public ModelAndView viewCafeDetail(String cafeNo) {
		return new ModelAndView("cafe/cafeDetail.tiles",
				"cafeTotal", cafeMapper.findCafeByCafeNo(cafeNo));
	}//viewCafeDetail
	
	// 카페 간략정보 ajax
	@RequestMapping("cafe-simple.do")
	@ResponseBody
	public CafeOperatingTimeVO getCafeSimple(String cafeNo) {
		CafeOperatingTimeVO cafeTotal=cafeMapper.findCafeByCafeNo(cafeNo);
		return cafeTotal;
	}

	// 카페등록폼으로 이동
	@Secured("ROLE_MANAGER")
	@RequestMapping("register-cafeform.do")
	public String registerCafeForm() {
		return "cafe/registerCafeForm.tiles";
	}
	//카페등록하기
	@Transactional
	@Secured("ROLE_MANAGER")
	@PostMapping("register-cafe.do") 
	public ModelAndView registerCafe(CafeVO cafeVO,CafeOperatingTimeVO cafeOperVO) {
		//로그인한 유저정보 불러오기
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		cafeVO.setUserVO(uvo);
		cafeOperVO.setCafeVO(cafeVO);ㄴ
		//카페정보 등록
		 cafeService.registerCafe(cafeVO,cafeOperVO);
		 //cafeNo 보내주기
		  cafeVO = cafeService.findcafeByNoNotJoin(cafeVO.getCafeNo());
		  cafeOperVO.setCafeVO(cafeVO);
		  cafeOperVO = cafeService.findCafeByCafeNo(cafeVO.getCafeNo());
		  return new ModelAndView("cafe/registerCafeResult.tiles","cafeOperVO",cafeOperVO);
		}

}

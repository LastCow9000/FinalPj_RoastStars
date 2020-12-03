package com.beans.roaststars.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewListVO;

@Controller
public class CafeController {

	@Resource
	CafeService cafeService;

	@Resource
	ReviewService reviewService;


	// 메인화면 검색 결과후 지역검색 리스트뽑기
	@RequestMapping("findListByLoc.do")
	public String findListByLoc(String loc, Model model) {
	   List<CafeOperatingTimeVO> cafeList = cafeService.findListByLoc(loc);	
	   model.addAttribute("cafeList",cafeList);
	   return "cafe/cafeListByLoc.tiles";
    }

	// 카페 상세보기 페이지로 이동
	@RequestMapping("cafe-detail.do")
	public String viewCafeDetail(String cafeNo, String pageNo, Model model) {
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
				"cafeTotal", cafeService.findCafeByCafeNo(cafeNo));
	}//viewCafeDetail
	
	//카페 간략정보 ajax
	@RequestMapping("cafe-simple.do")
	@ResponseBody
	public CafeOperatingTimeVO getCafeSimple(String cafeNo) {
		CafeOperatingTimeVO cafeTotal=cafeService.findCafeByCafeNo(cafeNo);
		return cafeTotal;
	}
	
	//카페 리스트 정렬 ajax
	@RequestMapping("cafe-list-sort-by-property.do")
	@ResponseBody
	public List<PropertyVO> cafeListSortByProperty(String[] arrOption, String loc) {
		List<PropertyVO> cafeList=cafeService.cafeListSortByProperty(arrOption, loc);
		return cafeList;
	}
	
}

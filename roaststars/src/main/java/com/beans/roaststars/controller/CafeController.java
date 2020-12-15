package com.beans.roaststars.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.service.MyPickService;
import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.MenuKindVO;
import com.beans.roaststars.model.vo.MyPickVO;
import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewListVO;

@Controller
public class CafeController {

	@Resource
	CafeService cafeService;

	@Resource
	ReviewService reviewService;
	
	@Resource
	MyPickService myPickService;

	// 메인화면 검색 결과후 지역검색 리스트뽑기
	@RequestMapping("findListByLoc.do")
	public String findListByLoc(String loc, Model model) {
	   List<CafeOperatingTimeVO> cafeList = cafeService.findListByLoc(loc);	
	   model.addAttribute("cafeList",cafeList);
	   return "cafe/cafeListByLoc.tiles";
    }

	// 카페 상세보기 페이지로 이동
	@RequestMapping("cafe-detail.do")
	public String viewCafeDetail(String cafeNo, String pageNo, String id, Model model) {
		// CafeVO 넘기기
		model.addAttribute("cafeTotal", cafeService.findCafeByCafeNo(cafeNo));
		// 총 리뷰 개수 넘기기
		model.addAttribute("reviewTotalCount", reviewService.findReviewTotalCountByCafeNo(cafeNo));
		// 리뷰 리스트 넘기기
		ReviewListVO lvo = reviewService.findReviewListByCafeNo(cafeNo, pageNo);
		model.addAttribute("lvo", lvo);
		// 마이픽 체크
		boolean flag=false;
		if(id!=null) { //로그인 했을 시 마이픽 리스트 불러오기
			List<MyPickVO> myPickList=myPickService.findMyPickListById(id);
			for (int i = 0; i < myPickList.size(); i++) {//로그인한 id에 마이픽 리스트가 있을시 채워진 별표 표시를 위해 true반환
				if(myPickList.get(i).getCafeVO().getCafeNo().equals(cafeNo))
					flag=true;
			}
		}
		model.addAttribute("flag",flag);

		// 카페번호로 메뉴 리스트 보내기
		List<MenuKindVO> menuList = cafeService.updateMenuList(cafeNo);
		model.addAttribute("menuList", menuList);
		
		return "cafe/cafeDetail.tiles";
	}// viewCafeDetail


	public ModelAndView viewCafeDetail(String cafeNo) {
		return new ModelAndView("cafe/cafeDetail.tiles",
				"cafeTotal", cafeService.findCafeByCafeNo(cafeNo));
	}//viewCafeDetail
	
	// 카페 간략정보 ajax
	@RequestMapping("cafe-simple.do")
	@ResponseBody
	public Object getCafeSimple(String cafeNo, String id) {
		ArrayList<Object> list=new ArrayList<Object>(); //두가지 이상을 넘기므로 object타입 리스트로
		boolean flag=false;
		CafeOperatingTimeVO cafeTotal=cafeService.findCafeByCafeNo(cafeNo); //카페 간략정보
		if(id!=null) { //로그인 했을 시 마이픽 리스트 불러오기
			List<MyPickVO> myPickList=myPickService.findMyPickListById(id);
			for (int i = 0; i < myPickList.size(); i++) {//로그인한 id에 마이픽 리스트가 있을시 채워진 별표 표시를 위해 true반환
				if(myPickList.get(i).getCafeVO().getCafeNo().equals(cafeNo))
					flag=true;
			}
		}
		list.add(cafeTotal);
		list.add(flag);
		return list;
	}
	
	//카페 리스트 정렬 ajax
	@RequestMapping("cafe-list-sort-by-property.do")
	@ResponseBody
	public List<PropertyVO> cafeListSortByProperty(String[] arrOption, String loc) {
		List<PropertyVO> cafeList=cafeService.cafeListSortByProperty(arrOption, loc);
		return cafeList;
	}
	
}

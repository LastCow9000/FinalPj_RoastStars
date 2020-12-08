package com.beans.roaststars;


import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.beans.roaststars.model.mapper.ReviewMapper;
import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.service.UserService;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewVO;
import com.beans.roaststars.model.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class ReviewUnitTest {
	
	@Resource
	ReviewService reviewService;

	@Resource
	CafeService cafeService;

	@Resource
	UserService userService;
	
	@Resource
	ReviewMapper reviewMapper;
	
	
	@Test
	public void reviewUnitTest() {
		/*
		
		// 1. 리뷰 등록
		//준비사항1) cafeVO / 준비사항2) userVO
		ReviewVO reviewVO = new ReviewVO();
		CafeOperatingTimeVO cafeOperVO = cafeService.findCafeByCafeNo("2"); //cafeNo로 CafeOp가져오기
		//System.out.println(cafeOperVO.getCafeVO());
		
		cafeOperVO.setCafeVO(cafeOperVO.getCafeVO());//cafeOp에 cafeVO 할당
		
		UserVO userVO = userService.findUserById("reviewtest18");
		
		reviewVO.setCafeVO(cafeOperVO.getCafeVO()); //cafeVO 할당
		reviewVO.setUserVO(userVO); //userVO 할당
		reviewVO.setReviewContent("얌얌짱맛임- 리뷰테스트2");
		
		reviewMapper.registerReview(reviewVO); //리뷰 등록

		// 2. 카페 특성 update
		//준비사항 1)cafeVO 
		PropertyVO propertyVO = new PropertyVO();
		propertyVO.setCafeVO(cafeOperVO.getCafeVO());//cafeOperVO 할당 - 그 안에 cafeVO 값 있음
		propertyVO.setDiversity(1);
		propertyVO.setMood(0);
		propertyVO.setPrice(-2);
		propertyVO.setService(1);
		propertyVO.setTaste(1);
		
		reviewMapper.updateProperty(propertyVO); //카페특성 update
		reviewMapper.insertEvalProperty(reviewVO.getReviewNo(), propertyVO); //리뷰 평가 insert
		
		
		System.out.println(reviewMapper.findReviewByReviewNo(reviewVO.getReviewNo()));
		System.out.println(cafeService.findCafeAndPropertyByCafeNo(propertyVO.getCafeOperatingTimeVO().getCafeVO().getCafeNo()));
		
		
		ReviewVO reviewVO = new ReviewVO();
		CafeOperatingTimeVO cafeOperVO = cafeService.findCafeByCafeNo("1"); //cafeNo로 CafeOp가져오기
		
		cafeOperVO.setCafeVO(cafeOperVO.getCafeVO());//cafeOp에 cafeVO 할당
		
		UserVO userVO = userService.findUserById("reviewtest20");
		
		reviewVO.setCafeVO(cafeOperVO.getCafeVO()); //cafeVO 할당
		reviewVO.setUserVO(userVO); //userVO 할당
		reviewVO.setReviewContent("얌얌짱맛임");
		

		// 2. 카페 특성 update
		//준비사항 1)cafeVO 
		PropertyVO propertyVO = new PropertyVO();
		propertyVO.setCafeVO(cafeOperVO.getCafeVO());//cafeOperVO 할당 - 그 안에 cafeVO 값 있음
		propertyVO.setDiversity(-2);
		propertyVO.setMood(-2);
		propertyVO.setPrice(-2);
		propertyVO.setService(-2);
		propertyVO.setTaste(-2);
		
		reviewService.registerReviewAndUpdateProperty(reviewVO, propertyVO, "1", "reviewtest20");
		
		System.out.println(reviewMapper.findReviewByReviewNo(reviewVO.getReviewNo()));
		System.out.println(cafeService.findCafeAndPropertyByCafeNo(propertyVO.getCafeVO().getCafeNo()));
		*/
		
		//리뷰 삭제
		//리뷰넘버로 카페 특성 불러오기
		/*PropertyVO propertyVO = reviewMapper.findPropertyByReviewNo("56");

		//해당 카페특성 롤백하기
		reviewMapper.rollbackProperty(propertyVO);
		reviewMapper.deleteReview("56");*/
	
		// 리뷰 등록 전, 리뷰 작성 여부 확인
		System.out.println(reviewService.checkDuplicatedReview("6", "sdfg"));
	
	}	
}

		//        사용법 예시             //
		/*
		@Resource
		ItemDAO itemDAO;
		@Test
		public void itemCountTest() {
			//System.out.println(itemDAO.getItemCount());
			//								1. 기대값		2.실제값
			//Assert.assertEquals(8, itemDAO.getItemCount());
			//Assert.assertNotNull(itemDAO.findItemByNo(2));
			//System.out.println(itemDAO.findItemByNo(1));
			// 아이템 등록 테스트
			// 아이템 번호는 시퀀스로 자동 생성
			ItemVO ivo=new ItemVO();
			ivo.setName("아몬드");
			ivo.setMaker("롯데");
			ivo.setPrice(1000);
			System.out.println("동록전: "+ ivo);
			itemDAO.registerItem(ivo);
			System.out.println("등록완료: "+ivo);
		}
		*/
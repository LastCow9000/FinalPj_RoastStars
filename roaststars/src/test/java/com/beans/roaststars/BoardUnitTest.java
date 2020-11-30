package com.beans.roaststars;


import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.service.ReviewService;
import com.beans.roaststars.model.service.UserService;
import com.beans.roaststars.model.vo.ReviewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class BoardUnitTest {

	//@Test
	//public void memberTest() {
	//	MemberVO paramVO = new MemberVO();
	//	paramVO.setId("java");
	//	paramVO.setPassword("1111");
	//	MemberVO mvo = memberMapper.login(paramVO);
	//	System.out.println("로그인 테스트 : " + mvo);
	//}

	@Resource
	private UserService userService;
	
	@Resource
	private CafeService cafeService;
	
	@Resource
	private ReviewService reviewService;
	
	/*@Test
	public void userTest() {
		// test1. 아이디로 회원정보 찾기
		UserVO userVO = userService.findUserById("sajang");
		System.out.println(userVO);
		
		UserVO userVO = userService.findUserById("java");
		System.out.println(userVO);
		
		// test2. 아이디(username)으로 권한 조회
		List<AuthorityVO> list = userMapper.selectAuthorityByUsername("java");
		for(AuthorityVO vo:list) {
			System.out.println(vo);
		}
		
		// test3. 카페 번호로 카페 정보 조회
		CafeVO cafeVO = cafeService.findCafeByCafeNo("9");
		System.out.println(cafeVO);
	}
	
	
}*/
	@Test
	public void reviewTest() {
		//test1. 카페넘버로 리뷰 목록 불러오기
		List<ReviewVO> list = reviewService.findReviewListByCafeNo("9");
		for(ReviewVO vo:list) {
			System.out.println(vo);
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
}
package com.beans.roaststars;


import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.beans.roaststars.model.service.CafeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class CafeUnitTest {
	@Resource
	CafeService cafeService;

	@Test
	public void cafeUnitTest() {
		System.out.println(cafeService.findListByLoc("부천"));
		
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
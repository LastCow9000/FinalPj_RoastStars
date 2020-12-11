package com.beans.roaststars;


import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.beans.roaststars.model.mapper.MyPickMapper;
import com.beans.roaststars.model.service.MyPickService;
import com.beans.roaststars.model.service.PagingBean;
import com.beans.roaststars.model.vo.MyPickListVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class MyPickUnitTest {
	
	@Resource
	MyPickService myPickService;

	@Resource
	MyPickMapper mm;
	
	@Test
	public void cafeUnitTest() {
		//총 갯수 테스트
		//System.out.println(myPickService.getTotalCountMyPick("java11"));
		
		//페이징 리스트 테스트
		//System.out.println(myPickService.getMyPickList("java11", "1"));
		//PagingBean pagingBean = new PagingBean(mm.getTotalCountMyPick("java11"));
		//System.out.println(pagingBean.getNowPage());
		//MyPickListVO list = myPickService.getMyPickList("java11");
		//System.out.println(list);
		
		//마이픽 추가 테스트
		//myPickService.addMyPick("java11", "4");
		
		//마이픽 삭제 테스트
		myPickService.deleteMyPick("11");
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
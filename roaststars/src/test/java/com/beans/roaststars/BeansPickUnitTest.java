package com.beans.roaststars;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.beans.roaststars.model.mapper.BeansPickMapper;
import com.beans.roaststars.model.service.BeansPickService;
import com.beans.roaststars.model.vo.BeansPickVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml",
		"file:src/main/webapp/WEB-INF/spring-security.xml" })
public class BeansPickUnitTest {

	@Resource
	private BeansPickMapper beansPickMapper;

	@Resource
	private BeansPickService bePickService;

	@Test
	public void BeanPickUnitTest() {
		//test.1 빈즈빅 리스트
//		List<BeansPickVO> listVO = beansPickMapper.getAllBeansPickList();
//		for(BeansPickVO vo:listVO) {
//			System.out.println(vo);
//		}
		
		//test.2 빈즈빅 게시물 하나
		System.out.println(beansPickMapper.getOneBeansPick("2"));
		
		
		
		
		
		//test.2 권한 종류 불러오기
//		System.out.println(adminMapper.getUserAuthorityList());
		
		//test.3 권한 부여 대기중인 회원 총 인원 수
//		System.out.println(adminMapper.getTotalCountByWaitingMember());
		
		//test.4 페이징 테스트
//		PagingBean pb=new PagingBean(adminMapper.getTotalCountByWaitingMember(), 2);
//		pb.setContentNumberPerPage(5);
//		pb.setPageNumberPerPageGroup(5);
//		System.out.println(adminMapper.findMemberByAuthority(pb));
		
		

	
		
	}

	
}
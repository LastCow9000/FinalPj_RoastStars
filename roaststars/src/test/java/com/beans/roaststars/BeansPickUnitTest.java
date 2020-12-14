package com.beans.roaststars;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.beans.roaststars.model.mapper.BeansPickMapper;
import com.beans.roaststars.model.service.BeansPickService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml",
		"file:src/main/webapp/WEB-INF/spring-security.xml" })
public class BeansPickUnitTest {

	@Resource
	private BeansPickMapper beansPickMapper;

	@Resource
	private BeansPickService beansPickService;

	@Test
	public void BeanPickUnitTest() {
		// test.1 빈즈픽 리스트
//		List<BeansPickVO> listVO = beansPickMapper.getAllBeansPickList();
//		for(BeansPickVO vo:listVO) {
//			System.out.println(vo);
//		}

		// test.2 빈즈빅 게시물 하나
//		System.out.println(beansPickMapper.getOneBeansPick("2"));

		// test.3 빈즈픽 등록
//		UserVO userVO = new UserVO();
//		BeansPickVO ivo = new BeansPickVO();
//		ivo.setBeansTitle("아몬드1111");
//		ivo.setBeansContent("롯데");
//		ivo.setBeansPic("default");
//		ivo.setBeansRegdate("y-y");
//		ivo.setBeansNo("1223");
//		ivo.setUserVO(userVO);
//		userVO.setId("admin");
//		beansPickService.registerBeansPick(ivo);
//		System.out.println(ivo);
//	}
		// test.4 빈즈픽 수정
//		UserVO userVO = new UserVO();
//		BeansPickVO ivo = new BeansPickVO();
//		System.out.println(beansPickMapper.getOneBeansPick("61"));
//		ivo.setBeansTitle("아몬드1111");
//		ivo.setBeansContent("롯데");
//		ivo.setBeansPic("default");
//		ivo.setBeansNo("61");
//		ivo.setUserVO(userVO);
//		userVO.setId("admin");
//		beansPickMapper.updateFormBeansPick(ivo);
//		System.out.println(beansPickMapper.getOneBeansPick("61"));
//	}
		//test.5 빈즈픽 삭제
		
//		System.out.println(beansPickMapper.getOneBeansPick("123"));
//		beansPickService.deleteFormBeansPick("123");
//		System.out.println(beansPickMapper.getOneBeansPick("123"));
//		}
		//test.6 빈즈픽 총 수량
//		System.out.println(beansPickService.getTotalCountBeansPick());
//	}
}
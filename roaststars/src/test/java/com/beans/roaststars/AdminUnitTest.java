package com.beans.roaststars;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.beans.roaststars.model.mapper.AdminMapper;
import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.service.AdminService;
import com.beans.roaststars.model.service.PagingBean;
import com.beans.roaststars.model.vo.AdminListVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml",
		"file:src/main/webapp/WEB-INF/spring-security.xml" })
public class AdminUnitTest {

	@Resource
	private AdminMapper adminMapper;

	@Resource
	private AdminService adminService;
	
	@Resource
	private CafeMapper cafeMapper;

	@Test
	public void adminUnitTest() {
		//test.1 가입한 아이디 중 사장 권한 부여 대기중인 회원
	//	List<AuthorityVO> listVO = adminMapper.getAllWaitingForUpgradeUserList();
	//	for(AuthorityVO vo:listVO) {
	//		System.out.println(vo);
	//  }
		
		//test.2 권한 종류 불러오기
		//System.out.println(adminMapper.getUserAuthorityList());
		
		//test.3 권한 부여 대기중인 회원 총 인원 수
		//System.out.println(adminMapper.getTotalCountByWaitingMember());
		
		//test.4 권한 부여하기
		//int a = adminService.grantAuthority("asdf11", "ROLE_MANAGER");
		//List<AuthorityVO> listVO = adminMapper.getAllWaitingForUpgradeUserList();
		//for(AuthorityVO vo:listVO) {
		//System.out.println(vo);
		
		//test.5 페이징 테스트
		//PagingBean pb=new PagingBean(adminMapper.getTotalCountByWaitingMember(), 1);

		AdminListVO adminListVO = adminService.getAllWatingForAuthor();
		System.out.println(adminListVO);
		
		
	}
}

	/*
	 * @Test public void adminTest() { //test1. admin 페이지에서 사장 등록 대기 중인 사용자 리스트 불러오기
	 * List<AuthorityVO> list = adminService.getAuthorityByUser(); AuthorityVO
	 * ua=new AuthorityVO(); ua.setUsername("java"); for(AuthorityVO vo:list) {
	 * System.out.println(vo); } }
	 */
	// 사용법 예시 //
	/*
	 * @Resource ItemDAO itemDAO;
	 * 
	 * @Test public void itemCountTest() {
	 * //System.out.println(itemDAO.getItemCount()); // 1. 기대값 2.실제값
	 * //Assert.assertEquals(8, itemDAO.getItemCount());
	 * //Assert.assertNotNull(itemDAO.findItemByNo(2));
	 * //System.out.println(itemDAO.findItemByNo(1)); // 아이템 등록 테스트 // 아이템 번호는 시퀀스로
	 * 자동 생성 ItemVO ivo=new ItemVO(); ivo.setName("아몬드"); ivo.setMaker("롯데");
	 * ivo.setPrice(1000); System.out.println("동록전: "+ ivo);
	 * itemDAO.registerItem(ivo); System.out.println("등록완료: "+ivo); }
	 */

package com.beans.roaststars.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beans.roaststars.model.mapper.AdminMapper;
import com.beans.roaststars.model.vo.AdminListVO;
import com.beans.roaststars.model.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Resource
	private AdminMapper adminMapper;
	
	//등업 대기 중인 회원 리스트 불러오기
	@Override
	public List<UserVO> getAllWaitingForUpgradeUserList() {
		return adminMapper.getAllWaitingForUpgradeUserList();
	}

	//회원 권한 종류 받아오기
	@Override
	public List<String> getUserAuthorityList(){
		return adminMapper.getUserAuthorityList();
	}
	//대기중인 회원 총 인원
	@Override
	public int getTotalCountByWaitingMember() {
		return adminMapper.getTotalCountByWaitingMember();
	}
	//페이징
	@Override
	public AdminListVO findMemberByAuthority() {
		return findMemberByAuthority("1");
	}
	@Override
	public AdminListVO findMemberByAuthority(String pageNo) {
		int watingmemberTotalCount=adminMapper.getTotalCountByWaitingMember();
		PagingBean pagingBean=null;
		if (pageNo==null) {
			pagingBean=new PagingBean(watingmemberTotalCount);
		}else {
			pagingBean=new PagingBean(watingmemberTotalCount, Integer.parseInt(pageNo));
		}
		pagingBean.setContentNumberPerPage(5);
		pagingBean.setPageNumberPerPageGroup(5);
		AdminListVO listVO=new AdminListVO(adminMapper.findMemberByAuthority(pagingBean), pagingBean);
		return listVO;
	}
	
	


}

package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.AdminListVO;
import com.beans.roaststars.model.vo.AuthorityVO;


public interface AdminService {
	//페이징적용전
	List<AuthorityVO> getAllWaitingForUpgradeUserList();
	
	// 페이징 용 : 승인 대기 중인 가입자 전체 목록 반환
    // getAllWatingForAuthor()
    // : 페이지 번호가 없을 때는 default 1 page
	AdminListVO getAllWatingForAuthor();
	
	// 페이징 용 : 승인 대기 중인 가입자 전체 목록 반환
    AdminListVO getAllWatingForAuthor(String pageNo);
   
	//권한 종류
	List<String> getUserAuthorityList();
	//등업 대기중인 총 회원수
	int getTotalCountByWaitingMember();
	//권한 부여
	int grantAuthority(String id, String authority);
}

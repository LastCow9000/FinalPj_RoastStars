package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.AdminListVO;


public interface AdminService {
	
	// 등급업 대기인원 리스트(페이징 적용)
    // getAllWatingForAuthor()
    // : 페이지 번호가 없을 때는 default 1 page
	AdminListVO getAllWatingForAuthor();
	
	// 등급업 대기인원 리스트(페이징 적용)
    AdminListVO getAllWatingForAuthor(String pageNo);
   
	//권한 종류
	List<String> getUserAuthorityList();
	//등업 대기중인 총 회원수
	int getTotalCountByWaitingMember();
	//권한 부여
	int grantAuthority(String id, String authority);
}

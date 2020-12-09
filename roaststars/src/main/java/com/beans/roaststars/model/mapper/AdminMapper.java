package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.roaststars.model.service.PagingBean;
import com.beans.roaststars.model.vo.AuthorityVO;

@Mapper
public interface AdminMapper {
	// 가입한 아이디 중, 사장 권한 부여를 받기 위해 대기 중인 user의 리스트 반환
	List<AuthorityVO> getAllWaitingForUpgradeUserList();

	// 권한 종류 불러오기
	List<String> getUserAuthorityList();

	// 카페넘버에 해당하는 리뷰 총 개수 조회하기
	int getTotalCountByWaitingMember();

	// 페이징
	List<AuthorityVO> findMemberByAuthority(@Param("pagingBean") PagingBean pagingBean);
	
	// 권한 부여하기
	int grantAuthority(@Param("id") String id, @Param("authority") String authority);

	
}

package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.roaststars.model.service.PagingBean;
import com.beans.roaststars.model.vo.AuthorityVO;

@Mapper
public interface AdminMapper {
	// 원래거
	List<AuthorityVO> getAllWaitingForUpgradeUserList();

	// 페이징 용 : 승인 대기 중인 가입자 전체 목록 반환
	List<AuthorityVO> getAllWatingForAuthor(PagingBean pagingBean);
	
	// 권한 종류 불러오기
	List<String> getUserAuthorityList();

	// 승인 대기 중인 총 회원 수
	int getTotalCountByWaitingMember();
	
	// 권한 부여하기
	int grantAuthority(@Param("id") String id, @Param("authority") String authority);
	
}

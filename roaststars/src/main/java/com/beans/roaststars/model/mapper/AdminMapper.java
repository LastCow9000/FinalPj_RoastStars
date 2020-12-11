package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.roaststars.model.service.PagingBean;
import com.beans.roaststars.model.vo.AuthorityVO;

@Mapper
public interface AdminMapper {

	// 등급업 대기인원 리스트(페이징 적용)
	List<AuthorityVO> getAllWatingForAuthor(PagingBean pagingBean);
	
	// 권한 종류 불러오기
	List<String> getUserAuthorityList();

	// 승인 대기 중인 총 회원 수
	int getTotalCountByWaitingMember();
	
	// 권한 부여하기
	int grantAuthority(@Param("id") String id, @Param("authority") String authority);
	
}

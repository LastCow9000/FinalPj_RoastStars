package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.beans.roaststars.model.vo.AuthorityVO;
import com.beans.roaststars.model.vo.UserVO;

@Mapper
public interface UserMapper {
	
	//로그인 시, id로 회원정보 조회
	UserVO findUserById(String id);
	
	//아이디로 권한받기
	List<AuthorityVO> selectAuthorityByUsername(String username);
	
}

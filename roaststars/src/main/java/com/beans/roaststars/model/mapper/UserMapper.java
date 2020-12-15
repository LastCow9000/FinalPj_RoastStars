package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.roaststars.model.vo.AuthorityVO;
import com.beans.roaststars.model.vo.UserVO;

@Mapper
public interface UserMapper {
	
	//로그인 시, id로 회원정보 조회
	UserVO findUserById(String id);
	
	//아이디로 권한받기
	List<AuthorityVO> selectAuthorityByUsername(String username);
	
	//회원가입
	void registerUser(UserVO vo);

	//권한부여
	void registerRole(AuthorityVO authority);

	//아이디 중복체크
	int idcheck(String id);

	//닉네임 중복체크
	int nickcheck(String nickname);
	
	//회원정보수정하기
	void updateUser(UserVO userVO);
	
	//회원탈퇴하기
	void deleteUser(UserVO userVO);
	
	//비번찾기용 아이디 이름 일치 체크
	int checkIdAndName(@Param("id") String id, @Param("name") String name);
	
	//발급된 임시비밀번호로 비밀번호 수정
	void updateTempPass(@Param("id") String id, @Param("password") String password);
}

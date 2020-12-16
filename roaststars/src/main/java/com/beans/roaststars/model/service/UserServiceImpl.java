package com.beans.roaststars.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beans.roaststars.model.mapper.UserMapper;
import com.beans.roaststars.model.vo.AuthorityVO;
import com.beans.roaststars.model.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;
	/*
	 *  비밀번호 암호화처리를 위한 객체를 주입받는다
	 *  spring-security.xml 에서 bean 설정이 되어 있음 	
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	// 회원가입시 반드시 권한까지 부여되도록 트랜잭션 처리한다
	@Transactional
	@Override
	public void registerUser(UserVO vo) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodedPwd);
		userMapper.registerUser(vo);
		AuthorityVO authority = new AuthorityVO(vo.getId(), "ROLE_MEMBER", vo);
		userMapper.registerRole(authority);
	}

	//아이디 중복체크
	@Override
	public String idCheck(String id) {
		int count = userMapper.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}
	
	//닉네임 중복체크
	@Override
	public String nickCheck(String nickname) {
		int count = userMapper.nickcheck(nickname);
		return (count == 0) ? "ok" : "fail";
	}
	
	//아이디로 회원정보 반환
	@Override
	public UserVO findUserById(String id) {
		return  userMapper.findUserById(id);
	}
	

	@Override
	public List<AuthorityVO> selectAuthorityByUsername(String username) {
		return userMapper.selectAuthorityByUsername(username);
	}

	@Override
	public String passCheck(String password) {
		UserVO userVO = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return passwordEncoder.matches(password, userVO.getPassword()) ? "ok" : "fail";
	}

	
	@Override
	public void updateUser(UserVO userVO) {
		String encodePassword = passwordEncoder.encode(userVO.getPassword());
		userVO.setPassword(encodePassword);
		userMapper.updateUser(userVO);
	}

	//회원탈퇴
	@Override
	public void deleteUser(UserVO userVO) {
		userMapper.deleteUser(userVO);
	}

	//비번찾기용 아이디 이름 일치 체크
	@Override
	public int checkIdAndName(String id, String name) {
		return userMapper.checkIdAndName(id, name);
	}

	//발급된 임시비밀번호로 비밀번호 수정
	@Override
	public String updateTempPass(String id) {
		String tempPw="";
		for (int i = 0; i < 8; i++) {
			tempPw += (char)((Math.random() * 26)+97);	//난수 발생시켜서 소문자 a~z까지 8글자 임시비밀번호 발급
		}
		String encodePassword = passwordEncoder.encode(tempPw);// 비밀번호 암호화
		userMapper.updateTempPass(id, encodePassword); //비밀번호 업데이트
		return tempPw;
	}
	
}
